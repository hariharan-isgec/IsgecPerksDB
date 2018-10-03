USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEmployeesSelectByID]
  @LoginID NVarChar(8),
  @EmployeeID Int 
  AS
  SELECT
    [PRK_Employees].* ,
    [PRK_Categories1].[Description] AS PRK_Categories1_Description,
    [PRK_MobileBillPlans2].[Description] AS PRK_MobileBillPlans2_Description 
  FROM [PRK_Employees] 
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Employees].[CategoryID] = [PRK_Categories1].[CategoryID]
  LEFT OUTER JOIN [PRK_MobileBillPlans] AS [PRK_MobileBillPlans2]
    ON [PRK_Employees].[MobileBillPlanID] = [PRK_MobileBillPlans2].[MobileBillPlanID]
  WHERE
  [PRK_Employees].[EmployeeID] = @EmployeeID
GO
