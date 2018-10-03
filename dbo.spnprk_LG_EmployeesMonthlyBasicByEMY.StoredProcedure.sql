USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprk_LG_EmployeesMonthlyBasicByEMY]
  @EmployeeID Int,
  @ForMonth Int,
  @ForYear Int 
  AS
  SELECT
		[PRK_EmployeesMonthlyBasic].* 
  FROM [PRK_EmployeesMonthlyBasic] 
  WHERE
      [PRK_EmployeesMonthlyBasic].[EmployeeID] = @EmployeeID 
  AND [PRK_EmployeesMonthlyBasic].[SalMonth] = @ForMonth 
  AND [PRK_EmployeesMonthlyBasic].[SalYear] = @ForYear
GO
