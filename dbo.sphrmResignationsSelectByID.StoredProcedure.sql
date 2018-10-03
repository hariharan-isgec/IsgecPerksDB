USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmResignationsSelectByID]
  @CardNo NVarChar(8)
  AS
  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[C_StatusID],
		[HRM_Employees].[Resigned],
		[HRM_Employees].[C_ResignedOn],
		[HRM_Employees].[C_DateOfReleaving],
		[HRM_Employees].[C_ResignedRemark],
		[HRM_Employees].[ActiveState],
		[HRM_Employees].[ActiveStateEventName],
		[HRM_Employees].[ModifiedBy],
		[HRM_Employees].[ModifiedOn],
		[HRM_Employees].[ModifiedEvent],
		[HRM_Departments1].[DepartmentID] AS HRM_Departments1_DepartmentID,
		[HRM_Departments1].[Description] AS HRM_Departments1_Description,
		[HRM_Designations2].[DesignationID] AS HRM_Designations2_DesignationID,
		[HRM_Designations2].[Description] AS HRM_Designations2_Description,
		[HRM_Designations2].[ShortName] AS HRM_Designations2_ShortName,
		[HRM_Designations2].[Sequence] AS HRM_Designations2_Sequence,
		[HRM_Status3].[StatusID] AS HRM_Status3_StatusID,
		[HRM_Status3].[Description] AS HRM_Status3_Description,
		[HRM_Status3].[Sequence] AS HRM_Status3_Sequence,
		[aspnet_Users4].[UserName] AS aspnet_Users4_UserName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments1]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments1].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations2]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations2].[DesignationID]
  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status3]
    ON [HRM_Employees].[C_StatusID] = [HRM_Status3].[StatusID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users4].[UserName]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
