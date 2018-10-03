USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEntitlementsSelectByEmployeeID]
  @EmployeeID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PRK_Entitlements].* ,
    [PRK_Categories1].[Description] AS PRK_Categories1_Description,
    [PRK_Employees2].[EmployeeName] AS PRK_Employees2_EmployeeName,
    [PRK_FinYears3].[Description] AS PRK_FinYears3_Description,
    [PRK_Perks4].[Description] AS PRK_Perks4_Description 
  FROM [PRK_Entitlements] 
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Entitlements].[CategoryID] = [PRK_Categories1].[CategoryID]
  INNER JOIN [PRK_Employees] AS [PRK_Employees2]
    ON [PRK_Entitlements].[EmployeeID] = [PRK_Employees2].[EmployeeID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears3]
    ON [PRK_Entitlements].[FinYear] = [PRK_FinYears3].[FinYear]
  INNER JOIN [PRK_Perks] AS [PRK_Perks4]
    ON [PRK_Entitlements].[PerkID] = [PRK_Perks4].[PerkID]
  WHERE
  [PRK_Entitlements].[EmployeeID] = @EmployeeID
  ORDER BY
     CASE @OrderBy WHEN 'EntitlementID' THEN [PRK_Entitlements].[EntitlementID] END,
     CASE @OrderBy WHEN 'EntitlementID DESC' THEN [PRK_Entitlements].[EntitlementID] END DESC,
     CASE @OrderBy WHEN 'EmployeeID' THEN [PRK_Entitlements].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [PRK_Entitlements].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'PerkID' THEN [PRK_Entitlements].[PerkID] END,
     CASE @OrderBy WHEN 'PerkID DESC' THEN [PRK_Entitlements].[PerkID] END DESC,
     CASE @OrderBy WHEN 'EffectiveDate' THEN [PRK_Entitlements].[EffectiveDate] END,
     CASE @OrderBy WHEN 'EffectiveDate DESC' THEN [PRK_Entitlements].[EffectiveDate] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [PRK_Entitlements].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PRK_Entitlements].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Value' THEN [PRK_Entitlements].[Value] END,
     CASE @OrderBy WHEN 'Value DESC' THEN [PRK_Entitlements].[Value] END DESC,
     CASE @OrderBy WHEN 'UOM' THEN [PRK_Entitlements].[UOM] END,
     CASE @OrderBy WHEN 'UOM DESC' THEN [PRK_Entitlements].[UOM] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [PRK_Entitlements].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [PRK_Entitlements].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'PostedAt' THEN [PRK_Entitlements].[PostedAt] END,
     CASE @OrderBy WHEN 'PostedAt DESC' THEN [PRK_Entitlements].[PostedAt] END DESC,
     CASE @OrderBy WHEN 'VehicleType' THEN [PRK_Entitlements].[VehicleType] END,
     CASE @OrderBy WHEN 'VehicleType DESC' THEN [PRK_Entitlements].[VehicleType] END DESC,
     CASE @OrderBy WHEN 'Basic' THEN [PRK_Entitlements].[Basic] END,
     CASE @OrderBy WHEN 'Basic DESC' THEN [PRK_Entitlements].[Basic] END DESC,
     CASE @OrderBy WHEN 'ESI' THEN [PRK_Entitlements].[ESI] END,
     CASE @OrderBy WHEN 'ESI DESC' THEN [PRK_Entitlements].[ESI] END DESC,
     CASE @OrderBy WHEN 'PRK_Categories1_Description' THEN [PRK_Categories1].[Description] END,
     CASE @OrderBy WHEN 'PRK_Categories1_Description DESC' THEN [PRK_Categories1].[Description] END DESC,
     CASE @OrderBy WHEN 'PRK_Employees2_EmployeeName' THEN [PRK_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'PRK_Employees2_EmployeeName DESC' THEN [PRK_Employees2].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PRK_FinYears3_Description' THEN [PRK_FinYears3].[Description] END,
     CASE @OrderBy WHEN 'PRK_FinYears3_Description DESC' THEN [PRK_FinYears3].[Description] END DESC,
     CASE @OrderBy WHEN 'PRK_Perks4_Description' THEN [PRK_Perks4].[Description] END,
     CASE @OrderBy WHEN 'PRK_Perks4_Description DESC' THEN [PRK_Perks4].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
