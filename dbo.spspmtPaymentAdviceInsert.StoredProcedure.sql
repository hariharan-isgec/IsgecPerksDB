USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtPaymentAdviceInsert]
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
  @Return_AdviceNo Int = null OUTPUT 
  AS
  INSERT [SPMT_PaymentAdvice]
  (
   [TranTypeID]
  ,[BPID]
  ,[ConcernedHOD]
  ,[CostCenter]
  ,[AdviceStatusUser]
  ,[AdviceStatusID]
  ,[RemarksAC]
  ,[VendorID]
  ,[AdviceStatusOn]
  ,[Remarks]
  ,[RemarksHOD]
  ,[RemarksHR]
  ,[Returned]
  ,[Forward]
  ,[ProjectID]
  ,[ElementID]
  ,[CostCenterID]
  ,[EmployeeID]
  ,[DepartmentID]
  ,[VoucherNo]
  ,[DocumentNo]
  ,[BaaNCompany]
  ,[BaaNLedger]
  ,[SupplierName]
  ,[AdvanceRate]
  ,[AdvanceAmount]
  ,[RetensionRate]
  ,[RetensionAmount]
  ,[UploadBatchNo]
  )
  VALUES
  (
   @TranTypeID
  ,@BPID
  ,@ConcernedHOD
  ,@CostCenter
  ,@AdviceStatusUser
  ,@AdviceStatusID
  ,@RemarksAC
  ,@VendorID
  ,@AdviceStatusOn
  ,@Remarks
  ,@RemarksHOD
  ,@RemarksHR
  ,@Returned
  ,@Forward
  ,@ProjectID
  ,@ElementID
  ,@CostCenterID
  ,@EmployeeID
  ,@DepartmentID
  ,@VoucherNo
  ,@DocumentNo
  ,@BaaNCompany
  ,@BaaNLedger
  ,@SupplierName
  ,@AdvanceRate
  ,@AdvanceAmount
  ,@RetensionRate
  ,@RetensionAmount
  ,@UploadBatchNo
  )
  SET @Return_AdviceNo = Scope_Identity()
GO
