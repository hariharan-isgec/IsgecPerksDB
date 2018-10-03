USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkEmployeesMonthlyBasicSelectListFilteres]
  @Filter_EmployeeID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @FinYear Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RecordID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (RecordID) ' + 
               'SELECT [PRK_EmployeesMonthlyBasic].[RecordID] FROM [PRK_EmployeesMonthlyBasic] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Employees] AS [PRK_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_EmployeesMonthlyBasic].[EmployeeID] = [PRK_Employees1].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Categories] AS [PRK_Categories2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_EmployeesMonthlyBasic].[CategoryID] = [PRK_Categories2].[CategoryID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_EmployeeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_EmployeesMonthlyBasic].[EmployeeID] = ' + STR(@Filter_EmployeeID)
  SET @LGSQL = @LGSQL + ' AND [PRK_EmployeesMonthlyBasic].[FinYear] = ' + STR(@FinYear)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RecordID' THEN '[PRK_EmployeesMonthlyBasic].[RecordID]'
                        WHEN 'RecordID DESC' THEN '[PRK_EmployeesMonthlyBasic].[RecordID] DESC'
                        WHEN 'EmployeeID' THEN '[PRK_EmployeesMonthlyBasic].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[PRK_EmployeesMonthlyBasic].[EmployeeID] DESC'
                        WHEN 'SalMonth' THEN '[PRK_EmployeesMonthlyBasic].[SalMonth]'
                        WHEN 'SalMonth DESC' THEN '[PRK_EmployeesMonthlyBasic].[SalMonth] DESC'
                        WHEN 'SalYear' THEN '[PRK_EmployeesMonthlyBasic].[SalYear]'
                        WHEN 'SalYear DESC' THEN '[PRK_EmployeesMonthlyBasic].[SalYear] DESC'
                        WHEN 'NetBasic' THEN '[PRK_EmployeesMonthlyBasic].[NetBasic]'
                        WHEN 'NetBasic DESC' THEN '[PRK_EmployeesMonthlyBasic].[NetBasic] DESC'
                        WHEN 'FinYear' THEN '[PRK_EmployeesMonthlyBasic].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PRK_EmployeesMonthlyBasic].[FinYear] DESC'
                        WHEN 'CategoryID' THEN '[PRK_EmployeesMonthlyBasic].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[PRK_EmployeesMonthlyBasic].[CategoryID] DESC'
                        WHEN 'PostedAt' THEN '[PRK_EmployeesMonthlyBasic].[PostedAt]'
                        WHEN 'PostedAt DESC' THEN '[PRK_EmployeesMonthlyBasic].[PostedAt] DESC'
                        WHEN 'VehicleType' THEN '[PRK_EmployeesMonthlyBasic].[VehicleType]'
                        WHEN 'VehicleType DESC' THEN '[PRK_EmployeesMonthlyBasic].[VehicleType] DESC'
                        WHEN 'ESI' THEN '[PRK_EmployeesMonthlyBasic].[ESI]'
                        WHEN 'ESI DESC' THEN '[PRK_EmployeesMonthlyBasic].[ESI] DESC'
                        WHEN 'ESIAmount' THEN '[PRK_EmployeesMonthlyBasic].[ESIAmount]'
                        WHEN 'ESIAmount DESC' THEN '[PRK_EmployeesMonthlyBasic].[ESIAmount] DESC'
                        WHEN 'MaintenanceAllowed' THEN '[PRK_EmployeesMonthlyBasic].[MaintenanceAllowed]'
                        WHEN 'MaintenanceAllowed DESC' THEN '[PRK_EmployeesMonthlyBasic].[MaintenanceAllowed] DESC'
                        WHEN 'PRK_Employees1_EmployeeID' THEN '[PRK_Employees1].[EmployeeID]'
                        WHEN 'PRK_Employees1_EmployeeID DESC' THEN '[PRK_Employees1].[EmployeeID] DESC'
                        WHEN 'PRK_Employees1_CardNo' THEN '[PRK_Employees1].[CardNo]'
                        WHEN 'PRK_Employees1_CardNo DESC' THEN '[PRK_Employees1].[CardNo] DESC'
                        WHEN 'PRK_Employees1_EmployeeName' THEN '[PRK_Employees1].[EmployeeName]'
                        WHEN 'PRK_Employees1_EmployeeName DESC' THEN '[PRK_Employees1].[EmployeeName] DESC'
                        WHEN 'PRK_Employees1_CategoryID' THEN '[PRK_Employees1].[CategoryID]'
                        WHEN 'PRK_Employees1_CategoryID DESC' THEN '[PRK_Employees1].[CategoryID] DESC'
                        WHEN 'PRK_Employees1_PostedAt' THEN '[PRK_Employees1].[PostedAt]'
                        WHEN 'PRK_Employees1_PostedAt DESC' THEN '[PRK_Employees1].[PostedAt] DESC'
                        WHEN 'PRK_Employees1_VehicleType' THEN '[PRK_Employees1].[VehicleType]'
                        WHEN 'PRK_Employees1_VehicleType DESC' THEN '[PRK_Employees1].[VehicleType] DESC'
                        WHEN 'PRK_Employees1_Basic' THEN '[PRK_Employees1].[Basic]'
                        WHEN 'PRK_Employees1_Basic DESC' THEN '[PRK_Employees1].[Basic] DESC'
                        WHEN 'PRK_Employees1_ESI' THEN '[PRK_Employees1].[ESI]'
                        WHEN 'PRK_Employees1_ESI DESC' THEN '[PRK_Employees1].[ESI] DESC'
                        WHEN 'PRK_Employees1_DOJ' THEN '[PRK_Employees1].[DOJ]'
                        WHEN 'PRK_Employees1_DOJ DESC' THEN '[PRK_Employees1].[DOJ] DESC'
                        WHEN 'PRK_Employees1_DOR' THEN '[PRK_Employees1].[DOR]'
                        WHEN 'PRK_Employees1_DOR DESC' THEN '[PRK_Employees1].[DOR] DESC'
                        WHEN 'PRK_Employees1_Department' THEN '[PRK_Employees1].[Department]'
                        WHEN 'PRK_Employees1_Department DESC' THEN '[PRK_Employees1].[Department] DESC'
                        WHEN 'PRK_Employees1_Company' THEN '[PRK_Employees1].[Company]'
                        WHEN 'PRK_Employees1_Company DESC' THEN '[PRK_Employees1].[Company] DESC'
                        WHEN 'PRK_Employees1_MaintenanceAllowed' THEN '[PRK_Employees1].[MaintenanceAllowed]'
                        WHEN 'PRK_Employees1_MaintenanceAllowed DESC' THEN '[PRK_Employees1].[MaintenanceAllowed] DESC'
                        WHEN 'PRK_Categories2_CategoryID' THEN '[PRK_Categories2].[CategoryID]'
                        WHEN 'PRK_Categories2_CategoryID DESC' THEN '[PRK_Categories2].[CategoryID] DESC'
                        WHEN 'PRK_Categories2_CategoryCode' THEN '[PRK_Categories2].[CategoryCode]'
                        WHEN 'PRK_Categories2_CategoryCode DESC' THEN '[PRK_Categories2].[CategoryCode] DESC'
                        WHEN 'PRK_Categories2_Description' THEN '[PRK_Categories2].[Description]'
                        WHEN 'PRK_Categories2_Description DESC' THEN '[PRK_Categories2].[Description] DESC'
                        WHEN 'PRK_Categories2_Active' THEN '[PRK_Categories2].[Active]'
                        WHEN 'PRK_Categories2_Active DESC' THEN '[PRK_Categories2].[Active] DESC'
                        WHEN 'PRK_Categories2_STDCategory' THEN '[PRK_Categories2].[STDCategory]'
                        WHEN 'PRK_Categories2_STDCategory DESC' THEN '[PRK_Categories2].[STDCategory] DESC'
                        WHEN 'PRK_Categories2_cmba' THEN '[PRK_Categories2].[cmba]'
                        WHEN 'PRK_Categories2_cmba DESC' THEN '[PRK_Categories2].[cmba] DESC'
                        ELSE '[PRK_EmployeesMonthlyBasic].[RecordID]'
                    END
  EXEC (@LGSQL)

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
