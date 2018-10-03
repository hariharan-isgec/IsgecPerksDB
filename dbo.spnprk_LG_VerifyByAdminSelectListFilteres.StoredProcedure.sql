USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprk_LG_VerifyByAdminSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ClaimID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ClaimID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PRK_UserClaims].[ClaimID]'
  SET @LGSQL = @LGSQL + ' FROM [PRK_UserClaims] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_ClaimStatus] AS [PRK_ClaimStatus4]'
  SET @LGSQL = @LGSQL + '    ON [PRK_UserClaims].[ClaimStatusID] = [PRK_ClaimStatus4].[ClaimStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_UserClaims].[CardNo] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_UserClaims].[ReceivedBy] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]'
  SET @LGSQL = @LGSQL + '    ON [PRK_UserClaims].[ReturnedBy] = [aspnet_users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [PRK_UserClaims].[ClaimStatusID] = 8' 
  -- IN (3,4) ' 
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [PRK_UserClaims].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ClaimID' THEN '[PRK_UserClaims].[ClaimID]'
                        WHEN 'ClaimID DESC' THEN '[PRK_UserClaims].[ClaimID] DESC'
                        WHEN 'Description' THEN '[PRK_UserClaims].[Description]'
                        WHEN 'Description DESC' THEN '[PRK_UserClaims].[Description] DESC'
                        WHEN 'CardNo' THEN '[PRK_UserClaims].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[PRK_UserClaims].[CardNo] DESC'
                        WHEN 'PassedAmount' THEN '[PRK_UserClaims].[PassedAmount]'
                        WHEN 'PassedAmount DESC' THEN '[PRK_UserClaims].[PassedAmount] DESC'
                        WHEN 'TotalAmount' THEN '[PRK_UserClaims].[TotalAmount]'
                        WHEN 'TotalAmount DESC' THEN '[PRK_UserClaims].[TotalAmount] DESC'
                        WHEN 'DeclarationAccepted' THEN '[PRK_UserClaims].[DeclarationAccepted]'
                        WHEN 'DeclarationAccepted DESC' THEN '[PRK_UserClaims].[DeclarationAccepted] DESC'
                        WHEN 'SubmittedOn' THEN '[PRK_UserClaims].[SubmittedOn]'
                        WHEN 'SubmittedOn DESC' THEN '[PRK_UserClaims].[SubmittedOn] DESC'
                        WHEN 'ReceivedOn' THEN '[PRK_UserClaims].[ReceivedOn]'
                        WHEN 'ReceivedOn DESC' THEN '[PRK_UserClaims].[ReceivedOn] DESC'
                        WHEN 'ReceivedBy' THEN '[PRK_UserClaims].[ReceivedBy]'
                        WHEN 'ReceivedBy DESC' THEN '[PRK_UserClaims].[ReceivedBy] DESC'
                        WHEN 'ReturnedOn' THEN '[PRK_UserClaims].[ReturnedOn]'
                        WHEN 'ReturnedOn DESC' THEN '[PRK_UserClaims].[ReturnedOn] DESC'
                        WHEN 'ReturnedBy' THEN '[PRK_UserClaims].[ReturnedBy]'
                        WHEN 'ReturnedBy DESC' THEN '[PRK_UserClaims].[ReturnedBy] DESC'
                        WHEN 'CompletedOn' THEN '[PRK_UserClaims].[CompletedOn]'
                        WHEN 'CompletedOn DESC' THEN '[PRK_UserClaims].[CompletedOn] DESC'
                        WHEN 'AccountsRemarks' THEN '[PRK_UserClaims].[AccountsRemarks]'
                        WHEN 'AccountsRemarks DESC' THEN '[PRK_UserClaims].[AccountsRemarks] DESC'
                        WHEN 'ClaimStatusID' THEN '[PRK_UserClaims].[ClaimStatusID]'
                        WHEN 'ClaimStatusID DESC' THEN '[PRK_UserClaims].[ClaimStatusID] DESC'
                        WHEN 'PRK_ClaimStatus4_Description' THEN '[PRK_ClaimStatus4].[Description]'
                        WHEN 'PRK_ClaimStatus4_Description DESC' THEN '[PRK_ClaimStatus4].[Description] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        ELSE '[PRK_UserClaims].[ClaimID]'
                    END
  EXEC (@LGSQL)

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
