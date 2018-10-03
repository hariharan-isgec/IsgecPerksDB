USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmEmployeeEMailGroupSelectByEMailGroup]
  @EMailGroup NVarChar(50),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  [HRM_EmployeeEMailGroup].[EMailGroup] = @EMailGroup
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [HRM_EmployeeEMailGroup].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_EmployeeEMailGroup].[CardNo] END DESC,
     CASE @orderBy WHEN 'EMailGroup' THEN [HRM_EmployeeEMailGroup].[EMailGroup] END,
     CASE @orderBy WHEN 'EMailGroup DESC' THEN [HRM_EmployeeEMailGroup].[EMailGroup] END DESC,
     CASE @orderBy WHEN 'HRM_EMailGroups1_EMailGroup' THEN [HRM_EMailGroups1].[EMailGroup] END,
     CASE @orderBy WHEN 'HRM_EMailGroups1_EMailGroup DESC' THEN [HRM_EMailGroups1].[EMailGroup] END DESC,
     CASE @orderBy WHEN 'HRM_EMailGroups1_Description' THEN [HRM_EMailGroups1].[Description] END,
     CASE @orderBy WHEN 'HRM_EMailGroups1_Description DESC' THEN [HRM_EMailGroups1].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo' THEN [HRM_Employees2].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo DESC' THEN [HRM_Employees2].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID' THEN [HRM_Employees2].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID DESC' THEN [HRM_Employees2].[C_OfficeID] END DESC 
  SET @RecordCount = @@RowCount
GO
