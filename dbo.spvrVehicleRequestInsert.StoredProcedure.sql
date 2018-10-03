USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleRequestInsert]
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
  @Return_RequestNo Int = null OUTPUT 
  AS
  INSERT [VR_VehicleRequest]
  (
   [RequestDescription]
  ,[SupplierID]
  ,[SupplierLocation]
  ,[ProjectID]
  ,[ProjectType]
  ,[DeliveryLocation]
  ,[ItemDescription]
  ,[MaterialSize]
  ,[SizeUnit]
  ,[Height]
  ,[Width]
  ,[Length]
  ,[MaterialWeight]
  ,[WeightUnit]
  ,[NoOfPackages]
  ,[VehicleTypeID]
  ,[VehicleRequiredOn]
  ,[OverDimentionConsignement]
  ,[ODCReasonID]
  ,[Remarks]
  ,[MICN]
  ,[CustomInvoiceNo]
  ,[RequestedBy]
  ,[RequestedOn]
  ,[RequesterDivisionID]
  ,[RequestStatus]
  ,[ReturnedOn]
  ,[ReturnedBy]
  ,[ReturnRemarks]
  ,[SRNNo]
  ,[ValidRequest]
  ,[ODCAtSupplierLoading]
  ,[FromLocation]
  ,[ToLocation]
  ,[CustomInvoiceIssued]
  ,[CT1Issued]
  ,[ARE1Issued]
  ,[DIIssued]
  ,[PaymentChecked]
  ,[GoodsPacked]
  ,[POApproved]
  ,[WayBill]
  ,[MarkingDetails]
  ,[TarpaulineRequired]
  ,[PackageStckable]
  ,[InvoiceValue]
  ,[OutOfContract]
  ,[ERPPONumber]
  ,[BuyerInERP]
  )
  VALUES
  (
   @RequestDescription
  ,@SupplierID
  ,@SupplierLocation
  ,@ProjectID
  ,@ProjectType
  ,@DeliveryLocation
  ,@ItemDescription
  ,@MaterialSize
  ,@SizeUnit
  ,@Height
  ,@Width
  ,@Length
  ,@MaterialWeight
  ,@WeightUnit
  ,@NoOfPackages
  ,@VehicleTypeID
  ,@VehicleRequiredOn
  ,@OverDimentionConsignement
  ,@ODCReasonID
  ,@Remarks
  ,@MICN
  ,@CustomInvoiceNo
  ,@RequestedBy
  ,@RequestedOn
  ,@RequesterDivisionID
  ,@RequestStatus
  ,@ReturnedOn
  ,@ReturnedBy
  ,@ReturnRemarks
  ,@SRNNo
  ,@ValidRequest
  ,@ODCAtSupplierLoading
  ,@FromLocation
  ,@ToLocation
  ,@CustomInvoiceIssued
  ,@CT1Issued
  ,@ARE1Issued
  ,@DIIssued
  ,@PaymentChecked
  ,@GoodsPacked
  ,@POApproved
  ,@WayBill
  ,@MarkingDetails
  ,@TarpaulineRequired
  ,@PackageStckable
  ,@InvoiceValue
  ,@OutOfContract
  ,@ERPPONumber
  ,@BuyerInERP
  )
  SET @Return_RequestNo = Scope_Identity()
GO
