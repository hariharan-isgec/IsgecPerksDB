USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtSupplierBillInsert]
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
  @SupplierGSTINNumber NvarChar(50),
  @UploadBatchNo NVarChar(50),
  @Return_IRNo Int = null OUTPUT 
  AS
  INSERT [SPMT_SupplierBill]
  (
   [PurchaseType]
  ,[TranTypeID]
  ,[IsgecGSTIN]
  ,[BPID]
  ,[SupplierGSTIN]
  ,[BillType]
  ,[HSNSACCode]
  ,[ShipToState]
  ,[BillNumber]
  ,[BillDate]
  ,[BillRemarks]
  ,[UOM]
  ,[Quantity]
  ,[Currency]
  ,[ConversionFactorINR]
  ,[AssessableValue]
  ,[IGSTRate]
  ,[IGSTAmount]
  ,[CGSTRate]
  ,[CGSTAmount]
  ,[SGSTRate]
  ,[SGSTAmount]
  ,[CessRate]
  ,[CessAmount]
  ,[TotalGST]
  ,[TaxAmount]
  ,[TotalAmount]
  ,[TotalAmountINR]
  ,[RemarksGST]
  ,[DocLine]
  ,[ReasonID]
  ,[BasicValue]
  ,[VendorID]
  ,[ProjectID]
  ,[IRReceivedOn]
  ,[CostCenter]
  ,[ConcernedHOD]
  ,[ApprovedAmount]
  ,[BillStatusDate]
  ,[PassedAmount]
  ,[BillStatusUser]
  ,[BaaNLedger]
  ,[Discount]
  ,[CostCenterID]
  ,[DocumentLine]
  ,[Remarks]
  ,[DocNo]
  ,[LogisticLinked]
  ,[BaaNCompany]
  ,[AdviceNo]
  ,[DocumentNo]
  ,[VoucherNo]
  ,[EmployeeID]
  ,[ElementID]
  ,[ServiceCharge]
  ,[DepartmentID]
  ,[RemarksAC]
  ,[BillStatusID]
  ,[BillAmount]
  ,[ReturnedByAC]
  ,[BatchNo]
  ,[TaxRate]
  ,[SupplierName]
  ,[SupplierGSTINNumber]
  ,[UploadBatchNo]
  )
  VALUES
  (
   @PurchaseType
  ,@TranTypeID
  ,@IsgecGSTIN
  ,@BPID
  ,@SupplierGSTIN
  ,@BillType
  ,@HSNSACCode
  ,@ShipToState
  ,@BillNumber
  ,@BillDate
  ,@BillRemarks
  ,@UOM
  ,@Quantity
  ,@Currency
  ,@ConversionFactorINR
  ,@AssessableValue
  ,@IGSTRate
  ,@IGSTAmount
  ,@CGSTRate
  ,@CGSTAmount
  ,@SGSTRate
  ,@SGSTAmount
  ,@CessRate
  ,@CessAmount
  ,@TotalGST
  ,@TaxAmount
  ,@TotalAmount
  ,@TotalAmountINR
  ,@RemarksGST
  ,@DocLine
  ,@ReasonID
  ,@BasicValue
  ,@VendorID
  ,@ProjectID
  ,@IRReceivedOn
  ,@CostCenter
  ,@ConcernedHOD
  ,@ApprovedAmount
  ,@BillStatusDate
  ,@PassedAmount
  ,@BillStatusUser
  ,@BaaNLedger
  ,@Discount
  ,@CostCenterID
  ,@DocumentLine
  ,@Remarks
  ,@DocNo
  ,@LogisticLinked
  ,@BaaNCompany
  ,@AdviceNo
  ,@DocumentNo
  ,@VoucherNo
  ,@EmployeeID
  ,@ElementID
  ,@ServiceCharge
  ,@DepartmentID
  ,@RemarksAC
  ,@BillStatusID
  ,@BillAmount
  ,@ReturnedByAC
  ,@BatchNo
  ,@TaxRate
  ,@SupplierName
  ,@SupplierGSTINNumber
  ,@UploadBatchNo
  )
  SET @Return_IRNo = Scope_Identity()
GO
