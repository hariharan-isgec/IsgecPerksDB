USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnExecuteChangeRequestSelectByID]
  @RequestID Int
  AS
  SELECT
		[ATN_ApproverChangeRequest].[RequestID],
		[ATN_ApproverChangeRequest].[UserID],
		[ATN_ApproverChangeRequest].[VerificationRequired],
		[ATN_ApproverChangeRequest].[VerifierID],
		[ATN_ApproverChangeRequest].[ApprovalRequired],
		[ATN_ApproverChangeRequest].[ApproverID],
		[ATN_ApproverChangeRequest].[Requested],
		[ATN_ApproverChangeRequest].[RequestedOn],
		[ATN_ApproverChangeRequest].[Executed],
		[ATN_ApproverChangeRequest].[ExecutedOn],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees3].[CardNo] AS HRM_Employees3_CardNo,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName 
  FROM [ATN_ApproverChangeRequest] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApproverChangeRequest].[UserID] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_ApproverChangeRequest].[VerifierID] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ATN_ApproverChangeRequest].[ApproverID] = [HRM_Employees3].[CardNo]
  WHERE
  [ATN_ApproverChangeRequest].[RequestID] = @RequestID
GO
