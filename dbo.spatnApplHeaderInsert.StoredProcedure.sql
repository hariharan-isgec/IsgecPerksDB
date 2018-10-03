USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplHeaderInsert]
  @CardNo NVarChar(8),
  @Remarks NVarChar(250),
  @FinYear NVarChar(4),
  @ApplStatusID Int,
  @AppliedOn DateTime,
  @VerificationRequired Bit,
  @ApprovalRequired Bit,
  @SanctionRequired Bit,
  @VerifiedBy NVarChar(8),
  @ApprovedBy NVarChar(8),
  @SanctionedBy NVarChar(8),
  @AdvanceApplication Bit,
  @ExecutionState Int,
  @Return_LeaveApplID Int = null OUTPUT
  AS
  INSERT [ATN_ApplHeader]
  (
   [CardNo]
  ,[Remarks]
  ,[FinYear]
  ,[ApplStatusID]
  ,[AppliedOn]
  ,[VerificationRequired]
  ,[ApprovalRequired]
  ,[SanctionRequired]
  ,[VerifiedBy]
  ,[ApprovedBy]
  ,[SanctionedBy]
  ,[AdvanceApplication]
  ,[ExecutionState]
  )
  VALUES
  (
   @CardNo
  ,@Remarks
  ,@FinYear
  ,@ApplStatusID
  ,@AppliedOn
  ,@VerificationRequired
  ,@ApprovalRequired
  ,@SanctionRequired
  ,@VerifiedBy
  ,@ApprovedBy
  ,@SanctionedBy
  ,@AdvanceApplication
  ,@ExecutionState
  )
  SET @Return_LeaveApplID = Scope_Identity()
GO
