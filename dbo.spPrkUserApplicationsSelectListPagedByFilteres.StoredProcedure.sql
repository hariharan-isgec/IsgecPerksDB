USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkUserApplicationsSelectListPagedByFilteres]
  @Filter_PerkID Int,
  @Filter_StatusID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @EmployeeID Int,
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
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Perks] AS [PRK_Perks1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[PerkID] = [PRK_Perks1].[PerkID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Status] AS [PRK_Status2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[StatusID] = [PRK_Status2].[StatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_FinYears] AS [PRK_FinYears3]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[FinYear] = [PRK_FinYears3].[FinYear]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_PerkID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[PerkID] = ' + STR(@Filter_PerkID)
  IF (@Filter_StatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[StatusID] = ' + STR(@Filter_StatusID)
  SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[EmployeeID] = ' + STR(@EmployeeID)
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
                        WHEN 'PRK_Perks1_PerkID' THEN '[PRK_Perks1].[PerkID]'
                        WHEN 'PRK_Perks1_PerkID DESC' THEN '[PRK_Perks1].[PerkID] DESC'
                        WHEN 'PRK_Perks1_PerkCode' THEN '[PRK_Perks1].[PerkCode]'
                        WHEN 'PRK_Perks1_PerkCode DESC' THEN '[PRK_Perks1].[PerkCode] DESC'
                        WHEN 'PRK_Perks1_Description' THEN '[PRK_Perks1].[Description]'
                        WHEN 'PRK_Perks1_Description DESC' THEN '[PRK_Perks1].[Description] DESC'
                        WHEN 'PRK_Perks1_AdvanceApplicable' THEN '[PRK_Perks1].[AdvanceApplicable]'
                        WHEN 'PRK_Perks1_AdvanceApplicable DESC' THEN '[PRK_Perks1].[AdvanceApplicable] DESC'
                        WHEN 'PRK_Perks1_AdvanceMonths' THEN '[PRK_Perks1].[AdvanceMonths]'
                        WHEN 'PRK_Perks1_AdvanceMonths DESC' THEN '[PRK_Perks1].[AdvanceMonths] DESC'
                        WHEN 'PRK_Perks1_LockedMonths' THEN '[PRK_Perks1].[LockedMonths]'
                        WHEN 'PRK_Perks1_LockedMonths DESC' THEN '[PRK_Perks1].[LockedMonths] DESC'
                        WHEN 'PRK_Perks1_NoOfPayments' THEN '[PRK_Perks1].[NoOfPayments]'
                        WHEN 'PRK_Perks1_NoOfPayments DESC' THEN '[PRK_Perks1].[NoOfPayments] DESC'
                        WHEN 'PRK_Perks1_CarryForward' THEN '[PRK_Perks1].[CarryForward]'
                        WHEN 'PRK_Perks1_CarryForward DESC' THEN '[PRK_Perks1].[CarryForward] DESC'
                        WHEN 'PRK_Perks1_UOM' THEN '[PRK_Perks1].[UOM]'
                        WHEN 'PRK_Perks1_UOM DESC' THEN '[PRK_Perks1].[UOM] DESC'
                        WHEN 'PRK_Perks1_Active' THEN '[PRK_Perks1].[Active]'
                        WHEN 'PRK_Perks1_Active DESC' THEN '[PRK_Perks1].[Active] DESC'
                        WHEN 'PRK_Perks1_BaaNGL' THEN '[PRK_Perks1].[BaaNGL]'
                        WHEN 'PRK_Perks1_BaaNGL DESC' THEN '[PRK_Perks1].[BaaNGL] DESC'
                        WHEN 'PRK_Perks1_BaaNReference' THEN '[PRK_Perks1].[BaaNReference]'
                        WHEN 'PRK_Perks1_BaaNReference DESC' THEN '[PRK_Perks1].[BaaNReference] DESC'
                        WHEN 'PRK_Perks1_cmba' THEN '[PRK_Perks1].[cmba]'
                        WHEN 'PRK_Perks1_cmba DESC' THEN '[PRK_Perks1].[cmba] DESC'
                        WHEN 'PRK_Status2_StatusID' THEN '[PRK_Status2].[StatusID]'
                        WHEN 'PRK_Status2_StatusID DESC' THEN '[PRK_Status2].[StatusID] DESC'
                        WHEN 'PRK_Status2_Description' THEN '[PRK_Status2].[Description]'
                        WHEN 'PRK_Status2_Description DESC' THEN '[PRK_Status2].[Description] DESC'
                        WHEN 'PRK_FinYears3_FinYear' THEN '[PRK_FinYears3].[FinYear]'
                        WHEN 'PRK_FinYears3_FinYear DESC' THEN '[PRK_FinYears3].[FinYear] DESC'
                        WHEN 'PRK_FinYears3_Description' THEN '[PRK_FinYears3].[Description]'
                        WHEN 'PRK_FinYears3_Description DESC' THEN '[PRK_FinYears3].[Description] DESC'
                        WHEN 'PRK_FinYears3_StartDate' THEN '[PRK_FinYears3].[StartDate]'
                        WHEN 'PRK_FinYears3_StartDate DESC' THEN '[PRK_FinYears3].[StartDate] DESC'
                        WHEN 'PRK_FinYears3_EndDate' THEN '[PRK_FinYears3].[EndDate]'
                        WHEN 'PRK_FinYears3_EndDate DESC' THEN '[PRK_FinYears3].[EndDate] DESC'
                        WHEN 'PRK_FinYears3_Status' THEN '[PRK_FinYears3].[Status]'
                        WHEN 'PRK_FinYears3_Status DESC' THEN '[PRK_FinYears3].[Status] DESC'
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
  END
GO
