USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAlertToApproverSelectByID]
  @LeaveApplID Int
  AS
  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[ApprovedBy],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[FinYear],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [ATN_ApplHeader] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[ApprovedBy] = [HRM_Employees1].[CardNo]
  WHERE
  [ATN_ApplHeader].[LeaveApplID] = @LeaveApplID
GO
