USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptsInsert]
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
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_MRNNo Int = null OUTPUT 
  AS
  INSERT [VR_LorryReceipts]
  (
   [ProjectID]
  ,[RequestExecutionNo]
  ,[MRNNo]
  ,[MRNDate]
  ,[TransporterID]
  ,[TransporterName]
  ,[CustomerID]
  ,[VehicleRegistrationNo]
  ,[WayBillFormNo]
  ,[PaymentMadeAtSite]
  ,[AmountPaid]
  ,[VehicleInDate]
  ,[VehicleOutDate]
  ,[DetentionAtSite]
  ,[ReasonForDetention]
  ,[OverDimensionConsignment]
  ,[VehicleTypeID]
  ,[VehicleType]
  ,[VehicleLengthInFt]
  ,[VechicleWidthInFt]
  ,[VehicleHeightInFt]
  ,[MaterialStateID]
  ,[RemarksForDamageOrShortage]
  ,[OtherRemarks]
  ,[DriverNameAndContactNo]
  ,[CreatedBy]
  ,[LRStatusID]
  ,[CreatedOn]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@RequestExecutionNo
  ,@MRNNo
  ,@MRNDate
  ,@TransporterID
  ,@TransporterName
  ,@CustomerID
  ,@VehicleRegistrationNo
  ,@WayBillFormNo
  ,@PaymentMadeAtSite
  ,@AmountPaid
  ,@VehicleInDate
  ,@VehicleOutDate
  ,@DetentionAtSite
  ,@ReasonForDetention
  ,@OverDimensionConsignment
  ,@VehicleTypeID
  ,@VehicleType
  ,@VehicleLengthInFt
  ,@VechicleWidthInFt
  ,@VehicleHeightInFt
  ,@MaterialStateID
  ,@RemarksForDamageOrShortage
  ,@OtherRemarks
  ,@DriverNameAndContactNo
  ,@CreatedBy
  ,@LRStatusID
  ,@CreatedOn
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_MRNNo = @MRNNo
GO
