USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfCreationInsert]
  @PaymentRequestNo NVarChar(9),
  @OurRefNo NVarChar(7),
  @BankVoucherDate DateTime,
  @SupplierCode NVarChar(9),
  @IRN NVarChar(10),
  @InvoiceNumber NVarChar(30),
  @InvoiceDate DateTime,
  @InvoiceAmount Int,
  @TotalAmountDisbursed Int,
  @InterestForDays Int,
  @InterestAmount Int,
  @PDNNo NVarChar(12),
  @DueDate DateTime,
  @PaymentDateToBank DateTime,
  @ChequeNoPaidToBank NVarChar(10),
  @AmountInWords NVarChar(500),
  @TDSAmount Int,
  @ServiceTax Int,
  @HSBCToVendor DateTime,
  @HSBCInterestDays Int,
  @HSBCInterestAmountInStatement Int,
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @ApprovedBy NVarChar(8),
  @ApprovedOn DateTime,
  @PSFStatus Int,
  @ModifiedBy NVarChar(8),
  @ModifiedOn DateTime,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [PSF_HSBCMain]
  (
   [PaymentRequestNo]
  ,[OurRefNo]
  ,[BankVoucherDate]
  ,[SupplierCode]
  ,[IRN]
  ,[InvoiceNumber]
  ,[InvoiceDate]
  ,[InvoiceAmount]
  ,[TotalAmountDisbursed]
  ,[InterestForDays]
  ,[InterestAmount]
  ,[PDNNo]
  ,[DueDate]
  ,[PaymentDateToBank]
  ,[ChequeNoPaidToBank]
  ,[AmountInWords]
  ,[TDSAmount]
  ,[ServiceTax]
  ,[HSBCToVendor]
  ,[HSBCInterestDays]
  ,[HSBCInterestAmountInStatement]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[ApprovedBy]
  ,[ApprovedOn]
  ,[PSFStatus]
  ,[ModifiedBy]
  ,[ModifiedOn]
  )
  VALUES
  (
   @PaymentRequestNo
  ,@OurRefNo
  ,@BankVoucherDate
  ,@SupplierCode
  ,@IRN
  ,@InvoiceNumber
  ,@InvoiceDate
  ,@InvoiceAmount
  ,@TotalAmountDisbursed
  ,@InterestForDays
  ,@InterestAmount
  ,@PDNNo
  ,@DueDate
  ,@PaymentDateToBank
  ,@ChequeNoPaidToBank
  ,@AmountInWords
  ,@TDSAmount
  ,@ServiceTax
  ,@HSBCToVendor
  ,@HSBCInterestDays
  ,@HSBCInterestAmountInStatement
  ,@CreatedBy
  ,@CreatedOn
  ,@ApprovedBy
  ,@ApprovedOn
  ,@PSFStatus
  ,@ModifiedBy
  ,@ModifiedOn
  )
  SET @Return_SerialNo = Scope_Identity()
GO
