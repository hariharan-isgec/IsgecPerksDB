USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtFEInsert]
  @RequestedBy NVarChar(8),
  @ContactDetails NVarChar(100),
  @RequestedFor NVarChar(500),
  @Nationality NVarChar(30),
  @BookingRQNo Int,
  @VendorID NVarChar(6),
  @PassportNumber NVarChar(20),
  @PlaceOfIssue NVarChar(30),
  @DateOfIssue DateTime,
  @ExpiryDate DateTime,
  @ExchangeAmountRequired Decimal(6),
  @RequiredOn DateTime,
  @FOREXTypeID NVarChar(20),
  @IBRRate Decimal(6,2),
  @TimeOfBooking DateTime,
  @DiscountPerUnit Decimal(6,2),
  @DiscountLimitAmount Decimal(6,2),
  @PayableRate Decimal(6,2),
  @EstimatedPayableAmount Decimal(10,2),
  @PlaceToBeVisited NVarChar(30),
  @DurationOfVisit Decimal(3),
  @TotalExpenditure Decimal(8,2),
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @Cancelled Bit,
  @CancelledOn DateTime,
  @CancelledBy NVarChar(8),
  @CancellationRQNo Int,
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
  @Return_FEID Int = null OUTPUT
  AS
  INSERT [SPMT_FE]
  (
   [RequestedBy]
  ,[ContactDetails]
  ,[RequestedFor]
  ,[Nationality]
  ,[BookingRQNo]
  ,[VendorID]
  ,[PassportNumber]
  ,[PlaceOfIssue]
  ,[DateOfIssue]
  ,[ExpiryDate]
  ,[ExchangeAmountRequired]
  ,[RequiredOn]
  ,[FOREXTypeID]
  ,[IBRRate]
  ,[TimeOfBooking]
  ,[DiscountPerUnit]
  ,[DiscountLimitAmount]
  ,[PayableRate]
  ,[EstimatedPayableAmount]
  ,[PlaceToBeVisited]
  ,[DurationOfVisit]
  ,[TotalExpenditure]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[Cancelled]
  ,[CancelledOn]
  ,[CancelledBy]
  ,[CancellationRQNo]
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
  ,@ContactDetails
  ,@RequestedFor
  ,@Nationality
  ,@BookingRQNo
  ,@VendorID
  ,@PassportNumber
  ,@PlaceOfIssue
  ,@DateOfIssue
  ,@ExpiryDate
  ,@ExchangeAmountRequired
  ,@RequiredOn
  ,@FOREXTypeID
  ,@IBRRate
  ,@TimeOfBooking
  ,@DiscountPerUnit
  ,@DiscountLimitAmount
  ,@PayableRate
  ,@EstimatedPayableAmount
  ,@PlaceToBeVisited
  ,@DurationOfVisit
  ,@TotalExpenditure
  ,@CreatedBy
  ,@CreatedOn
  ,@Cancelled
  ,@CancelledOn
  ,@CancelledBy
  ,@CancellationRQNo
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
  SET @Return_FEID = Scope_Identity()
GO
