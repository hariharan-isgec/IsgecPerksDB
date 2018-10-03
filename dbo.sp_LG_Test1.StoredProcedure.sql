USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LG_Test1]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
		[PRK_Categories1].[CategoryID] AS PRK_Categories1_CategoryID,
		[PRK_Categories1].[CategoryCode] AS PRK_Categories1_CategoryCode,
		[PRK_Categories1].[Description] AS PRK_Categories1_Description,
		[PRK_Categories1].[Active] AS PRK_Categories1_Active,
		[PRK_Categories1].[STDCategory] AS PRK_Categories1_STDCategory,
		[PRK_Categories1].[cmba] AS PRK_Categories1_cmba 
  FROM [PRK_Employees] 
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Employees].[CategoryID] = [PRK_Categories1].[CategoryID]
  ORDER BY
     CASE @orderBy WHEN 'EmployeeID' THEN [PRK_Employees].[EmployeeID] END,
     CASE @orderBy WHEN 'EmployeeID DESC' THEN [PRK_Employees].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [PRK_Employees].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [PRK_Employees].[CardNo] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [PRK_Employees].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [PRK_Employees].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'CategoryID' THEN [PRK_Employees].[CategoryID] END,
     CASE @orderBy WHEN 'CategoryID DESC' THEN [PRK_Employees].[CategoryID] END DESC,
     CASE @orderBy WHEN 'PostedAt' THEN [PRK_Employees].[PostedAt] END,
     CASE @orderBy WHEN 'PostedAt DESC' THEN [PRK_Employees].[PostedAt] END DESC,
     CASE @orderBy WHEN 'VehicleType' THEN [PRK_Employees].[VehicleType] END,
     CASE @orderBy WHEN 'VehicleType DESC' THEN [PRK_Employees].[VehicleType] END DESC,
     CASE @orderBy WHEN 'Basic' THEN [PRK_Employees].[Basic] END,
     CASE @orderBy WHEN 'Basic DESC' THEN [PRK_Employees].[Basic] END DESC,
     CASE @orderBy WHEN 'ESI' THEN [PRK_Employees].[ESI] END,
     CASE @orderBy WHEN 'ESI DESC' THEN [PRK_Employees].[ESI] END DESC,
     CASE @orderBy WHEN 'DOJ' THEN [PRK_Employees].[DOJ] END,
     CASE @orderBy WHEN 'DOJ DESC' THEN [PRK_Employees].[DOJ] END DESC,
     CASE @orderBy WHEN 'DOR' THEN [PRK_Employees].[DOR] END,
     CASE @orderBy WHEN 'DOR DESC' THEN [PRK_Employees].[DOR] END DESC,
     CASE @orderBy WHEN 'Department' THEN [PRK_Employees].[Department] END,
     CASE @orderBy WHEN 'Department DESC' THEN [PRK_Employees].[Department] END DESC,
     CASE @orderBy WHEN 'Company' THEN [PRK_Employees].[Company] END,
     CASE @orderBy WHEN 'Company DESC' THEN [PRK_Employees].[Company] END DESC,
     CASE @orderBy WHEN 'MaintenanceAllowed' THEN [PRK_Employees].[MaintenanceAllowed] END,
     CASE @orderBy WHEN 'MaintenanceAllowed DESC' THEN [PRK_Employees].[MaintenanceAllowed] END DESC,
     CASE @orderBy WHEN 'PRK_Categories1_CategoryID' THEN [PRK_Categories1].[CategoryID] END,
     CASE @orderBy WHEN 'PRK_Categories1_CategoryID DESC' THEN [PRK_Categories1].[CategoryID] END DESC,
     CASE @orderBy WHEN 'PRK_Categories1_CategoryCode' THEN [PRK_Categories1].[CategoryCode] END,
     CASE @orderBy WHEN 'PRK_Categories1_CategoryCode DESC' THEN [PRK_Categories1].[CategoryCode] END DESC,
     CASE @orderBy WHEN 'PRK_Categories1_Description' THEN [PRK_Categories1].[Description] END,
     CASE @orderBy WHEN 'PRK_Categories1_Description DESC' THEN [PRK_Categories1].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_Categories1_Active' THEN [PRK_Categories1].[Active] END,
     CASE @orderBy WHEN 'PRK_Categories1_Active DESC' THEN [PRK_Categories1].[Active] END DESC,
     CASE @orderBy WHEN 'PRK_Categories1_STDCategory' THEN [PRK_Categories1].[STDCategory] END,
     CASE @orderBy WHEN 'PRK_Categories1_STDCategory DESC' THEN [PRK_Categories1].[STDCategory] END DESC,
     CASE @orderBy WHEN 'PRK_Categories1_cmba' THEN [PRK_Categories1].[cmba] END,
     CASE @orderBy WHEN 'PRK_Categories1_cmba DESC' THEN [PRK_Categories1].[cmba] END DESC 
  SET @RecordCount = @@RowCount
GO
