USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEmployeesMonthlyBasicSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RecordID Int NOT NULL
  )
  INSERT INTO #PageIndex (RecordID)
  SELECT [PRK_EmployeesMonthlyBasic].[RecordID] FROM [PRK_EmployeesMonthlyBasic]
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_EmployeesMonthlyBasic].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  LEFT OUTER JOIN [PRK_MobileBillPlans] AS [PRK_MobileBillPlans2]
    ON [PRK_EmployeesMonthlyBasic].[MobileBillPlanID] = [PRK_MobileBillPlans2].[MobileBillPlanID]
 WHERE  
   ( 
         STR(ISNULL([PRK_EmployeesMonthlyBasic].[RecordID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_EmployeesMonthlyBasic].[EmployeeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_EmployeesMonthlyBasic].[SalMonth], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_EmployeesMonthlyBasic].[SalYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_EmployeesMonthlyBasic].[NetBasic], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_EmployeesMonthlyBasic].[FinYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_EmployeesMonthlyBasic].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_EmployeesMonthlyBasic].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_EmployeesMonthlyBasic].[VehicleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_EmployeesMonthlyBasic].[ESIAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_EmployeesMonthlyBasic].[MobileLimit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_EmployeesMonthlyBasic].[MobileBillPlanID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_EmployeesMonthlyBasic].[LandlineLimit], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RecordID' THEN [PRK_EmployeesMonthlyBasic].[RecordID] END,
     CASE @OrderBy WHEN 'RecordID DESC' THEN [PRK_EmployeesMonthlyBasic].[RecordID] END DESC,
     CASE @OrderBy WHEN 'EmployeeID' THEN [PRK_EmployeesMonthlyBasic].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [PRK_EmployeesMonthlyBasic].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'SalMonth' THEN [PRK_EmployeesMonthlyBasic].[SalMonth] END,
     CASE @OrderBy WHEN 'SalMonth DESC' THEN [PRK_EmployeesMonthlyBasic].[SalMonth] END DESC,
     CASE @OrderBy WHEN 'SalYear' THEN [PRK_EmployeesMonthlyBasic].[SalYear] END,
     CASE @OrderBy WHEN 'SalYear DESC' THEN [PRK_EmployeesMonthlyBasic].[SalYear] END DESC,
     CASE @OrderBy WHEN 'NetBasic' THEN [PRK_EmployeesMonthlyBasic].[NetBasic] END,
     CASE @OrderBy WHEN 'NetBasic DESC' THEN [PRK_EmployeesMonthlyBasic].[NetBasic] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [PRK_EmployeesMonthlyBasic].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PRK_EmployeesMonthlyBasic].[FinYear] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [PRK_EmployeesMonthlyBasic].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [PRK_EmployeesMonthlyBasic].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'PostedAt' THEN [PRK_EmployeesMonthlyBasic].[PostedAt] END,
     CASE @OrderBy WHEN 'PostedAt DESC' THEN [PRK_EmployeesMonthlyBasic].[PostedAt] END DESC,
     CASE @OrderBy WHEN 'VehicleType' THEN [PRK_EmployeesMonthlyBasic].[VehicleType] END,
     CASE @OrderBy WHEN 'VehicleType DESC' THEN [PRK_EmployeesMonthlyBasic].[VehicleType] END DESC,
     CASE @OrderBy WHEN 'ESI' THEN [PRK_EmployeesMonthlyBasic].[ESI] END,
     CASE @OrderBy WHEN 'ESI DESC' THEN [PRK_EmployeesMonthlyBasic].[ESI] END DESC,
     CASE @OrderBy WHEN 'ESIAmount' THEN [PRK_EmployeesMonthlyBasic].[ESIAmount] END,
     CASE @OrderBy WHEN 'ESIAmount DESC' THEN [PRK_EmployeesMonthlyBasic].[ESIAmount] END DESC,
     CASE @OrderBy WHEN 'MaintenanceAllowed' THEN [PRK_EmployeesMonthlyBasic].[MaintenanceAllowed] END,
     CASE @OrderBy WHEN 'MaintenanceAllowed DESC' THEN [PRK_EmployeesMonthlyBasic].[MaintenanceAllowed] END DESC,
     CASE @OrderBy WHEN 'TWInSalary' THEN [PRK_EmployeesMonthlyBasic].[TWInSalary] END,
     CASE @OrderBy WHEN 'TWInSalary DESC' THEN [PRK_EmployeesMonthlyBasic].[TWInSalary] END DESC,
     CASE @OrderBy WHEN 'MobileLimit' THEN [PRK_EmployeesMonthlyBasic].[MobileLimit] END,
     CASE @OrderBy WHEN 'MobileLimit DESC' THEN [PRK_EmployeesMonthlyBasic].[MobileLimit] END DESC,
     CASE @OrderBy WHEN 'MobileWithInternet' THEN [PRK_EmployeesMonthlyBasic].[MobileWithInternet] END,
     CASE @OrderBy WHEN 'MobileWithInternet DESC' THEN [PRK_EmployeesMonthlyBasic].[MobileWithInternet] END DESC,
     CASE @OrderBy WHEN 'MobileBillPlanID' THEN [PRK_EmployeesMonthlyBasic].[MobileBillPlanID] END,
     CASE @OrderBy WHEN 'MobileBillPlanID DESC' THEN [PRK_EmployeesMonthlyBasic].[MobileBillPlanID] END DESC,
     CASE @OrderBy WHEN 'LandlineLimit' THEN [PRK_EmployeesMonthlyBasic].[LandlineLimit] END,
     CASE @OrderBy WHEN 'LandlineLimit DESC' THEN [PRK_EmployeesMonthlyBasic].[LandlineLimit] END DESC,
     CASE @OrderBy WHEN 'PRK_Employees1_EmployeeName' THEN [PRK_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'PRK_Employees1_EmployeeName DESC' THEN [PRK_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PRK_MobileBillPlans2_Description' THEN [PRK_MobileBillPlans2].[Description] END,
     CASE @OrderBy WHEN 'PRK_MobileBillPlans2_Description DESC' THEN [PRK_MobileBillPlans2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PRK_EmployeesMonthlyBasic].* ,
    [PRK_Employees1].[EmployeeName] AS PRK_Employees1_EmployeeName,
    [PRK_MobileBillPlans2].[Description] AS PRK_MobileBillPlans2_Description 
  FROM [PRK_EmployeesMonthlyBasic] 
      INNER JOIN #PageIndex
          ON [PRK_EmployeesMonthlyBasic].[RecordID] = #PageIndex.RecordID
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_EmployeesMonthlyBasic].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  LEFT OUTER JOIN [PRK_MobileBillPlans] AS [PRK_MobileBillPlans2]
    ON [PRK_EmployeesMonthlyBasic].[MobileBillPlanID] = [PRK_MobileBillPlans2].[MobileBillPlanID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
