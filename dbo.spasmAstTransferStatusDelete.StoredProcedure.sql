USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTransferStatusDelete]
  @Original_TransferStatusID NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  DELETE [ASM_AstTransferStatus]
  WHERE
  [ASM_AstTransferStatus].[TransferStatusID] = @Original_TransferStatusID
  SET @RowCount = @@RowCount
GO
