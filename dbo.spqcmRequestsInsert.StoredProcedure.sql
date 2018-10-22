USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestsInsert]
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
  @POWeight Decimal(18,4)=0,
  @Return_RequestID Int = null OUTPUT 
  AS
  INSERT [QCM_Requests]
  (
   [ProjectID]
  ,[OrderNo]
  ,[OrderDate]
  ,[SupplierID]
  ,[Description]
  ,[TotalRequestedQuantity]
  ,[RequestedInspectionStartDate]
  ,[RequestedInspectionFinishDate]
  ,[ClientInspectionRequired]
  ,[ThirdPartyInspectionRequired]
  ,[ReceivedOn]
  ,[ReceivedBy]
  ,[ReceivingMediumID]
  ,[CreationRemarks]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[RequestStateID]
  ,[FileAttached]
  ,[InspectionStageiD]
  ,[AllotedTo]
  ,[AllotedStartDate]
  ,[AllotedFinishDate]
  ,[AllotedOn]
  ,[AllotedBy]
  ,[AllotmentRemarks]
  ,[InspectionStartDate]
  ,[InspectionFinishDate]
  ,[InspectionStatusID]
  ,[CancelledOn]
  ,[CancelledBy]
  ,[CancellationRemarks]
  ,[RegionID]
  ,[LotSize]
  ,[UOM]
  ,[DocumentID]
  ,[ReturnRemarks]
  ,[Paused]
  ,[PausedHrs]
  ,[TotalHrs]
  ,[LastPausedOn]
  ,[POWeight]
  )
  VALUES
  (
   @ProjectID
  ,@OrderNo
  ,@OrderDate
  ,@SupplierID
  ,@Description
  ,@TotalRequestedQuantity
  ,@RequestedInspectionStartDate
  ,@RequestedInspectionFinishDate
  ,@ClientInspectionRequired
  ,@ThirdPartyInspectionRequired
  ,@ReceivedOn
  ,@ReceivedBy
  ,@ReceivingMediumID
  ,@CreationRemarks
  ,@CreatedBy
  ,@CreatedOn
  ,@RequestStateID
  ,@FileAttached
  ,@InspectionStageiD
  ,@AllotedTo
  ,@AllotedStartDate
  ,@AllotedFinishDate
  ,@AllotedOn
  ,@AllotedBy
  ,@AllotmentRemarks
  ,@InspectionStartDate
  ,@InspectionFinishDate
  ,@InspectionStatusID
  ,@CancelledOn
  ,@CancelledBy
  ,@CancellationRemarks
  ,@RegionID
  ,@LotSize
  ,@UOM
  ,@DocumentID
  ,@ReturnRemarks
  ,@Paused
  ,@PausedHrs
  ,@TotalHrs
  ,@LastPausedOn 
  ,@POWeight
  )
  SET @Return_RequestID = Scope_Identity()
GO
