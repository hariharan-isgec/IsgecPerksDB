USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkAdminApplicationsSelectListPagedByFilteres]
  @Filter_EmployeeID Int,
  @Filter_PerkID Int,
  @Filter_StatusID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @StatusID Int,
  @FinYear Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ApplicationID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (ApplicationID) ' + 
               'SELECT [PRK_Applications].[ApplicationID] FROM [PRK_Applications] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Employees] AS [PRK_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Perks] AS [PRK_Perks2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[PerkID] = [PRK_Perks2].[PerkID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Status] AS [PRK_Status3]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[StatusID] = [PRK_Status3].[StatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[FinYear] = [PRK_FinYears4].[FinYear]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_EmployeeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[EmployeeID] = ' + STR(@Filter_EmployeeID)
  IF (@Filter_PerkID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[PerkID] = ' + STR(@Filter_PerkID)
  IF (@Filter_StatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[StatusID] = ' + STR(@Filter_StatusID)
  SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[StatusID] != ' + STR(@StatusID)
  SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[FinYear] = ' + STR(@FinYear)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ApplicationID' THEN '[PRK_Applications].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[PRK_Applications].[ApplicationID] DESC'
                        WHEN 'EmployeeID' THEN '[PRK_Applications].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[PRK_Applications].[EmployeeID] DESC'
                        WHEN 'PerkID' THEN '[PRK_Applications].[PerkID]'
                        WHEN 'PerkID DESC' THEN '[PRK_Applications].[PerkID] DESC'
                        WHEN 'AppliedOn' THEN '[PRK_Applications].[AppliedOn]'
                        WHEN 'AppliedOn DESC' THEN '[PRK_Applications].[AppliedOn] DESC'
                        WHEN 'Value' THEN '[PRK_Applications].[Value]'
                        WHEN 'Value DESC' THEN '[PRK_Applications].[Value] DESC'
                        WHEN 'UserRemark' THEN '[PRK_Applications].[UserRemark]'
                        WHEN 'UserRemark DESC' THEN '[PRK_Applications].[UserRemark] DESC'
                        WHEN 'VerifiedValue' THEN '[PRK_Applications].[VerifiedValue]'
                        WHEN 'VerifiedValue DESC' THEN '[PRK_Applications].[VerifiedValue] DESC'
                        WHEN 'VerifiedAmt' THEN '[PRK_Applications].[VerifiedAmt]'
                        WHEN 'VerifiedAmt DESC' THEN '[PRK_Applications].[VerifiedAmt] DESC'
                        WHEN 'VerifiedOn' THEN '[PRK_Applications].[VerifiedOn]'
                        WHEN 'VerifiedOn DESC' THEN '[PRK_Applications].[VerifiedOn] DESC'
                        WHEN 'VerifierRemark' THEN '[PRK_Applications].[VerifierRemark]'
                        WHEN 'VerifierRemark DESC' THEN '[PRK_Applications].[VerifierRemark] DESC'
                        WHEN 'ApprovedValue' THEN '[PRK_Applications].[ApprovedValue]'
                        WHEN 'ApprovedValue DESC' THEN '[PRK_Applications].[ApprovedValue] DESC'
                        WHEN 'ApprovedAmt' THEN '[PRK_Applications].[ApprovedAmt]'
                        WHEN 'ApprovedAmt DESC' THEN '[PRK_Applications].[ApprovedAmt] DESC'
                        WHEN 'ApprovedOn' THEN '[PRK_Applications].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[PRK_Applications].[ApprovedOn] DESC'
                        WHEN 'ApproverRemark' THEN '[PRK_Applications].[ApproverRemark]'
                        WHEN 'ApproverRemark DESC' THEN '[PRK_Applications].[ApproverRemark] DESC'
                        WHEN 'PaymentMethod' THEN '[PRK_Applications].[PaymentMethod]'
                        WHEN 'PaymentMethod DESC' THEN '[PRK_Applications].[PaymentMethod] DESC'
                        WHEN 'StatusID' THEN '[PRK_Applications].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[PRK_Applications].[StatusID] DESC'
                        WHEN 'FinYear' THEN '[PRK_Applications].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PRK_Applications].[FinYear] DESC'
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
                        WHEN 'PRK_Status3_StatusID' THEN '[PRK_Status3].[StatusID]'
                        WHEN 'PRK_Status3_StatusID DESC' THEN '[PRK_Status3].[StatusID] DESC'
                        WHEN 'PRK_Status3_Description' THEN '[PRK_Status3].[Description]'
                        WHEN 'PRK_Status3_Description DESC' THEN '[PRK_Status3].[Description] DESC'
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
                        ELSE '[PRK_Applications].[ApplicationID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PRK_Applications].[ApplicationID],
		[PRK_Applications].[EmployeeID],
		[PRK_Applications].[PerkID],
		[PRK_Applications].[AppliedOn],
		[PRK_Applications].[Value],
		[PRK_Applications].[UserRemark],
		[PRK_Applications].[VerifiedValue],
		[PRK_Applications].[VerifiedAmt],
		[PRK_Applications].[VerifiedOn],
		[PRK_Applications].[VerifierRemark],
		[PRK_Applications].[ApprovedValue],
		[PRK_Applications].[ApprovedAmt],
		[PRK_Applications].[ApprovedOn],
		[PRK_Applications].[ApproverRemark],
		[PRK_Applications].[PaymentMethod],
		[PRK_Applications].[StatusID],
		[PRK_Applications].[FinYear],
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
		[PRK_Status3].[StatusID] AS PRK_Status3_StatusID,
		[PRK_Status3].[Description] AS PRK_Status3_Description,
		[PRK_FinYears4].[FinYear] AS PRK_FinYears4_FinYear,
		[PRK_FinYears4].[Description] AS PRK_FinYears4_Description,
		[PRK_FinYears4].[StartDate] AS PRK_FinYears4_StartDate,
		[PRK_FinYears4].[EndDate] AS PRK_FinYears4_EndDate,
		[PRK_FinYears4].[Status] AS PRK_FinYears4_Status 
  FROM [PRK_Applications] 
    	INNER JOIN #PageIndex
          ON [PRK_Applications].[ApplicationID] = #PageIndex.ApplicationID
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Applications].[PerkID] = [PRK_Perks2].[PerkID]
  INNER JOIN [PRK_Status] AS [PRK_Status3]
    ON [PRK_Applications].[StatusID] = [PRK_Status3].[StatusID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]
    ON [PRK_Applications].[FinYear] = [PRK_FinYears4].[FinYear]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
