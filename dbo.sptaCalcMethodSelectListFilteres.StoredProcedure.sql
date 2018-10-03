USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCalcMethodSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,CalculationTypeID NVarChar(10) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CalculationTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_CalcMethod].[CalculationTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_CalcMethod] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CalculationTypeID' THEN '[TA_CalcMethod].[CalculationTypeID]'
                        WHEN 'CalculationTypeID DESC' THEN '[TA_CalcMethod].[CalculationTypeID] DESC'
                        WHEN 'CalculationDescription' THEN '[TA_CalcMethod].[CalculationDescription]'
                        WHEN 'CalculationDescription DESC' THEN '[TA_CalcMethod].[CalculationDescription] DESC'
                        ELSE '[TA_CalcMethod].[CalculationTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_CalcMethod].[CalculationTypeID] ,
		[TA_CalcMethod].[CalculationDescription]  
  FROM [TA_CalcMethod] 
      INNER JOIN #PageIndex
          ON [TA_CalcMethod].[CalculationTypeID] = #PageIndex.CalculationTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
