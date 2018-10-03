USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestExecutionUpdate]
  @Original_SRNNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_RequestExecution] SET 
   [ExecutionDescription] = @ExecutionDescription
  ,[TransporterID] = @TransporterID
  ,[VehiclePlacedOn] = @VehiclePlacedOn
  ,[VehicleTypeID] = @VehicleTypeID
  ,[VehicleNo] = @VehicleNo
  ,[Remarks] = @Remarks
  ,[ArrangedBy] = @ArrangedBy
  ,[ArrangedOn] = @ArrangedOn
  ,[TraficOfficerDivisionID] = @TraficOfficerDivisionID
  ,[RequestStatusID] = @RequestStatusID
  ,[ApprovalRemarks] = @ApprovalRemarks
  ,[ApprovedBy] = @ApprovedBy
  ,[ApprovedOn] = @ApprovedOn
  ,[GRNo] = @GRNo
  ,[GRDate] = @GRDate
  ,[LoadedAtSupplier] = @LoadedAtSupplier
  ,[LoadedOn] = @LoadedOn
  ,[TransShipment] = @TransShipment
  ,[TransGRNO] = @TransGRNO
  ,[TransGRDate] = @TransGRDate
  ,[TransVehicleNo] = @TransVehicleNo
  ,[TransVehicleTypeID] = @TransVehicleTypeID
  ,[TransTransporterID] = @TransTransporterID
  ,[ReceiptAtSite] = @ReceiptAtSite
  ,[ReceiptBy] = @ReceiptBy
  ,[ReceiptOn] = @ReceiptOn
  ,[MaterialStateID] = @MaterialStateID
  ,[ReceiptMaterialSize] = @ReceiptMaterialSize
  ,[ReceiptMaterialWeight] = @ReceiptMaterialWeight
  ,[ReceiptSizeUnit] = @ReceiptSizeUnit
  ,[ReceiptNoOfPackages] = @ReceiptNoOfPackages
  ,[ReachedAtSite] = @ReachedAtSite
  ,[ReachedOn] = @ReachedOn
  ,[UnloadedAtSite] = @UnloadedAtSite
  ,[UnloadedOn] = @UnloadedOn
  ,[SiteReceiptNo] = @SiteReceiptNo
  ,[SiteReceiptDate] = @SiteReceiptDate
  ,[ReceiptRemarks] = @ReceiptRemarks
  ,[TransShipmentAtSite] = @TransShipmentAtSite
  ,[SiteGRNO] = @SiteGRNO
  ,[SiteGRDate] = @SiteGRDate
  ,[SiteVehicleNo] = @SiteVehicleNo
  ,[SiteVehicleTypeID] = @SiteVehicleTypeID
  ,[SiteTransporterID] = @SiteTransporterID
  ,[IRNo] = @IRNo
  ,[MaterialSize] = @MaterialSize
  ,[SizeUnit] = @SizeUnit
  ,[Height] = @Height
  ,[Width] = @Width
  ,[Length] = @Length
  ,[MaterialWeight] = @MaterialWeight
  ,[WeightUnit] = @WeightUnit
  ,[NoOfPackages] = @NoOfPackages
  ,[OverDimentionConsignement] = @OverDimentionConsignement
  ,[GRRemarks] = @GRRemarks
  ,[TransRemarks] = @TransRemarks
  ,[ReachedAtSupplierOn] = @ReachedAtSupplierOn
  ,[ODCByRequest] = @ODCByRequest
  ,[Linked] = @Linked
  ,[LinkID] = @LinkID
  ,[VehicleNotPlaced] = @VehicleNotPlaced
  ,[DelayedPlacement] = @DelayedPlacement
  ,[EmptyReturn] = @EmptyReturn
  ,[DetentionAtSupplier] = @DetentionAtSupplier
  ,[DebitToTransporter] = @DebitToTransporter
  ,[PayableToTransporter] = @PayableToTransporter
  ,[BorneByISGEC] = @BorneByISGEC
  ,[BorneBySupplier] = @BorneBySupplier
  ,[DebitAmount] = @DebitAmount
  ,[PayableAmount] = @PayableAmount
  ,[ISGECAmount] = @ISGECAmount
  ,[SupplierAmount] = @SupplierAmount
  ,[EmptyReturnRemarks] = @EmptyReturnRemarks
  ,[ODCReasonID] = @ODCReasonID
  ,[EstimatedDistance] = @EstimatedDistance
  ,[EstimatedRatePerKM] = @EstimatedRatePerKM
  ,[EstimatedAmount] = @EstimatedAmount
  ,[EstimatedPOBalance] = @EstimatedPOBalance
  ,[POValue] = @POValue
  ,[SanctionExceeded] = @SanctionExceeded
  ,[SanctionExceededApproved] = @SanctionExceededApproved
  ,[SanctionApprovalRemarks] = @SanctionApprovalRemarks
  ,[SanctionApprovedBy] = @SanctionApprovedBy
  ,[SanctionApprovedOn] = @SanctionApprovedOn
  WHERE
  [SRNNo] = @Original_SRNNo
  SET @RowCount = @@RowCount
GO
