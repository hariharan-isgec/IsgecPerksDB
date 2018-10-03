USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnVerifedApplicationSelectByID]
  @LeaveApplID Int
  AS
  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[CardNo],
		[ATN_ApplHeader].[Remarks],
		[ATN_ApplHeader].[AppliedOn],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[VerificationRemark],
		[ATN_ApplHeader].[VerificationOn],
		[ATN_ApplHeader].[VerifiedBy],
		[ATN_ApplHeader].[ApprovalRequired],
		[ATN_ApplHeader].[SanctionRequired],
		[ATN_ApplHeader].[FinYear],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[ATN_ApplicationStatus2].[ApplStatusID] AS ATN_ApplicationStatus2_ApplStatusID,
		[ATN_ApplicationStatus2].[Description] AS ATN_ApplicationStatus2_Description,
		[HRM_Employees3].[CardNo] AS HRM_Employees3_CardNo,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName 
  FROM [ATN_ApplHeader] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus2]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus2].[ApplStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ATN_ApplHeader].[VerifiedBy] = [HRM_Employees3].[CardNo]
  WHERE
  [ATN_ApplHeader].[LeaveApplID] = @LeaveApplID
GO
