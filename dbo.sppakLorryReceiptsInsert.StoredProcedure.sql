USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakLorryReceiptsInsert]
  @ProjectID NVarChar(6),
  @MRNNo Int,
  @MRNDate DateTime,
  @RequestExecutionNo Int,
  @CustomerID NVarChar(9),
  @VehicleInDate DateTime,
  @VehicleOutDate DateTime,
  @TransporterID NVarChar(9),
  @TransporterName NVarChar(50),
  @VehicleRegistrationNo NVarChar(50),
  @WayBillFormNo NVarChar(50),
  @PaymentMadeAtSite Bit,
  @AmountPaid Decimal(10,2),
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @OverDimensionConsignment NVarChar(10),
  @DetentionAtSite NVarChar(10),
  @ReasonForDetention NVarChar(500),
  @OtherRemarks NVarChar(500),
  @MaterialStateID Int,
  @RemarksForDamageOrShortage NVarChar(500),
  @DriverNameAndContactNo NVarChar(50),
  @TempMRNNo Int,
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_MRNNo Int = null OUTPUT 
  AS
  INSERT [VR_LorryReceipts]
  (
   [ProjectID]
  ,[MRNNo]
  ,[MRNDate]
  ,[RequestExecutionNo]
  ,[CustomerID]
  ,[VehicleInDate]
  ,[VehicleOutDate]
  ,[TransporterID]
  ,[TransporterName]
  ,[VehicleRegistrationNo]
  ,[WayBillFormNo]
  ,[PaymentMadeAtSite]
  ,[AmountPaid]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[OverDimensionConsignment]
  ,[DetentionAtSite]
  ,[ReasonForDetention]
  ,[OtherRemarks]
  ,[MaterialStateID]
  ,[RemarksForDamageOrShortage]
  ,[DriverNameAndContactNo]
  ,[TempMRNNo]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@MRNNo
  ,@MRNDate
  ,@RequestExecutionNo
  ,@CustomerID
  ,@VehicleInDate
  ,@VehicleOutDate
  ,@TransporterID
  ,@TransporterName
  ,@VehicleRegistrationNo
  ,@WayBillFormNo
  ,@PaymentMadeAtSite
  ,@AmountPaid
  ,@CreatedBy
  ,@CreatedOn
  ,@OverDimensionConsignment
  ,@DetentionAtSite
  ,@ReasonForDetention
  ,@OtherRemarks
  ,@MaterialStateID
  ,@RemarksForDamageOrShortage
  ,@DriverNameAndContactNo
  ,@TempMRNNo
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_MRNNo = @MRNNo
GO
