USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplHeaderUpdate]
  @ApplStatusID Int,
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
  @ExecutionState Int,
  @Original_LeaveApplID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_ApplHeader] SET 
   [ApplStatusID] = @ApplStatusID
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
  ,[ExecutionState] = @ExecutionState
  WHERE
  [LeaveApplID] = @Original_LeaveApplID
  SET @RowCount = @@RowCount
GO
