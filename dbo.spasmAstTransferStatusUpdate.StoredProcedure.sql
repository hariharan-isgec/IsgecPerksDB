USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTransferStatusUpdate]
  @Original_TransferStatusID NVarChar(30), 
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_AstTransferStatus] SET 
   [Description] = @Description
  WHERE
  [TransferStatusID] = @Original_TransferStatusID
  SET @RowCount = @@RowCount
GO
