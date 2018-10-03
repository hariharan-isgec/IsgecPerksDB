USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakInventoryStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_InventoryStatus].*  
  FROM [PAK_InventoryStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'InventoryStatusID' THEN [PAK_InventoryStatus].[InventoryStatusID] END,
     CASE @OrderBy WHEN 'InventoryStatusID DESC' THEN [PAK_InventoryStatus].[InventoryStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_InventoryStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_InventoryStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
