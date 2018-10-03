USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnEmployeesSelectByID]
  @CardNo NVarChar(8)
  AS
  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[VerificationRequired],
		[HRM_Employees].[VerifierID],
		[HRM_Employees].[ApprovalRequired],
		[HRM_Employees].[ApproverID],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[C_DateOfReleaving],
		[HRM_Employees].[C_CompanyID],
		[HRM_Employees].[C_DivisionID],
		[HRM_Employees].[C_OfficeID],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[ActiveState],
		[HRM_Employees].[C_ConfirmedOn],
		[HRM_Employees].[C_ProjectSiteID],
		[HRM_Employees].[Contractual],
		[HRM_Employees].[CategoryID],
		[HRM_Employees].[EMailID],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[VerificationRequired] AS HRM_Employees1_VerificationRequired,
		[HRM_Employees1].[VerifierID] AS HRM_Employees1_VerifierID,
		[HRM_Employees1].[ApprovalRequired] AS HRM_Employees1_ApprovalRequired,
		[HRM_Employees1].[ApproverID] AS HRM_Employees1_ApproverID,
		[HRM_Employees1].[C_DateOfJoining] AS HRM_Employees1_C_DateOfJoining,
		[HRM_Employees1].[C_DateOfReleaving] AS HRM_Employees1_C_DateOfReleaving,
		[HRM_Employees1].[C_CompanyID] AS HRM_Employees1_C_CompanyID,
		[HRM_Employees1].[C_DivisionID] AS HRM_Employees1_C_DivisionID,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[HRM_Employees1].[C_DepartmentID] AS HRM_Employees1_C_DepartmentID,
		[HRM_Employees1].[C_DesignationID] AS HRM_Employees1_C_DesignationID,
		[HRM_Employees1].[ActiveState] AS HRM_Employees1_ActiveState,
		[HRM_Employees1].[C_ConfirmedOn] AS HRM_Employees1_C_ConfirmedOn,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees2].[VerificationRequired] AS HRM_Employees2_VerificationRequired,
		[HRM_Employees2].[VerifierID] AS HRM_Employees2_VerifierID,
		[HRM_Employees2].[ApprovalRequired] AS HRM_Employees2_ApprovalRequired,
		[HRM_Employees2].[ApproverID] AS HRM_Employees2_ApproverID,
		[HRM_Employees2].[C_DateOfJoining] AS HRM_Employees2_C_DateOfJoining,
		[HRM_Employees2].[C_DateOfReleaving] AS HRM_Employees2_C_DateOfReleaving,
		[HRM_Employees2].[C_CompanyID] AS HRM_Employees2_C_CompanyID,
		[HRM_Employees2].[C_DivisionID] AS HRM_Employees2_C_DivisionID,
		[HRM_Employees2].[C_OfficeID] AS HRM_Employees2_C_OfficeID,
		[HRM_Employees2].[C_DepartmentID] AS HRM_Employees2_C_DepartmentID,
		[HRM_Employees2].[C_DesignationID] AS HRM_Employees2_C_DesignationID,
		[HRM_Employees2].[ActiveState] AS HRM_Employees2_ActiveState,
		[HRM_Employees2].[C_ConfirmedOn] AS HRM_Employees2_C_ConfirmedOn,
		[HRM_Companies3].[CompanyID] AS HRM_Companies3_CompanyID,
		[HRM_Companies3].[Description] AS HRM_Companies3_Description,
		[HRM_Companies3].[ShortName] AS HRM_Companies3_ShortName,
		[HRM_Companies3].[BaaNID] AS HRM_Companies3_BaaNID,
		[HRM_Divisions4].[DivisionID] AS HRM_Divisions4_DivisionID,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Offices5].[OfficeID] AS HRM_Offices5_OfficeID,
		[HRM_Offices5].[Description] AS HRM_Offices5_Description,
		[HRM_Offices5].[Address] AS HRM_Offices5_Address,
		[HRM_Offices5].[City] AS HRM_Offices5_City,
		[HRM_Departments6].[DepartmentID] AS HRM_Departments6_DepartmentID,
		[HRM_Departments6].[Description] AS HRM_Departments6_Description,
		[HRM_Designations7].[DesignationID] AS HRM_Designations7_DesignationID,
		[HRM_Designations7].[Description] AS HRM_Designations7_Description,
		[HRM_Designations7].[ShortName] AS HRM_Designations7_ShortName,
		[HRM_Designations7].[Sequence] AS HRM_Designations7_Sequence 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Employees].[VerifierID] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_Employees].[ApproverID] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies3]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies3].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices5]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices5].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments6]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments6].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations7]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations7].[DesignationID]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
