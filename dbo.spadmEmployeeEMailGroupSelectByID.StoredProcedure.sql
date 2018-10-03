USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmEmployeeEMailGroupSelectByID]
  @CardNo NVarChar(8),
  @EMailGroup NVarChar(50) 
  AS
  SELECT
		[HRM_EmployeeEMailGroup].[CardNo],
		[HRM_EmployeeEMailGroup].[EMailGroup],
		[HRM_EMailGroups1].[EMailGroup] AS HRM_EMailGroups1_EMailGroup,
		[HRM_EMailGroups1].[Description] AS HRM_EMailGroups1_Description,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees2].[C_OfficeID] AS HRM_Employees2_C_OfficeID 
  FROM [HRM_EmployeeEMailGroup] 
  INNER JOIN [HRM_EMailGroups] AS [HRM_EMailGroups1]
    ON [HRM_EmployeeEMailGroup].[EMailGroup] = [HRM_EMailGroups1].[EMailGroup]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_EmployeeEMailGroup].[CardNo] = [HRM_Employees2].[CardNo]
  WHERE
  [HRM_EmployeeEMailGroup].[CardNo] = @CardNo
  AND [HRM_EmployeeEMailGroup].[EMailGroup] = @EMailGroup
GO
