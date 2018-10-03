USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptStatusUpdate]
  @Original_LRStatusID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_LorryReceiptStatus] SET 
   [Description] = @Description
  WHERE
  [LRStatusID] = @Original_LRStatusID
  SET @RowCount = @@RowCount
GO
