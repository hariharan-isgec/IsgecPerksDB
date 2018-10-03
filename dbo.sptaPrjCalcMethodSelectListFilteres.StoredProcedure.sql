USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaPrjCalcMethodSelectListFilteres]
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
 ,ProjectCalcID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectCalcID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_PrjCalcMethod].[ProjectCalcID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_PrjCalcMethod] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectCalcID' THEN '[TA_PrjCalcMethod].[ProjectCalcID]'
                        WHEN 'ProjectCalcID DESC' THEN '[TA_PrjCalcMethod].[ProjectCalcID] DESC'
                        WHEN 'Description' THEN '[TA_PrjCalcMethod].[Description]'
                        WHEN 'Description DESC' THEN '[TA_PrjCalcMethod].[Description] DESC'
                        ELSE '[TA_PrjCalcMethod].[ProjectCalcID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_PrjCalcMethod].[ProjectCalcID] ,
		[TA_PrjCalcMethod].[Description]  
  FROM [TA_PrjCalcMethod] 
      INNER JOIN #PageIndex
          ON [TA_PrjCalcMethod].[ProjectCalcID] = #PageIndex.ProjectCalcID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
