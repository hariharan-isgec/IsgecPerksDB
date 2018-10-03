USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkApplicationsInsert]
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
  @ApplicationID Int = null OUTPUT
  AS
  INSERT [PRK_Applications]
  (
   [EmployeeID]
  ,[PerkID]
  ,[Applied]
  ,[AppliedOn]
  ,[Value]
  ,[UserRemark]
  ,[Approved]
  ,[ApprovedValue]
  ,[ApprovedAmt]
  ,[ApprovedBy]
  ,[ApprovedOn]
  ,[ApproverRemark]
  ,[Verified]
  ,[VerifiedValue]
  ,[VerifiedAmt]
  ,[UpdatedBy]
  ,[PostedBy]
  ,[VerifiedBy]
  ,[VerifiedOn]
  ,[VerifierRemark]
  ,[PaymentMethod]
  ,[UpdatedInLedger]
  ,[UpdatedOn]
  ,[PostedInBaaN]
  ,[PostedOn]
  ,[Documents]
  ,[StatusID]
  ,[FinYear]
  )
  VALUES
  (
   @EmployeeID
  ,@PerkID
  ,@Applied
  ,@AppliedOn
  ,@Value
  ,@UserRemark
  ,@Approved
  ,@ApprovedValue
  ,@ApprovedAmt
  ,@ApprovedBy
  ,@ApprovedOn
  ,@ApproverRemark
  ,@Verified
  ,@VerifiedValue
  ,@VerifiedAmt
  ,@UpdatedBy
  ,@PostedBy
  ,@VerifiedBy
  ,@VerifiedOn
  ,@VerifierRemark
  ,@PaymentMethod
  ,@UpdatedInLedger
  ,@UpdatedOn
  ,@PostedInBaaN
  ,@PostedOn
  ,@Documents
  ,@StatusID
  ,@FinYear
  )
  SET @ApplicationID = Scope_Identity()
GO
