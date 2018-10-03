USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaDepartmentsSelectByID]
  @LoginID NVarChar(8),
  @DepartmentID NVarChar(6) 
  AS
  SELECT
		[HRM_Departments].[Description] ,
		[HRM_Departments].[DepartmentHead] ,
		[HRM_Departments].[BusinessHead] ,
		[HRM_Departments].[DepartmentID] ,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [HRM_Departments] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_Departments].[BusinessHead] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Departments].[DepartmentHead] = [HRM_Employees1].[CardNo]
  WHERE
  [HRM_Departments].[DepartmentID] = @DepartmentID
GO
