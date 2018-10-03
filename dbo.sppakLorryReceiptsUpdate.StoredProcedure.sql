USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakLorryReceiptsUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_MRNNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_LorryReceipts] SET 
   [ProjectID] = @ProjectID
  ,[MRNNo] = @MRNNo
  ,[MRNDate] = @MRNDate
  ,[RequestExecutionNo] = @RequestExecutionNo
  ,[CustomerID] = @CustomerID
  ,[VehicleInDate] = @VehicleInDate
  ,[VehicleOutDate] = @VehicleOutDate
  ,[TransporterID] = @TransporterID
  ,[TransporterName] = @TransporterName
  ,[VehicleRegistrationNo] = @VehicleRegistrationNo
  ,[WayBillFormNo] = @WayBillFormNo
  ,[PaymentMadeAtSite] = @PaymentMadeAtSite
  ,[AmountPaid] = @AmountPaid
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  ,[OverDimensionConsignment] = @OverDimensionConsignment
  ,[DetentionAtSite] = @DetentionAtSite
  ,[ReasonForDetention] = @ReasonForDetention
  ,[OtherRemarks] = @OtherRemarks
  ,[MaterialStateID] = @MaterialStateID
  ,[RemarksForDamageOrShortage] = @RemarksForDamageOrShortage
  ,[DriverNameAndContactNo] = @DriverNameAndContactNo
  ,[TempMRNNo] = @TempMRNNo
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [MRNNo] = @Original_MRNNo
  SET @RowCount = @@RowCount
GO
