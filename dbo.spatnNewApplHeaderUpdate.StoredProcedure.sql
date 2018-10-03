USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnNewApplHeaderUpdate]
  @Original_LeaveApplID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_ApplHeader] SET 
   [CardNo] = @CardNo
  ,[Approved] = @Approved
  ,[Rejected] = @Rejected
  ,[Application] = @Application
  ,[Remarks] = @Remarks
  ,[FinYear] = @FinYear
  ,[ApplStatusID] = @ApplStatusID
  ,[AppliedOn] = @AppliedOn
  ,[VerificationOn] = @VerificationOn
  ,[ApprovalOn] = @ApprovalOn
  ,[SanctionOn] = @SanctionOn
  ,[PostedOn] = @PostedOn
  ,[VerificationRequired] = @VerificationRequired
  ,[ApprovalRequired] = @ApprovalRequired
  ,[SanctionRequired] = @SanctionRequired
  ,[VerifiedBy] = @VerifiedBy
  ,[ApprovedBy] = @ApprovedBy
  ,[SanctionedBy] = @SanctionedBy
  ,[PostedBy] = @PostedBy
  ,[VerificationRemark] = @VerificationRemark
  ,[ApprovalRemark] = @ApprovalRemark
  ,[SanctionRemark] = @SanctionRemark
  ,[PostingRemark] = @PostingRemark
  ,[AdvanceApplication] = @AdvanceApplication
  ,[ExecutionState] = @ExecutionState
  WHERE
  [LeaveApplID] = @Original_LeaveApplID
  SET @RowCount = @@RowCount
GO
