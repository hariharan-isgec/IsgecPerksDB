USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWTransferHeaderDelete]
  @Original_TransferID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ASM_TransferHeader]
  WHERE
  [ASM_TransferHeader].[TransferID] = @Original_TransferID
  SET @RowCount = @@RowCount
GO
