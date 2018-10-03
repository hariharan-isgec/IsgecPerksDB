USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApprovedApplicationSelectByID]
  @LeaveApplID Int
  AS
  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[CardNo],
		[ATN_ApplHeader].[Remarks],
		[ATN_ApplHeader].[VerifiedBy],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[ApprovalRemark],
		[ATN_ApplHeader].[ApprovalOn],
		[ATN_ApplHeader].[SanctionRequired],
		[ATN_ApplHeader].[ApprovedBy],
		[ATN_ApplHeader].[AppliedOn],
		[ATN_ApplHeader].[FinYear],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[ATN_ApplicationStatus3].[ApplStatusID] AS ATN_ApplicationStatus3_ApplStatusID,
		[ATN_ApplicationStatus3].[Description] AS ATN_ApplicationStatus3_Description,
		[HRM_Employees4].[CardNo] AS HRM_Employees4_CardNo,
		[HRM_Employees4].[EmployeeName] AS HRM_Employees4_EmployeeName 
  FROM [ATN_ApplHeader] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_ApplHeader].[VerifiedBy] = [HRM_Employees2].[CardNo]
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus3]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus3].[ApplStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [ATN_ApplHeader].[ApprovedBy] = [HRM_Employees4].[CardNo]
  WHERE
  [ATN_ApplHeader].[LeaveApplID] = @LeaveApplID
GO
