USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkAdminApplicationsSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
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
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Applications].[PerkID] = [PRK_Perks2].[PerkID]
  INNER JOIN [PRK_Status] AS [PRK_Status3]
    ON [PRK_Applications].[StatusID] = [PRK_Status3].[StatusID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears4]
    ON [PRK_Applications].[FinYear] = [PRK_FinYears4].[FinYear]
  WHERE [PRK_Applications].[StatusID] != @StatusID
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
     CASE @orderBy WHEN 'PRK_Status3_StatusID' THEN [PRK_Status3].[StatusID] END,
     CASE @orderBy WHEN 'PRK_Status3_StatusID DESC' THEN [PRK_Status3].[StatusID] END DESC,
     CASE @orderBy WHEN 'PRK_Status3_Description' THEN [PRK_Status3].[Description] END,
     CASE @orderBy WHEN 'PRK_Status3_Description DESC' THEN [PRK_Status3].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears4_FinYear' THEN [PRK_FinYears4].[FinYear] END,
     CASE @orderBy WHEN 'PRK_FinYears4_FinYear DESC' THEN [PRK_FinYears4].[FinYear] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears4_Description' THEN [PRK_FinYears4].[Description] END,
     CASE @orderBy WHEN 'PRK_FinYears4_Description DESC' THEN [PRK_FinYears4].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears4_StartDate' THEN [PRK_FinYears4].[StartDate] END,
     CASE @orderBy WHEN 'PRK_FinYears4_StartDate DESC' THEN [PRK_FinYears4].[StartDate] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears4_EndDate' THEN [PRK_FinYears4].[EndDate] END,
     CASE @orderBy WHEN 'PRK_FinYears4_EndDate DESC' THEN [PRK_FinYears4].[EndDate] END DESC,
     CASE @orderBy WHEN 'PRK_FinYears4_Status' THEN [PRK_FinYears4].[Status] END,
     CASE @orderBy WHEN 'PRK_FinYears4_Status DESC' THEN [PRK_FinYears4].[Status] END DESC 

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
GO
