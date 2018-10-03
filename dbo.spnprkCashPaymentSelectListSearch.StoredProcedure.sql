USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkCashPaymentSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @FinYear Int,
  @StatusID Int,
  @PaymentMethod NVarChar(20),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ClaimID Int NOT NULL
 ,ApplicationID Int NOT NULL
  )
  INSERT INTO #PageIndex (ClaimID, ApplicationID)
  SELECT [PRK_Applications].[ClaimID], [PRK_Applications].[ApplicationID] FROM [PRK_Applications]
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
      [PRK_Applications].[FinYear] = (@FinYear)
  AND [PRK_Applications].[StatusID] = (@StatusID)
  AND [PRK_Applications].[PaymentMethod] = (@PaymentMethod)
   AND ( 
         STR(ISNULL([PRK_Applications].[ClaimID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[ApplicationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[PerkID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications].[UserRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[FinYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[ApprovedBy], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[ApprovedValue], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications].[VerifierRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[Value], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[VerifiedBy], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[UpdatedBy], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications].[PaymentMethod],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[ApprovedAmt], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[EmployeeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications].[ApproverRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[VerifiedValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[VerifiedAmt], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[PostedBy], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ClaimID' THEN [PRK_Applications].[ClaimID] END,
     CASE @OrderBy WHEN 'ClaimID DESC' THEN [PRK_Applications].[ClaimID] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [PRK_Applications].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [PRK_Applications].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'PerkID' THEN [PRK_Applications].[PerkID] END,
     CASE @OrderBy WHEN 'PerkID DESC' THEN [PRK_Applications].[PerkID] END DESC,
     CASE @OrderBy WHEN 'UserRemark' THEN [PRK_Applications].[UserRemark] END,
     CASE @OrderBy WHEN 'UserRemark DESC' THEN [PRK_Applications].[UserRemark] END DESC,
     CASE @OrderBy WHEN 'Selected' THEN [PRK_Applications].[Selected] END,
     CASE @OrderBy WHEN 'Selected DESC' THEN [PRK_Applications].[Selected] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [PRK_Applications].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PRK_Applications].[FinYear] END DESC,
     CASE @OrderBy WHEN 'ApprovedBy' THEN [PRK_Applications].[ApprovedBy] END,
     CASE @OrderBy WHEN 'ApprovedBy DESC' THEN [PRK_Applications].[ApprovedBy] END DESC,
     CASE @OrderBy WHEN 'ExcessClaimed' THEN [PRK_Applications].[ExcessClaimed] END,
     CASE @OrderBy WHEN 'ExcessClaimed DESC' THEN [PRK_Applications].[ExcessClaimed] END DESC,
     CASE @OrderBy WHEN 'PostedOn' THEN [PRK_Applications].[PostedOn] END,
     CASE @OrderBy WHEN 'PostedOn DESC' THEN [PRK_Applications].[PostedOn] END DESC,
     CASE @OrderBy WHEN 'ApprovedValue' THEN [PRK_Applications].[ApprovedValue] END,
     CASE @OrderBy WHEN 'ApprovedValue DESC' THEN [PRK_Applications].[ApprovedValue] END DESC,
     CASE @OrderBy WHEN 'VerifierRemark' THEN [PRK_Applications].[VerifierRemark] END,
     CASE @OrderBy WHEN 'VerifierRemark DESC' THEN [PRK_Applications].[VerifierRemark] END DESC,
     CASE @OrderBy WHEN 'ApprovedOn' THEN [PRK_Applications].[ApprovedOn] END,
     CASE @OrderBy WHEN 'ApprovedOn DESC' THEN [PRK_Applications].[ApprovedOn] END DESC,
     CASE @OrderBy WHEN 'PostedInBaaN' THEN [PRK_Applications].[PostedInBaaN] END,
     CASE @OrderBy WHEN 'PostedInBaaN DESC' THEN [PRK_Applications].[PostedInBaaN] END DESC,
     CASE @OrderBy WHEN 'Value' THEN [PRK_Applications].[Value] END,
     CASE @OrderBy WHEN 'Value DESC' THEN [PRK_Applications].[Value] END DESC,
     CASE @OrderBy WHEN 'VerifiedBy' THEN [PRK_Applications].[VerifiedBy] END,
     CASE @OrderBy WHEN 'VerifiedBy DESC' THEN [PRK_Applications].[VerifiedBy] END DESC,
     CASE @OrderBy WHEN 'UpdatedBy' THEN [PRK_Applications].[UpdatedBy] END,
     CASE @OrderBy WHEN 'UpdatedBy DESC' THEN [PRK_Applications].[UpdatedBy] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [PRK_Applications].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [PRK_Applications].[StatusID] END DESC,
     CASE @OrderBy WHEN 'PaymentMethod' THEN [PRK_Applications].[PaymentMethod] END,
     CASE @OrderBy WHEN 'PaymentMethod DESC' THEN [PRK_Applications].[PaymentMethod] END DESC,
     CASE @OrderBy WHEN 'Approved' THEN [PRK_Applications].[Approved] END,
     CASE @OrderBy WHEN 'Approved DESC' THEN [PRK_Applications].[Approved] END DESC,
     CASE @OrderBy WHEN 'ApprovedAmt' THEN [PRK_Applications].[ApprovedAmt] END,
     CASE @OrderBy WHEN 'ApprovedAmt DESC' THEN [PRK_Applications].[ApprovedAmt] END DESC,
     CASE @OrderBy WHEN 'Verified' THEN [PRK_Applications].[Verified] END,
     CASE @OrderBy WHEN 'Verified DESC' THEN [PRK_Applications].[Verified] END DESC,
     CASE @OrderBy WHEN 'EmployeeID' THEN [PRK_Applications].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [PRK_Applications].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'AppliedOn' THEN [PRK_Applications].[AppliedOn] END,
     CASE @OrderBy WHEN 'AppliedOn DESC' THEN [PRK_Applications].[AppliedOn] END DESC,
     CASE @OrderBy WHEN 'Documents' THEN [PRK_Applications].[Documents] END,
     CASE @OrderBy WHEN 'Documents DESC' THEN [PRK_Applications].[Documents] END DESC,
     CASE @OrderBy WHEN 'ApproverRemark' THEN [PRK_Applications].[ApproverRemark] END,
     CASE @OrderBy WHEN 'ApproverRemark DESC' THEN [PRK_Applications].[ApproverRemark] END DESC,
     CASE @OrderBy WHEN 'UpdatedOn' THEN [PRK_Applications].[UpdatedOn] END,
     CASE @OrderBy WHEN 'UpdatedOn DESC' THEN [PRK_Applications].[UpdatedOn] END DESC,
     CASE @OrderBy WHEN 'VerifiedValue' THEN [PRK_Applications].[VerifiedValue] END,
     CASE @OrderBy WHEN 'VerifiedValue DESC' THEN [PRK_Applications].[VerifiedValue] END DESC,
     CASE @OrderBy WHEN 'VerifiedOn' THEN [PRK_Applications].[VerifiedOn] END,
     CASE @OrderBy WHEN 'VerifiedOn DESC' THEN [PRK_Applications].[VerifiedOn] END DESC,
     CASE @OrderBy WHEN 'VerifiedAmt' THEN [PRK_Applications].[VerifiedAmt] END,
     CASE @OrderBy WHEN 'VerifiedAmt DESC' THEN [PRK_Applications].[VerifiedAmt] END DESC,
     CASE @OrderBy WHEN 'UpdatedInLedger' THEN [PRK_Applications].[UpdatedInLedger] END,
     CASE @OrderBy WHEN 'UpdatedInLedger DESC' THEN [PRK_Applications].[UpdatedInLedger] END DESC,
     CASE @OrderBy WHEN 'Applied' THEN [PRK_Applications].[Applied] END,
     CASE @OrderBy WHEN 'Applied DESC' THEN [PRK_Applications].[Applied] END DESC,
     CASE @OrderBy WHEN 'PostedBy' THEN [PRK_Applications].[PostedBy] END,
     CASE @OrderBy WHEN 'PostedBy DESC' THEN [PRK_Applications].[PostedBy] END DESC,
     CASE @OrderBy WHEN 'PRK_Employees1_EmployeeName' THEN [PRK_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'PRK_Employees1_EmployeeName DESC' THEN [PRK_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PRK_Employees2_EmployeeName' THEN [PRK_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'PRK_Employees2_EmployeeName DESC' THEN [PRK_Employees2].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PRK_Employees3_EmployeeName' THEN [PRK_Employees3].[EmployeeName] END,
     CASE @OrderBy WHEN 'PRK_Employees3_EmployeeName DESC' THEN [PRK_Employees3].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PRK_Employees4_EmployeeName' THEN [PRK_Employees4].[EmployeeName] END,
     CASE @OrderBy WHEN 'PRK_Employees4_EmployeeName DESC' THEN [PRK_Employees4].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PRK_Employees5_EmployeeName' THEN [PRK_Employees5].[EmployeeName] END,
     CASE @OrderBy WHEN 'PRK_Employees5_EmployeeName DESC' THEN [PRK_Employees5].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'PRK_FinYears6_Description' THEN [PRK_FinYears6].[Description] END,
     CASE @OrderBy WHEN 'PRK_FinYears6_Description DESC' THEN [PRK_FinYears6].[Description] END DESC,
     CASE @OrderBy WHEN 'PRK_Perks7_Description' THEN [PRK_Perks7].[Description] END,
     CASE @OrderBy WHEN 'PRK_Perks7_Description DESC' THEN [PRK_Perks7].[Description] END DESC,
     CASE @OrderBy WHEN 'PRK_Status8_Description' THEN [PRK_Status8].[Description] END,
     CASE @OrderBy WHEN 'PRK_Status8_Description DESC' THEN [PRK_Status8].[Description] END DESC,
     CASE @OrderBy WHEN 'PRK_UserClaims9_Description' THEN [PRK_UserClaims9].[Description] END,
     CASE @OrderBy WHEN 'PRK_UserClaims9_Description DESC' THEN [PRK_UserClaims9].[Description] END DESC 

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
