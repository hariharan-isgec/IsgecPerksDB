USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtBCUpdate]
  @Original_BCID Int, 
  @RequestedBy NVarChar(8),
  @RequestedFor NVarChar(500),
  @BookingRQNo Int,
  @VendorID NVarChar(6),
  @FromPlaceID NVarChar(30),
  @ToPlaceID NVarChar(30),
  @AirLines NVarChar(500),
  @FlightTime DateTime,
  @EstimatedAmount Decimal(10,2),
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @Cancelled Bit,
  @CancellationRQNo Int,
  @CancelledOn DateTime,
  @CancelledBy NVarChar(8),
  @CancellationAmount Decimal(10,2),
  @CancellationRemarks NVarChar(500),
  @BillLinked Bit,
  @BillLinkedOn DateTime,
  @BillLinkedBy NVarChar(8),
  @BillNo NVarChar(100),
  @BillDate DateTime,
  @CancellationBillLinked Bit,
  @CancellationBillLinkedBy NVarChar(8),
  @CancellationBillLinkedOn DateTime,
  @CancellationBillNo NVarChar(100),
  @CancellationBillDate DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_BC] SET 
   [RequestedBy] = @RequestedBy
  ,[RequestedFor] = @RequestedFor
  ,[BookingRQNo] = @BookingRQNo
  ,[VendorID] = @VendorID
  ,[FromPlaceID] = @FromPlaceID
  ,[ToPlaceID] = @ToPlaceID
  ,[AirLines] = @AirLines
  ,[FlightTime] = @FlightTime
  ,[EstimatedAmount] = @EstimatedAmount
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  ,[Cancelled] = @Cancelled
  ,[CancellationRQNo] = @CancellationRQNo
  ,[CancelledOn] = @CancelledOn
  ,[CancelledBy] = @CancelledBy
  ,[CancellationAmount] = @CancellationAmount
  ,[CancellationRemarks] = @CancellationRemarks
  ,[BillLinked] = @BillLinked
  ,[BillLinkedOn] = @BillLinkedOn
  ,[BillLinkedBy] = @BillLinkedBy
  ,[BillNo] = @BillNo
  ,[BillDate] = @BillDate
  ,[CancellationBillLinked] = @CancellationBillLinked
  ,[CancellationBillLinkedBy] = @CancellationBillLinkedBy
  ,[CancellationBillLinkedOn] = @CancellationBillLinkedOn
  ,[CancellationBillNo] = @CancellationBillNo
  ,[CancellationBillDate] = @CancellationBillDate
  WHERE
  [BCID] = @Original_BCID
  SET @RowCount = @@RowCount
GO
