USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillUpdate]
  @Original_IRNo Int, 
  @IRNo Int,
  @IRDate DateTime,
  @SupplierID NVarChar(9),
  @SupplierBillNo NVarChar(50),
  @SupplierBillDate DateTime,
  @BillAmount Decimal(18,2),
  @GRNo NVarChar(50),
  @GRDate DateTime,
  @ProjectID NVarChar(6),
  @PONumber NVarChar(9),
  @BillTypeID Int,
  @OtherBillType NVarChar(20),
  @VehicleExeNo Int,
  @MRNNo Int,
  @CreatedOn DateTime,
  @StatusID Int,
  @CreatedBy NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_DetentionBill] SET 
   [IRNo] = @IRNo
  ,[IRDate] = @IRDate
  ,[SupplierID] = @SupplierID
  ,[SupplierBillNo] = @SupplierBillNo
  ,[SupplierBillDate] = @SupplierBillDate
  ,[BillAmount] = @BillAmount
  ,[GRNo] = @GRNo
  ,[GRDate] = @GRDate
  ,[ProjectID] = @ProjectID
  ,[PONumber] = @PONumber
  ,[BillTypeID] = @BillTypeID
  ,[OtherBillType] = @OtherBillType
  ,[VehicleExeNo] = @VehicleExeNo
  ,[MRNNo] = @MRNNo
  ,[CreatedOn] = @CreatedOn
  ,[StatusID] = @StatusID
  ,[CreatedBy] = @CreatedBy
  WHERE
  [IRNo] = @Original_IRNo
  SET @RowCount = @@RowCount
GO
