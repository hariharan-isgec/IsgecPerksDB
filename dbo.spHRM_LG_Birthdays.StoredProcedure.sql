USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spHRM_LG_Birthdays]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT  
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[ActiveState],
		[HRM_Employees].[DateOfBirth],
		[HRM_Departments4].[DepartmentID] AS HRM_Departments4_DepartmentID,
		[HRM_Departments4].[Description] AS HRM_Departments4_Description  
  FROM [HRM_Employees]   
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments4]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments4].[DepartmentID]

	WHERE 
      DAY([HRM_Employees].[DateOfBirth])=DAY(GETDATE())    
  AND MONTH([HRM_Employees].[DateOfBirth])=MONTH(GETDATE())
    
  AND [HRM_Employees].[ActiveState] = 1  

  ORDER BY [HRM_Employees].[DateOfBirth]    

  SET @RecordCount = @@RowCount
GO
