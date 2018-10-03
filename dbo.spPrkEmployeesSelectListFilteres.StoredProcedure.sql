USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkEmployeesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  EmployeeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (EmployeeID) ' + 
               'SELECT [PRK_Employees].[EmployeeID] FROM [PRK_Employees] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Categories] AS [PRK_Categories1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Employees].[CategoryID] = [PRK_Categories1].[CategoryID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'EmployeeID' THEN '[PRK_Employees].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[PRK_Employees].[EmployeeID] DESC'
                        WHEN 'CardNo' THEN '[PRK_Employees].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[PRK_Employees].[CardNo] DESC'
                        WHEN 'EmployeeName' THEN '[PRK_Employees].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[PRK_Employees].[EmployeeName] DESC'
                        WHEN 'CategoryID' THEN '[PRK_Employees].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[PRK_Employees].[CategoryID] DESC'
                        WHEN 'PostedAt' THEN '[PRK_Employees].[PostedAt]'
                        WHEN 'PostedAt DESC' THEN '[PRK_Employees].[PostedAt] DESC'
                        WHEN 'VehicleType' THEN '[PRK_Employees].[VehicleType]'
                        WHEN 'VehicleType DESC' THEN '[PRK_Employees].[VehicleType] DESC'
                        WHEN 'Basic' THEN '[PRK_Employees].[Basic]'
                        WHEN 'Basic DESC' THEN '[PRK_Employees].[Basic] DESC'
                        WHEN 'ESI' THEN '[PRK_Employees].[ESI]'
                        WHEN 'ESI DESC' THEN '[PRK_Employees].[ESI] DESC'
                        WHEN 'DOJ' THEN '[PRK_Employees].[DOJ]'
                        WHEN 'DOJ DESC' THEN '[PRK_Employees].[DOJ] DESC'
                        WHEN 'DOR' THEN '[PRK_Employees].[DOR]'
                        WHEN 'DOR DESC' THEN '[PRK_Employees].[DOR] DESC'
                        WHEN 'Department' THEN '[PRK_Employees].[Department]'
                        WHEN 'Department DESC' THEN '[PRK_Employees].[Department] DESC'
                        WHEN 'Company' THEN '[PRK_Employees].[Company]'
                        WHEN 'Company DESC' THEN '[PRK_Employees].[Company] DESC'
                        WHEN 'MaintenanceAllowed' THEN '[PRK_Employees].[MaintenanceAllowed]'
                        WHEN 'MaintenanceAllowed DESC' THEN '[PRK_Employees].[MaintenanceAllowed] DESC'
                        WHEN 'PRK_Categories1_CategoryID' THEN '[PRK_Categories1].[CategoryID]'
                        WHEN 'PRK_Categories1_CategoryID DESC' THEN '[PRK_Categories1].[CategoryID] DESC'
                        WHEN 'PRK_Categories1_CategoryCode' THEN '[PRK_Categories1].[CategoryCode]'
                        WHEN 'PRK_Categories1_CategoryCode DESC' THEN '[PRK_Categories1].[CategoryCode] DESC'
                        WHEN 'PRK_Categories1_Description' THEN '[PRK_Categories1].[Description]'
                        WHEN 'PRK_Categories1_Description DESC' THEN '[PRK_Categories1].[Description] DESC'
                        WHEN 'PRK_Categories1_Active' THEN '[PRK_Categories1].[Active]'
                        WHEN 'PRK_Categories1_Active DESC' THEN '[PRK_Categories1].[Active] DESC'
                        WHEN 'PRK_Categories1_STDCategory' THEN '[PRK_Categories1].[STDCategory]'
                        WHEN 'PRK_Categories1_STDCategory DESC' THEN '[PRK_Categories1].[STDCategory] DESC'
                        WHEN 'PRK_Categories1_cmba' THEN '[PRK_Categories1].[cmba]'
                        WHEN 'PRK_Categories1_cmba DESC' THEN '[PRK_Categories1].[cmba] DESC'
                        ELSE '[PRK_Employees].[EmployeeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [PRK_Employees].[EmployeeID] = #PageIndex.EmployeeID
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Employees].[CategoryID] = [PRK_Categories1].[CategoryID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
