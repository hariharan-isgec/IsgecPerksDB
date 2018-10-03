USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEmployeesSelectListFilteres]
  @Filter_EmployeeID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,EmployeeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'EmployeeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PRK_Employees].[EmployeeID]'
  SET @LGSQL = @LGSQL + ' FROM [PRK_Employees] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Categories] AS [PRK_Categories1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Employees].[CategoryID] = [PRK_Categories1].[CategoryID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_MobileBillPlans] AS [PRK_MobileBillPlans2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Employees].[MobileBillPlanID] = [PRK_MobileBillPlans2].[MobileBillPlanID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_EmployeeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Employees].[EmployeeID] = ' + STR(@Filter_EmployeeID)
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
                        WHEN 'Basic' THEN '[PRK_Employees].[Basic]'
                        WHEN 'Basic DESC' THEN '[PRK_Employees].[Basic] DESC'
                        WHEN 'DOJ' THEN '[PRK_Employees].[DOJ]'
                        WHEN 'DOJ DESC' THEN '[PRK_Employees].[DOJ] DESC'
                        WHEN 'DOR' THEN '[PRK_Employees].[DOR]'
                        WHEN 'DOR DESC' THEN '[PRK_Employees].[DOR] DESC'
                        WHEN 'PostedAt' THEN '[PRK_Employees].[PostedAt]'
                        WHEN 'PostedAt DESC' THEN '[PRK_Employees].[PostedAt] DESC'
                        WHEN 'VehicleType' THEN '[PRK_Employees].[VehicleType]'
                        WHEN 'VehicleType DESC' THEN '[PRK_Employees].[VehicleType] DESC'
                        WHEN 'MaintenanceAllowed' THEN '[PRK_Employees].[MaintenanceAllowed]'
                        WHEN 'MaintenanceAllowed DESC' THEN '[PRK_Employees].[MaintenanceAllowed] DESC'
                        WHEN 'TWInSalary' THEN '[PRK_Employees].[TWInSalary]'
                        WHEN 'TWInSalary DESC' THEN '[PRK_Employees].[TWInSalary] DESC'
                        WHEN 'ESI' THEN '[PRK_Employees].[ESI]'
                        WHEN 'ESI DESC' THEN '[PRK_Employees].[ESI] DESC'
                        WHEN 'Department' THEN '[PRK_Employees].[Department]'
                        WHEN 'Department DESC' THEN '[PRK_Employees].[Department] DESC'
                        WHEN 'Company' THEN '[PRK_Employees].[Company]'
                        WHEN 'Company DESC' THEN '[PRK_Employees].[Company] DESC'
                        WHEN 'MobileLimit' THEN '[PRK_Employees].[MobileLimit]'
                        WHEN 'MobileLimit DESC' THEN '[PRK_Employees].[MobileLimit] DESC'
                        WHEN 'MobileWithInternet' THEN '[PRK_Employees].[MobileWithInternet]'
                        WHEN 'MobileWithInternet DESC' THEN '[PRK_Employees].[MobileWithInternet] DESC'
                        WHEN 'MobileBillPlanID' THEN '[PRK_Employees].[MobileBillPlanID]'
                        WHEN 'MobileBillPlanID DESC' THEN '[PRK_Employees].[MobileBillPlanID] DESC'
                        WHEN 'LandlineLimit' THEN '[PRK_Employees].[LandlineLimit]'
                        WHEN 'LandlineLimit DESC' THEN '[PRK_Employees].[LandlineLimit] DESC'
                        WHEN 'PRK_Categories1_Description' THEN '[PRK_Categories1].[Description]'
                        WHEN 'PRK_Categories1_Description DESC' THEN '[PRK_Categories1].[Description] DESC'
                        WHEN 'PRK_MobileBillPlans2_Description' THEN '[PRK_MobileBillPlans2].[Description]'
                        WHEN 'PRK_MobileBillPlans2_Description DESC' THEN '[PRK_MobileBillPlans2].[Description] DESC'
                        ELSE '[PRK_Employees].[EmployeeID]'
                    END
  EXEC (@LGSQL)

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
