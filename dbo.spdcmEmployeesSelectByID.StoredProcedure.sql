USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmEmployeesSelectByID]
  @CardNo NVarChar(8) 
  AS
  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[C_CompanyID],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[ActiveState] 
  FROM [HRM_Employees] 
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
