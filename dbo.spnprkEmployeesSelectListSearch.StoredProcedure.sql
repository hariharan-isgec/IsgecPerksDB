USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEmployeesSelectListSearch]
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
 ,EmployeeID Int NOT NULL
  )
  INSERT INTO #PageIndex (EmployeeID)
  SELECT [PRK_Employees].[EmployeeID] FROM [PRK_Employees]
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Employees].[CategoryID] = [PRK_Categories1].[CategoryID]
  LEFT OUTER JOIN [PRK_MobileBillPlans] AS [PRK_MobileBillPlans2]
    ON [PRK_Employees].[MobileBillPlanID] = [PRK_MobileBillPlans2].[MobileBillPlanID]
 WHERE  
   ( 
         STR(ISNULL([PRK_Employees].[EmployeeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees].[CategoryID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees].[Basic], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees].[VehicleType],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees].[Company],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees].[MobileLimit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees].[MobileBillPlanID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees].[LandlineLimit], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'EmployeeID' THEN [PRK_Employees].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [PRK_Employees].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'CardNo' THEN [PRK_Employees].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [PRK_Employees].[CardNo] END DESC,
     CASE @OrderBy WHEN 'EmployeeName' THEN [PRK_Employees].[EmployeeName] END,
     CASE @OrderBy WHEN 'EmployeeName DESC' THEN [PRK_Employees].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [PRK_Employees].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [PRK_Employees].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'Basic' THEN [PRK_Employees].[Basic] END,
     CASE @OrderBy WHEN 'Basic DESC' THEN [PRK_Employees].[Basic] END DESC,
     CASE @OrderBy WHEN 'DOJ' THEN [PRK_Employees].[DOJ] END,
     CASE @OrderBy WHEN 'DOJ DESC' THEN [PRK_Employees].[DOJ] END DESC,
     CASE @OrderBy WHEN 'DOR' THEN [PRK_Employees].[DOR] END,
     CASE @OrderBy WHEN 'DOR DESC' THEN [PRK_Employees].[DOR] END DESC,
     CASE @OrderBy WHEN 'PostedAt' THEN [PRK_Employees].[PostedAt] END,
     CASE @OrderBy WHEN 'PostedAt DESC' THEN [PRK_Employees].[PostedAt] END DESC,
     CASE @OrderBy WHEN 'VehicleType' THEN [PRK_Employees].[VehicleType] END,
     CASE @OrderBy WHEN 'VehicleType DESC' THEN [PRK_Employees].[VehicleType] END DESC,
     CASE @OrderBy WHEN 'MaintenanceAllowed' THEN [PRK_Employees].[MaintenanceAllowed] END,
     CASE @OrderBy WHEN 'MaintenanceAllowed DESC' THEN [PRK_Employees].[MaintenanceAllowed] END DESC,
     CASE @OrderBy WHEN 'TWInSalary' THEN [PRK_Employees].[TWInSalary] END,
     CASE @OrderBy WHEN 'TWInSalary DESC' THEN [PRK_Employees].[TWInSalary] END DESC,
     CASE @OrderBy WHEN 'ESI' THEN [PRK_Employees].[ESI] END,
     CASE @OrderBy WHEN 'ESI DESC' THEN [PRK_Employees].[ESI] END DESC,
     CASE @OrderBy WHEN 'Department' THEN [PRK_Employees].[Department] END,
     CASE @OrderBy WHEN 'Department DESC' THEN [PRK_Employees].[Department] END DESC,
     CASE @OrderBy WHEN 'Company' THEN [PRK_Employees].[Company] END,
     CASE @OrderBy WHEN 'Company DESC' THEN [PRK_Employees].[Company] END DESC,
     CASE @OrderBy WHEN 'MobileLimit' THEN [PRK_Employees].[MobileLimit] END,
     CASE @OrderBy WHEN 'MobileLimit DESC' THEN [PRK_Employees].[MobileLimit] END DESC,
     CASE @OrderBy WHEN 'MobileWithInternet' THEN [PRK_Employees].[MobileWithInternet] END,
     CASE @OrderBy WHEN 'MobileWithInternet DESC' THEN [PRK_Employees].[MobileWithInternet] END DESC,
     CASE @OrderBy WHEN 'MobileBillPlanID' THEN [PRK_Employees].[MobileBillPlanID] END,
     CASE @OrderBy WHEN 'MobileBillPlanID DESC' THEN [PRK_Employees].[MobileBillPlanID] END DESC,
     CASE @OrderBy WHEN 'LandlineLimit' THEN [PRK_Employees].[LandlineLimit] END,
     CASE @OrderBy WHEN 'LandlineLimit DESC' THEN [PRK_Employees].[LandlineLimit] END DESC,
     CASE @OrderBy WHEN 'PRK_Categories1_Description' THEN [PRK_Categories1].[Description] END,
     CASE @OrderBy WHEN 'PRK_Categories1_Description DESC' THEN [PRK_Categories1].[Description] END DESC,
     CASE @OrderBy WHEN 'PRK_MobileBillPlans2_Description' THEN [PRK_MobileBillPlans2].[Description] END,
     CASE @OrderBy WHEN 'PRK_MobileBillPlans2_Description DESC' THEN [PRK_MobileBillPlans2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PRK_Employees].* ,
    [PRK_Categories1].[Description] AS PRK_Categories1_Description,
    [PRK_MobileBillPlans2].[Description] AS PRK_MobileBillPlans2_Description 
  FROM [PRK_Employees] 
      INNER JOIN #PageIndex
          ON [PRK_Employees].[EmployeeID] = #PageIndex.EmployeeID
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Employees].[CategoryID] = [PRK_Categories1].[CategoryID]
  LEFT OUTER JOIN [PRK_MobileBillPlans] AS [PRK_MobileBillPlans2]
    ON [PRK_Employees].[MobileBillPlanID] = [PRK_MobileBillPlans2].[MobileBillPlanID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
