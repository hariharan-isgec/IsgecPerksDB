USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEmployeesMonthlyBasicSelectByID]
  @LoginID NVarChar(8),
  @RecordID Int 
  AS
  SELECT
    [PRK_EmployeesMonthlyBasic].* ,
    [PRK_Employees1].[EmployeeName] AS PRK_Employees1_EmployeeName,
    [PRK_MobileBillPlans2].[Description] AS PRK_MobileBillPlans2_Description 
  FROM [PRK_EmployeesMonthlyBasic] 
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_EmployeesMonthlyBasic].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  LEFT OUTER JOIN [PRK_MobileBillPlans] AS [PRK_MobileBillPlans2]
    ON [PRK_EmployeesMonthlyBasic].[MobileBillPlanID] = [PRK_MobileBillPlans2].[MobileBillPlanID]
  WHERE
  [PRK_EmployeesMonthlyBasic].[RecordID] = @RecordID
GO
