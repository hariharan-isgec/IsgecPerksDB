USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtSupplierBillUpdate]
  @Original_IRNo Int, 
  @PurchaseType NVarChar(50),
  @TranTypeID NVarChar(3),
  @IsgecGSTIN Int,
  @BPID NVarChar(9),
  @SupplierGSTIN Int,
  @BillType Int,
  @HSNSACCode NVarChar(20),
  @ShipToState NVarChar(2),
  @BillNumber NVarChar(50),
  @BillDate DateTime,
  @BillRemarks NVarChar(500),
  @UOM NVarChar(3),
  @Quantity Decimal(18,2),
  @Currency NVarChar(50),
  @ConversionFactorINR Decimal(18,6),
  @AssessableValue Decimal(18,2),
  @IGSTRate Decimal(18,2),
  @IGSTAmount Decimal(18,2),
  @CGSTRate Decimal(18,2),
  @CGSTAmount Decimal(18,2),
  @SGSTRate Decimal(18,2),
  @SGSTAmount Decimal(18,2),
  @CessRate Decimal(18,2),
  @CessAmount Decimal(18,2),
  @TotalGST Decimal(18,2),
  @TaxAmount Decimal(18,2),
  @TotalAmount Decimal(18,2),
  @TotalAmountINR Decimal(18,2),
  @RemarksGST NVarChar(250),
  @DocLine NVarChar(10),
  @ReasonID Int,
  @BasicValue Decimal(18,2),
  @VendorID NVarChar(6),
  @ProjectID NVarChar(6),
  @IRReceivedOn DateTime,
  @CostCenter NVarChar(50),
  @ConcernedHOD NVarChar(8),
  @ApprovedAmount Decimal(18,2),
  @BillStatusDate DateTime,
  @PassedAmount Decimal(18,2),
  @BillStatusUser NVarChar(8),
  @BaaNLedger NVarChar(20),
  @Discount Decimal(18,2),
  @CostCenterID NVarChar(6),
  @DocumentLine NVarChar(50),
  @Remarks NVarChar(500),
  @DocNo NVarChar(10),
  @LogisticLinked Bit,
  @BaaNCompany NVarChar(10),
  @AdviceNo Int,
  @DocumentNo NVarChar(50),
  @VoucherNo Int,
  @EmployeeID NVarChar(8),
  @ElementID NVarChar(8),
  @ServiceCharge Decimal(18,2),
  @DepartmentID NVarChar(6),
  @RemarksAC NVarChar(500),
  @BillStatusID Int,
  @BillAmount Decimal(18,2),
  @ReturnedByAC Bit,
  @BatchNo NVarChar(10),
  @TaxRate Decimal(18,2),
  @SupplierName NVarChar(100),
  @SupplierGSTINNumber NVarChar(50),
  @UploadBatchNo NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_SupplierBill] SET 
   [PurchaseType] = @PurchaseType
  ,[TranTypeID] = @TranTypeID
  ,[IsgecGSTIN] = @IsgecGSTIN
  ,[BPID] = @BPID
  ,[SupplierGSTIN] = @SupplierGSTIN
  ,[BillType] = @BillType
  ,[HSNSACCode] = @HSNSACCode
  ,[ShipToState] = @ShipToState
  ,[BillNumber] = @BillNumber
  ,[BillDate] = @BillDate
  ,[BillRemarks] = @BillRemarks
  ,[UOM] = @UOM
  ,[Quantity] = @Quantity
  ,[Currency] = @Currency
  ,[ConversionFactorINR] = @ConversionFactorINR
  ,[AssessableValue] = @AssessableValue
  ,[IGSTRate] = @IGSTRate
  ,[IGSTAmount] = @IGSTAmount
  ,[CGSTRate] = @CGSTRate
  ,[CGSTAmount] = @CGSTAmount
  ,[SGSTRate] = @SGSTRate
  ,[SGSTAmount] = @SGSTAmount
  ,[CessRate] = @CessRate
  ,[CessAmount] = @CessAmount
  ,[TotalGST] = @TotalGST
  ,[TaxAmount] = @TaxAmount
  ,[TotalAmount] = @TotalAmount
  ,[TotalAmountINR] = @TotalAmountINR
  ,[RemarksGST] = @RemarksGST
  ,[DocLine] = @DocLine
  ,[ReasonID] = @ReasonID
  ,[BasicValue] = @BasicValue
  ,[VendorID] = @VendorID
  ,[ProjectID] = @ProjectID
  ,[IRReceivedOn] = @IRReceivedOn
  ,[CostCenter] = @CostCenter
  ,[ConcernedHOD] = @ConcernedHOD
  ,[ApprovedAmount] = @ApprovedAmount
  ,[BillStatusDate] = @BillStatusDate
  ,[PassedAmount] = @PassedAmount
  ,[BillStatusUser] = @BillStatusUser
  ,[BaaNLedger] = @BaaNLedger
  ,[Discount] = @Discount
  ,[CostCenterID] = @CostCenterID
  ,[DocumentLine] = @DocumentLine
  ,[Remarks] = @Remarks
  ,[DocNo] = @DocNo
  ,[LogisticLinked] = @LogisticLinked
  ,[BaaNCompany] = @BaaNCompany
  ,[AdviceNo] = @AdviceNo
  ,[DocumentNo] = @DocumentNo
  ,[VoucherNo] = @VoucherNo
  ,[EmployeeID] = @EmployeeID
  ,[ElementID] = @ElementID
  ,[ServiceCharge] = @ServiceCharge
  ,[DepartmentID] = @DepartmentID
  ,[RemarksAC] = @RemarksAC
  ,[BillStatusID] = @BillStatusID
  ,[BillAmount] = @BillAmount
  ,[ReturnedByAC] = @ReturnedByAC
  ,[BatchNo] = @BatchNo
  ,[TaxRate] = @TaxRate
  ,[SupplierName]=@SupplierName
  ,[SupplierGSTINNumber]=@SupplierGSTINNumber
  ,[UploadBatchNo]=@UploadBatchNo  
  WHERE
  [IRNo] = @Original_IRNo
  SET @RowCount = @@RowCount
GO
