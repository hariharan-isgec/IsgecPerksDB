USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewSBHUpdate]
  @Original_IRNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_newSBH] SET 
   [TranTypeID] = @TranTypeID
  ,[SupplierName] = @SupplierName
  ,[BillNumber] = @BillNumber
  ,[BillDate] = @BillDate
  ,[CreatedBy] = @CreatedBy
  ,[TotalBillAmount] = @TotalBillAmount
  ,[AdviceNo] = @AdviceNo
  ,[IsgecGSTIN] = @IsgecGSTIN
  ,[CreatedOn] = @CreatedOn
  ,[EmployeeID] = @EmployeeID
  ,[IRReceivedOn] = @IRReceivedOn
  ,[BillRemarks] = @BillRemarks
  ,[PurchaseType] = @PurchaseType
  ,[UploadBatchNo] = @UploadBatchNo
  ,[CostCenterID] = @CostCenterID
  ,[SupplierGSTIN] = @SupplierGSTIN
  ,[SupplierGSTINNumber] = @SupplierGSTINNumber
  ,[ShipToState] = @ShipToState
  ,[BPID] = @BPID
  ,[DepartmentID] = @DepartmentID
  ,[ElementID] = @ElementID
  ,[ProjectID] = @ProjectID
  WHERE
  [IRNo] = @Original_IRNo
  SET @RowCount = @@RowCount
GO
