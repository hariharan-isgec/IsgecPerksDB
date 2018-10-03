USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewSBHInsert]
  @TranTypeID NVarChar(3),
  @SupplierName NVarChar(100),
  @BillNumber NVarChar(50),
  @BillDate DateTime,
  @CreatedBy NVarChar(8),
  @TotalBillAmount Decimal(18,2),
  @AdviceNo Int,
  @IsgecGSTIN Int,
  @CreatedOn DateTime,
  @EmployeeID NVarChar(8),
  @IRReceivedOn DateTime,
  @BillRemarks NVarChar(500),
  @PurchaseType NVarChar(50),
  @UploadBatchNo NVarChar(50),
  @CostCenterID NVarChar(6),
  @SupplierGSTIN Int,
  @SupplierGSTINNumber NVarChar(50),
  @ShipToState NVarChar(2),
  @BPID NVarChar(9),
  @DepartmentID NVarChar(6),
  @ElementID NVarChar(8),
  @ProjectID NVarChar(6),
  @Return_IRNo Int = null OUTPUT 
  AS
  INSERT [SPMT_newSBH]
  (
   [TranTypeID]
  ,[SupplierName]
  ,[BillNumber]
  ,[BillDate]
  ,[CreatedBy]
  ,[TotalBillAmount]
  ,[AdviceNo]
  ,[IsgecGSTIN]
  ,[CreatedOn]
  ,[EmployeeID]
  ,[IRReceivedOn]
  ,[BillRemarks]
  ,[PurchaseType]
  ,[UploadBatchNo]
  ,[CostCenterID]
  ,[SupplierGSTIN]
  ,[SupplierGSTINNumber]
  ,[ShipToState]
  ,[BPID]
  ,[DepartmentID]
  ,[ElementID]
  ,[ProjectID]
  )
  VALUES
  (
   @TranTypeID
  ,@SupplierName
  ,@BillNumber
  ,@BillDate
  ,@CreatedBy
  ,@TotalBillAmount
  ,@AdviceNo
  ,@IsgecGSTIN
  ,@CreatedOn
  ,@EmployeeID
  ,@IRReceivedOn
  ,@BillRemarks
  ,@PurchaseType
  ,@UploadBatchNo
  ,@CostCenterID
  ,@SupplierGSTIN
  ,@SupplierGSTINNumber
  ,@ShipToState
  ,@BPID
  ,@DepartmentID
  ,@ElementID
  ,@ProjectID
  )
  SET @Return_IRNo = Scope_Identity()
GO
