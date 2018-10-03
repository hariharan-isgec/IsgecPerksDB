USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtCostCentersSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,CostCenterID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (CostCenterID)
  SELECT [SPMT_CostCenters].[CostCenterID] FROM [SPMT_CostCenters]
 WHERE  
   ( 
         LOWER(ISNULL([SPMT_CostCenters].[CostCenterID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_CostCenters].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_CostCenters].[BaaNCompany],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_CostCenters].[BaaNLedger],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_CostCenters].[Location],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CostCenterID' THEN [SPMT_CostCenters].[CostCenterID] END,
     CASE @OrderBy WHEN 'CostCenterID DESC' THEN [SPMT_CostCenters].[CostCenterID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_CostCenters].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_CostCenters].[Description] END DESC,
     CASE @OrderBy WHEN 'BaaNCompany' THEN [SPMT_CostCenters].[BaaNCompany] END,
     CASE @OrderBy WHEN 'BaaNCompany DESC' THEN [SPMT_CostCenters].[BaaNCompany] END DESC,
     CASE @OrderBy WHEN 'BaaNLedger' THEN [SPMT_CostCenters].[BaaNLedger] END,
     CASE @OrderBy WHEN 'BaaNLedger DESC' THEN [SPMT_CostCenters].[BaaNLedger] END DESC,
     CASE @OrderBy WHEN 'Location' THEN [SPMT_CostCenters].[Location] END,
     CASE @OrderBy WHEN 'Location DESC' THEN [SPMT_CostCenters].[Location] END DESC 

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
