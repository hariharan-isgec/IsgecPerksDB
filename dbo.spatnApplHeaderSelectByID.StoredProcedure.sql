USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplHeaderSelectByID]
  @LeaveApplID Int
  AS
  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[CardNo],
		[ATN_ApplHeader].[Remarks],
		[ATN_ApplHeader].[FinYear],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[AppliedOn],
		[ATN_ApplHeader].[VerificationOn],
		[ATN_ApplHeader].[ApprovalOn],
		[ATN_ApplHeader].[SanctionOn],
		[ATN_ApplHeader].[PostedOn],
		[ATN_ApplHeader].[VerificationRequired],
		[ATN_ApplHeader].[ApprovalRequired],
		[ATN_ApplHeader].[SanctionRequired],
		[ATN_ApplHeader].[VerifiedBy],
		[ATN_ApplHeader].[ApprovedBy],
		[ATN_ApplHeader].[SanctionedBy],
		[ATN_ApplHeader].[PostedBy],
		[ATN_ApplHeader].[VerificationRemark],
		[ATN_ApplHeader].[ApprovalRemark],
		[ATN_ApplHeader].[SanctionRemark],
		[ATN_ApplHeader].[PostingRemark],
		[ATN_ApplHeader].[AdvanceApplication],
		[ATN_ApplHeader].[ExecutionState] 
  FROM [ATN_ApplHeader] 
  WHERE
  [ATN_ApplHeader].[LeaveApplID] = @LeaveApplID
GO
