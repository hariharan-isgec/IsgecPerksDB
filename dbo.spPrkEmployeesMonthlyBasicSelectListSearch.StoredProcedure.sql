USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkEmployeesMonthlyBasicSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @FinYear Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RecordID Int NOT NULL
  )
  INSERT INTO #PageIndex (RecordID)
  SELECT [PRK_EmployeesMonthlyBasic].[RecordID] FROM [PRK_EmployeesMonthlyBasic]
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_EmployeesMonthlyBasic].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Categories] AS [PRK_Categories2]
    ON [PRK_EmployeesMonthlyBasic].[CategoryID] = [PRK_Categories2].[CategoryID]
 WHERE  
      [PRK_EmployeesMonthlyBasic].[FinYear] = @FinYear
   AND ( 
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
     OR LOWER(ISNULL([PRK_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees1].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[VehicleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees1].[Basic], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[Company],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories2].[CategoryCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories2].[STDCategory],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'RecordID' THEN [PRK_EmployeesMonthlyBasic].[RecordID] END,
     CASE @orderBy WHEN 'RecordID DESC' THEN [PRK_EmployeesMonthlyBasic].[RecordID] END DESC,
     CASE @orderBy WHEN 'EmployeeID' THEN [PRK_EmployeesMonthlyBasic].[EmployeeID] END,
     CASE @orderBy WHEN 'EmployeeID DESC' THEN [PRK_EmployeesMonthlyBasic].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'SalMonth' THEN [PRK_EmployeesMonthlyBasic].[SalMonth] END,
     CASE @orderBy WHEN 'SalMonth DESC' THEN [PRK_EmployeesMonthlyBasic].[SalMonth] END DESC,
     CASE @orderBy WHEN 'SalYear' THEN [PRK_EmployeesMonthlyBasic].[SalYear] END,
     CASE @orderBy WHEN 'SalYear DESC' THEN [PRK_EmployeesMonthlyBasic].[SalYear] END DESC,
     CASE @orderBy WHEN 'NetBasic' THEN [PRK_EmployeesMonthlyBasic].[NetBasic] END,
     CASE @orderBy WHEN 'NetBasic DESC' THEN [PRK_EmployeesMonthlyBasic].[NetBasic] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [PRK_EmployeesMonthlyBasic].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [PRK_EmployeesMonthlyBasic].[FinYear] END DESC,
     CASE @orderBy WHEN 'CategoryID' THEN [PRK_EmployeesMonthlyBasic].[CategoryID] END,
     CASE @orderBy WHEN 'CategoryID DESC' THEN [PRK_EmployeesMonthlyBasic].[CategoryID] END DESC,
     CASE @orderBy WHEN 'PostedAt' THEN [PRK_EmployeesMonthlyBasic].[PostedAt] END,
     CASE @orderBy WHEN 'PostedAt DESC' THEN [PRK_EmployeesMonthlyBasic].[PostedAt] END DESC,
     CASE @orderBy WHEN 'VehicleType' THEN [PRK_EmployeesMonthlyBasic].[VehicleType] END,
     CASE @orderBy WHEN 'VehicleType DESC' THEN [PRK_EmployeesMonthlyBasic].[VehicleType] END DESC,
     CASE @orderBy WHEN 'ESI' THEN [PRK_EmployeesMonthlyBasic].[ESI] END,
     CASE @orderBy WHEN 'ESI DESC' THEN [PRK_EmployeesMonthlyBasic].[ESI] END DESC,
     CASE @orderBy WHEN 'ESIAmount' THEN [PRK_EmployeesMonthlyBasic].[ESIAmount] END,
     CASE @orderBy WHEN 'ESIAmount DESC' THEN [PRK_EmployeesMonthlyBasic].[ESIAmount] END DESC,
     CASE @orderBy WHEN 'MaintenanceAllowed' THEN [PRK_EmployeesMonthlyBasic].[MaintenanceAllowed] END,
     CASE @orderBy WHEN 'MaintenanceAllowed DESC' THEN [PRK_EmployeesMonthlyBasic].[MaintenanceAllowed] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_EmployeeID' THEN [PRK_Employees1].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees1_EmployeeID DESC' THEN [PRK_Employees1].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_CardNo' THEN [PRK_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees1_CardNo DESC' THEN [PRK_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_EmployeeName' THEN [PRK_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees1_EmployeeName DESC' THEN [PRK_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_CategoryID' THEN [PRK_Employees1].[CategoryID] END,
     CASE @orderBy WHEN 'PRK_Employees1_CategoryID DESC' THEN [PRK_Employees1].[CategoryID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_PostedAt' THEN [PRK_Employees1].[PostedAt] END,
     CASE @orderBy WHEN 'PRK_Employees1_PostedAt DESC' THEN [PRK_Employees1].[PostedAt] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_VehicleType' THEN [PRK_Employees1].[VehicleType] END,
     CASE @orderBy WHEN 'PRK_Employees1_VehicleType DESC' THEN [PRK_Employees1].[VehicleType] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_Basic' THEN [PRK_Employees1].[Basic] END,
     CASE @orderBy WHEN 'PRK_Employees1_Basic DESC' THEN [PRK_Employees1].[Basic] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_ESI' THEN [PRK_Employees1].[ESI] END,
     CASE @orderBy WHEN 'PRK_Employees1_ESI DESC' THEN [PRK_Employees1].[ESI] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_DOJ' THEN [PRK_Employees1].[DOJ] END,
     CASE @orderBy WHEN 'PRK_Employees1_DOJ DESC' THEN [PRK_Employees1].[DOJ] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_DOR' THEN [PRK_Employees1].[DOR] END,
     CASE @orderBy WHEN 'PRK_Employees1_DOR DESC' THEN [PRK_Employees1].[DOR] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_Department' THEN [PRK_Employees1].[Department] END,
     CASE @orderBy WHEN 'PRK_Employees1_Department DESC' THEN [PRK_Employees1].[Department] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_Company' THEN [PRK_Employees1].[Company] END,
     CASE @orderBy WHEN 'PRK_Employees1_Company DESC' THEN [PRK_Employees1].[Company] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_MaintenanceAllowed' THEN [PRK_Employees1].[MaintenanceAllowed] END,
     CASE @orderBy WHEN 'PRK_Employees1_MaintenanceAllowed DESC' THEN [PRK_Employees1].[MaintenanceAllowed] END DESC,
     CASE @orderBy WHEN 'PRK_Categories2_CategoryID' THEN [PRK_Categories2].[CategoryID] END,
     CASE @orderBy WHEN 'PRK_Categories2_CategoryID DESC' THEN [PRK_Categories2].[CategoryID] END DESC,
     CASE @orderBy WHEN 'PRK_Categories2_CategoryCode' THEN [PRK_Categories2].[CategoryCode] END,
     CASE @orderBy WHEN 'PRK_Categories2_CategoryCode DESC' THEN [PRK_Categories2].[CategoryCode] END DESC,
     CASE @orderBy WHEN 'PRK_Categories2_Description' THEN [PRK_Categories2].[Description] END,
     CASE @orderBy WHEN 'PRK_Categories2_Description DESC' THEN [PRK_Categories2].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_Categories2_Active' THEN [PRK_Categories2].[Active] END,
     CASE @orderBy WHEN 'PRK_Categories2_Active DESC' THEN [PRK_Categories2].[Active] END DESC,
     CASE @orderBy WHEN 'PRK_Categories2_STDCategory' THEN [PRK_Categories2].[STDCategory] END,
     CASE @orderBy WHEN 'PRK_Categories2_STDCategory DESC' THEN [PRK_Categories2].[STDCategory] END DESC,
     CASE @orderBy WHEN 'PRK_Categories2_cmba' THEN [PRK_Categories2].[cmba] END,
     CASE @orderBy WHEN 'PRK_Categories2_cmba DESC' THEN [PRK_Categories2].[cmba] END DESC 

    SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [PRK_EmployeesMonthlyBasic].[RecordID] = #PageIndex.RecordID
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_EmployeesMonthlyBasic].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Categories] AS [PRK_Categories2]
    ON [PRK_EmployeesMonthlyBasic].[CategoryID] = [PRK_Categories2].[CategoryID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
