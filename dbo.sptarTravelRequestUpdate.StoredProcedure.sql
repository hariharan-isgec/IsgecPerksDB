USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptarTravelRequestUpdate]
  @Original_RequestID Int, 
  @AdditionalCurrency Decimal(18,2),
  @Add1AmountDescription NVarChar(150),
  @Add1Amount Decimal(18,2),
  @Add2AmountDescription NVarChar(150),
  @Add2Amount Decimal(18,2),
  @Add3AmountDescription NVarChar(150),
  @Add3Amount Decimal(18,2),
  @Add4AmountDescription NVarChar(150),
  @Add4Amount Decimal(18,2),
  @Add5AmountDescription NVarChar(150),
  @Add5Amount Decimal(18,2),
  @TravelStartDate DateTime,
  @TravelFinishDate DateTime,
  @RequestedFor NVarChar(8),
  @RequestedForEmployees NVarChar(250),
  @TravelTypeID Int,
  @ProjectID NVarChar(6),
  @ProjectManagerID NVarChar(8),
  @CostCenterID NVarChar(6),
  @TravelItinerary NVarChar(500),
  @Purpose NVarChar(500),
  @TotalRequestedAmount Decimal(18,2),
  @RequestedCurrencyID NVarChar(6),
  @RequestedConversionFactor Decimal(18,6),
  @MDLodgingAmount Decimal(18,2),
  @MDCurrencyID NVarChar(6),
  @RequestKey NVarChar(8),
  @ApprovedBy NVarChar(8),
  @StatusID Int,
  @ProjectManagerRemarks NVarChar(250),
  @MDApprovalOn DateTime,
  @MDConversionFactor Decimal(18,6),
  @MDDAAmount Decimal(18,2),
  @MDDAAmountINR Decimal(18,2),
  @TotalRequestedAmountINR Decimal(18,2),
  @CreatedOn DateTime,
  @BudgetCheckedOn DateTime,
  @BHApprovalBy NVarChar(8),
  @BudgetCheckedBy NVarChar(8),
  @CreatedBy NVarChar(8),
  @BalanceBudgetWhenSubmitted Decimal(18,2),
  @MDRemarks NVarChar(250),
  @FileAttached Bit,
  @MDApprovalBy NVarChar(8),
  @BHRemarks NVarChar(250),
  @ApprovedOn DateTime,
  @MDLodgingAmountINR Decimal(18,2),
  @BHApprovalOn DateTime,
  @ApproverRemarks NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_TravelRequest] SET 
   [AdditionalCurrency] = @AdditionalCurrency
  ,[Add1AmountDescription] = @Add1AmountDescription
  ,[Add1Amount] = @Add1Amount
  ,[Add2AmountDescription] = @Add2AmountDescription
  ,[Add2Amount] = @Add2Amount
  ,[Add3AmountDescription] = @Add3AmountDescription
  ,[Add3Amount] = @Add3Amount
  ,[Add4AmountDescription] = @Add4AmountDescription
  ,[Add4Amount] = @Add4Amount
  ,[Add5AmountDescription] = @Add5AmountDescription
  ,[Add5Amount] = @Add5Amount
  ,[TravelStartDate] = @TravelStartDate
  ,[TravelFinishDate] = @TravelFinishDate
  ,[RequestedFor] = @RequestedFor
  ,[RequestedForEmployees] = @RequestedForEmployees
  ,[TravelTypeID] = @TravelTypeID
  ,[ProjectID] = @ProjectID
  ,[ProjectManagerID] = @ProjectManagerID
  ,[CostCenterID] = @CostCenterID
  ,[TravelItinerary] = @TravelItinerary
  ,[Purpose] = @Purpose
  ,[TotalRequestedAmount] = @TotalRequestedAmount
  ,[RequestedCurrencyID] = @RequestedCurrencyID
  ,[RequestedConversionFactor] = @RequestedConversionFactor
  ,[MDLodgingAmount] = @MDLodgingAmount
  ,[MDCurrencyID] = @MDCurrencyID
  ,[RequestKey] = @RequestKey
  ,[ApprovedBy] = @ApprovedBy
  ,[StatusID] = @StatusID
  ,[ProjectManagerRemarks] = @ProjectManagerRemarks
  ,[MDApprovalOn] = @MDApprovalOn
  ,[MDConversionFactor] = @MDConversionFactor
  ,[MDDAAmount] = @MDDAAmount
  ,[MDDAAmountINR] = @MDDAAmountINR
  ,[TotalRequestedAmountINR] = @TotalRequestedAmountINR
  ,[CreatedOn] = @CreatedOn
  ,[BudgetCheckedOn] = @BudgetCheckedOn
  ,[BHApprovalBy] = @BHApprovalBy
  ,[BudgetCheckedBy] = @BudgetCheckedBy
  ,[CreatedBy] = @CreatedBy
  ,[BalanceBudgetWhenSubmitted] = @BalanceBudgetWhenSubmitted
  ,[MDRemarks] = @MDRemarks
  ,[FileAttached] = @FileAttached
  ,[MDApprovalBy] = @MDApprovalBy
  ,[BHRemarks] = @BHRemarks
  ,[ApprovedOn] = @ApprovedOn
  ,[MDLodgingAmountINR] = @MDLodgingAmountINR
  ,[BHApprovalOn] = @BHApprovalOn
  ,[ApproverRemarks] = @ApproverRemarks
  WHERE
  [RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
