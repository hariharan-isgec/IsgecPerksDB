USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkChequePaymentSelectListFilteres]
  @Filter_PerkID Int,
  @Filter_EmployeeID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @StatusID Int,
  @FinYear Int,
  @PaymentMethod NVarChar(20),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ClaimID Int NOT NULL
 ,ApplicationID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ClaimID'
  SET @LGSQL = @LGSQL + ', ApplicationID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PRK_Applications].[ClaimID]'
  SET @LGSQL = @LGSQL + ', [PRK_Applications].[ApplicationID]'
  SET @LGSQL = @LGSQL + ' FROM [PRK_Applications] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Employees] AS [PRK_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[ApprovedBy] = [PRK_Employees2].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[VerifiedBy] = [PRK_Employees3].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees4]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[UpdatedBy] = [PRK_Employees4].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[PostedBy] = [PRK_Employees5].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_FinYears] AS [PRK_FinYears6]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[FinYear] = [PRK_FinYears6].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Perks] AS [PRK_Perks7]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[PerkID] = [PRK_Perks7].[PerkID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Status] AS [PRK_Status8]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[StatusID] = [PRK_Status8].[StatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_UserClaims] AS [PRK_UserClaims9]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[ClaimID] = [PRK_UserClaims9].[ClaimID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[StatusID] = ''' + STR(@StatusID) + '''' 
  SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[FinYear] = ''' + STR(@FinYear) + '''' 
  SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[PaymentMethod] = (''' + @PaymentMethod + ''')'
  IF (@Filter_PerkID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[PerkID] = ' + STR(@Filter_PerkID)
  IF (@Filter_EmployeeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[EmployeeID] = ' + STR(@Filter_EmployeeID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ClaimID' THEN '[PRK_Applications].[ClaimID]'
                        WHEN 'ClaimID DESC' THEN '[PRK_Applications].[ClaimID] DESC'
                        WHEN 'ApplicationID' THEN '[PRK_Applications].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[PRK_Applications].[ApplicationID] DESC'
                        WHEN 'PerkID' THEN '[PRK_Applications].[PerkID]'
                        WHEN 'PerkID DESC' THEN '[PRK_Applications].[PerkID] DESC'
                        WHEN 'UserRemark' THEN '[PRK_Applications].[UserRemark]'
                        WHEN 'UserRemark DESC' THEN '[PRK_Applications].[UserRemark] DESC'
                        WHEN 'ApprovedBy' THEN '[PRK_Applications].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[PRK_Applications].[ApprovedBy] DESC'
                        WHEN 'Value' THEN '[PRK_Applications].[Value]'
                        WHEN 'Value DESC' THEN '[PRK_Applications].[Value] DESC'
                        WHEN 'PostedBy' THEN '[PRK_Applications].[PostedBy]'
                        WHEN 'PostedBy DESC' THEN '[PRK_Applications].[PostedBy] DESC'
                        WHEN 'ApprovedOn' THEN '[PRK_Applications].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[PRK_Applications].[ApprovedOn] DESC'
                        WHEN 'UpdatedOn' THEN '[PRK_Applications].[UpdatedOn]'
                        WHEN 'UpdatedOn DESC' THEN '[PRK_Applications].[UpdatedOn] DESC'
                        WHEN 'ExcessClaimed' THEN '[PRK_Applications].[ExcessClaimed]'
                        WHEN 'ExcessClaimed DESC' THEN '[PRK_Applications].[ExcessClaimed] DESC'
                        WHEN 'StatusID' THEN '[PRK_Applications].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[PRK_Applications].[StatusID] DESC'
                        WHEN 'ApprovedValue' THEN '[PRK_Applications].[ApprovedValue]'
                        WHEN 'ApprovedValue DESC' THEN '[PRK_Applications].[ApprovedValue] DESC'
                        WHEN 'FinYear' THEN '[PRK_Applications].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PRK_Applications].[FinYear] DESC'
                        WHEN 'Selected' THEN '[PRK_Applications].[Selected]'
                        WHEN 'Selected DESC' THEN '[PRK_Applications].[Selected] DESC'
                        WHEN 'PostedOn' THEN '[PRK_Applications].[PostedOn]'
                        WHEN 'PostedOn DESC' THEN '[PRK_Applications].[PostedOn] DESC'
                        WHEN 'VerifiedAmt' THEN '[PRK_Applications].[VerifiedAmt]'
                        WHEN 'VerifiedAmt DESC' THEN '[PRK_Applications].[VerifiedAmt] DESC'
                        WHEN 'VerifiedValue' THEN '[PRK_Applications].[VerifiedValue]'
                        WHEN 'VerifiedValue DESC' THEN '[PRK_Applications].[VerifiedValue] DESC'
                        WHEN 'PaymentMethod' THEN '[PRK_Applications].[PaymentMethod]'
                        WHEN 'PaymentMethod DESC' THEN '[PRK_Applications].[PaymentMethod] DESC'
                        WHEN 'Approved' THEN '[PRK_Applications].[Approved]'
                        WHEN 'Approved DESC' THEN '[PRK_Applications].[Approved] DESC'
                        WHEN 'ApprovedAmt' THEN '[PRK_Applications].[ApprovedAmt]'
                        WHEN 'ApprovedAmt DESC' THEN '[PRK_Applications].[ApprovedAmt] DESC'
                        WHEN 'Verified' THEN '[PRK_Applications].[Verified]'
                        WHEN 'Verified DESC' THEN '[PRK_Applications].[Verified] DESC'
                        WHEN 'EmployeeID' THEN '[PRK_Applications].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[PRK_Applications].[EmployeeID] DESC'
                        WHEN 'AppliedOn' THEN '[PRK_Applications].[AppliedOn]'
                        WHEN 'AppliedOn DESC' THEN '[PRK_Applications].[AppliedOn] DESC'
                        WHEN 'Documents' THEN '[PRK_Applications].[Documents]'
                        WHEN 'Documents DESC' THEN '[PRK_Applications].[Documents] DESC'
                        WHEN 'ApproverRemark' THEN '[PRK_Applications].[ApproverRemark]'
                        WHEN 'ApproverRemark DESC' THEN '[PRK_Applications].[ApproverRemark] DESC'
                        WHEN 'PostedInBaaN' THEN '[PRK_Applications].[PostedInBaaN]'
                        WHEN 'PostedInBaaN DESC' THEN '[PRK_Applications].[PostedInBaaN] DESC'
                        WHEN 'VerifierRemark' THEN '[PRK_Applications].[VerifierRemark]'
                        WHEN 'VerifierRemark DESC' THEN '[PRK_Applications].[VerifierRemark] DESC'
                        WHEN 'VerifiedOn' THEN '[PRK_Applications].[VerifiedOn]'
                        WHEN 'VerifiedOn DESC' THEN '[PRK_Applications].[VerifiedOn] DESC'
                        WHEN 'UpdatedBy' THEN '[PRK_Applications].[UpdatedBy]'
                        WHEN 'UpdatedBy DESC' THEN '[PRK_Applications].[UpdatedBy] DESC'
                        WHEN 'UpdatedInLedger' THEN '[PRK_Applications].[UpdatedInLedger]'
                        WHEN 'UpdatedInLedger DESC' THEN '[PRK_Applications].[UpdatedInLedger] DESC'
                        WHEN 'VerifiedBy' THEN '[PRK_Applications].[VerifiedBy]'
                        WHEN 'VerifiedBy DESC' THEN '[PRK_Applications].[VerifiedBy] DESC'
                        WHEN 'Applied' THEN '[PRK_Applications].[Applied]'
                        WHEN 'Applied DESC' THEN '[PRK_Applications].[Applied] DESC'
                        WHEN 'PRK_Employees1_EmployeeName' THEN '[PRK_Employees1].[EmployeeName]'
                        WHEN 'PRK_Employees1_EmployeeName DESC' THEN '[PRK_Employees1].[EmployeeName] DESC'
                        WHEN 'PRK_Employees2_EmployeeName' THEN '[PRK_Employees2].[EmployeeName]'
                        WHEN 'PRK_Employees2_EmployeeName DESC' THEN '[PRK_Employees2].[EmployeeName] DESC'
                        WHEN 'PRK_Employees3_EmployeeName' THEN '[PRK_Employees3].[EmployeeName]'
                        WHEN 'PRK_Employees3_EmployeeName DESC' THEN '[PRK_Employees3].[EmployeeName] DESC'
                        WHEN 'PRK_Employees4_EmployeeName' THEN '[PRK_Employees4].[EmployeeName]'
                        WHEN 'PRK_Employees4_EmployeeName DESC' THEN '[PRK_Employees4].[EmployeeName] DESC'
                        WHEN 'PRK_Employees5_EmployeeName' THEN '[PRK_Employees5].[EmployeeName]'
                        WHEN 'PRK_Employees5_EmployeeName DESC' THEN '[PRK_Employees5].[EmployeeName] DESC'
                        WHEN 'PRK_FinYears6_Description' THEN '[PRK_FinYears6].[Description]'
                        WHEN 'PRK_FinYears6_Description DESC' THEN '[PRK_FinYears6].[Description] DESC'
                        WHEN 'PRK_Perks7_Description' THEN '[PRK_Perks7].[Description]'
                        WHEN 'PRK_Perks7_Description DESC' THEN '[PRK_Perks7].[Description] DESC'
                        WHEN 'PRK_Status8_Description' THEN '[PRK_Status8].[Description]'
                        WHEN 'PRK_Status8_Description DESC' THEN '[PRK_Status8].[Description] DESC'
                        WHEN 'PRK_UserClaims9_Description' THEN '[PRK_UserClaims9].[Description]'
                        WHEN 'PRK_UserClaims9_Description DESC' THEN '[PRK_UserClaims9].[Description] DESC'
                        ELSE '[PRK_Applications].[ClaimID],[PRK_Applications].[ApplicationID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PRK_Applications].* ,
    [PRK_Employees1].[EmployeeName] AS PRK_Employees1_EmployeeName,
    [PRK_Employees2].[EmployeeName] AS PRK_Employees2_EmployeeName,
    [PRK_Employees3].[EmployeeName] AS PRK_Employees3_EmployeeName,
    [PRK_Employees4].[EmployeeName] AS PRK_Employees4_EmployeeName,
    [PRK_Employees5].[EmployeeName] AS PRK_Employees5_EmployeeName,
    [PRK_FinYears6].[Description] AS PRK_FinYears6_Description,
    [PRK_Perks7].[Description] AS PRK_Perks7_Description,
    [PRK_Status8].[Description] AS PRK_Status8_Description,
    [PRK_UserClaims9].[Description] AS PRK_UserClaims9_Description 
  FROM [PRK_Applications] 
      INNER JOIN #PageIndex
          ON [PRK_Applications].[ClaimID] = #PageIndex.ClaimID
          AND [PRK_Applications].[ApplicationID] = #PageIndex.ApplicationID
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees2]
    ON [PRK_Applications].[ApprovedBy] = [PRK_Employees2].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [PRK_Applications].[VerifiedBy] = [PRK_Employees3].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees4]
    ON [PRK_Applications].[UpdatedBy] = [PRK_Employees4].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [PRK_Applications].[PostedBy] = [PRK_Employees5].[EmployeeID]
  LEFT OUTER JOIN [PRK_FinYears] AS [PRK_FinYears6]
    ON [PRK_Applications].[FinYear] = [PRK_FinYears6].[FinYear]
  INNER JOIN [PRK_Perks] AS [PRK_Perks7]
    ON [PRK_Applications].[PerkID] = [PRK_Perks7].[PerkID]
  INNER JOIN [PRK_Status] AS [PRK_Status8]
    ON [PRK_Applications].[StatusID] = [PRK_Status8].[StatusID]
  INNER JOIN [PRK_UserClaims] AS [PRK_UserClaims9]
    ON [PRK_Applications].[ClaimID] = [PRK_UserClaims9].[ClaimID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
