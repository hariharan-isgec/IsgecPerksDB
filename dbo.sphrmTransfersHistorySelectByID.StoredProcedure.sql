USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmTransfersHistorySelectByID]
  @TransferID Int
  AS
  SELECT
		[HRM_Transfers].[TransferID],
		[HRM_Transfers].[CardNo],
		[HRM_Transfers].[CompanyID],
		[HRM_Transfers].[DivisionID],
		[HRM_Transfers].[OfficeID],
		[HRM_Transfers].[DepartmentID],
		[HRM_Transfers].[ProjectSiteID],
		[HRM_Transfers].[TransferedOn],
		[HRM_Transfers].[Remarks],
		[HRM_Transfers].[ActiveState],
		[HRM_Transfers].[Executed],
		[HRM_Transfers].[Cancelled],
		[HRM_Transfers].[ProcessedBy],
		[HRM_Transfers].[ProcessedOn],
		[HRM_Transfers].[VerifiedBy],
		[HRM_Transfers].[VerifiedOn],
		[HRM_Transfers].[CreateEvent],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[C_DateOfJoining] AS HRM_Employees1_C_DateOfJoining,
		[HRM_Employees1].[C_CompanyID] AS HRM_Employees1_C_CompanyID,
		[HRM_Employees1].[C_DivisionID] AS HRM_Employees1_C_DivisionID,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[HRM_Employees1].[C_DepartmentID] AS HRM_Employees1_C_DepartmentID,
		[HRM_Employees1].[C_ProjectSiteID] AS HRM_Employees1_C_ProjectSiteID,
		[HRM_Employees1].[C_DesignationID] AS HRM_Employees1_C_DesignationID,
		[HRM_Employees1].[ActiveState] AS HRM_Employees1_ActiveState,
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
		[HRM_Employees6].[CardNo] AS HRM_Employees6_CardNo,
		[HRM_Employees6].[EmployeeName] AS HRM_Employees6_EmployeeName,
		[HRM_Employees6].[C_DateOfJoining] AS HRM_Employees6_C_DateOfJoining,
		[HRM_Employees6].[C_CompanyID] AS HRM_Employees6_C_CompanyID,
		[HRM_Employees6].[C_DivisionID] AS HRM_Employees6_C_DivisionID,
		[HRM_Employees6].[C_OfficeID] AS HRM_Employees6_C_OfficeID,
		[HRM_Employees6].[C_DepartmentID] AS HRM_Employees6_C_DepartmentID,
		[HRM_Employees6].[C_ProjectSiteID] AS HRM_Employees6_C_ProjectSiteID,
		[HRM_Employees6].[C_DesignationID] AS HRM_Employees6_C_DesignationID,
		[HRM_Employees6].[ActiveState] AS HRM_Employees6_ActiveState 
  FROM [HRM_Transfers] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Transfers].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [HRM_Transfers].[CompanyID] = [HRM_Companies2].[CompanyID]
  INNER JOIN [HRM_Divisions] AS [HRM_Divisions3]
    ON [HRM_Transfers].[DivisionID] = [HRM_Divisions3].[DivisionID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices4]
    ON [HRM_Transfers].[OfficeID] = [HRM_Offices4].[OfficeID]
  INNER JOIN [HRM_Departments] AS [HRM_Departments5]
    ON [HRM_Transfers].[DepartmentID] = [HRM_Departments5].[DepartmentID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]
    ON [HRM_Transfers].[ProcessedBy] = [HRM_Employees6].[CardNo]
  WHERE
  [HRM_Transfers].[TransferID] = @TransferID
GO
