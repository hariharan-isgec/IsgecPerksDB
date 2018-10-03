USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtACVouchersUpdate]
  @Original_VoucherNo Int, 
  @VoucherDate DateTime,
  @VendorID NVarChar(6),
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @PostedInBaaN Bit,
  @BatchNo NVarChar(20),
  @BatchDate DateTime,
  @DocumentNo NVarChar(50),
  @ChequeNo NVarChar(20),
  @ChequeDate DateTime,
  @PostedBy NVarChar(8),
  @PostedOn DateTime,
  @PostingRemarks NVarChar(500),
  @PaidToSupplier Bit,
  @PaidOn DateTime,
  @PaidBy NVarChar(8),
  @PaidRemarks NVarChar(500),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_ACVouchers] SET 
   [VoucherDate] = @VoucherDate
  ,[VendorID] = @VendorID
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  ,[PostedInBaaN] = @PostedInBaaN
  ,[BatchNo] = @BatchNo
  ,[BatchDate] = @BatchDate
  ,[DocumentNo] = @DocumentNo
  ,[ChequeNo] = @ChequeNo
  ,[ChequeDate] = @ChequeDate
  ,[PostedBy] = @PostedBy
  ,[PostedOn] = @PostedOn
  ,[PostingRemarks] = @PostingRemarks
  ,[PaidToSupplier] = @PaidToSupplier
  ,[PaidOn] = @PaidOn
  ,[PaidBy] = @PaidBy
  ,[PaidRemarks] = @PaidRemarks
  WHERE
  [VoucherNo] = @Original_VoucherNo
  SET @RowCount = @@RowCount
GO
