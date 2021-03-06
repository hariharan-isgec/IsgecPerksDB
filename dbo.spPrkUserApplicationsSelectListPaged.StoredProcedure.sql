USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkUserApplicationsSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @EmployeeID Int,
  @StatusID Int,
  @FinYear Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ApplicationID Int NOT NULL
  )
  INSERT INTO #PageIndex (ApplicationID)
  SELECT [PRK_Applications].[ApplicationID] FROM [PRK_Applications]
  INNER JOIN [PRK_Perks] AS [PRK_Perks1]
    ON [PRK_Applications].[PerkID] = [PRK_Perks1].[PerkID]
  INNER JOIN [PRK_Status] AS [PRK_Status2]
    ON [PRK_Applications].[StatusID] = [PRK_Status2].[StatusID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears3]
    ON [PRK_Applications].[FinYear] = [PRK_FinYears3].[FinYear]
  WHERE [PRK_Applications].[EmployeeID] = @EmployeeID
  AND [PRK_Applications].[StatusID] != @StatusID
  AND [PRK_Applications].[FinYear] = @FinYear
  ORDER BY
     CASE @orderBy WHEN 'ApplicationID' THEN [PRK_Applications].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [PRK_Applications].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'EmployeeID' THEN [PRK_Applications].[EmployeeID] END,
     CASE @orderBy WHEN 'EmployeeID DESC' THEN [PRK_Applications].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PerkID' THEN [PRK_Applications].[PerkID] END,
     CASE @orderBy WHEN 'PerkID DESC' THEN [PRK_Applications].[PerkID] END DESC,
     CASE @orderBy WHEN 'AppliedOn' THEN [PRK_Applications].[AppliedOn] END,
     CASE @orderBy WHEN 'AppliedOn DESC' THEN [PRK_Applications].[AppliedOn] END DESC,
     CASE @orderBy WHEN 'Value' THEN [PRK_Applications].[Value] END,
     CASE @orderBy WHEN 'Value DESC' THEN [PRK_Applications].[Value] END DESC,
     CASE @orderBy WHEN 'UserRemark' THEN [PRK_Applications].[UserRemark] END,
     CASE @orderBy WHEN 'UserRemark DESC' THEN [PRK_Applications].[UserRemark] END DESC,
     CASE @orderBy WHEN 'VerifiedValue' THEN [PRK_Applications].[VerifiedValue] END,
     CASE @orderBy WHEN 'VerifiedValue DESC' THEN [PRK_Applications].[VerifiedValue] END DESC,
     CASE @orderBy WHEN 'VerifiedAmt' THEN [PRK_Applications].[VerifiedAmt] END,
     CASE @orderBy WHEN 'VerifiedAmt DESC' THEN [PRK_Applications].[VerifiedAmt] END DESC,
     CASE @orderBy WHEN 'VerifiedOn' THEN [PRK_Applications].[VerifiedOn] END,
     CASE @orderBy WHEN 'VerifiedOn DESC' THEN [PRK_Applications].[VerifiedOn] END DESC,
     CASE @orderBy WHEN 'VerifierRemark' THEN [PRK_Applications].[VerifierRemark] END,
     CASE @orderBy WHEN 'VerifierRemark DESC' THEN [PRK_Applications].[VerifierRemark] END DESC,
     CASE @orderBy WHEN 'ApprovedValue' THEN [PRK_Applications].[ApprovedValue] END,
     CASE @orderBy WHEN 'ApprovedValue DESC' THEN [PRK_Applications].[ApprovedValue] END DESC,
     CASE @orderBy WHEN 'ApprovedAmt' THEN [PRK_Applications].[ApprovedAmt] END,
     CASE @orderBy WHEN 'ApprovedAmt DESC' THEN [PRK_Applications].[ApprovedAmt] END DESC,
     CASE @orderBy WHEN 'ApprovedOn' THEN [PRK_Applications].[ApprovedOn] END,
     CASE @orderBy WHEN 'ApprovedOn DESC' THEN [PRK_Applications].[ApprovedOn] END DESC,
     CASE @orderBy WHEN 'ApproverRemark' THEN [PRK_Applications].[ApproverRemark] END,
     CASE @orderBy WHEN 'ApproverRemark DESC' THEN [PRK_Applications].[ApproverRemark] END DESC,
     CASE @orderBy WHEN 'PaymentMethod' THEN [PRK_Applications].[PaymentMethod] END,
     CASE @orderBy WHEN 'PaymentMethod DESC' THEN [PRK_Applications].[PaymentMethod] END DESC,
     CASE @orderBy WHEN 'StatusID' THEN [PRK_Applications].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [PRK_Applications].[StatusID] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [PRK_Applications].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [PRK_Applications].[FinYear] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_PerkID' THEN [PRK_Perks1].[PerkID] END,
     CASE @orderBy WHEN 'PRK_Perks1_PerkID DESC' THEN [PRK_Perks1].[PerkID] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_PerkCode' THEN [PRK_Perks1].[PerkCode] END,
     CASE @orderBy WHEN 'PRK_Perks1_PerkCode DESC' THEN [PRK_Perks1].[PerkCode] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_Description' THEN [PRK_Perks1].[Description] END,
     CASE @orderBy WHEN 'PRK_Perks1_Description DESC' THEN [PRK_Perks1].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_AdvanceApplicable' THEN [PRK_Perks1].[AdvanceApplicable] END,
     CASE @orderBy WHEN 'PRK_Perks1_AdvanceApplicable DESC' THEN [PRK_Perks1].[AdvanceApplicable] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_AdvanceMonths' THEN [PRK_Perks1].[AdvanceMonths] END,
     CASE @orderBy WHEN 'PRK_Perks1_AdvanceMonths DESC' THEN [PRK_Perks1].[AdvanceMonths] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_LockedMonths' THEN [PRK_Perks1].[LockedMonths] END,
     CASE @orderBy WHEN 'PRK_Perks1_LockedMonths DESC' THEN [PRK_Perks1].[LockedMonths] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_NoOfPayments' THEN [PRK_Perks1].[NoOfPayments] END,
     CASE @orderBy WHEN 'PRK_Perks1_NoOfPayments DESC' THEN [PRK_Perks1].[NoOfPayments] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_CarryForward' THEN [PRK_Perks1].[CarryForward] END,
     CASE @orderBy WHEN 'PRK_Perks1_CarryForward DESC' THEN [PRK_Perks1].[CarryForward] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_UOM' THEN [PRK_Perks1].[UOM] END,
     CASE @orderBy WHEN 'PRK_Perks1_UOM DESC' THEN [PRK_Perks1].[UOM] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_Active' THEN [PRK_Perks1].[Active] END,
     CASE @orderBy WHEN 'PRK_Perks1_Active DESC' THEN [PRK_Perks1].[Active] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_BaaNGL' THEN [PRK_Perks1].[BaaNGL] END,
     CASE @orderBy WHEN 'PRK_Perks1_BaaNGL DESC' THEN [PRK_Perks1].[BaaNGL] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_BaaNReference' THEN [PRK_Perks1].[BaaNReference] END,
     CASE @orderBy WHEN 'PRK_Perks1_BaaNReference DESC' THEN [PRK_Perks1].[BaaNReference] END DESC,
     CASE @orderBy WHEN 'PRK_Perks1_cmba' THEN [PRK_Perks1].[cmba] END,
     CASE @orderBy WHEN 'PRK_Perks1_cmba DESC' THEN [PRK_Perks1].[cmba] END DESC,
     CASE @orderBy WHEN 'PRK_Status2_StatusID' THEN [PRK_Status2].[StatusID] END,
     CASE @orderBy WHEN 'PRK_Status2_StatusID DESC' THEN [PRK_Status2].[StatusID] END DESC,
     CASE @orderBy WHEN 'PRK_Status2_Description' THEN [PRK_Status2].[Description] END,
     CASE @orderBy WHEN 'PRK_Status2_Description DESC' THEN [PRK_Status2].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears3_FinYear' THEN [PRK_FinYears3].[FinYear] END,
     CASE @orderBy WHEN 'PRK_FinYears3_FinYear DESC' THEN [PRK_FinYears3].[FinYear] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears3_Description' THEN [PRK_FinYears3].[Description] END,
     CASE @orderBy WHEN 'PRK_FinYears3_Description DESC' THEN [PRK_FinYears3].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears3_StartDate' THEN [PRK_FinYears3].[StartDate] END,
     CASE @orderBy WHEN 'PRK_FinYears3_StartDate DESC' THEN [PRK_FinYears3].[StartDate] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears3_EndDate' THEN [PRK_FinYears3].[EndDate] END,
     CASE @orderBy WHEN 'PRK_FinYears3_EndDate DESC' THEN [PRK_FinYears3].[EndDate] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears3_Status' THEN [PRK_FinYears3].[Status] END,
     CASE @orderBy WHEN 'PRK_FinYears3_Status DESC' THEN [PRK_FinYears3].[Status] END DESC 

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
    	INNER JOIN #PageIndex
          ON [PRK_Applications].[ApplicationID] = #PageIndex.ApplicationID
  INNER JOIN [PRK_Perks] AS [PRK_Perks1]
    ON [PRK_Applications].[PerkID] = [PRK_Perks1].[PerkID]
  INNER JOIN [PRK_Status] AS [PRK_Status2]
    ON [PRK_Applications].[StatusID] = [PRK_Status2].[StatusID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears3]
    ON [PRK_Applications].[FinYear] = [PRK_FinYears3].[FinYear]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
