USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkUserClaimsSelectList]
  @CardNo NVarChar(8),
  @FinYear Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PRK_UserClaims].* ,
    [PRK_ClaimStatus4].[Description] AS PRK_ClaimStatus4_Description,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [PRK_FinYears5].[Description] AS PRK_FinYears5_Description 
  FROM [PRK_UserClaims] 
  LEFT OUTER JOIN [PRK_ClaimStatus] AS [PRK_ClaimStatus4]
    ON [PRK_UserClaims].[ClaimStatusID] = [PRK_ClaimStatus4].[ClaimStatusID]
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PRK_UserClaims].[CardNo] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [PRK_UserClaims].[ReceivedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [PRK_UserClaims].[ReturnedBy] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [PRK_FinYears] AS [PRK_FinYears5]
    ON [PRK_UserClaims].[FinYear] = [PRK_FinYears5].[FinYear]
  WHERE 1 = 1  
  AND [PRK_UserClaims].[CardNo] = (@CardNo)  
  AND [PRK_UserClaims].[FinYear] = (@FinYear)  
  ORDER BY
     CASE @OrderBy WHEN 'ClaimID' THEN [PRK_UserClaims].[ClaimID] END,
     CASE @OrderBy WHEN 'ClaimID DESC' THEN [PRK_UserClaims].[ClaimID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PRK_UserClaims].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PRK_UserClaims].[Description] END DESC,
     CASE @OrderBy WHEN 'CardNo' THEN [PRK_UserClaims].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [PRK_UserClaims].[CardNo] END DESC,
     CASE @OrderBy WHEN 'PassedAmount' THEN [PRK_UserClaims].[PassedAmount] END,
     CASE @OrderBy WHEN 'PassedAmount DESC' THEN [PRK_UserClaims].[PassedAmount] END DESC,
     CASE @OrderBy WHEN 'TotalAmount' THEN [PRK_UserClaims].[TotalAmount] END,
     CASE @OrderBy WHEN 'TotalAmount DESC' THEN [PRK_UserClaims].[TotalAmount] END DESC,
     CASE @OrderBy WHEN 'DeclarationAccepted' THEN [PRK_UserClaims].[DeclarationAccepted] END,
     CASE @OrderBy WHEN 'DeclarationAccepted DESC' THEN [PRK_UserClaims].[DeclarationAccepted] END DESC,
     CASE @OrderBy WHEN 'SubmittedOn' THEN [PRK_UserClaims].[SubmittedOn] END,
     CASE @OrderBy WHEN 'SubmittedOn DESC' THEN [PRK_UserClaims].[SubmittedOn] END DESC,
     CASE @OrderBy WHEN 'ReceivedOn' THEN [PRK_UserClaims].[ReceivedOn] END,
     CASE @OrderBy WHEN 'ReceivedOn DESC' THEN [PRK_UserClaims].[ReceivedOn] END DESC,
     CASE @OrderBy WHEN 'ReceivedBy' THEN [PRK_UserClaims].[ReceivedBy] END,
     CASE @OrderBy WHEN 'ReceivedBy DESC' THEN [PRK_UserClaims].[ReceivedBy] END DESC,
     CASE @OrderBy WHEN 'ReturnedOn' THEN [PRK_UserClaims].[ReturnedOn] END,
     CASE @OrderBy WHEN 'ReturnedOn DESC' THEN [PRK_UserClaims].[ReturnedOn] END DESC,
     CASE @OrderBy WHEN 'ReturnedBy' THEN [PRK_UserClaims].[ReturnedBy] END,
     CASE @OrderBy WHEN 'ReturnedBy DESC' THEN [PRK_UserClaims].[ReturnedBy] END DESC,
     CASE @OrderBy WHEN 'CompletedOn' THEN [PRK_UserClaims].[CompletedOn] END,
     CASE @OrderBy WHEN 'CompletedOn DESC' THEN [PRK_UserClaims].[CompletedOn] END DESC,
     CASE @OrderBy WHEN 'AccountsRemarks' THEN [PRK_UserClaims].[AccountsRemarks] END,
     CASE @OrderBy WHEN 'AccountsRemarks DESC' THEN [PRK_UserClaims].[AccountsRemarks] END DESC,
     CASE @OrderBy WHEN 'ClaimStatusID' THEN [PRK_UserClaims].[ClaimStatusID] END,
     CASE @OrderBy WHEN 'ClaimStatusID DESC' THEN [PRK_UserClaims].[ClaimStatusID] END DESC,
     CASE @OrderBy WHEN 'ClaimRefNo' THEN [PRK_UserClaims].[ClaimRefNo] END,
     CASE @OrderBy WHEN 'ClaimRefNo DESC' THEN [PRK_UserClaims].[ClaimRefNo] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [PRK_UserClaims].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PRK_UserClaims].[FinYear] END DESC,
     CASE @OrderBy WHEN 'forRef' THEN [PRK_UserClaims].[forRef] END,
     CASE @OrderBy WHEN 'forRef DESC' THEN [PRK_UserClaims].[forRef] END DESC,
     CASE @OrderBy WHEN 'PRK_ClaimStatus4_Description' THEN [PRK_ClaimStatus4].[Description] END,
     CASE @OrderBy WHEN 'PRK_ClaimStatus4_Description DESC' THEN [PRK_ClaimStatus4].[Description] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'PRK_FinYears5_Description' THEN [PRK_FinYears5].[Description] END,
     CASE @OrderBy WHEN 'PRK_FinYears5_Description DESC' THEN [PRK_FinYears5].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
