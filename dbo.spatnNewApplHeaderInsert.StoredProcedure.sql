USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnNewApplHeaderInsert]
  @CardNo NVarChar(8),
  @Approved NVarChar(50),
  @Rejected NVarChar(50),
  @Application NVarChar(50),
  @Remarks NVarChar(250),
  @FinYear NVarChar(4),
  @ApplStatusID Int,
  @AppliedOn DateTime,
  @VerificationOn DateTime,
  @ApprovalOn DateTime,
  @SanctionOn DateTime,
  @PostedOn DateTime,
  @VerificationRequired Bit,
  @ApprovalRequired Bit,
  @SanctionRequired Bit,
  @VerifiedBy NVarChar(8),
  @ApprovedBy NVarChar(8),
  @SanctionedBy NVarChar(8),
  @PostedBy NVarChar(8),
  @VerificationRemark NVarChar(100),
  @ApprovalRemark NVarChar(100),
  @SanctionRemark NVarChar(100),
  @PostingRemark NVarChar(100),
  @AdvanceApplication Bit,
  @ExecutionState Int,
  @Return_LeaveApplID Int = null OUTPUT 
  AS
  INSERT [ATN_ApplHeader]
  (
   [CardNo]
  ,[Approved]
  ,[Rejected]
  ,[Application]
  ,[Remarks]
  ,[FinYear]
  ,[ApplStatusID]
  ,[AppliedOn]
  ,[VerificationOn]
  ,[ApprovalOn]
  ,[SanctionOn]
  ,[PostedOn]
  ,[VerificationRequired]
  ,[ApprovalRequired]
  ,[SanctionRequired]
  ,[VerifiedBy]
  ,[ApprovedBy]
  ,[SanctionedBy]
  ,[PostedBy]
  ,[VerificationRemark]
  ,[ApprovalRemark]
  ,[SanctionRemark]
  ,[PostingRemark]
  ,[AdvanceApplication]
  ,[ExecutionState]
  )
  VALUES
  (
   @CardNo
  ,@Approved
  ,@Rejected
  ,@Application
  ,@Remarks
  ,@FinYear
  ,@ApplStatusID
  ,@AppliedOn
  ,@VerificationOn
  ,@ApprovalOn
  ,@SanctionOn
  ,@PostedOn
  ,@VerificationRequired
  ,@ApprovalRequired
  ,@SanctionRequired
  ,@VerifiedBy
  ,@ApprovedBy
  ,@SanctionedBy
  ,@PostedBy
  ,@VerificationRemark
  ,@ApprovalRemark
  ,@SanctionRemark
  ,@PostingRemark
  ,@AdvanceApplication
  ,@ExecutionState
  )
  SET @Return_LeaveApplID = Scope_Identity()
GO
