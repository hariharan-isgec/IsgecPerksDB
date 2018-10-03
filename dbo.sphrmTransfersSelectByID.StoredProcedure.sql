USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmTransfersSelectByID]
  @CardNo NVarChar(8)
  AS
  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[C_CompanyID],
		[HRM_Employees].[C_DivisionID],
		[HRM_Employees].[C_OfficeID],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[C_ProjectSiteID],
		[HRM_Employees].[U_UnderTransfer],
		[HRM_Employees].[U_CompanyID],
		[HRM_Employees].[U_DivisionID],
		[HRM_Employees].[U_OfficeID],
		[HRM_Employees].[U_DepartmentID],
		[HRM_Employees].[U_ProjectSiteID],
		[HRM_Employees].[U_ActiveState],
		[HRM_Employees].[C_TransferedOn],
		[HRM_Employees].[C_TransferRemark],
		[HRM_Employees].[Resigned],
		[HRM_Employees].[ActiveState],
		[HRM_Employees].[Confirmed],
		[HRM_Employees].[ModifiedBy],
		[HRM_Employees].[ModifiedOn],
		[HRM_Employees].[ModifiedEvent],
		[HRM_Employees].[ActiveStateEventName],
		[HRM_Designations1].[DesignationID] AS HRM_Designations1_DesignationID,
		[HRM_Designations1].[Description] AS HRM_Designations1_Description,
		[HRM_Designations1].[ShortName] AS HRM_Designations1_ShortName,
		[HRM_Designations1].[Sequence] AS HRM_Designations1_Sequence,
		[HRM_Companies2].[CompanyID] AS HRM_Companies2_CompanyID,
		[HRM_Companies2].[Description] AS HRM_Companies2_Description,
		[HRM_Companies2].[ShortName] AS HRM_Companies2_ShortName,
		[HRM_Companies2].[BaaNID] AS HRM_Companies2_BaaNID,
		[HRM_Divisions3].[DivisionID] AS HRM_Divisions3_DivisionID,
		[HRM_Divisions3].[Description] AS HRM_Divisions3_Description,
		[HRM_Offices4].[OfficeID] AS HRM_Offices4_OfficeID,
		[HRM_Offices4].[Description] AS HRM_Offices4_Description,
		[HRM_Offices4].[Address] AS HRM_Offices4_Address,
		[HRM_Offices4].[City] AS HRM_Offices4_City,
		[HRM_Departments5].[DepartmentID] AS HRM_Departments5_DepartmentID,
		[HRM_Departments5].[Description] AS HRM_Departments5_Description,
		[DCM_Projects6].[ProjectCode] AS DCM_Projects6_ProjectCode,
		[DCM_Projects6].[Description] AS DCM_Projects6_Description,
		[HRM_Companies7].[CompanyID] AS HRM_Companies7_CompanyID,
		[HRM_Companies7].[Description] AS HRM_Companies7_Description,
		[HRM_Companies7].[ShortName] AS HRM_Companies7_ShortName,
		[HRM_Companies7].[BaaNID] AS HRM_Companies7_BaaNID,
		[HRM_Divisions8].[DivisionID] AS HRM_Divisions8_DivisionID,
		[HRM_Divisions8].[Description] AS HRM_Divisions8_Description,
		[HRM_Offices9].[OfficeID] AS HRM_Offices9_OfficeID,
		[HRM_Offices9].[Description] AS HRM_Offices9_Description,
		[HRM_Offices9].[Address] AS HRM_Offices9_Address,
		[HRM_Offices9].[City] AS HRM_Offices9_City,
		[HRM_Departments10].[DepartmentID] AS HRM_Departments10_DepartmentID,
		[HRM_Departments10].[Description] AS HRM_Departments10_Description,
		[DCM_Projects11].[ProjectCode] AS DCM_Projects11_ProjectCode,
		[DCM_Projects11].[Description] AS DCM_Projects11_Description,
		[aspnet_Users12].[UserName] AS aspnet_Users12_UserName,
		[aspnet_Users12].[UserFullName] AS aspnet_Users12_UserFullName 
  FROM [HRM_Employees] 
  INNER JOIN [HRM_Designations] AS [HRM_Designations1]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations1].[DesignationID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies2].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions3]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions3].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices4]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices4].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments5]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments5].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects6]
    ON [HRM_Employees].[C_ProjectSiteID] = [DCM_Projects6].[ProjectCode]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies7]
    ON [HRM_Employees].[U_CompanyID] = [HRM_Companies7].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions8]
    ON [HRM_Employees].[U_DivisionID] = [HRM_Divisions8].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices9]
    ON [HRM_Employees].[U_OfficeID] = [HRM_Offices9].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments10]
    ON [HRM_Employees].[U_DepartmentID] = [HRM_Departments10].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects11]
    ON [HRM_Employees].[U_ProjectSiteID] = [DCM_Projects11].[ProjectCode]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users12]
    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users12].[UserName]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
