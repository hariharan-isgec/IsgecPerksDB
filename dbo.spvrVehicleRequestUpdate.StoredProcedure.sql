USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleRequestUpdate]
  @Original_RequestNo Int, 
  @RequestDescription NVarChar(50),
  @SupplierID NVarChar(9),
  @SupplierLocation NVarChar(250),
  @ProjectID NVarChar(6),
  @ProjectType NVarChar(10),
  @DeliveryLocation NVarChar(400),
  @ItemDescription NVarChar(500),
  @MaterialSize NVarChar(50),
  @SizeUnit Int,
  @Height Decimal(6,2),
  @Width Decimal(6,2),
  @Length Decimal(6,2),
  @MaterialWeight Decimal(18,2),
  @WeightUnit Int,
  @NoOfPackages Int,
  @VehicleTypeID Int,
  @VehicleRequiredOn DateTime,
  @OverDimentionConsignement Bit,
  @ODCReasonID Int,
  @Remarks NVarChar(500),
  @MICN Bit,
  @CustomInvoiceNo NVarChar(100),
  @RequestedBy NVarChar(8),
  @RequestedOn DateTime,
  @RequesterDivisionID NVarChar(6),
  @RequestStatus Int,
  @ReturnedOn DateTime,
  @ReturnedBy NVarChar(8),
  @ReturnRemarks NVarChar(100),
  @SRNNo Int,
  @ValidRequest Bit,
  @ODCAtSupplierLoading Bit,
  @FromLocation NVarChar(50),
  @ToLocation NVarChar(50),
  @CustomInvoiceIssued Bit,
  @CT1Issued Bit,
  @ARE1Issued Bit,
  @DIIssued Bit,
  @PaymentChecked Bit,
  @GoodsPacked Bit,
  @POApproved Bit,
  @WayBill Bit,
  @MarkingDetails Bit,
  @TarpaulineRequired Bit,
  @PackageStckable Bit,
  @InvoiceValue Decimal(13,2),
  @OutOfContract Bit,
  @ERPPONumber NVarChar(10),
  @BuyerInERP NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_VehicleRequest] SET 
   [RequestDescription] = @RequestDescription
  ,[SupplierID] = @SupplierID
  ,[SupplierLocation] = @SupplierLocation
  ,[ProjectID] = @ProjectID
  ,[ProjectType] = @ProjectType
  ,[DeliveryLocation] = @DeliveryLocation
  ,[ItemDescription] = @ItemDescription
  ,[MaterialSize] = @MaterialSize
  ,[SizeUnit] = @SizeUnit
  ,[Height] = @Height
  ,[Width] = @Width
  ,[Length] = @Length
  ,[MaterialWeight] = @MaterialWeight
  ,[WeightUnit] = @WeightUnit
  ,[NoOfPackages] = @NoOfPackages
  ,[VehicleTypeID] = @VehicleTypeID
  ,[VehicleRequiredOn] = @VehicleRequiredOn
  ,[OverDimentionConsignement] = @OverDimentionConsignement
  ,[ODCReasonID] = @ODCReasonID
  ,[Remarks] = @Remarks
  ,[MICN] = @MICN
  ,[CustomInvoiceNo] = @CustomInvoiceNo
  ,[RequestedBy] = @RequestedBy
  ,[RequestedOn] = @RequestedOn
  ,[RequesterDivisionID] = @RequesterDivisionID
  ,[RequestStatus] = @RequestStatus
  ,[ReturnedOn] = @ReturnedOn
  ,[ReturnedBy] = @ReturnedBy
  ,[ReturnRemarks] = @ReturnRemarks
  ,[SRNNo] = @SRNNo
  ,[ValidRequest] = @ValidRequest
  ,[ODCAtSupplierLoading] = @ODCAtSupplierLoading
  ,[FromLocation] = @FromLocation
  ,[ToLocation] = @ToLocation
  ,[CustomInvoiceIssued] = @CustomInvoiceIssued
  ,[CT1Issued] = @CT1Issued
  ,[ARE1Issued] = @ARE1Issued
  ,[DIIssued] = @DIIssued
  ,[PaymentChecked] = @PaymentChecked
  ,[GoodsPacked] = @GoodsPacked
  ,[POApproved] = @POApproved
  ,[WayBill] = @WayBill
  ,[MarkingDetails] = @MarkingDetails
  ,[TarpaulineRequired] = @TarpaulineRequired
  ,[PackageStckable] = @PackageStckable
  ,[InvoiceValue] = @InvoiceValue
  ,[OutOfContract] = @OutOfContract
  ,[ERPPONumber] = @ERPPONumber
  ,[BuyerInERP] = @BuyerInERP
  WHERE
  [RequestNo] = @Original_RequestNo
  SET @RowCount = @@RowCount
GO
