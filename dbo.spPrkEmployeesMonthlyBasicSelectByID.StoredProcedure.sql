USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkEmployeesMonthlyBasicSelectByID]
  @RecordID Int
  AS
  SELECT
		[PRK_EmployeesMonthlyBasic].[RecordID],
		[PRK_EmployeesMonthlyBasic].[EmployeeID],
		[PRK_EmployeesMonthlyBasic].[SalMonth],
		[PRK_EmployeesMonthlyBasic].[SalYear],
		[PRK_EmployeesMonthlyBasic].[NetBasic],
		[PRK_EmployeesMonthlyBasic].[FinYear],
		[PRK_EmployeesMonthlyBasic].[CategoryID],
		[PRK_EmployeesMonthlyBasic].[PostedAt],
		[PRK_EmployeesMonthlyBasic].[VehicleType],
		[PRK_EmployeesMonthlyBasic].[ESI],
		[PRK_EmployeesMonthlyBasic].[ESIAmount],
		[PRK_EmployeesMonthlyBasic].[MaintenanceAllowed],
		[PRK_EmployeesMonthlyBasic].[TWInSalary],
		[PRK_Employees1].[EmployeeID] AS PRK_Employees1_EmployeeID,
		[PRK_Employees1].[CardNo] AS PRK_Employees1_CardNo,
		[PRK_Employees1].[EmployeeName] AS PRK_Employees1_EmployeeName,
		[PRK_Employees1].[CategoryID] AS PRK_Employees1_CategoryID,
		[PRK_Employees1].[PostedAt] AS PRK_Employees1_PostedAt,
		[PRK_Employees1].[VehicleType] AS PRK_Employees1_VehicleType,
		[PRK_Employees1].[Basic] AS PRK_Employees1_Basic,
		[PRK_Employees1].[ESI] AS PRK_Employees1_ESI,
		[PRK_Employees1].[DOJ] AS PRK_Employees1_DOJ,
		[PRK_Employees1].[DOR] AS PRK_Employees1_DOR,
		[PRK_Employees1].[Department] AS PRK_Employees1_Department,
		[PRK_Employees1].[Company] AS PRK_Employees1_Company,
		[PRK_Employees1].[MaintenanceAllowed] AS PRK_Employees1_MaintenanceAllowed,
		[PRK_Categories2].[CategoryID] AS PRK_Categories2_CategoryID,
		[PRK_Categories2].[CategoryCode] AS PRK_Categories2_CategoryCode,
		[PRK_Categories2].[Description] AS PRK_Categories2_Description,
		[PRK_Categories2].[Active] AS PRK_Categories2_Active,
		[PRK_Categories2].[STDCategory] AS PRK_Categories2_STDCategory,
		[PRK_Categories2].[cmba] AS PRK_Categories2_cmba 
  FROM [PRK_EmployeesMonthlyBasic] 
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_EmployeesMonthlyBasic].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Categories] AS [PRK_Categories2]
    ON [PRK_EmployeesMonthlyBasic].[CategoryID] = [PRK_Categories2].[CategoryID]
  WHERE
  [PRK_EmployeesMonthlyBasic].[RecordID] = @RecordID
GO
