USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkUserClaimsSelectByID]
  @LoginID NVarChar(8),
  @ClaimID Int 
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
  WHERE
  [PRK_UserClaims].[ClaimID] = @ClaimID
GO
