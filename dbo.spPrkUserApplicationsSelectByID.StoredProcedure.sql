USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkUserApplicationsSelectByID]
  @ApplicationID Int
  AS
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
		[PRK_Perks1].[PerkID] AS PRK_Perks1_PerkID,
		[PRK_Perks1].[PerkCode] AS PRK_Perks1_PerkCode,
		[PRK_Perks1].[Description] AS PRK_Perks1_Description,
		[PRK_Perks1].[AdvanceApplicable] AS PRK_Perks1_AdvanceApplicable,
		[PRK_Perks1].[AdvanceMonths] AS PRK_Perks1_AdvanceMonths,
		[PRK_Perks1].[LockedMonths] AS PRK_Perks1_LockedMonths,
		[PRK_Perks1].[NoOfPayments] AS PRK_Perks1_NoOfPayments,
		[PRK_Perks1].[CarryForward] AS PRK_Perks1_CarryForward,
		[PRK_Perks1].[UOM] AS PRK_Perks1_UOM,
		[PRK_Perks1].[Active] AS PRK_Perks1_Active,
		[PRK_Perks1].[BaaNGL] AS PRK_Perks1_BaaNGL,
		[PRK_Perks1].[BaaNReference] AS PRK_Perks1_BaaNReference,
		[PRK_Perks1].[cmba] AS PRK_Perks1_cmba,
		[PRK_Status2].[StatusID] AS PRK_Status2_StatusID,
		[PRK_Status2].[Description] AS PRK_Status2_Description,
		[PRK_FinYears3].[FinYear] AS PRK_FinYears3_FinYear,
		[PRK_FinYears3].[Description] AS PRK_FinYears3_Description,
		[PRK_FinYears3].[StartDate] AS PRK_FinYears3_StartDate,
		[PRK_FinYears3].[EndDate] AS PRK_FinYears3_EndDate,
		[PRK_FinYears3].[Status] AS PRK_FinYears3_Status 
  FROM [PRK_Applications] 
  INNER JOIN [PRK_Perks] AS [PRK_Perks1]
    ON [PRK_Applications].[PerkID] = [PRK_Perks1].[PerkID]
  INNER JOIN [PRK_Status] AS [PRK_Status2]
    ON [PRK_Applications].[StatusID] = [PRK_Status2].[StatusID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears3]
    ON [PRK_Applications].[FinYear] = [PRK_FinYears3].[FinYear]
  WHERE
  [PRK_Applications].[ApplicationID] = @ApplicationID
GO
