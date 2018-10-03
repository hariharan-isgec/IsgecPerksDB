USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptsUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_MRNNo Int, 
  @ProjectID NVarChar(6),
  @RequestExecutionNo Int,
  @MRNNo Int,
  @MRNDate DateTime,
  @TransporterID NVarChar(9),
  @TransporterName NVarChar(50),
  @CustomerID NVarChar(9),
  @VehicleRegistrationNo NVarChar(50),
  @WayBillFormNo NVarChar(50),
  @PaymentMadeAtSite Bit,
  @AmountPaid Decimal(10,2),
  @VehicleInDate DateTime,
  @VehicleOutDate DateTime,
  @DetentionAtSite NVarChar(10),
  @ReasonForDetention NVarChar(500),
  @OverDimensionConsignment NVarChar(10),
  @VehicleTypeID Int,
  @VehicleType NVarChar(50),
  @VehicleLengthInFt Decimal(6,2),
  @VechicleWidthInFt Decimal(6,2),
  @VehicleHeightInFt Decimal(6,2),
  @MaterialStateID Int,
  @RemarksForDamageOrShortage NVarChar(500),
  @OtherRemarks NVarChar(500),
  @DriverNameAndContactNo NVarChar(50),
  @CreatedBy NVarChar(8),
  @LRStatusID Int,
  @CreatedOn DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_LorryReceipts] SET 
   [ProjectID] = @ProjectID
  ,[RequestExecutionNo] = @RequestExecutionNo
  ,[MRNNo] = @MRNNo
  ,[MRNDate] = @MRNDate
  ,[TransporterID] = @TransporterID
  ,[TransporterName] = @TransporterName
  ,[CustomerID] = @CustomerID
  ,[VehicleRegistrationNo] = @VehicleRegistrationNo
  ,[WayBillFormNo] = @WayBillFormNo
  ,[PaymentMadeAtSite] = @PaymentMadeAtSite
  ,[AmountPaid] = @AmountPaid
  ,[VehicleInDate] = @VehicleInDate
  ,[VehicleOutDate] = @VehicleOutDate
  ,[DetentionAtSite] = @DetentionAtSite
  ,[ReasonForDetention] = @ReasonForDetention
  ,[OverDimensionConsignment] = @OverDimensionConsignment
  ,[VehicleTypeID] = @VehicleTypeID
  ,[VehicleType] = @VehicleType
  ,[VehicleLengthInFt] = @VehicleLengthInFt
  ,[VechicleWidthInFt] = @VechicleWidthInFt
  ,[VehicleHeightInFt] = @VehicleHeightInFt
  ,[MaterialStateID] = @MaterialStateID
  ,[RemarksForDamageOrShortage] = @RemarksForDamageOrShortage
  ,[OtherRemarks] = @OtherRemarks
  ,[DriverNameAndContactNo] = @DriverNameAndContactNo
  ,[CreatedBy] = @CreatedBy
  ,[LRStatusID] = @LRStatusID
  ,[CreatedOn] = @CreatedOn
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [MRNNo] = @Original_MRNNo
  SET @RowCount = @@RowCount
GO
