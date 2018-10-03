USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEntitlementsSelectListFilteres]
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
 ,EntitlementID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'EntitlementID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PRK_Entitlements].[EntitlementID]'
  SET @LGSQL = @LGSQL + ' FROM [PRK_Entitlements] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Categories] AS [PRK_Categories1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Entitlements].[CategoryID] = [PRK_Categories1].[CategoryID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Employees] AS [PRK_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Entitlements].[EmployeeID] = [PRK_Employees2].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_FinYears] AS [PRK_FinYears3]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Entitlements].[FinYear] = [PRK_FinYears3].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Perks] AS [PRK_Perks4]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Entitlements].[PerkID] = [PRK_Perks4].[PerkID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'EntitlementID' THEN '[PRK_Entitlements].[EntitlementID]'
                        WHEN 'EntitlementID DESC' THEN '[PRK_Entitlements].[EntitlementID] DESC'
                        WHEN 'EmployeeID' THEN '[PRK_Entitlements].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[PRK_Entitlements].[EmployeeID] DESC'
                        WHEN 'PerkID' THEN '[PRK_Entitlements].[PerkID]'
                        WHEN 'PerkID DESC' THEN '[PRK_Entitlements].[PerkID] DESC'
                        WHEN 'EffectiveDate' THEN '[PRK_Entitlements].[EffectiveDate]'
                        WHEN 'EffectiveDate DESC' THEN '[PRK_Entitlements].[EffectiveDate] DESC'
                        WHEN 'FinYear' THEN '[PRK_Entitlements].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PRK_Entitlements].[FinYear] DESC'
                        WHEN 'Value' THEN '[PRK_Entitlements].[Value]'
                        WHEN 'Value DESC' THEN '[PRK_Entitlements].[Value] DESC'
                        WHEN 'UOM' THEN '[PRK_Entitlements].[UOM]'
                        WHEN 'UOM DESC' THEN '[PRK_Entitlements].[UOM] DESC'
                        WHEN 'CategoryID' THEN '[PRK_Entitlements].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[PRK_Entitlements].[CategoryID] DESC'
                        WHEN 'PostedAt' THEN '[PRK_Entitlements].[PostedAt]'
                        WHEN 'PostedAt DESC' THEN '[PRK_Entitlements].[PostedAt] DESC'
                        WHEN 'VehicleType' THEN '[PRK_Entitlements].[VehicleType]'
                        WHEN 'VehicleType DESC' THEN '[PRK_Entitlements].[VehicleType] DESC'
                        WHEN 'Basic' THEN '[PRK_Entitlements].[Basic]'
                        WHEN 'Basic DESC' THEN '[PRK_Entitlements].[Basic] DESC'
                        WHEN 'ESI' THEN '[PRK_Entitlements].[ESI]'
                        WHEN 'ESI DESC' THEN '[PRK_Entitlements].[ESI] DESC'
                        WHEN 'PRK_Categories1_Description' THEN '[PRK_Categories1].[Description]'
                        WHEN 'PRK_Categories1_Description DESC' THEN '[PRK_Categories1].[Description] DESC'
                        WHEN 'PRK_Employees2_EmployeeName' THEN '[PRK_Employees2].[EmployeeName]'
                        WHEN 'PRK_Employees2_EmployeeName DESC' THEN '[PRK_Employees2].[EmployeeName] DESC'
                        WHEN 'PRK_FinYears3_Description' THEN '[PRK_FinYears3].[Description]'
                        WHEN 'PRK_FinYears3_Description DESC' THEN '[PRK_FinYears3].[Description] DESC'
                        WHEN 'PRK_Perks4_Description' THEN '[PRK_Perks4].[Description]'
                        WHEN 'PRK_Perks4_Description DESC' THEN '[PRK_Perks4].[Description] DESC'
                        ELSE '[PRK_Entitlements].[EntitlementID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PRK_Entitlements].* ,
    [PRK_Categories1].[Description] AS PRK_Categories1_Description,
    [PRK_Employees2].[EmployeeName] AS PRK_Employees2_EmployeeName,
    [PRK_FinYears3].[Description] AS PRK_FinYears3_Description,
    [PRK_Perks4].[Description] AS PRK_Perks4_Description 
  FROM [PRK_Entitlements] 
      INNER JOIN #PageIndex
          ON [PRK_Entitlements].[EntitlementID] = #PageIndex.EntitlementID
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Entitlements].[CategoryID] = [PRK_Categories1].[CategoryID]
  INNER JOIN [PRK_Employees] AS [PRK_Employees2]
    ON [PRK_Entitlements].[EmployeeID] = [PRK_Employees2].[EmployeeID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears3]
    ON [PRK_Entitlements].[FinYear] = [PRK_FinYears3].[FinYear]
  INNER JOIN [PRK_Perks] AS [PRK_Perks4]
    ON [PRK_Entitlements].[PerkID] = [PRK_Perks4].[PerkID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
