USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestsUpdate]
  @Original_RequestID Int, 
  @ProjectID NVarChar(6),
  @OrderNo NVarChar(50),
  @OrderDate DateTime,
  @SupplierID NVarChar(9),
  @Description NVarChar(500),
  @TotalRequestedQuantity NVarChar(50),
  @RequestedInspectionStartDate DateTime,
  @RequestedInspectionFinishDate DateTime,
  @ClientInspectionRequired Bit,
  @ThirdPartyInspectionRequired Bit,
  @ReceivedOn DateTime,
  @ReceivedBy NVarChar(8),
  @ReceivingMediumID Int,
  @CreationRemarks NVarChar(500),
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @RequestStateID NVarChar(10),
  @FileAttached Bit,
  @InspectionStageiD Int,
  @AllotedTo NVarChar(8),
  @AllotedStartDate DateTime,
  @AllotedFinishDate DateTime,
  @AllotedOn DateTime,
  @AllotedBy NVarChar(8),
  @AllotmentRemarks NVarChar(500),
  @InspectionStartDate DateTime,
  @InspectionFinishDate DateTime,
  @InspectionStatusID Int,
  @CancelledOn DateTime,
  @CancelledBy NVarChar(8),
  @CancellationRemarks NVarChar(500),
  @RegionID Int,
  @LotSize NvarChar(50),
  @UOM NvarChar(10),
  @DocumentID NvarChar(50),
  @ReturnRemarks NvarChar(250),
  @Paused Bit = 0,
  @PausedHrs Decimal(18,2) = 0.00,
  @TotalHrs Decimal(18,2) = 0.00,
  @LastPausedOn DateTime = NULL,
  @RowCount int = null OUTPUT
  AS
  UPDATE [QCM_Requests] SET 
   [ProjectID] = @ProjectID
  ,[OrderNo] = @OrderNo
  ,[OrderDate] = @OrderDate
  ,[SupplierID] = @SupplierID
  ,[Description] = @Description
  ,[TotalRequestedQuantity] = @TotalRequestedQuantity
  ,[RequestedInspectionStartDate] = @RequestedInspectionStartDate
  ,[RequestedInspectionFinishDate] = @RequestedInspectionFinishDate
  ,[ClientInspectionRequired] = @ClientInspectionRequired
  ,[ThirdPartyInspectionRequired] = @ThirdPartyInspectionRequired
  ,[ReceivedOn] = @ReceivedOn
  ,[ReceivedBy] = @ReceivedBy
  ,[ReceivingMediumID] = @ReceivingMediumID
  ,[CreationRemarks] = @CreationRemarks
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  ,[RequestStateID] = @RequestStateID
  ,[FileAttached] = @FileAttached
  ,[InspectionStageiD] = @InspectionStageiD
  ,[AllotedTo] = @AllotedTo
  ,[AllotedStartDate] = @AllotedStartDate
  ,[AllotedFinishDate] = @AllotedFinishDate
  ,[AllotedOn] = @AllotedOn
  ,[AllotedBy] = @AllotedBy
  ,[AllotmentRemarks] = @AllotmentRemarks
  ,[InspectionStartDate] = @InspectionStartDate
  ,[InspectionFinishDate] = @InspectionFinishDate
  ,[InspectionStatusID] = @InspectionStatusID
  ,[CancelledOn] = @CancelledOn
  ,[CancelledBy] = @CancelledBy
  ,[CancellationRemarks] = @CancellationRemarks
  ,[RegionID] = @RegionID
  ,[LotSize] = @LotSize
  ,[UOM] = @UOM
  ,[DocumentID] = @DocumentID
  ,[ReturnRemarks] = @ReturnRemarks 
  ,[Paused] = @Paused
  ,[PausedHrs] = @PausedHrs
  ,[TotalHrs] = @TotalHrs 
  ,[LastPausedOn] = @LastPausedOn
  WHERE
  [RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
