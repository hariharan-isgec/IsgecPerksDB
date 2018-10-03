USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtCostCentersSelectListFilteres]
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
 ,CostCenterID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CostCenterID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_CostCenters].[CostCenterID]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_CostCenters] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CostCenterID' THEN '[SPMT_CostCenters].[CostCenterID]'
                        WHEN 'CostCenterID DESC' THEN '[SPMT_CostCenters].[CostCenterID] DESC'
                        WHEN 'Description' THEN '[SPMT_CostCenters].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_CostCenters].[Description] DESC'
                        WHEN 'BaaNCompany' THEN '[SPMT_CostCenters].[BaaNCompany]'
                        WHEN 'BaaNCompany DESC' THEN '[SPMT_CostCenters].[BaaNCompany] DESC'
                        WHEN 'BaaNLedger' THEN '[SPMT_CostCenters].[BaaNLedger]'
                        WHEN 'BaaNLedger DESC' THEN '[SPMT_CostCenters].[BaaNLedger] DESC'
                        WHEN 'Location' THEN '[SPMT_CostCenters].[Location]'
                        WHEN 'Location DESC' THEN '[SPMT_CostCenters].[Location] DESC'
                        ELSE '[SPMT_CostCenters].[CostCenterID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_CostCenters].*  
  FROM [SPMT_CostCenters] 
      INNER JOIN #PageIndex
          ON [SPMT_CostCenters].[CostCenterID] = #PageIndex.CostCenterID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
