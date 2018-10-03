USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillInsert]
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
  @Return_IRNo Int = null OUTPUT 
  AS
  INSERT [ELOG_DetentionBill]
  (
   [IRNo]
  ,[IRDate]
  ,[SupplierID]
  ,[SupplierBillNo]
  ,[SupplierBillDate]
  ,[BillAmount]
  ,[GRNo]
  ,[GRDate]
  ,[ProjectID]
  ,[PONumber]
  ,[BillTypeID]
  ,[OtherBillType]
  ,[VehicleExeNo]
  ,[MRNNo]
  ,[CreatedOn]
  ,[StatusID]
  ,[CreatedBy]
  )
  VALUES
  (
   @IRNo
  ,@IRDate
  ,@SupplierID
  ,@SupplierBillNo
  ,@SupplierBillDate
  ,@BillAmount
  ,@GRNo
  ,@GRDate
  ,@ProjectID
  ,@PONumber
  ,@BillTypeID
  ,@OtherBillType
  ,@VehicleExeNo
  ,@MRNNo
  ,@CreatedOn
  ,@StatusID
  ,@CreatedBy
  )
  SET @Return_IRNo = @IRNo
GO
