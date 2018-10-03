USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkEntitlementsSelectListPagedByFilteresAsOn]
  @Filter_EmployeeID Int,
  @Filter_PerkID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @EffectiveDate DateTime,
  @FinYear Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  EntitlementID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (EntitlementID) ' + 
               'SELECT [PRK_Entitlements].[EntitlementID] FROM [PRK_Entitlements] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Employees] AS [PRK_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Entitlements].[EmployeeID] = [PRK_Employees1].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Perks] AS [PRK_Perks2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Entitlements].[PerkID] = [PRK_Perks2].[PerkID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Categories] AS [PRK_Categories3]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Entitlements].[CategoryID] = [PRK_Categories3].[CategoryID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Entitlements].[FinYear] = [PRK_FinYears4].[FinYear]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_EmployeeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Entitlements].[EmployeeID] = ' + STR(@Filter_EmployeeID)
  IF (@Filter_PerkID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Entitlements].[PerkID] = ' + STR(@Filter_PerkID)
  SET @LGSQL = @LGSQL + ' AND DATEDIFF(mm,CONVERT(DATETIME,''' + CONVERT(NVARCHAR(20),@EffectiveDate) + ''',102), [PRK_Entitlements].[EffectiveDate]) <=0'
  SET @LGSQL = @LGSQL + ' AND [PRK_Entitlements].[FinYear] = ' + STR(@FinYear)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'EntitlementID' THEN '[PRK_Entitlements].[EntitlementID]'
                        WHEN 'EntitlementID DESC' THEN '[PRK_Entitlements].[EntitlementID] DESC'
                        WHEN 'EmployeeID' THEN '[PRK_Entitlements].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[PRK_Entitlements].[EmployeeID] DESC'
                        WHEN 'PerkID' THEN '[PRK_Entitlements].[PerkID]'
                        WHEN 'PerkID DESC' THEN '[PRK_Entitlements].[PerkID] DESC'
                        WHEN 'CategoryID' THEN '[PRK_Entitlements].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[PRK_Entitlements].[CategoryID] DESC'
                        WHEN 'EffectiveDate' THEN '[PRK_Entitlements].[EffectiveDate]'
                        WHEN 'EffectiveDate DESC' THEN '[PRK_Entitlements].[EffectiveDate] DESC'
                        WHEN 'PostedAt' THEN '[PRK_Entitlements].[PostedAt]'
                        WHEN 'PostedAt DESC' THEN '[PRK_Entitlements].[PostedAt] DESC'
                        WHEN 'Value' THEN '[PRK_Entitlements].[Value]'
                        WHEN 'Value DESC' THEN '[PRK_Entitlements].[Value] DESC'
                        WHEN 'VehicleType' THEN '[PRK_Entitlements].[VehicleType]'
                        WHEN 'VehicleType DESC' THEN '[PRK_Entitlements].[VehicleType] DESC'
                        WHEN 'Basic' THEN '[PRK_Entitlements].[Basic]'
                        WHEN 'Basic DESC' THEN '[PRK_Entitlements].[Basic] DESC'
                        WHEN 'UOM' THEN '[PRK_Entitlements].[UOM]'
                        WHEN 'UOM DESC' THEN '[PRK_Entitlements].[UOM] DESC'
                        WHEN 'ESI' THEN '[PRK_Entitlements].[ESI]'
                        WHEN 'ESI DESC' THEN '[PRK_Entitlements].[ESI] DESC'
                        WHEN 'FinYear' THEN '[PRK_Entitlements].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PRK_Entitlements].[FinYear] DESC'
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
                        WHEN 'PRK_Perks2_PerkID' THEN '[PRK_Perks2].[PerkID]'
                        WHEN 'PRK_Perks2_PerkID DESC' THEN '[PRK_Perks2].[PerkID] DESC'
                        WHEN 'PRK_Perks2_PerkCode' THEN '[PRK_Perks2].[PerkCode]'
                        WHEN 'PRK_Perks2_PerkCode DESC' THEN '[PRK_Perks2].[PerkCode] DESC'
                        WHEN 'PRK_Perks2_Description' THEN '[PRK_Perks2].[Description]'
                        WHEN 'PRK_Perks2_Description DESC' THEN '[PRK_Perks2].[Description] DESC'
                        WHEN 'PRK_Perks2_AdvanceApplicable' THEN '[PRK_Perks2].[AdvanceApplicable]'
                        WHEN 'PRK_Perks2_AdvanceApplicable DESC' THEN '[PRK_Perks2].[AdvanceApplicable] DESC'
                        WHEN 'PRK_Perks2_AdvanceMonths' THEN '[PRK_Perks2].[AdvanceMonths]'
                        WHEN 'PRK_Perks2_AdvanceMonths DESC' THEN '[PRK_Perks2].[AdvanceMonths] DESC'
                        WHEN 'PRK_Perks2_LockedMonths' THEN '[PRK_Perks2].[LockedMonths]'
                        WHEN 'PRK_Perks2_LockedMonths DESC' THEN '[PRK_Perks2].[LockedMonths] DESC'
                        WHEN 'PRK_Perks2_NoOfPayments' THEN '[PRK_Perks2].[NoOfPayments]'
                        WHEN 'PRK_Perks2_NoOfPayments DESC' THEN '[PRK_Perks2].[NoOfPayments] DESC'
                        WHEN 'PRK_Perks2_CarryForward' THEN '[PRK_Perks2].[CarryForward]'
                        WHEN 'PRK_Perks2_CarryForward DESC' THEN '[PRK_Perks2].[CarryForward] DESC'
                        WHEN 'PRK_Perks2_UOM' THEN '[PRK_Perks2].[UOM]'
                        WHEN 'PRK_Perks2_UOM DESC' THEN '[PRK_Perks2].[UOM] DESC'
                        WHEN 'PRK_Perks2_Active' THEN '[PRK_Perks2].[Active]'
                        WHEN 'PRK_Perks2_Active DESC' THEN '[PRK_Perks2].[Active] DESC'
                        WHEN 'PRK_Perks2_BaaNGL' THEN '[PRK_Perks2].[BaaNGL]'
                        WHEN 'PRK_Perks2_BaaNGL DESC' THEN '[PRK_Perks2].[BaaNGL] DESC'
                        WHEN 'PRK_Perks2_BaaNReference' THEN '[PRK_Perks2].[BaaNReference]'
                        WHEN 'PRK_Perks2_BaaNReference DESC' THEN '[PRK_Perks2].[BaaNReference] DESC'
                        WHEN 'PRK_Perks2_cmba' THEN '[PRK_Perks2].[cmba]'
                        WHEN 'PRK_Perks2_cmba DESC' THEN '[PRK_Perks2].[cmba] DESC'
                        WHEN 'PRK_Categories3_CategoryID' THEN '[PRK_Categories3].[CategoryID]'
                        WHEN 'PRK_Categories3_CategoryID DESC' THEN '[PRK_Categories3].[CategoryID] DESC'
                        WHEN 'PRK_Categories3_CategoryCode' THEN '[PRK_Categories3].[CategoryCode]'
                        WHEN 'PRK_Categories3_CategoryCode DESC' THEN '[PRK_Categories3].[CategoryCode] DESC'
                        WHEN 'PRK_Categories3_Description' THEN '[PRK_Categories3].[Description]'
                        WHEN 'PRK_Categories3_Description DESC' THEN '[PRK_Categories3].[Description] DESC'
                        WHEN 'PRK_Categories3_Active' THEN '[PRK_Categories3].[Active]'
                        WHEN 'PRK_Categories3_Active DESC' THEN '[PRK_Categories3].[Active] DESC'
                        WHEN 'PRK_Categories3_STDCategory' THEN '[PRK_Categories3].[STDCategory]'
                        WHEN 'PRK_Categories3_STDCategory DESC' THEN '[PRK_Categories3].[STDCategory] DESC'
                        WHEN 'PRK_Categories3_cmba' THEN '[PRK_Categories3].[cmba]'
                        WHEN 'PRK_Categories3_cmba DESC' THEN '[PRK_Categories3].[cmba] DESC'
                        WHEN 'PRK_FinYears4_FinYear' THEN '[PRK_FinYears4].[FinYear]'
                        WHEN 'PRK_FinYears4_FinYear DESC' THEN '[PRK_FinYears4].[FinYear] DESC'
                        WHEN 'PRK_FinYears4_Description' THEN '[PRK_FinYears4].[Description]'
                        WHEN 'PRK_FinYears4_Description DESC' THEN '[PRK_FinYears4].[Description] DESC'
                        WHEN 'PRK_FinYears4_StartDate' THEN '[PRK_FinYears4].[StartDate]'
                        WHEN 'PRK_FinYears4_StartDate DESC' THEN '[PRK_FinYears4].[StartDate] DESC'
                        WHEN 'PRK_FinYears4_EndDate' THEN '[PRK_FinYears4].[EndDate]'
                        WHEN 'PRK_FinYears4_EndDate DESC' THEN '[PRK_FinYears4].[EndDate] DESC'
                        WHEN 'PRK_FinYears4_Status' THEN '[PRK_FinYears4].[Status]'
                        WHEN 'PRK_FinYears4_Status DESC' THEN '[PRK_FinYears4].[Status] DESC'
                        ELSE '[PRK_Entitlements].[EntitlementID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PRK_Entitlements].[EntitlementID],
		[PRK_Entitlements].[EmployeeID],
		[PRK_Entitlements].[PerkID],
		[PRK_Entitlements].[CategoryID],
		[PRK_Entitlements].[EffectiveDate],
		[PRK_Entitlements].[PostedAt],
		[PRK_Entitlements].[Value],
		[PRK_Entitlements].[VehicleType],
		[PRK_Entitlements].[Basic],
		[PRK_Entitlements].[UOM],
		[PRK_Entitlements].[ESI],
		[PRK_Entitlements].[FinYear],
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
		[PRK_Perks2].[PerkID] AS PRK_Perks2_PerkID,
		[PRK_Perks2].[PerkCode] AS PRK_Perks2_PerkCode,
		[PRK_Perks2].[Description] AS PRK_Perks2_Description,
		[PRK_Perks2].[AdvanceApplicable] AS PRK_Perks2_AdvanceApplicable,
		[PRK_Perks2].[AdvanceMonths] AS PRK_Perks2_AdvanceMonths,
		[PRK_Perks2].[LockedMonths] AS PRK_Perks2_LockedMonths,
		[PRK_Perks2].[NoOfPayments] AS PRK_Perks2_NoOfPayments,
		[PRK_Perks2].[CarryForward] AS PRK_Perks2_CarryForward,
		[PRK_Perks2].[UOM] AS PRK_Perks2_UOM,
		[PRK_Perks2].[Active] AS PRK_Perks2_Active,
		[PRK_Perks2].[BaaNGL] AS PRK_Perks2_BaaNGL,
		[PRK_Perks2].[BaaNReference] AS PRK_Perks2_BaaNReference,
		[PRK_Perks2].[cmba] AS PRK_Perks2_cmba,
		[PRK_Categories3].[CategoryID] AS PRK_Categories3_CategoryID,
		[PRK_Categories3].[CategoryCode] AS PRK_Categories3_CategoryCode,
		[PRK_Categories3].[Description] AS PRK_Categories3_Description,
		[PRK_Categories3].[Active] AS PRK_Categories3_Active,
		[PRK_Categories3].[STDCategory] AS PRK_Categories3_STDCategory,
		[PRK_Categories3].[cmba] AS PRK_Categories3_cmba,
		[PRK_FinYears4].[FinYear] AS PRK_FinYears4_FinYear,
		[PRK_FinYears4].[Description] AS PRK_FinYears4_Description,
		[PRK_FinYears4].[StartDate] AS PRK_FinYears4_StartDate,
		[PRK_FinYears4].[EndDate] AS PRK_FinYears4_EndDate,
		[PRK_FinYears4].[Status] AS PRK_FinYears4_Status 
  FROM [PRK_Entitlements] 
    	INNER JOIN #PageIndex
          ON [PRK_Entitlements].[EntitlementID] = #PageIndex.EntitlementID
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Entitlements].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Entitlements].[PerkID] = [PRK_Perks2].[PerkID]
  INNER JOIN [PRK_Categories] AS [PRK_Categories3]
    ON [PRK_Entitlements].[CategoryID] = [PRK_Categories3].[CategoryID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]
    ON [PRK_Entitlements].[FinYear] = [PRK_FinYears4].[FinYear]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
