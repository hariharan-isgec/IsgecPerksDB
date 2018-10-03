USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtBCInsert]
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
  @Return_BCID Int = null OUTPUT
  AS
  INSERT [SPMT_BC]
  (
   [RequestedBy]
  ,[RequestedFor]
  ,[BookingRQNo]
  ,[VendorID]
  ,[FromPlaceID]
  ,[ToPlaceID]
  ,[AirLines]
  ,[FlightTime]
  ,[EstimatedAmount]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[Cancelled]
  ,[CancellationRQNo]
  ,[CancelledOn]
  ,[CancelledBy]
  ,[CancellationAmount]
  ,[CancellationRemarks]
  ,[BillLinked]
  ,[BillLinkedOn]
  ,[BillLinkedBy]
  ,[BillNo]
  ,[BillDate]
  ,[CancellationBillLinked]
  ,[CancellationBillLinkedBy]
  ,[CancellationBillLinkedOn]
  ,[CancellationBillNo]
  ,[CancellationBillDate]
  )
  VALUES
  (
   @RequestedBy
  ,@RequestedFor
  ,@BookingRQNo
  ,@VendorID
  ,@FromPlaceID
  ,@ToPlaceID
  ,@AirLines
  ,@FlightTime
  ,@EstimatedAmount
  ,@CreatedBy
  ,@CreatedOn
  ,@Cancelled
  ,@CancellationRQNo
  ,@CancelledOn
  ,@CancelledBy
  ,@CancellationAmount
  ,@CancellationRemarks
  ,@BillLinked
  ,@BillLinkedOn
  ,@BillLinkedBy
  ,@BillNo
  ,@BillDate
  ,@CancellationBillLinked
  ,@CancellationBillLinkedBy
  ,@CancellationBillLinkedOn
  ,@CancellationBillNo
  ,@CancellationBillDate
  )
  SET @Return_BCID = Scope_Identity()
GO
