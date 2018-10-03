USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrk_LG_EmployeesMonthlyBasicByEMY]
  @EmployeeID Int,
  @ForMonth Int,
  @ForYear Int 
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
		[PRK_EmployeesMonthlyBasic].[TWInSalary] 
  FROM [PRK_EmployeesMonthlyBasic] 
  WHERE
      [PRK_EmployeesMonthlyBasic].[EmployeeID] = @EmployeeID 
  AND [PRK_EmployeesMonthlyBasic].[SalMonth] = @ForMonth 
  AND [PRK_EmployeesMonthlyBasic].[SalYear] = @ForYear
GO
