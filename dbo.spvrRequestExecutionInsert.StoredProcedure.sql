USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestExecutionInsert]
  @ExecutionDescription NVarChar(50),
  @TransporterID NVarChar(9),
  @VehiclePlacedOn DateTime,
  @VehicleTypeID Int,
  @VehicleNo NVarChar(20),
  @Remarks NVarChar(500),
  @ArrangedBy NVarChar(8),
  @ArrangedOn DateTime,
  @TraficOfficerDivisionID NVarChar(6),
  @RequestStatusID Int,
  @ApprovalRemarks NVarChar(200),
  @ApprovedBy NVarChar(8),
  @ApprovedOn DateTime,
  @GRNo NVarChar(50),
  @GRDate DateTime,
  @LoadedAtSupplier Bit,
  @LoadedOn DateTime,
  @TransShipment Bit,
  @TransGRNO NVarChar(50),
  @TransGRDate DateTime,
  @TransVehicleNo NVarChar(20),
  @TransVehicleTypeID Int,
  @TransTransporterID NVarChar(9),
  @ReceiptAtSite Bit,
  @ReceiptBy NVarChar(8),
  @ReceiptOn DateTime,
  @MaterialStateID Int,
  @ReceiptMaterialSize NVarChar(50),
  @ReceiptMaterialWeight Decimal(18,2),
  @ReceiptSizeUnit Int,
  @ReceiptNoOfPackages Int,
  @ReachedAtSite Bit,
  @ReachedOn DateTime,
  @UnloadedAtSite Bit,
  @UnloadedOn DateTime,
  @SiteReceiptNo NVarChar(50),
  @SiteReceiptDate DateTime,
  @ReceiptRemarks NVarChar(500),
  @TransShipmentAtSite Bit,
  @SiteGRNO NVarChar(50),
  @SiteGRDate DateTime,
  @SiteVehicleNo NVarChar(20),
  @SiteVehicleTypeID Int,
  @SiteTransporterID NVarChar(9),
  @IRNo Int,
  @MaterialSize NVarChar(50),
  @SizeUnit Int,
  @Height Decimal(6,2),
  @Width Decimal(6,2),
  @Length Decimal(6,2),
  @MaterialWeight Decimal(18,2),
  @WeightUnit Int,
  @NoOfPackages Int,
  @OverDimentionConsignement Bit,
  @GRRemarks NVarChar(500),
  @TransRemarks NVarChar(500),
  @ReachedAtSupplierOn DateTime,
  @ODCByRequest Bit,
  @Linked Bit,
  @LinkID Int,
  @VehicleNotPlaced Bit,
  @DelayedPlacement Bit,
  @EmptyReturn Bit,
  @DetentionAtSupplier Bit,
  @DebitToTransporter Bit,
  @PayableToTransporter Bit,
  @BorneByISGEC Bit,
  @BorneBySupplier Bit,
  @DebitAmount Decimal(18,2),
  @PayableAmount Decimal(18,2),
  @ISGECAmount Decimal(18,2),
  @SupplierAmount Decimal(18,2),
  @EmptyReturnRemarks NVarChar(250),
  @ODCReasonID Int,
  @EstimatedDistance Decimal(10,2),
  @EstimatedRatePerKM Decimal(8,2),
  @EstimatedAmount Decimal(12,2),
  @EstimatedPOBalance Decimal(12,2),
  @POValue Decimal(12,2),
  @SanctionExceeded Bit,
  @SanctionExceededApproved Bit,
  @SanctionApprovalRemarks NVarChar(250),
  @SanctionApprovedBy NVarChar(8),
  @SanctionApprovedOn DateTime,
  @Return_SRNNo Int = null OUTPUT 
  AS
  INSERT [VR_RequestExecution]
  (
   [ExecutionDescription]
  ,[TransporterID]
  ,[VehiclePlacedOn]
  ,[VehicleTypeID]
  ,[VehicleNo]
  ,[Remarks]
  ,[ArrangedBy]
  ,[ArrangedOn]
  ,[TraficOfficerDivisionID]
  ,[RequestStatusID]
  ,[ApprovalRemarks]
  ,[ApprovedBy]
  ,[ApprovedOn]
  ,[GRNo]
  ,[GRDate]
  ,[LoadedAtSupplier]
  ,[LoadedOn]
  ,[TransShipment]
  ,[TransGRNO]
  ,[TransGRDate]
  ,[TransVehicleNo]
  ,[TransVehicleTypeID]
  ,[TransTransporterID]
  ,[ReceiptAtSite]
  ,[ReceiptBy]
  ,[ReceiptOn]
  ,[MaterialStateID]
  ,[ReceiptMaterialSize]
  ,[ReceiptMaterialWeight]
  ,[ReceiptSizeUnit]
  ,[ReceiptNoOfPackages]
  ,[ReachedAtSite]
  ,[ReachedOn]
  ,[UnloadedAtSite]
  ,[UnloadedOn]
  ,[SiteReceiptNo]
  ,[SiteReceiptDate]
  ,[ReceiptRemarks]
  ,[TransShipmentAtSite]
  ,[SiteGRNO]
  ,[SiteGRDate]
  ,[SiteVehicleNo]
  ,[SiteVehicleTypeID]
  ,[SiteTransporterID]
  ,[IRNo]
  ,[MaterialSize]
  ,[SizeUnit]
  ,[Height]
  ,[Width]
  ,[Length]
  ,[MaterialWeight]
  ,[WeightUnit]
  ,[NoOfPackages]
  ,[OverDimentionConsignement]
  ,[GRRemarks]
  ,[TransRemarks]
  ,[ReachedAtSupplierOn]
  ,[ODCByRequest]
  ,[Linked]
  ,[LinkID]
  ,[VehicleNotPlaced]
  ,[DelayedPlacement]
  ,[EmptyReturn]
  ,[DetentionAtSupplier]
  ,[DebitToTransporter]
  ,[PayableToTransporter]
  ,[BorneByISGEC]
  ,[BorneBySupplier]
  ,[DebitAmount]
  ,[PayableAmount]
  ,[ISGECAmount]
  ,[SupplierAmount]
  ,[EmptyReturnRemarks]
  ,[ODCReasonID]
  ,[EstimatedDistance]
  ,[EstimatedRatePerKM]
  ,[EstimatedAmount]
  ,[EstimatedPOBalance]
  ,[POValue]
  ,[SanctionExceeded]
  ,[SanctionExceededApproved]
  ,[SanctionApprovalRemarks]
  ,[SanctionApprovedBy]
  ,[SanctionApprovedOn]
  )
  VALUES
  (
   @ExecutionDescription
  ,@TransporterID
  ,@VehiclePlacedOn
  ,@VehicleTypeID
  ,@VehicleNo
  ,@Remarks
  ,@ArrangedBy
  ,@ArrangedOn
  ,@TraficOfficerDivisionID
  ,@RequestStatusID
  ,@ApprovalRemarks
  ,@ApprovedBy
  ,@ApprovedOn
  ,@GRNo
  ,@GRDate
  ,@LoadedAtSupplier
  ,@LoadedOn
  ,@TransShipment
  ,@TransGRNO
  ,@TransGRDate
  ,@TransVehicleNo
  ,@TransVehicleTypeID
  ,@TransTransporterID
  ,@ReceiptAtSite
  ,@ReceiptBy
  ,@ReceiptOn
  ,@MaterialStateID
  ,@ReceiptMaterialSize
  ,@ReceiptMaterialWeight
  ,@ReceiptSizeUnit
  ,@ReceiptNoOfPackages
  ,@ReachedAtSite
  ,@ReachedOn
  ,@UnloadedAtSite
  ,@UnloadedOn
  ,@SiteReceiptNo
  ,@SiteReceiptDate
  ,@ReceiptRemarks
  ,@TransShipmentAtSite
  ,@SiteGRNO
  ,@SiteGRDate
  ,@SiteVehicleNo
  ,@SiteVehicleTypeID
  ,@SiteTransporterID
  ,@IRNo
  ,@MaterialSize
  ,@SizeUnit
  ,@Height
  ,@Width
  ,@Length
  ,@MaterialWeight
  ,@WeightUnit
  ,@NoOfPackages
  ,@OverDimentionConsignement
  ,@GRRemarks
  ,@TransRemarks
  ,@ReachedAtSupplierOn
  ,@ODCByRequest
  ,@Linked
  ,@LinkID
  ,@VehicleNotPlaced
  ,@DelayedPlacement
  ,@EmptyReturn
  ,@DetentionAtSupplier
  ,@DebitToTransporter
  ,@PayableToTransporter
  ,@BorneByISGEC
  ,@BorneBySupplier
  ,@DebitAmount
  ,@PayableAmount
  ,@ISGECAmount
  ,@SupplierAmount
  ,@EmptyReturnRemarks
  ,@ODCReasonID
  ,@EstimatedDistance
  ,@EstimatedRatePerKM
  ,@EstimatedAmount
  ,@EstimatedPOBalance
  ,@POValue
  ,@SanctionExceeded
  ,@SanctionExceededApproved
  ,@SanctionApprovalRemarks
  ,@SanctionApprovedBy
  ,@SanctionApprovedOn
  )
  SET @Return_SRNNo = Scope_Identity()
GO
