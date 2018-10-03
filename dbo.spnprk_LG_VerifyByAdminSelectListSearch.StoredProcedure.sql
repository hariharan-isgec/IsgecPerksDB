USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprk_LG_VerifyByAdminSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ClaimID Int NOT NULL
  )
  INSERT INTO #PageIndex (ClaimID)
  SELECT [PRK_UserClaims].[ClaimID] FROM [PRK_UserClaims]
  LEFT OUTER JOIN [PRK_ClaimStatus] AS [PRK_ClaimStatus4]
    ON [PRK_UserClaims].[ClaimStatusID] = [PRK_ClaimStatus4].[ClaimStatusID]
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PRK_UserClaims].[CardNo] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [PRK_UserClaims].[ReceivedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [PRK_UserClaims].[ReturnedBy] = [aspnet_users3].[LoginID]
 WHERE  
      [PRK_UserClaims].[ClaimStatusID] = 8  
   AND ( 
         STR(ISNULL([PRK_UserClaims].[ClaimID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_UserClaims].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_UserClaims].[CardNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_UserClaims].[PassedAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_UserClaims].[TotalAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_UserClaims].[ReceivedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_UserClaims].[ReturnedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_UserClaims].[AccountsRemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_UserClaims].[ClaimStatusID], 0)) LIKE @KeyWord1
   ) 
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
     CASE @OrderBy WHEN 'PRK_ClaimStatus4_Description' THEN [PRK_ClaimStatus4].[Description] END,
     CASE @OrderBy WHEN 'PRK_ClaimStatus4_Description DESC' THEN [PRK_ClaimStatus4].[Description] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PRK_UserClaims].* ,
    [PRK_ClaimStatus4].[Description] AS PRK_ClaimStatus4_Description,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName 
  FROM [PRK_UserClaims] 
      INNER JOIN #PageIndex
          ON [PRK_UserClaims].[ClaimID] = #PageIndex.ClaimID
  LEFT OUTER JOIN [PRK_ClaimStatus] AS [PRK_ClaimStatus4]
    ON [PRK_UserClaims].[ClaimStatusID] = [PRK_ClaimStatus4].[ClaimStatusID]
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PRK_UserClaims].[CardNo] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [PRK_UserClaims].[ReceivedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [PRK_UserClaims].[ReturnedBy] = [aspnet_users3].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
