USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkLedgerSelectByPostedBy]
  @FinYear Int,
  @PostedBy Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
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
  [PRK_Ledger].[PostedBy] = @PostedBy
  AND [PRK_Ledger].[FinYear] = @FinYear
  ORDER BY
     CASE @orderBy WHEN 'DocumentID' THEN [PRK_Ledger].[DocumentID] END,
     CASE @orderBy WHEN 'DocumentID DESC' THEN [PRK_Ledger].[DocumentID] END DESC,
     CASE @orderBy WHEN 'EmployeeID' THEN [PRK_Ledger].[EmployeeID] END,
     CASE @orderBy WHEN 'EmployeeID DESC' THEN [PRK_Ledger].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PerkID' THEN [PRK_Ledger].[PerkID] END,
     CASE @orderBy WHEN 'PerkID DESC' THEN [PRK_Ledger].[PerkID] END DESC,
     CASE @orderBy WHEN 'TranType' THEN [PRK_Ledger].[TranType] END,
     CASE @orderBy WHEN 'TranType DESC' THEN [PRK_Ledger].[TranType] END DESC,
     CASE @orderBy WHEN 'TranDate' THEN [PRK_Ledger].[TranDate] END,
     CASE @orderBy WHEN 'TranDate DESC' THEN [PRK_Ledger].[TranDate] END DESC,
     CASE @orderBy WHEN 'Value' THEN [PRK_Ledger].[Value] END,
     CASE @orderBy WHEN 'Value DESC' THEN [PRK_Ledger].[Value] END DESC,
     CASE @orderBy WHEN 'UOM' THEN [PRK_Ledger].[UOM] END,
     CASE @orderBy WHEN 'UOM DESC' THEN [PRK_Ledger].[UOM] END DESC,
     CASE @orderBy WHEN 'Amount' THEN [PRK_Ledger].[Amount] END,
     CASE @orderBy WHEN 'Amount DESC' THEN [PRK_Ledger].[Amount] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [PRK_Ledger].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [PRK_Ledger].[Remarks] END DESC,
     CASE @orderBy WHEN 'CreatedBy' THEN [PRK_Ledger].[CreatedBy] END,
     CASE @orderBy WHEN 'CreatedBy DESC' THEN [PRK_Ledger].[CreatedBy] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [PRK_Ledger].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [PRK_Ledger].[FinYear] END DESC,
     CASE @orderBy WHEN 'PostedInBaaN' THEN [PRK_Ledger].[PostedInBaaN] END,
     CASE @orderBy WHEN 'PostedInBaaN DESC' THEN [PRK_Ledger].[PostedInBaaN] END DESC,
     CASE @orderBy WHEN 'ApplicationID' THEN [PRK_Ledger].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [PRK_Ledger].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'PostedOn' THEN [PRK_Ledger].[PostedOn] END,
     CASE @orderBy WHEN 'PostedOn DESC' THEN [PRK_Ledger].[PostedOn] END DESC,
     CASE @orderBy WHEN 'PostedBy' THEN [PRK_Ledger].[PostedBy] END,
     CASE @orderBy WHEN 'PostedBy DESC' THEN [PRK_Ledger].[PostedBy] END DESC,
     CASE @orderBy WHEN 'BatchNo' THEN [PRK_Ledger].[BatchNo] END,
     CASE @orderBy WHEN 'BatchNo DESC' THEN [PRK_Ledger].[BatchNo] END DESC,
     CASE @orderBy WHEN 'VoucherNo' THEN [PRK_Ledger].[VoucherNo] END,
     CASE @orderBy WHEN 'VoucherNo DESC' THEN [PRK_Ledger].[VoucherNo] END DESC,
     CASE @orderBy WHEN 'VoucherLineNo' THEN [PRK_Ledger].[VoucherLineNo] END,
     CASE @orderBy WHEN 'VoucherLineNo DESC' THEN [PRK_Ledger].[VoucherLineNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_EmployeeID' THEN [PRK_Employees1].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees1_EmployeeID DESC' THEN [PRK_Employees1].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_CardNo' THEN [PRK_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees1_CardNo DESC' THEN [PRK_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_EmployeeName' THEN [PRK_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees1_EmployeeName DESC' THEN [PRK_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_CategoryID' THEN [PRK_Employees1].[CategoryID] END,
     CASE @orderBy WHEN 'PRK_Employees1_CategoryID DESC' THEN [PRK_Employees1].[CategoryID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_PostedAt' THEN [PRK_Employees1].[PostedAt] END,
     CASE @orderBy WHEN 'PRK_Employees1_PostedAt DESC' THEN [PRK_Employees1].[PostedAt] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_VehicleType' THEN [PRK_Employees1].[VehicleType] END,
     CASE @orderBy WHEN 'PRK_Employees1_VehicleType DESC' THEN [PRK_Employees1].[VehicleType] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_Basic' THEN [PRK_Employees1].[Basic] END,
     CASE @orderBy WHEN 'PRK_Employees1_Basic DESC' THEN [PRK_Employees1].[Basic] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_ESI' THEN [PRK_Employees1].[ESI] END,
     CASE @orderBy WHEN 'PRK_Employees1_ESI DESC' THEN [PRK_Employees1].[ESI] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_DOJ' THEN [PRK_Employees1].[DOJ] END,
     CASE @orderBy WHEN 'PRK_Employees1_DOJ DESC' THEN [PRK_Employees1].[DOJ] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_DOR' THEN [PRK_Employees1].[DOR] END,
     CASE @orderBy WHEN 'PRK_Employees1_DOR DESC' THEN [PRK_Employees1].[DOR] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_Department' THEN [PRK_Employees1].[Department] END,
     CASE @orderBy WHEN 'PRK_Employees1_Department DESC' THEN [PRK_Employees1].[Department] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_Company' THEN [PRK_Employees1].[Company] END,
     CASE @orderBy WHEN 'PRK_Employees1_Company DESC' THEN [PRK_Employees1].[Company] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_PerkID' THEN [PRK_Perks2].[PerkID] END,
     CASE @orderBy WHEN 'PRK_Perks2_PerkID DESC' THEN [PRK_Perks2].[PerkID] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_PerkCode' THEN [PRK_Perks2].[PerkCode] END,
     CASE @orderBy WHEN 'PRK_Perks2_PerkCode DESC' THEN [PRK_Perks2].[PerkCode] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_Description' THEN [PRK_Perks2].[Description] END,
     CASE @orderBy WHEN 'PRK_Perks2_Description DESC' THEN [PRK_Perks2].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_AdvanceApplicable' THEN [PRK_Perks2].[AdvanceApplicable] END,
     CASE @orderBy WHEN 'PRK_Perks2_AdvanceApplicable DESC' THEN [PRK_Perks2].[AdvanceApplicable] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_AdvanceMonths' THEN [PRK_Perks2].[AdvanceMonths] END,
     CASE @orderBy WHEN 'PRK_Perks2_AdvanceMonths DESC' THEN [PRK_Perks2].[AdvanceMonths] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_LockedMonths' THEN [PRK_Perks2].[LockedMonths] END,
     CASE @orderBy WHEN 'PRK_Perks2_LockedMonths DESC' THEN [PRK_Perks2].[LockedMonths] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_NoOfPayments' THEN [PRK_Perks2].[NoOfPayments] END,
     CASE @orderBy WHEN 'PRK_Perks2_NoOfPayments DESC' THEN [PRK_Perks2].[NoOfPayments] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_CarryForward' THEN [PRK_Perks2].[CarryForward] END,
     CASE @orderBy WHEN 'PRK_Perks2_CarryForward DESC' THEN [PRK_Perks2].[CarryForward] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_UOM' THEN [PRK_Perks2].[UOM] END,
     CASE @orderBy WHEN 'PRK_Perks2_UOM DESC' THEN [PRK_Perks2].[UOM] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_Active' THEN [PRK_Perks2].[Active] END,
     CASE @orderBy WHEN 'PRK_Perks2_Active DESC' THEN [PRK_Perks2].[Active] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_BaaNGL' THEN [PRK_Perks2].[BaaNGL] END,
     CASE @orderBy WHEN 'PRK_Perks2_BaaNGL DESC' THEN [PRK_Perks2].[BaaNGL] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_BaaNReference' THEN [PRK_Perks2].[BaaNReference] END,
     CASE @orderBy WHEN 'PRK_Perks2_BaaNReference DESC' THEN [PRK_Perks2].[BaaNReference] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_cmba' THEN [PRK_Perks2].[cmba] END,
     CASE @orderBy WHEN 'PRK_Perks2_cmba DESC' THEN [PRK_Perks2].[cmba] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_EmployeeID' THEN [PRK_Employees3].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees3_EmployeeID DESC' THEN [PRK_Employees3].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_CardNo' THEN [PRK_Employees3].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees3_CardNo DESC' THEN [PRK_Employees3].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_EmployeeName' THEN [PRK_Employees3].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees3_EmployeeName DESC' THEN [PRK_Employees3].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_CategoryID' THEN [PRK_Employees3].[CategoryID] END,
     CASE @orderBy WHEN 'PRK_Employees3_CategoryID DESC' THEN [PRK_Employees3].[CategoryID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_PostedAt' THEN [PRK_Employees3].[PostedAt] END,
     CASE @orderBy WHEN 'PRK_Employees3_PostedAt DESC' THEN [PRK_Employees3].[PostedAt] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_VehicleType' THEN [PRK_Employees3].[VehicleType] END,
     CASE @orderBy WHEN 'PRK_Employees3_VehicleType DESC' THEN [PRK_Employees3].[VehicleType] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_Basic' THEN [PRK_Employees3].[Basic] END,
     CASE @orderBy WHEN 'PRK_Employees3_Basic DESC' THEN [PRK_Employees3].[Basic] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_ESI' THEN [PRK_Employees3].[ESI] END,
     CASE @orderBy WHEN 'PRK_Employees3_ESI DESC' THEN [PRK_Employees3].[ESI] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_DOJ' THEN [PRK_Employees3].[DOJ] END,
     CASE @orderBy WHEN 'PRK_Employees3_DOJ DESC' THEN [PRK_Employees3].[DOJ] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_DOR' THEN [PRK_Employees3].[DOR] END,
     CASE @orderBy WHEN 'PRK_Employees3_DOR DESC' THEN [PRK_Employees3].[DOR] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_Department' THEN [PRK_Employees3].[Department] END,
     CASE @orderBy WHEN 'PRK_Employees3_Department DESC' THEN [PRK_Employees3].[Department] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_Company' THEN [PRK_Employees3].[Company] END,
     CASE @orderBy WHEN 'PRK_Employees3_Company DESC' THEN [PRK_Employees3].[Company] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears4_FinYear' THEN [PRK_FinYears4].[FinYear] END,
     CASE @orderBy WHEN 'PRK_FinYears4_FinYear DESC' THEN [PRK_FinYears4].[FinYear] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears4_Description' THEN [PRK_FinYears4].[Description] END,
     CASE @orderBy WHEN 'PRK_FinYears4_Description DESC' THEN [PRK_FinYears4].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears4_StartDate' THEN [PRK_FinYears4].[StartDate] END,
     CASE @orderBy WHEN 'PRK_FinYears4_StartDate DESC' THEN [PRK_FinYears4].[StartDate] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears4_EndDate' THEN [PRK_FinYears4].[EndDate] END,
     CASE @orderBy WHEN 'PRK_FinYears4_EndDate DESC' THEN [PRK_FinYears4].[EndDate] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears4_Status' THEN [PRK_FinYears4].[Status] END,
     CASE @orderBy WHEN 'PRK_FinYears4_Status DESC' THEN [PRK_FinYears4].[Status] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_EmployeeID' THEN [PRK_Employees5].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees5_EmployeeID DESC' THEN [PRK_Employees5].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_CardNo' THEN [PRK_Employees5].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees5_CardNo DESC' THEN [PRK_Employees5].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_EmployeeName' THEN [PRK_Employees5].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees5_EmployeeName DESC' THEN [PRK_Employees5].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_CategoryID' THEN [PRK_Employees5].[CategoryID] END,
     CASE @orderBy WHEN 'PRK_Employees5_CategoryID DESC' THEN [PRK_Employees5].[CategoryID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_PostedAt' THEN [PRK_Employees5].[PostedAt] END,
     CASE @orderBy WHEN 'PRK_Employees5_PostedAt DESC' THEN [PRK_Employees5].[PostedAt] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_VehicleType' THEN [PRK_Employees5].[VehicleType] END,
     CASE @orderBy WHEN 'PRK_Employees5_VehicleType DESC' THEN [PRK_Employees5].[VehicleType] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_Basic' THEN [PRK_Employees5].[Basic] END,
     CASE @orderBy WHEN 'PRK_Employees5_Basic DESC' THEN [PRK_Employees5].[Basic] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_ESI' THEN [PRK_Employees5].[ESI] END,
     CASE @orderBy WHEN 'PRK_Employees5_ESI DESC' THEN [PRK_Employees5].[ESI] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_DOJ' THEN [PRK_Employees5].[DOJ] END,
     CASE @orderBy WHEN 'PRK_Employees5_DOJ DESC' THEN [PRK_Employees5].[DOJ] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_DOR' THEN [PRK_Employees5].[DOR] END,
     CASE @orderBy WHEN 'PRK_Employees5_DOR DESC' THEN [PRK_Employees5].[DOR] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_Department' THEN [PRK_Employees5].[Department] END,
     CASE @orderBy WHEN 'PRK_Employees5_Department DESC' THEN [PRK_Employees5].[Department] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_Company' THEN [PRK_Employees5].[Company] END,
     CASE @orderBy WHEN 'PRK_Employees5_Company DESC' THEN [PRK_Employees5].[Company] END DESC 
  SET @RecordCount = @@RowCount
GO
