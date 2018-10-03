USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprk_LG_GetPayments]
  @Filter_EmployeeID Int,
  @Filter_PerkID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @FinYear Int,
  @TranType NVarChar(3),
  @TranDate DateTime,
  @OrderBy NVarChar(50),
  @PostedInBaaN Int,
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  DocumentID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (DocumentID) ' + 
               'SELECT [PRK_Ledger].[DocumentID] FROM [PRK_Ledger] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Employees] AS [PRK_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Ledger].[EmployeeID] = [PRK_Employees1].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Perks] AS [PRK_Perks2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Ledger].[PerkID] = [PRK_Perks2].[PerkID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Employees] AS [PRK_Employees3]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Ledger].[CreatedBy] = [PRK_Employees3].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Ledger].[FinYear] = [PRK_FinYears4].[FinYear]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Ledger].[PostedBy] = [PRK_Employees5].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_EmployeeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Ledger].[EmployeeID] = ' + STR(@Filter_EmployeeID)
  IF (@Filter_PerkID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Ledger].[PerkID] = ' + STR(@Filter_PerkID)
  SET @LGSQL = @LGSQL + ' AND DATEDIFF(DY,[PRK_Ledger].[TranDate],CONVERT(DATETIME,''' + CONVERT(NVARCHAR(20),@TranDate) + ''',102)) = 0'
  IF (@TranType != '')
		SET @LGSQL = @LGSQL + ' AND [PRK_Ledger].[TranType] = ''' + @TranType + ''''
	ELSE
		SET @LGSQL = @LGSQL + ' AND ([PRK_Ledger].[TranType] != ''OPB'' AND [PRK_Ledger].[TranType] != ''ADJ'')'
  IF (@PostedInBaaN > -1) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Ledger].[PostedInBaaN] = ' + STR(@PostedInBaaN)
  SET @LGSQL = @LGSQL + ' AND [PRK_Ledger].[FinYear] = ' + STR(@FinYear)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DocumentID' THEN '[PRK_Ledger].[DocumentID]'
                        WHEN 'DocumentID DESC' THEN '[PRK_Ledger].[DocumentID] DESC'
                        WHEN 'EmployeeID' THEN '[PRK_Ledger].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[PRK_Ledger].[EmployeeID] DESC'
                        WHEN 'PerkID' THEN '[PRK_Ledger].[PerkID]'
                        WHEN 'PerkID DESC' THEN '[PRK_Ledger].[PerkID] DESC'
                        WHEN 'TranType' THEN '[PRK_Ledger].[TranType]'
                        WHEN 'TranType DESC' THEN '[PRK_Ledger].[TranType] DESC'
                        WHEN 'TranDate' THEN '[PRK_Ledger].[TranDate]'
                        WHEN 'TranDate DESC' THEN '[PRK_Ledger].[TranDate] DESC'
                        WHEN 'Value' THEN '[PRK_Ledger].[Value]'
                        WHEN 'Value DESC' THEN '[PRK_Ledger].[Value] DESC'
                        WHEN 'UOM' THEN '[PRK_Ledger].[UOM]'
                        WHEN 'UOM DESC' THEN '[PRK_Ledger].[UOM] DESC'
                        WHEN 'Amount' THEN '[PRK_Ledger].[Amount]'
                        WHEN 'Amount DESC' THEN '[PRK_Ledger].[Amount] DESC'
                        WHEN 'Remarks' THEN '[PRK_Ledger].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PRK_Ledger].[Remarks] DESC'
                        WHEN 'CreatedBy' THEN '[PRK_Ledger].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[PRK_Ledger].[CreatedBy] DESC'
                        WHEN 'FinYear' THEN '[PRK_Ledger].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PRK_Ledger].[FinYear] DESC'
                        WHEN 'PostedInBaaN' THEN '[PRK_Ledger].[PostedInBaaN]'
                        WHEN 'PostedInBaaN DESC' THEN '[PRK_Ledger].[PostedInBaaN] DESC'
                        WHEN 'ApplicationID' THEN '[PRK_Ledger].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[PRK_Ledger].[ApplicationID] DESC'
                        WHEN 'PostedOn' THEN '[PRK_Ledger].[PostedOn]'
                        WHEN 'PostedOn DESC' THEN '[PRK_Ledger].[PostedOn] DESC'
                        WHEN 'PostedBy' THEN '[PRK_Ledger].[PostedBy]'
                        WHEN 'PostedBy DESC' THEN '[PRK_Ledger].[PostedBy] DESC'
                        WHEN 'BatchNo' THEN '[PRK_Ledger].[BatchNo]'
                        WHEN 'BatchNo DESC' THEN '[PRK_Ledger].[BatchNo] DESC'
                        WHEN 'VoucherNo' THEN '[PRK_Ledger].[VoucherNo]'
                        WHEN 'VoucherNo DESC' THEN '[PRK_Ledger].[VoucherNo] DESC'
                        WHEN 'VoucherLineNo' THEN '[PRK_Ledger].[VoucherLineNo]'
                        WHEN 'VoucherLineNo DESC' THEN '[PRK_Ledger].[VoucherLineNo] DESC'
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
                        WHEN 'PRK_Employees3_EmployeeID' THEN '[PRK_Employees3].[EmployeeID]'
                        WHEN 'PRK_Employees3_EmployeeID DESC' THEN '[PRK_Employees3].[EmployeeID] DESC'
                        WHEN 'PRK_Employees3_CardNo' THEN '[PRK_Employees3].[CardNo]'
                        WHEN 'PRK_Employees3_CardNo DESC' THEN '[PRK_Employees3].[CardNo] DESC'
                        WHEN 'PRK_Employees3_EmployeeName' THEN '[PRK_Employees3].[EmployeeName]'
                        WHEN 'PRK_Employees3_EmployeeName DESC' THEN '[PRK_Employees3].[EmployeeName] DESC'
                        WHEN 'PRK_Employees3_CategoryID' THEN '[PRK_Employees3].[CategoryID]'
                        WHEN 'PRK_Employees3_CategoryID DESC' THEN '[PRK_Employees3].[CategoryID] DESC'
                        WHEN 'PRK_Employees3_PostedAt' THEN '[PRK_Employees3].[PostedAt]'
                        WHEN 'PRK_Employees3_PostedAt DESC' THEN '[PRK_Employees3].[PostedAt] DESC'
                        WHEN 'PRK_Employees3_VehicleType' THEN '[PRK_Employees3].[VehicleType]'
                        WHEN 'PRK_Employees3_VehicleType DESC' THEN '[PRK_Employees3].[VehicleType] DESC'
                        WHEN 'PRK_Employees3_Basic' THEN '[PRK_Employees3].[Basic]'
                        WHEN 'PRK_Employees3_Basic DESC' THEN '[PRK_Employees3].[Basic] DESC'
                        WHEN 'PRK_Employees3_ESI' THEN '[PRK_Employees3].[ESI]'
                        WHEN 'PRK_Employees3_ESI DESC' THEN '[PRK_Employees3].[ESI] DESC'
                        WHEN 'PRK_Employees3_DOJ' THEN '[PRK_Employees3].[DOJ]'
                        WHEN 'PRK_Employees3_DOJ DESC' THEN '[PRK_Employees3].[DOJ] DESC'
                        WHEN 'PRK_Employees3_DOR' THEN '[PRK_Employees3].[DOR]'
                        WHEN 'PRK_Employees3_DOR DESC' THEN '[PRK_Employees3].[DOR] DESC'
                        WHEN 'PRK_Employees3_Department' THEN '[PRK_Employees3].[Department]'
                        WHEN 'PRK_Employees3_Department DESC' THEN '[PRK_Employees3].[Department] DESC'
                        WHEN 'PRK_Employees3_Company' THEN '[PRK_Employees3].[Company]'
                        WHEN 'PRK_Employees3_Company DESC' THEN '[PRK_Employees3].[Company] DESC'
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
                        WHEN 'PRK_Employees5_EmployeeID' THEN '[PRK_Employees5].[EmployeeID]'
                        WHEN 'PRK_Employees5_EmployeeID DESC' THEN '[PRK_Employees5].[EmployeeID] DESC'
                        WHEN 'PRK_Employees5_CardNo' THEN '[PRK_Employees5].[CardNo]'
                        WHEN 'PRK_Employees5_CardNo DESC' THEN '[PRK_Employees5].[CardNo] DESC'
                        WHEN 'PRK_Employees5_EmployeeName' THEN '[PRK_Employees5].[EmployeeName]'
                        WHEN 'PRK_Employees5_EmployeeName DESC' THEN '[PRK_Employees5].[EmployeeName] DESC'
                        WHEN 'PRK_Employees5_CategoryID' THEN '[PRK_Employees5].[CategoryID]'
                        WHEN 'PRK_Employees5_CategoryID DESC' THEN '[PRK_Employees5].[CategoryID] DESC'
                        WHEN 'PRK_Employees5_PostedAt' THEN '[PRK_Employees5].[PostedAt]'
                        WHEN 'PRK_Employees5_PostedAt DESC' THEN '[PRK_Employees5].[PostedAt] DESC'
                        WHEN 'PRK_Employees5_VehicleType' THEN '[PRK_Employees5].[VehicleType]'
                        WHEN 'PRK_Employees5_VehicleType DESC' THEN '[PRK_Employees5].[VehicleType] DESC'
                        WHEN 'PRK_Employees5_Basic' THEN '[PRK_Employees5].[Basic]'
                        WHEN 'PRK_Employees5_Basic DESC' THEN '[PRK_Employees5].[Basic] DESC'
                        WHEN 'PRK_Employees5_ESI' THEN '[PRK_Employees5].[ESI]'
                        WHEN 'PRK_Employees5_ESI DESC' THEN '[PRK_Employees5].[ESI] DESC'
                        WHEN 'PRK_Employees5_DOJ' THEN '[PRK_Employees5].[DOJ]'
                        WHEN 'PRK_Employees5_DOJ DESC' THEN '[PRK_Employees5].[DOJ] DESC'
                        WHEN 'PRK_Employees5_DOR' THEN '[PRK_Employees5].[DOR]'
                        WHEN 'PRK_Employees5_DOR DESC' THEN '[PRK_Employees5].[DOR] DESC'
                        WHEN 'PRK_Employees5_Department' THEN '[PRK_Employees5].[Department]'
                        WHEN 'PRK_Employees5_Department DESC' THEN '[PRK_Employees5].[Department] DESC'
                        WHEN 'PRK_Employees5_Company' THEN '[PRK_Employees5].[Company]'
                        WHEN 'PRK_Employees5_Company DESC' THEN '[PRK_Employees5].[Company] DESC'
                        ELSE '[PRK_Ledger].[DocumentID]'
                    END
		SET @LGSQL = @LGSQL + ',[PRK_Employees1].[Company]'
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PRK_Ledger].[DocumentID],
		[PRK_Ledger].[EmployeeID],
		[PRK_Ledger].[PerkID],
		[PRK_Ledger].[TranType],
		[PRK_Ledger].[TranDate],
		[PRK_Ledger].[Value],
		[PRK_Ledger].[UOM],
		[PRK_Ledger].[Amount],
		[PRK_Ledger].[Remarks],
		[PRK_Ledger].[CreatedBy],
		[PRK_Ledger].[FinYear],
		[PRK_Ledger].[PostedInBaaN],
		[PRK_Ledger].[ApplicationID],
		[PRK_Ledger].[PostedOn],
		[PRK_Ledger].[PostedBy],
		[PRK_Ledger].[BatchNo],
		[PRK_Ledger].[VoucherNo],
		[PRK_Ledger].[VoucherLineNo],
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
		[PRK_Perks2].[CreditGLForCash24] AS PRK_Perks2_CreditGLForCash24,
		[PRK_Perks2].[CreditGLForCash63] AS PRK_Perks2_CreditGLForCash63,
		[PRK_Perks2].[CreditGLForCheque] AS PRK_Perks2_CreditGLForCheque,
		[PRK_Perks2].[CreditGLForImprest] AS PRK_Perks2_CreditGLForImprest,
		[PRK_Employees3].[EmployeeID] AS PRK_Employees3_EmployeeID,
		[PRK_Employees3].[CardNo] AS PRK_Employees3_CardNo,
		[PRK_Employees3].[EmployeeName] AS PRK_Employees3_EmployeeName,
		[PRK_Employees3].[CategoryID] AS PRK_Employees3_CategoryID,
		[PRK_Employees3].[PostedAt] AS PRK_Employees3_PostedAt,
		[PRK_Employees3].[VehicleType] AS PRK_Employees3_VehicleType,
		[PRK_Employees3].[Basic] AS PRK_Employees3_Basic,
		[PRK_Employees3].[ESI] AS PRK_Employees3_ESI,
		[PRK_Employees3].[DOJ] AS PRK_Employees3_DOJ,
		[PRK_Employees3].[DOR] AS PRK_Employees3_DOR,
		[PRK_Employees3].[Department] AS PRK_Employees3_Department,
		[PRK_Employees3].[Company] AS PRK_Employees3_Company,
		[PRK_FinYears4].[FinYear] AS PRK_FinYears4_FinYear,
		[PRK_FinYears4].[Description] AS PRK_FinYears4_Description,
		[PRK_FinYears4].[StartDate] AS PRK_FinYears4_StartDate,
		[PRK_FinYears4].[EndDate] AS PRK_FinYears4_EndDate,
		[PRK_FinYears4].[Status] AS PRK_FinYears4_Status, 
		[PRK_Employees5].[EmployeeID] AS PRK_Employees5_EmployeeID,
		[PRK_Employees5].[CardNo] AS PRK_Employees5_CardNo,
		[PRK_Employees5].[EmployeeName] AS PRK_Employees5_EmployeeName,
		[PRK_Employees5].[CategoryID] AS PRK_Employees5_CategoryID,
		[PRK_Employees5].[PostedAt] AS PRK_Employees5_PostedAt,
		[PRK_Employees5].[VehicleType] AS PRK_Employees5_VehicleType,
		[PRK_Employees5].[Basic] AS PRK_Employees5_Basic,
		[PRK_Employees5].[ESI] AS PRK_Employees5_ESI,
		[PRK_Employees5].[DOJ] AS PRK_Employees5_DOJ,
		[PRK_Employees5].[DOR] AS PRK_Employees5_DOR,
		[PRK_Employees5].[Department] AS PRK_Employees5_Department,
		[PRK_Employees5].[Company] AS PRK_Employees5_Company 
  FROM [PRK_Ledger] 
    	INNER JOIN #PageIndex
          ON [PRK_Ledger].[DocumentID] = #PageIndex.DocumentID
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Ledger].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Ledger].[PerkID] = [PRK_Perks2].[PerkID]
  INNER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [PRK_Ledger].[CreatedBy] = [PRK_Employees3].[EmployeeID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]
    ON [PRK_Ledger].[FinYear] = [PRK_FinYears4].[FinYear]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [PRK_Ledger].[PostedBy] = [PRK_Employees5].[EmployeeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
