USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEntitlementsSelectListSearch]
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
 ,EntitlementID Int NOT NULL
  )
  INSERT INTO #PageIndex (EntitlementID)
  SELECT [PRK_Entitlements].[EntitlementID] FROM [PRK_Entitlements]
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Entitlements].[CategoryID] = [PRK_Categories1].[CategoryID]
  INNER JOIN [PRK_Employees] AS [PRK_Employees2]
    ON [PRK_Entitlements].[EmployeeID] = [PRK_Employees2].[EmployeeID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears3]
    ON [PRK_Entitlements].[FinYear] = [PRK_FinYears3].[FinYear]
  INNER JOIN [PRK_Perks] AS [PRK_Perks4]
    ON [PRK_Entitlements].[PerkID] = [PRK_Perks4].[PerkID]
 WHERE  
   ( 
         STR(ISNULL([PRK_Entitlements].[EntitlementID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[EmployeeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[PerkID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[FinYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[Value], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Entitlements].[UOM],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Entitlements].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Entitlements].[VehicleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Entitlements].[Basic], 0)) LIKE @KeyWord1
   ) 
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
