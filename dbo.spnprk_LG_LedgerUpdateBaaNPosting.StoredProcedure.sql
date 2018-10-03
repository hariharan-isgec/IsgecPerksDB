USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprk_LG_LedgerUpdateBaaNPosting]
  @PostedInBaaN Bit,
  @PostedOn DateTime,
  @PostedBy Int,
  @BatchNo NVarChar(6),
  @VoucherNo NVarChar(8),
  @VoucherLineNo NVarChar(10),
  @Original_DocumentID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Ledger] SET 
   [PostedInBaaN] = @PostedInBaaN
  ,[PostedOn] = @PostedOn
  ,[PostedBy] = @PostedBy
  ,[BatchNo] = @BatchNo
  ,[VoucherNo] = @VoucherNo
  ,[VoucherLineNo] = @VoucherLineNo
  WHERE
  [DocumentID] = @Original_DocumentID
  SET @RowCount = @@RowCount
GO
