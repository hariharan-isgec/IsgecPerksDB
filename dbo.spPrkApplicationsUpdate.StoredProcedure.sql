USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkApplicationsUpdate]
  @EmployeeID Int,
  @PerkID Int,
  @Applied Bit,
  @AppliedOn DateTime,
  @Value Decimal(10,2),
  @UserRemark NVarChar(200),
  @Approved Bit,
  @ApprovedValue Decimal(10,2),
  @ApprovedAmt Decimal(10,2),
  @ApprovedBy Int,
  @ApprovedOn DateTime,
  @ApproverRemark NVarChar(100),
  @Verified Bit,
  @VerifiedValue Decimal(10,2),
  @VerifiedAmt Decimal(10,2),
  @UpdatedBy Int,
  @PostedBy Int,
  @VerifiedBy Int,
  @VerifiedOn DateTime,
  @VerifierRemark NVarChar(100),
  @PaymentMethod NVarChar(20),
  @UpdatedInLedger Bit,
  @UpdatedOn DateTime,
  @PostedInBaaN Bit,
  @PostedOn DateTime,
  @Documents Bit,
  @StatusID Int,
  @FinYear Int,
  @Original_ApplicationID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Applications] SET 
   [EmployeeID] = @EmployeeID
  ,[PerkID] = @PerkID
  ,[Applied] = @Applied
  ,[AppliedOn] = @AppliedOn
  ,[Value] = @Value
  ,[UserRemark] = @UserRemark
  ,[Approved] = @Approved
  ,[ApprovedValue] = @ApprovedValue
  ,[ApprovedAmt] = @ApprovedAmt
  ,[ApprovedBy] = @ApprovedBy
  ,[ApprovedOn] = @ApprovedOn
  ,[ApproverRemark] = @ApproverRemark
  ,[Verified] = @Verified
  ,[VerifiedValue] = @VerifiedValue
  ,[VerifiedAmt] = @VerifiedAmt
  ,[UpdatedBy] = @UpdatedBy
  ,[PostedBy] = @PostedBy
  ,[VerifiedBy] = @VerifiedBy
  ,[VerifiedOn] = @VerifiedOn
  ,[VerifierRemark] = @VerifierRemark
  ,[PaymentMethod] = @PaymentMethod
  ,[UpdatedInLedger] = @UpdatedInLedger
  ,[UpdatedOn] = @UpdatedOn
  ,[PostedInBaaN] = @PostedInBaaN
  ,[PostedOn] = @PostedOn
  ,[Documents] = @Documents
  ,[StatusID] = @StatusID
  ,[FinYear] = @FinYear
  WHERE
  [ApplicationID] = @Original_ApplicationID
  SET @RowCount = @@RowCount
GO
