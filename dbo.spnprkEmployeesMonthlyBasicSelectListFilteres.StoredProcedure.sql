USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEmployeesMonthlyBasicSelectListFilteres]
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
 ,RecordID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RecordID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PRK_EmployeesMonthlyBasic].[RecordID]'
  SET @LGSQL = @LGSQL + ' FROM [PRK_EmployeesMonthlyBasic] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Employees] AS [PRK_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_EmployeesMonthlyBasic].[EmployeeID] = [PRK_Employees1].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_MobileBillPlans] AS [PRK_MobileBillPlans2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_EmployeesMonthlyBasic].[MobileBillPlanID] = [PRK_MobileBillPlans2].[MobileBillPlanID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_EmployeeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_EmployeesMonthlyBasic].[EmployeeID] = ' + STR(@Filter_EmployeeID)
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
                        WHEN 'TWInSalary' THEN '[PRK_EmployeesMonthlyBasic].[TWInSalary]'
                        WHEN 'TWInSalary DESC' THEN '[PRK_EmployeesMonthlyBasic].[TWInSalary] DESC'
                        WHEN 'MobileLimit' THEN '[PRK_EmployeesMonthlyBasic].[MobileLimit]'
                        WHEN 'MobileLimit DESC' THEN '[PRK_EmployeesMonthlyBasic].[MobileLimit] DESC'
                        WHEN 'MobileWithInternet' THEN '[PRK_EmployeesMonthlyBasic].[MobileWithInternet]'
                        WHEN 'MobileWithInternet DESC' THEN '[PRK_EmployeesMonthlyBasic].[MobileWithInternet] DESC'
                        WHEN 'MobileBillPlanID' THEN '[PRK_EmployeesMonthlyBasic].[MobileBillPlanID]'
                        WHEN 'MobileBillPlanID DESC' THEN '[PRK_EmployeesMonthlyBasic].[MobileBillPlanID] DESC'
                        WHEN 'LandlineLimit' THEN '[PRK_EmployeesMonthlyBasic].[LandlineLimit]'
                        WHEN 'LandlineLimit DESC' THEN '[PRK_EmployeesMonthlyBasic].[LandlineLimit] DESC'
                        WHEN 'PRK_Employees1_EmployeeName' THEN '[PRK_Employees1].[EmployeeName]'
                        WHEN 'PRK_Employees1_EmployeeName DESC' THEN '[PRK_Employees1].[EmployeeName] DESC'
                        WHEN 'PRK_MobileBillPlans2_Description' THEN '[PRK_MobileBillPlans2].[Description]'
                        WHEN 'PRK_MobileBillPlans2_Description DESC' THEN '[PRK_MobileBillPlans2].[Description] DESC'
                        ELSE '[PRK_EmployeesMonthlyBasic].[RecordID]'
                    END
  EXEC (@LGSQL)

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
