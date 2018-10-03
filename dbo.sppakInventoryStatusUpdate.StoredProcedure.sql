USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakInventoryStatusUpdate]
  @Original_InventoryStatusID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_InventoryStatus] SET 
   [Description] = @Description
  WHERE
  [InventoryStatusID] = @Original_InventoryStatusID
  SET @RowCount = @@RowCount
GO
