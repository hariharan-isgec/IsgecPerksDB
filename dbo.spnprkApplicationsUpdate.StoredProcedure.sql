USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkApplicationsUpdate]
  @Original_ApplicationID Int, 
  @Original_ClaimID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Applications] SET 
   [PerkID] = @PerkID
  ,[AppliedOn] = @AppliedOn
  ,[Value] = @Value
  ,[VerifiedOn] = @VerifiedOn
  ,[ApprovedOn] = @ApprovedOn
  ,[PostedOn] = @PostedOn
  ,[ApprovedAmt] = @ApprovedAmt
  ,[StatusID] = @StatusID
  ,[UserRemark] = @UserRemark
  ,[PostedInBaaN] = @PostedInBaaN
  ,[Applied] = @Applied
  ,[EmployeeID] = @EmployeeID
  ,[ClaimID] = @ClaimID
  ,[VerifiedAmt] = @VerifiedAmt
  ,[FinYear] = @FinYear
  ,[VerifierRemark] = @VerifierRemark
  ,[UpdatedOn] = @UpdatedOn
  ,[ExcessClaimed] = @ExcessClaimed
  ,[Verified] = @Verified
  ,[VerifiedBy] = @VerifiedBy
  ,[ApproverRemark] = @ApproverRemark
  ,[PaymentMethod] = @PaymentMethod
  ,[UpdatedBy] = @UpdatedBy
  ,[ApprovedBy] = @ApprovedBy
  ,[UpdatedInLedger] = @UpdatedInLedger
  ,[Documents] = @Documents
  ,[VerifiedValue] = @VerifiedValue
  ,[Approved] = @Approved
  ,[PostedBy] = @PostedBy
  ,[Selected] = @Selected
  ,[ApprovedValue] = @ApprovedValue
  ,[ReportAttached] = @ReportAttached
  ,[ReportFileName] = @ReportFileName
  ,[ReportDiskFile] = @ReportDiskFile  
  WHERE
  [ApplicationID] = @Original_ApplicationID
  AND [ClaimID] = @Original_ClaimID
  SET @RowCount = @@RowCount
GO
