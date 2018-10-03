USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtCostCentersSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SPMT_CostCenters].*  
  FROM [SPMT_CostCenters] 
  WHERE 1 = 1  
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
GO
