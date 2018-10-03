USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWTransferDetailsDelete]
  @Original_TransferID Int,
  @Original_MrnID Int,
  @Original_AssetID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ASM_TransferDetails]
  WHERE
  [ASM_TransferDetails].[TransferID] = @Original_TransferID
  AND [ASM_TransferDetails].[MrnID] = @Original_MrnID
  AND [ASM_TransferDetails].[AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO
