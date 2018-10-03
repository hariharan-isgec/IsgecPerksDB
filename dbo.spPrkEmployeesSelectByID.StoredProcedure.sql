USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkEmployeesSelectByID]
  @EmployeeID Int
  AS
  SELECT
		[PRK_Employees].[EmployeeID],
		[PRK_Employees].[CardNo],
		[PRK_Employees].[EmployeeName],
		[PRK_Employees].[CategoryID],
		[PRK_Employees].[PostedAt],
		[PRK_Employees].[VehicleType],
		[PRK_Employees].[Basic],
		[PRK_Employees].[ESI],
		[PRK_Employees].[DOJ],
		[PRK_Employees].[DOR],
		[PRK_Employees].[Department],
		[PRK_Employees].[Company],
		[PRK_Employees].[MaintenanceAllowed],
		[PRK_Employees].[TWInSalary],
		[PRK_Categories1].[CategoryID] AS PRK_Categories1_CategoryID,
		[PRK_Categories1].[CategoryCode] AS PRK_Categories1_CategoryCode,
		[PRK_Categories1].[Description] AS PRK_Categories1_Description,
		[PRK_Categories1].[Active] AS PRK_Categories1_Active,
		[PRK_Categories1].[STDCategory] AS PRK_Categories1_STDCategory,
		[PRK_Categories1].[cmba] AS PRK_Categories1_cmba 
  FROM [PRK_Employees] 
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Employees].[CategoryID] = [PRK_Categories1].[CategoryID]
  WHERE
  [PRK_Employees].[EmployeeID] = @EmployeeID
GO
