USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtPaymentAdviceUpdate]
  @Original_AdviceNo Int, 
  @TranTypeID NVarChar(3),
  @BPID NVarChar(9),
  @ConcernedHOD NVarChar(8),
  @CostCenter NVarChar(50),
  @AdviceStatusUser NVarChar(8),
  @AdviceStatusID Int,
  @RemarksAC NVarChar(500),
  @VendorID NVarChar(6),
  @AdviceStatusOn DateTime,
  @Remarks NVarChar(500),
  @RemarksHOD NVarChar(500),
  @RemarksHR NVarChar(500),
  @Returned Bit,
  @Forward Bit,
  @ProjectID NVarChar(6),
  @ElementID NVarChar(8),
  @CostCenterID NVarChar(6),
  @EmployeeID NVarChar(8),
  @DepartmentID NVarChar(6),
  @VoucherNo Int,
  @DocumentNo NVarChar(50),
  @BaaNCompany NVarChar(10),
  @BaaNLedger NVarChar(20),
  @SupplierName NVarChar(100),
  @AdvanceRate Decimal(18,2),
  @AdvanceAmount Decimal(18,2),
  @RetensionRate Decimal(18,2),
  @RetensionAmount Decimal(18,2),
  @UploadBatchNo NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_PaymentAdvice] SET 
   [TranTypeID] = @TranTypeID
  ,[BPID] = @BPID
  ,[ConcernedHOD] = @ConcernedHOD
  ,[CostCenter] = @CostCenter
  ,[AdviceStatusUser] = @AdviceStatusUser
  ,[AdviceStatusID] = @AdviceStatusID
  ,[RemarksAC] = @RemarksAC
  ,[VendorID] = @VendorID
  ,[AdviceStatusOn] = @AdviceStatusOn
  ,[Remarks] = @Remarks
  ,[RemarksHOD] = @RemarksHOD
  ,[RemarksHR] = @RemarksHR
  ,[Returned] = @Returned
  ,[Forward] = @Forward
  ,[ProjectID] = @ProjectID
  ,[ElementID] = @ElementID
  ,[CostCenterID] = @CostCenterID
  ,[EmployeeID] = @EmployeeID
  ,[DepartmentID] = @DepartmentID
  ,[VoucherNo] = @VoucherNo
  ,[DocumentNo] = @DocumentNo
  ,[BaaNCompany] = @BaaNCompany
  ,[BaaNLedger] = @BaaNLedger
  ,[SupplierName]=@SupplierName
  ,[AdvanceRate]=@AdvanceRate
  ,[AdvanceAmount]=@AdvanceAmount
  ,[RetensionRate]=@RetensionRate
  ,[RetensionAmount]=@RetensionAmount  
  ,[UploadBatchNo]=@UploadBatchNo 
  WHERE
  [AdviceNo] = @Original_AdviceNo
  SET @RowCount = @@RowCount
GO
