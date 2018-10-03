USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeesSelectByID]
  @LoginID NVarChar(8),
  @CardNo NVarChar(8) 
  AS
  SELECT
		[HRM_Employees].[CardNo] ,
		[HRM_Employees].[EmployeeName] ,
		[HRM_Employees].[C_DateOfJoining] ,
		[HRM_Employees].[C_OfficeID] ,
		[HRM_Employees].[C_DepartmentID] ,
		[HRM_Employees].[C_DesignationID] ,
		[HRM_Employees].[C_CompanyID] ,
		[HRM_Employees].[C_DivisionID] ,
		[HRM_Employees].[ActiveState] ,
		[HRM_Employees].[Contractual] ,
		[HRM_Employees].[ContactNumbers] ,
		[HRM_Employees].[EMailID] ,
		[HRM_Employees].[C_DateOfReleaving] ,
		ISNULL([HRM_Employees].[CategoryID],'') AS CategoryID ,
		[HRM_Departments2].[Description] AS HRM_Departments2_Description,
		[HRM_Designations3].[Description] AS HRM_Designations3_Description,
		[HRM_Offices1].[Description] AS HRM_Offices1_Description 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments2].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations3]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations3].[DesignationID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices1].[OfficeID]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
