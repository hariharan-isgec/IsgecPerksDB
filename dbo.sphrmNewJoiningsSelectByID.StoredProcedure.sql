USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmNewJoiningsSelectByID]
  @CardNo NVarChar(8)
  AS
  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[Salute],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[AliasName],
		[HRM_Employees].[Gender],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[J_CompanyID],
		[HRM_Employees].[J_DivisionID],
		[HRM_Employees].[J_OfficeID],
		[HRM_Employees].[J_DepartmentID],
		[HRM_Employees].[J_ProjectSiteID],
		[HRM_Employees].[J_DesignationID],
		[HRM_Employees].[J_BasicSalary],
		[HRM_Employees].[J_StatusID],
		[HRM_Employees].[J_StatusRemark],
		[HRM_Employees].[C_JoinngStateID],
		[HRM_Employees].[Freezed],
		[HRM_Employees].[ModifiedBy],
		[HRM_Employees].[ModifiedOn],
		[HRM_Employees].[ModifiedEvent],
		[HRM_Employees].[Contractual],
		[HRM_Employees].[EMailID],
		[HRM_Employees].[ContactNumbers],
		[HRM_Companies1].[CompanyID] AS HRM_Companies1_CompanyID,
		[HRM_Companies1].[Description] AS HRM_Companies1_Description,
		[HRM_Companies1].[ShortName] AS HRM_Companies1_ShortName,
		[HRM_Companies1].[BaaNID] AS HRM_Companies1_BaaNID,
		[HRM_Divisions2].[DivisionID] AS HRM_Divisions2_DivisionID,
		[HRM_Divisions2].[Description] AS HRM_Divisions2_Description,
		[HRM_Offices3].[OfficeID] AS HRM_Offices3_OfficeID,
		[HRM_Offices3].[Description] AS HRM_Offices3_Description,
		[HRM_Offices3].[Address] AS HRM_Offices3_Address,
		[HRM_Offices3].[City] AS HRM_Offices3_City,
		[HRM_Departments4].[DepartmentID] AS HRM_Departments4_DepartmentID,
		[HRM_Departments4].[Description] AS HRM_Departments4_Description,
		[DCM_Projects5].[ProjectCode] AS DCM_Projects5_ProjectCode,
		[DCM_Projects5].[Description] AS DCM_Projects5_Description,
		[HRM_Designations6].[DesignationID] AS HRM_Designations6_DesignationID,
		[HRM_Designations6].[Description] AS HRM_Designations6_Description,
		[HRM_Designations6].[ShortName] AS HRM_Designations6_ShortName,
		[HRM_Designations6].[Sequence] AS HRM_Designations6_Sequence,
		[HRM_Status7].[StatusID] AS HRM_Status7_StatusID,
		[HRM_Status7].[Description] AS HRM_Status7_Description,
		[HRM_Status7].[Sequence] AS HRM_Status7_Sequence,
		[HRM_JoiningStates8].[JoiningStateID] AS HRM_JoiningStates8_JoiningStateID,
		[HRM_JoiningStates8].[Description] AS HRM_JoiningStates8_Description,
		[aspnet_Users9].[UserName] AS aspnet_Users9_UserName,
		[aspnet_Users9].[UserFullName] AS aspnet_Users9_UserFullName 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies1]
    ON [HRM_Employees].[J_CompanyID] = [HRM_Companies1].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions2]
    ON [HRM_Employees].[J_DivisionID] = [HRM_Divisions2].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices3]
    ON [HRM_Employees].[J_OfficeID] = [HRM_Offices3].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments4]
    ON [HRM_Employees].[J_DepartmentID] = [HRM_Departments4].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects5]
    ON [HRM_Employees].[J_ProjectSiteID] = [DCM_Projects5].[ProjectCode]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations6]
    ON [HRM_Employees].[J_DesignationID] = [HRM_Designations6].[DesignationID]
  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status7]
    ON [HRM_Employees].[J_StatusID] = [HRM_Status7].[StatusID]
  LEFT OUTER JOIN [HRM_JoiningStates] AS [HRM_JoiningStates8]
    ON [HRM_Employees].[C_JoinngStateID] = [HRM_JoiningStates8].[JoiningStateID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users9]
    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users9].[UserName]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
