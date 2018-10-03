USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakInventoryStatusSelectByID]
  @LoginID NVarChar(8),
  @InventoryStatusID Int 
  AS
  SELECT
    [PAK_InventoryStatus].*  
  FROM [PAK_InventoryStatus] 
  WHERE
  [PAK_InventoryStatus].[InventoryStatusID] = @InventoryStatusID
GO
