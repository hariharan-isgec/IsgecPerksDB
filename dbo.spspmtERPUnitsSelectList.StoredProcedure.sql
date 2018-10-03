USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtERPUnitsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SPMT_ERPUnits].*  
  FROM [SPMT_ERPUnits] 
  WHERE 1 = 1  
  ORDER BY [SPMT_ERPUnits].[Description]
     --CASE @OrderBy WHEN 'UOM' THEN [SPMT_ERPUnits].[UOM] END,
     --CASE @OrderBy WHEN 'UOM DESC' THEN [SPMT_ERPUnits].[UOM] END DESC,
     --CASE @OrderBy WHEN 'Description' THEN [SPMT_ERPUnits].[Description] END,
     --CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_ERPUnits].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
