USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfCreationUpdate]
  @Original_SerialNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [PSF_HSBCMain] SET 
   [PaymentRequestNo] = @PaymentRequestNo
  ,[OurRefNo] = @OurRefNo
  ,[BankVoucherDate] = @BankVoucherDate
  ,[SupplierCode] = @SupplierCode
  ,[IRN] = @IRN
  ,[InvoiceNumber] = @InvoiceNumber
  ,[InvoiceDate] = @InvoiceDate
  ,[InvoiceAmount] = @InvoiceAmount
  ,[TotalAmountDisbursed] = @TotalAmountDisbursed
  ,[InterestForDays] = @InterestForDays
  ,[InterestAmount] = @InterestAmount
  ,[PDNNo] = @PDNNo
  ,[DueDate] = @DueDate
  ,[PaymentDateToBank] = @PaymentDateToBank
  ,[ChequeNoPaidToBank] = @ChequeNoPaidToBank
  ,[AmountInWords] = @AmountInWords
  ,[TDSAmount] = @TDSAmount
  ,[ServiceTax] = @ServiceTax
  ,[HSBCToVendor] = @HSBCToVendor
  ,[HSBCInterestDays] = @HSBCInterestDays
  ,[HSBCInterestAmountInStatement] = @HSBCInterestAmountInStatement
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  ,[ApprovedBy] = @ApprovedBy
  ,[ApprovedOn] = @ApprovedOn
  ,[PSFStatus] = @PSFStatus
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
