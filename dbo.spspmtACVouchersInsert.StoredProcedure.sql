USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtACVouchersInsert]
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
  @Return_VoucherNo Int = null OUTPUT
  AS
  INSERT [SPMT_ACVouchers]
  (
   [VoucherDate]
  ,[VendorID]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[PostedInBaaN]
  ,[BatchNo]
  ,[BatchDate]
  ,[DocumentNo]
  ,[ChequeNo]
  ,[ChequeDate]
  ,[PostedBy]
  ,[PostedOn]
  ,[PostingRemarks]
  ,[PaidToSupplier]
  ,[PaidOn]
  ,[PaidBy]
  ,[PaidRemarks]
  )
  VALUES
  (
   @VoucherDate
  ,@VendorID
  ,@CreatedBy
  ,@CreatedOn
  ,@PostedInBaaN
  ,@BatchNo
  ,@BatchDate
  ,@DocumentNo
  ,@ChequeNo
  ,@ChequeDate
  ,@PostedBy
  ,@PostedOn
  ,@PostingRemarks
  ,@PaidToSupplier
  ,@PaidOn
  ,@PaidBy
  ,@PaidRemarks
  )
  SET @Return_VoucherNo = Scope_Identity()
GO
