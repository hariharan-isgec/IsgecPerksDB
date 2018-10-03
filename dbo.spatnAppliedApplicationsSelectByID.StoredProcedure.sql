USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAppliedApplicationsSelectByID]
  @LeaveApplID Int
  AS
  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[CardNo],
		[ATN_ApplHeader].[AppliedOn],
		[ATN_ApplHeader].[Remarks],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[VerificationRemark],
		[ATN_ApplHeader].[FinYear],
		[ATN_ApplHeader].[VerificationOn],
		[ATN_ApplHeader].[ApprovalOn],
		[ATN_ApplHeader].[SanctionOn],
		[ATN_ApplHeader].[PostedOn],
		[ATN_ApplHeader].[VerificationRequired],
		[ATN_ApplHeader].[ApprovalRequired],
		[ATN_ApplHeader].[SanctionRequired],
		[ATN_ApplHeader].[ApprovalRemark],
		[ATN_ApplHeader].[SanctionRemark],
		[ATN_ApplicationStatus1].[ApplStatusID] AS ATN_ApplicationStatus1_ApplStatusID,
		[ATN_ApplicationStatus1].[Description] AS ATN_ApplicationStatus1_Description 
  FROM [ATN_ApplHeader] 
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus1]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus1].[ApplStatusID]
  WHERE
  [ATN_ApplHeader].[LeaveApplID] = @LeaveApplID
GO
