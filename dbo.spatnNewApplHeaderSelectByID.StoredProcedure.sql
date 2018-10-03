USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnNewApplHeaderSelectByID]
  @LoginID NVarChar(8),
  @LeaveApplID Int 
  AS
  SELECT
    [ATN_ApplHeader].* ,
    [ATN_ApplicationStatus1].[Description] AS ATN_ApplicationStatus1_Description,
    [ATN_ExecutionStates2].[Description] AS ATN_ExecutionStates2_Description,
    [HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
    [HRM_Employees4].[EmployeeName] AS HRM_Employees4_EmployeeName,
    [HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName,
    [HRM_Employees6].[EmployeeName] AS HRM_Employees6_EmployeeName,
    [HRM_Employees7].[EmployeeName] AS HRM_Employees7_EmployeeName 
  FROM [ATN_ApplHeader] 
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus1]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus1].[ApplStatusID]
  LEFT OUTER JOIN [ATN_ExecutionStates] AS [ATN_ExecutionStates2]
    ON [ATN_ApplHeader].[ExecutionState] = [ATN_ExecutionStates2].[ExecutionState]
  INNER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees3].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [ATN_ApplHeader].[VerifiedBy] = [HRM_Employees4].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [ATN_ApplHeader].[ApprovedBy] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]
    ON [ATN_ApplHeader].[SanctionedBy] = [HRM_Employees6].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]
    ON [ATN_ApplHeader].[PostedBy] = [HRM_Employees7].[CardNo]
  WHERE
  [ATN_ApplHeader].[LeaveApplID] = @LeaveApplID
GO
