USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakReceiveStatusUpdate]
  @Original_ReceiveStatusID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_ReceiveStatus] SET 
   [Description] = @Description
  WHERE
  [ReceiveStatusID] = @Original_ReceiveStatusID
  SET @RowCount = @@RowCount
GO
