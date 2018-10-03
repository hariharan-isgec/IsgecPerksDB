USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkApplicationsInsert]
  @PerkID Int,
  @AppliedOn DateTime,
  @Value Decimal(10,2),
  @VerifiedOn DateTime,
  @ApprovedOn DateTime,
  @PostedOn DateTime,
  @ApprovedAmt Decimal(10,2),
  @StatusID Int,
  @UserRemark NVarChar(200),
  @PostedInBaaN Bit,
  @Applied Bit,
  @EmployeeID Int,
  @ClaimID Int,
  @VerifiedAmt Decimal(10,2),
  @FinYear Int,
  @VerifierRemark NVarChar(100),
  @UpdatedOn DateTime,
  @ExcessClaimed Bit,
  @Verified Bit,
  @VerifiedBy Int,
  @ApproverRemark NVarChar(100),
  @PaymentMethod NVarChar(20),
  @UpdatedBy Int,
  @ApprovedBy Int,
  @UpdatedInLedger Bit,
  @Documents Bit,
  @VerifiedValue Decimal(10,2),
  @Approved Bit,
  @PostedBy Int,
  @Selected Bit,
  @ApprovedValue Decimal(10,2),
  @ReportAttached Bit,
  @ReportFileName NVarchar(100),
  @ReportDiskFile NVarChar(250),
  @Return_ApplicationID Int = null OUTPUT, 
  @Return_ClaimID Int = null OUTPUT 
  AS
  INSERT [PRK_Applications]
  (
   [PerkID]
  ,[AppliedOn]
  ,[Value]
  ,[VerifiedOn]
  ,[ApprovedOn]
  ,[PostedOn]
  ,[ApprovedAmt]
  ,[StatusID]
  ,[UserRemark]
  ,[PostedInBaaN]
  ,[Applied]
  ,[EmployeeID]
  ,[ClaimID]
  ,[VerifiedAmt]
  ,[FinYear]
  ,[VerifierRemark]
  ,[UpdatedOn]
  ,[ExcessClaimed]
  ,[Verified]
  ,[VerifiedBy]
  ,[ApproverRemark]
  ,[PaymentMethod]
  ,[UpdatedBy]
  ,[ApprovedBy]
  ,[UpdatedInLedger]
  ,[Documents]
  ,[VerifiedValue]
  ,[Approved]
  ,[PostedBy]
  ,[Selected]
  ,[ApprovedValue]
  ,[ReportAttached]
  ,[ReportFileName]
  ,[ReportDiskFile]
  )
  VALUES
  (
   @PerkID
  ,@AppliedOn
  ,@Value
  ,@VerifiedOn
  ,@ApprovedOn
  ,@PostedOn
  ,@ApprovedAmt
  ,@StatusID
  ,@UserRemark
  ,@PostedInBaaN
  ,@Applied
  ,@EmployeeID
  ,@ClaimID
  ,@VerifiedAmt
  ,@FinYear
  ,@VerifierRemark
  ,@UpdatedOn
  ,@ExcessClaimed
  ,@Verified
  ,@VerifiedBy
  ,@ApproverRemark
  ,@PaymentMethod
  ,@UpdatedBy
  ,@ApprovedBy
  ,@UpdatedInLedger
  ,@Documents
  ,@VerifiedValue
  ,@Approved
  ,@PostedBy
  ,@Selected
  ,@ApprovedValue
  ,@ReportAttached
  ,@ReportFileName
  ,@ReportDiskFile
  )
  SET @Return_ApplicationID = Scope_Identity()
  SET @Return_ClaimID = @ClaimID
GO
