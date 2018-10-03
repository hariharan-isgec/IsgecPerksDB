USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakInventoryStatusDelete]
  @Original_InventoryStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_InventoryStatus]
  WHERE
  [PAK_InventoryStatus].[InventoryStatusID] = @Original_InventoryStatusID
  SET @RowCount = @@RowCount
GO
