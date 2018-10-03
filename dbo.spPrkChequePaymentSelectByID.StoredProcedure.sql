USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkChequePaymentSelectByID]
  @ApplicationID Int
  AS
  SELECT
		[PRK_Applications].[ApplicationID],
		[PRK_Applications].[EmployeeID],
		[PRK_Applications].[PerkID],
		[PRK_Applications].[Documents],
		[PRK_Applications].[Verified],
		[PRK_Applications].[VerifiedValue],
		[PRK_Applications].[VerifiedAmt],
		[PRK_Applications].[VerifiedBy],
		[PRK_Applications].[VerifiedOn],
		[PRK_Applications].[VerifierRemark],
		[PRK_Applications].[Approved],
		[PRK_Applications].[ApprovedValue],
		[PRK_Applications].[ApprovedAmt],
		[PRK_Applications].[ApprovedBy],
		[PRK_Applications].[ApprovedOn],
		[PRK_Applications].[ApproverRemark],
		[PRK_Applications].[PaymentMethod],
		[PRK_Applications].[UpdatedInLedger],
		[PRK_Applications].[UpdatedOn],
		[PRK_Applications].[UpdatedBy],
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
		[PRK_Status6].[StatusID] AS PRK_Status6_StatusID,
		[PRK_Status6].[Description] AS PRK_Status6_Description,
		[PRK_FinYears7].[FinYear] AS PRK_FinYears7_FinYear,
		[PRK_FinYears7].[Description] AS PRK_FinYears7_Description,
		[PRK_FinYears7].[StartDate] AS PRK_FinYears7_StartDate,
		[PRK_FinYears7].[EndDate] AS PRK_FinYears7_EndDate,
		[PRK_FinYears7].[Status] AS PRK_FinYears7_Status 
  FROM [PRK_Applications] 
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Applications].[PerkID] = [PRK_Perks2].[PerkID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [PRK_Applications].[VerifiedBy] = [PRK_Employees3].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees4]
    ON [PRK_Applications].[ApprovedBy] = [PRK_Employees4].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [PRK_Applications].[UpdatedBy] = [PRK_Employees5].[EmployeeID]
  INNER JOIN [PRK_Status] AS [PRK_Status6]
    ON [PRK_Applications].[StatusID] = [PRK_Status6].[StatusID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears7]
    ON [PRK_Applications].[FinYear] = [PRK_FinYears7].[FinYear]
  WHERE
  [PRK_Applications].[ApplicationID] = @ApplicationID
GO
