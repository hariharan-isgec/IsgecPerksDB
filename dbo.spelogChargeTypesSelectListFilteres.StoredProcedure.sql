USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeTypesSelectListFilteres]
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
 ,ChargeTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ChargeTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_ChargeTypes].[ChargeTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_ChargeTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ChargeTypeID' THEN '[ELOG_ChargeTypes].[ChargeTypeID]'
                        WHEN 'ChargeTypeID DESC' THEN '[ELOG_ChargeTypes].[ChargeTypeID] DESC'
                        WHEN 'Description' THEN '[ELOG_ChargeTypes].[Description]'
                        WHEN 'Description DESC' THEN '[ELOG_ChargeTypes].[Description] DESC'
                        ELSE '[ELOG_ChargeTypes].[ChargeTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_ChargeTypes].*  
  FROM [ELOG_ChargeTypes] 
      INNER JOIN #PageIndex
          ON [ELOG_ChargeTypes].[ChargeTypeID] = #PageIndex.ChargeTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
