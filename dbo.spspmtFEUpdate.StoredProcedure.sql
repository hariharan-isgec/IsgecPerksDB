USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtFEUpdate]
  @Original_FEID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_FE] SET 
   [RequestedBy] = @RequestedBy
  ,[ContactDetails] = @ContactDetails
  ,[RequestedFor] = @RequestedFor
  ,[Nationality] = @Nationality
  ,[BookingRQNo] = @BookingRQNo
  ,[VendorID] = @VendorID
  ,[PassportNumber] = @PassportNumber
  ,[PlaceOfIssue] = @PlaceOfIssue
  ,[DateOfIssue] = @DateOfIssue
  ,[ExpiryDate] = @ExpiryDate
  ,[ExchangeAmountRequired] = @ExchangeAmountRequired
  ,[RequiredOn] = @RequiredOn
  ,[FOREXTypeID] = @FOREXTypeID
  ,[IBRRate] = @IBRRate
  ,[TimeOfBooking] = @TimeOfBooking
  ,[DiscountPerUnit] = @DiscountPerUnit
  ,[DiscountLimitAmount] = @DiscountLimitAmount
  ,[PayableRate] = @PayableRate
  ,[EstimatedPayableAmount] = @EstimatedPayableAmount
  ,[PlaceToBeVisited] = @PlaceToBeVisited
  ,[DurationOfVisit] = @DurationOfVisit
  ,[TotalExpenditure] = @TotalExpenditure
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  ,[Cancelled] = @Cancelled
  ,[CancelledOn] = @CancelledOn
  ,[CancelledBy] = @CancelledBy
  ,[CancellationRQNo] = @CancellationRQNo
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
  [FEID] = @Original_FEID
  SET @RowCount = @@RowCount
GO
