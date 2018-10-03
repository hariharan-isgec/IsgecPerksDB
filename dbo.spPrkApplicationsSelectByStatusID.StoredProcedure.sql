USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkApplicationsSelectByStatusID]
  @FinYear Int,
  @StatusID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[PRK_Applications].[ApplicationID],
		[PRK_Applications].[EmployeeID],
		[PRK_Applications].[PerkID],
		[PRK_Applications].[Applied],
		[PRK_Applications].[AppliedOn],
		[PRK_Applications].[Value],
		[PRK_Applications].[UserRemark],
		[PRK_Applications].[Approved],
		[PRK_Applications].[ApprovedValue],
		[PRK_Applications].[ApprovedAmt],
		[PRK_Applications].[ApprovedBy],
		[PRK_Applications].[ApprovedOn],
		[PRK_Applications].[ApproverRemark],
		[PRK_Applications].[Verified],
		[PRK_Applications].[VerifiedValue],
		[PRK_Applications].[VerifiedAmt],
		[PRK_Applications].[UpdatedBy],
		[PRK_Applications].[PostedBy],
		[PRK_Applications].[VerifiedBy],
		[PRK_Applications].[VerifiedOn],
		[PRK_Applications].[VerifierRemark],
		[PRK_Applications].[PaymentMethod],
		[PRK_Applications].[UpdatedInLedger],
		[PRK_Applications].[UpdatedOn],
		[PRK_Applications].[PostedInBaaN],
		[PRK_Applications].[PostedOn],
		[PRK_Applications].[Documents],
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
		[PRK_Employees6].[EmployeeID] AS PRK_Employees6_EmployeeID,
		[PRK_Employees6].[CardNo] AS PRK_Employees6_CardNo,
		[PRK_Employees6].[EmployeeName] AS PRK_Employees6_EmployeeName,
		[PRK_Employees6].[CategoryID] AS PRK_Employees6_CategoryID,
		[PRK_Employees6].[PostedAt] AS PRK_Employees6_PostedAt,
		[PRK_Employees6].[VehicleType] AS PRK_Employees6_VehicleType,
		[PRK_Employees6].[Basic] AS PRK_Employees6_Basic,
		[PRK_Employees6].[ESI] AS PRK_Employees6_ESI,
		[PRK_Employees6].[DOJ] AS PRK_Employees6_DOJ,
		[PRK_Employees6].[DOR] AS PRK_Employees6_DOR,
		[PRK_Employees6].[Department] AS PRK_Employees6_Department,
		[PRK_Employees6].[Company] AS PRK_Employees6_Company,
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
		[PRK_Employees5].[Company] AS PRK_Employees5_Company,
		[PRK_Employees4].[EmployeeID] AS PRK_Employees4_EmployeeID,
		[PRK_Employees4].[CardNo] AS PRK_Employees4_CardNo,
		[PRK_Employees4].[EmployeeName] AS PRK_Employees4_EmployeeName,
		[PRK_Employees4].[CategoryID] AS PRK_Employees4_CategoryID,
		[PRK_Employees4].[PostedAt] AS PRK_Employees4_PostedAt,
		[PRK_Employees4].[VehicleType] AS PRK_Employees4_VehicleType,
		[PRK_Employees4].[Basic] AS PRK_Employees4_Basic,
		[PRK_Employees4].[ESI] AS PRK_Employees4_ESI,
		[PRK_Employees4].[DOJ] AS PRK_Employees4_DOJ,
		[PRK_Employees4].[DOR] AS PRK_Employees4_DOR,
		[PRK_Employees4].[Department] AS PRK_Employees4_Department,
		[PRK_Employees4].[Company] AS PRK_Employees4_Company,
		[PRK_Status7].[StatusID] AS PRK_Status7_StatusID,
		[PRK_Status7].[Description] AS PRK_Status7_Description,
		[PRK_FinYears8].[FinYear] AS PRK_FinYears8_FinYear,
		[PRK_FinYears8].[Description] AS PRK_FinYears8_Description,
		[PRK_FinYears8].[StartDate] AS PRK_FinYears8_StartDate,
		[PRK_FinYears8].[EndDate] AS PRK_FinYears8_EndDate,
		[PRK_FinYears8].[Status] AS PRK_FinYears8_Status 
  FROM [PRK_Applications] 
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Applications].[PerkID] = [PRK_Perks2].[PerkID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [PRK_Applications].[ApprovedBy] = [PRK_Employees3].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees6]
    ON [PRK_Applications].[UpdatedBy] = [PRK_Employees6].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [PRK_Applications].[PostedBy] = [PRK_Employees5].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees4]
    ON [PRK_Applications].[VerifiedBy] = [PRK_Employees4].[EmployeeID]
  INNER JOIN [PRK_Status] AS [PRK_Status7]
    ON [PRK_Applications].[StatusID] = [PRK_Status7].[StatusID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears8]
    ON [PRK_Applications].[FinYear] = [PRK_FinYears8].[FinYear]
  WHERE
  [PRK_Applications].[StatusID] = @StatusID
  AND [PRK_Applications].[FinYear] = @FinYear
  ORDER BY
     CASE @orderBy WHEN 'ApplicationID' THEN [PRK_Applications].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [PRK_Applications].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'EmployeeID' THEN [PRK_Applications].[EmployeeID] END,
     CASE @orderBy WHEN 'EmployeeID DESC' THEN [PRK_Applications].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PerkID' THEN [PRK_Applications].[PerkID] END,
     CASE @orderBy WHEN 'PerkID DESC' THEN [PRK_Applications].[PerkID] END DESC,
     CASE @orderBy WHEN 'Applied' THEN [PRK_Applications].[Applied] END,
     CASE @orderBy WHEN 'Applied DESC' THEN [PRK_Applications].[Applied] END DESC,
     CASE @orderBy WHEN 'AppliedOn' THEN [PRK_Applications].[AppliedOn] END,
     CASE @orderBy WHEN 'AppliedOn DESC' THEN [PRK_Applications].[AppliedOn] END DESC,
     CASE @orderBy WHEN 'Value' THEN [PRK_Applications].[Value] END,
     CASE @orderBy WHEN 'Value DESC' THEN [PRK_Applications].[Value] END DESC,
     CASE @orderBy WHEN 'UserRemark' THEN [PRK_Applications].[UserRemark] END,
     CASE @orderBy WHEN 'UserRemark DESC' THEN [PRK_Applications].[UserRemark] END DESC,
     CASE @orderBy WHEN 'Approved' THEN [PRK_Applications].[Approved] END,
     CASE @orderBy WHEN 'Approved DESC' THEN [PRK_Applications].[Approved] END DESC,
     CASE @orderBy WHEN 'ApprovedValue' THEN [PRK_Applications].[ApprovedValue] END,
     CASE @orderBy WHEN 'ApprovedValue DESC' THEN [PRK_Applications].[ApprovedValue] END DESC,
     CASE @orderBy WHEN 'ApprovedAmt' THEN [PRK_Applications].[ApprovedAmt] END,
     CASE @orderBy WHEN 'ApprovedAmt DESC' THEN [PRK_Applications].[ApprovedAmt] END DESC,
     CASE @orderBy WHEN 'ApprovedBy' THEN [PRK_Applications].[ApprovedBy] END,
     CASE @orderBy WHEN 'ApprovedBy DESC' THEN [PRK_Applications].[ApprovedBy] END DESC,
     CASE @orderBy WHEN 'ApprovedOn' THEN [PRK_Applications].[ApprovedOn] END,
     CASE @orderBy WHEN 'ApprovedOn DESC' THEN [PRK_Applications].[ApprovedOn] END DESC,
     CASE @orderBy WHEN 'ApproverRemark' THEN [PRK_Applications].[ApproverRemark] END,
     CASE @orderBy WHEN 'ApproverRemark DESC' THEN [PRK_Applications].[ApproverRemark] END DESC,
     CASE @orderBy WHEN 'Verified' THEN [PRK_Applications].[Verified] END,
     CASE @orderBy WHEN 'Verified DESC' THEN [PRK_Applications].[Verified] END DESC,
     CASE @orderBy WHEN 'VerifiedValue' THEN [PRK_Applications].[VerifiedValue] END,
     CASE @orderBy WHEN 'VerifiedValue DESC' THEN [PRK_Applications].[VerifiedValue] END DESC,
     CASE @orderBy WHEN 'VerifiedAmt' THEN [PRK_Applications].[VerifiedAmt] END,
     CASE @orderBy WHEN 'VerifiedAmt DESC' THEN [PRK_Applications].[VerifiedAmt] END DESC,
     CASE @orderBy WHEN 'UpdatedBy' THEN [PRK_Applications].[UpdatedBy] END,
     CASE @orderBy WHEN 'UpdatedBy DESC' THEN [PRK_Applications].[UpdatedBy] END DESC,
     CASE @orderBy WHEN 'PostedBy' THEN [PRK_Applications].[PostedBy] END,
     CASE @orderBy WHEN 'PostedBy DESC' THEN [PRK_Applications].[PostedBy] END DESC,
     CASE @orderBy WHEN 'VerifiedBy' THEN [PRK_Applications].[VerifiedBy] END,
     CASE @orderBy WHEN 'VerifiedBy DESC' THEN [PRK_Applications].[VerifiedBy] END DESC,
     CASE @orderBy WHEN 'VerifiedOn' THEN [PRK_Applications].[VerifiedOn] END,
     CASE @orderBy WHEN 'VerifiedOn DESC' THEN [PRK_Applications].[VerifiedOn] END DESC,
     CASE @orderBy WHEN 'VerifierRemark' THEN [PRK_Applications].[VerifierRemark] END,
     CASE @orderBy WHEN 'VerifierRemark DESC' THEN [PRK_Applications].[VerifierRemark] END DESC,
     CASE @orderBy WHEN 'PaymentMethod' THEN [PRK_Applications].[PaymentMethod] END,
     CASE @orderBy WHEN 'PaymentMethod DESC' THEN [PRK_Applications].[PaymentMethod] END DESC,
     CASE @orderBy WHEN 'UpdatedInLedger' THEN [PRK_Applications].[UpdatedInLedger] END,
     CASE @orderBy WHEN 'UpdatedInLedger DESC' THEN [PRK_Applications].[UpdatedInLedger] END DESC,
     CASE @orderBy WHEN 'UpdatedOn' THEN [PRK_Applications].[UpdatedOn] END,
     CASE @orderBy WHEN 'UpdatedOn DESC' THEN [PRK_Applications].[UpdatedOn] END DESC,
     CASE @orderBy WHEN 'PostedInBaaN' THEN [PRK_Applications].[PostedInBaaN] END,
     CASE @orderBy WHEN 'PostedInBaaN DESC' THEN [PRK_Applications].[PostedInBaaN] END DESC,
     CASE @orderBy WHEN 'PostedOn' THEN [PRK_Applications].[PostedOn] END,
     CASE @orderBy WHEN 'PostedOn DESC' THEN [PRK_Applications].[PostedOn] END DESC,
     CASE @orderBy WHEN 'Documents' THEN [PRK_Applications].[Documents] END,
     CASE @orderBy WHEN 'Documents DESC' THEN [PRK_Applications].[Documents] END DESC,
     CASE @orderBy WHEN 'StatusID' THEN [PRK_Applications].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [PRK_Applications].[StatusID] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [PRK_Applications].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [PRK_Applications].[FinYear] END DESC,
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
     CASE @orderBy WHEN 'PRK_Employees6_EmployeeID' THEN [PRK_Employees6].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees6_EmployeeID DESC' THEN [PRK_Employees6].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_CardNo' THEN [PRK_Employees6].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees6_CardNo DESC' THEN [PRK_Employees6].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_EmployeeName' THEN [PRK_Employees6].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees6_EmployeeName DESC' THEN [PRK_Employees6].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_CategoryID' THEN [PRK_Employees6].[CategoryID] END,
     CASE @orderBy WHEN 'PRK_Employees6_CategoryID DESC' THEN [PRK_Employees6].[CategoryID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_PostedAt' THEN [PRK_Employees6].[PostedAt] END,
     CASE @orderBy WHEN 'PRK_Employees6_PostedAt DESC' THEN [PRK_Employees6].[PostedAt] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_VehicleType' THEN [PRK_Employees6].[VehicleType] END,
     CASE @orderBy WHEN 'PRK_Employees6_VehicleType DESC' THEN [PRK_Employees6].[VehicleType] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_Basic' THEN [PRK_Employees6].[Basic] END,
     CASE @orderBy WHEN 'PRK_Employees6_Basic DESC' THEN [PRK_Employees6].[Basic] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_ESI' THEN [PRK_Employees6].[ESI] END,
     CASE @orderBy WHEN 'PRK_Employees6_ESI DESC' THEN [PRK_Employees6].[ESI] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_DOJ' THEN [PRK_Employees6].[DOJ] END,
     CASE @orderBy WHEN 'PRK_Employees6_DOJ DESC' THEN [PRK_Employees6].[DOJ] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_DOR' THEN [PRK_Employees6].[DOR] END,
     CASE @orderBy WHEN 'PRK_Employees6_DOR DESC' THEN [PRK_Employees6].[DOR] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_Department' THEN [PRK_Employees6].[Department] END,
     CASE @orderBy WHEN 'PRK_Employees6_Department DESC' THEN [PRK_Employees6].[Department] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_Company' THEN [PRK_Employees6].[Company] END,
     CASE @orderBy WHEN 'PRK_Employees6_Company DESC' THEN [PRK_Employees6].[Company] END DESC,
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
     CASE @orderBy WHEN 'PRK_Employees5_Company DESC' THEN [PRK_Employees5].[Company] END DESC,
     CASE @orderBy WHEN 'PRK_Employees4_EmployeeID' THEN [PRK_Employees4].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees4_EmployeeID DESC' THEN [PRK_Employees4].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees4_CardNo' THEN [PRK_Employees4].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees4_CardNo DESC' THEN [PRK_Employees4].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees4_EmployeeName' THEN [PRK_Employees4].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees4_EmployeeName DESC' THEN [PRK_Employees4].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Employees4_CategoryID' THEN [PRK_Employees4].[CategoryID] END,
     CASE @orderBy WHEN 'PRK_Employees4_CategoryID DESC' THEN [PRK_Employees4].[CategoryID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees4_PostedAt' THEN [PRK_Employees4].[PostedAt] END,
     CASE @orderBy WHEN 'PRK_Employees4_PostedAt DESC' THEN [PRK_Employees4].[PostedAt] END DESC,
     CASE @orderBy WHEN 'PRK_Employees4_VehicleType' THEN [PRK_Employees4].[VehicleType] END,
     CASE @orderBy WHEN 'PRK_Employees4_VehicleType DESC' THEN [PRK_Employees4].[VehicleType] END DESC,
     CASE @orderBy WHEN 'PRK_Employees4_Basic' THEN [PRK_Employees4].[Basic] END,
     CASE @orderBy WHEN 'PRK_Employees4_Basic DESC' THEN [PRK_Employees4].[Basic] END DESC,
     CASE @orderBy WHEN 'PRK_Employees4_ESI' THEN [PRK_Employees4].[ESI] END,
     CASE @orderBy WHEN 'PRK_Employees4_ESI DESC' THEN [PRK_Employees4].[ESI] END DESC,
     CASE @orderBy WHEN 'PRK_Employees4_DOJ' THEN [PRK_Employees4].[DOJ] END,
     CASE @orderBy WHEN 'PRK_Employees4_DOJ DESC' THEN [PRK_Employees4].[DOJ] END DESC,
     CASE @orderBy WHEN 'PRK_Employees4_DOR' THEN [PRK_Employees4].[DOR] END,
     CASE @orderBy WHEN 'PRK_Employees4_DOR DESC' THEN [PRK_Employees4].[DOR] END DESC,
     CASE @orderBy WHEN 'PRK_Employees4_Department' THEN [PRK_Employees4].[Department] END,
     CASE @orderBy WHEN 'PRK_Employees4_Department DESC' THEN [PRK_Employees4].[Department] END DESC,
     CASE @orderBy WHEN 'PRK_Employees4_Company' THEN [PRK_Employees4].[Company] END,
     CASE @orderBy WHEN 'PRK_Employees4_Company DESC' THEN [PRK_Employees4].[Company] END DESC,
     CASE @orderBy WHEN 'PRK_Status7_StatusID' THEN [PRK_Status7].[StatusID] END,
     CASE @orderBy WHEN 'PRK_Status7_StatusID DESC' THEN [PRK_Status7].[StatusID] END DESC,
     CASE @orderBy WHEN 'PRK_Status7_Description' THEN [PRK_Status7].[Description] END,
     CASE @orderBy WHEN 'PRK_Status7_Description DESC' THEN [PRK_Status7].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears8_FinYear' THEN [PRK_FinYears8].[FinYear] END,
     CASE @orderBy WHEN 'PRK_FinYears8_FinYear DESC' THEN [PRK_FinYears8].[FinYear] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears8_Description' THEN [PRK_FinYears8].[Description] END,
     CASE @orderBy WHEN 'PRK_FinYears8_Description DESC' THEN [PRK_FinYears8].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears8_StartDate' THEN [PRK_FinYears8].[StartDate] END,
     CASE @orderBy WHEN 'PRK_FinYears8_StartDate DESC' THEN [PRK_FinYears8].[StartDate] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears8_EndDate' THEN [PRK_FinYears8].[EndDate] END,
     CASE @orderBy WHEN 'PRK_FinYears8_EndDate DESC' THEN [PRK_FinYears8].[EndDate] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears8_Status' THEN [PRK_FinYears8].[Status] END,
     CASE @orderBy WHEN 'PRK_FinYears8_Status DESC' THEN [PRK_FinYears8].[Status] END DESC 
  SET @RecordCount = @@RowCount
GO
