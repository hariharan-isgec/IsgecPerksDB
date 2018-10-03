USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkBillDetailsSelectListFilteres]
  @Filter_ClaimID Int,
  @Filter_ApplicationID Int,
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
 ,ApplicationID Int NOT NULL
 ,AttachmentID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ClaimID'
  SET @LGSQL = @LGSQL + ', ApplicationID'
  SET @LGSQL = @LGSQL + ', AttachmentID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PRK_BillDetails].[ClaimID]'
  SET @LGSQL = @LGSQL + ', [PRK_BillDetails].[ApplicationID]'
  SET @LGSQL = @LGSQL + ', [PRK_BillDetails].[AttachmentID]'
  SET @LGSQL = @LGSQL + ' FROM [PRK_BillDetails] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Applications] AS [PRK_Applications2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_BillDetails].[ClaimID] = [PRK_Applications2].[ClaimID]'
  SET @LGSQL = @LGSQL + '    AND [PRK_BillDetails].[ApplicationID] = [PRK_Applications2].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_UserClaims] AS [PRK_UserClaims1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_BillDetails].[ClaimID] = [PRK_UserClaims1].[ClaimID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ClaimID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_BillDetails].[ClaimID] = ' + STR(@Filter_ClaimID)
  IF (@Filter_ApplicationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_BillDetails].[ApplicationID] = ' + STR(@Filter_ApplicationID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ClaimID' THEN '[PRK_BillDetails].[ClaimID]'
                        WHEN 'ClaimID DESC' THEN '[PRK_BillDetails].[ClaimID] DESC'
                        WHEN 'ApplicationID' THEN '[PRK_BillDetails].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[PRK_BillDetails].[ApplicationID] DESC'
                        WHEN 'AttachmentID' THEN '[PRK_BillDetails].[AttachmentID]'
                        WHEN 'AttachmentID DESC' THEN '[PRK_BillDetails].[AttachmentID] DESC'
                        WHEN 'BillNo' THEN '[PRK_BillDetails].[BillNo]'
                        WHEN 'BillNo DESC' THEN '[PRK_BillDetails].[BillNo] DESC'
                        WHEN 'BillDate' THEN '[PRK_BillDetails].[BillDate]'
                        WHEN 'BillDate DESC' THEN '[PRK_BillDetails].[BillDate] DESC'
                        WHEN 'FromDate' THEN '[PRK_BillDetails].[FromDate]'
                        WHEN 'FromDate DESC' THEN '[PRK_BillDetails].[FromDate] DESC'
                        WHEN 'ToDate' THEN '[PRK_BillDetails].[ToDate]'
                        WHEN 'ToDate DESC' THEN '[PRK_BillDetails].[ToDate] DESC'
                        WHEN 'Description' THEN '[PRK_BillDetails].[Description]'
                        WHEN 'Description DESC' THEN '[PRK_BillDetails].[Description] DESC'
                        WHEN 'Particulars' THEN '[PRK_BillDetails].[Particulars]'
                        WHEN 'Particulars DESC' THEN '[PRK_BillDetails].[Particulars] DESC'
                        WHEN 'Quantity' THEN '[PRK_BillDetails].[Quantity]'
                        WHEN 'Quantity DESC' THEN '[PRK_BillDetails].[Quantity] DESC'
                        WHEN 'Amount' THEN '[PRK_BillDetails].[Amount]'
                        WHEN 'Amount DESC' THEN '[PRK_BillDetails].[Amount] DESC'
                        WHEN 'SerialNo' THEN '[PRK_BillDetails].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PRK_BillDetails].[SerialNo] DESC'
                        WHEN 'PRK_Applications2_UserRemark' THEN '[PRK_Applications2].[UserRemark]'
                        WHEN 'PRK_Applications2_UserRemark DESC' THEN '[PRK_Applications2].[UserRemark] DESC'
                        WHEN 'PRK_UserClaims1_Description' THEN '[PRK_UserClaims1].[Description]'
                        WHEN 'PRK_UserClaims1_Description DESC' THEN '[PRK_UserClaims1].[Description] DESC'
                        ELSE '[PRK_BillDetails].[ClaimID],[PRK_BillDetails].[ApplicationID],[PRK_BillDetails].[AttachmentID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PRK_BillDetails].* ,
    [PRK_Applications2].[UserRemark] AS PRK_Applications2_UserRemark,
    [PRK_UserClaims1].[Description] AS PRK_UserClaims1_Description 
  FROM [PRK_BillDetails] 
      INNER JOIN #PageIndex
          ON [PRK_BillDetails].[ClaimID] = #PageIndex.ClaimID
          AND [PRK_BillDetails].[ApplicationID] = #PageIndex.ApplicationID
          AND [PRK_BillDetails].[AttachmentID] = #PageIndex.AttachmentID
  LEFT OUTER JOIN [PRK_Applications] AS [PRK_Applications2]
    ON [PRK_BillDetails].[ClaimID] = [PRK_Applications2].[ClaimID]
    AND [PRK_BillDetails].[ApplicationID] = [PRK_Applications2].[ApplicationID]
  LEFT OUTER JOIN [PRK_UserClaims] AS [PRK_UserClaims1]
    ON [PRK_BillDetails].[ClaimID] = [PRK_UserClaims1].[ClaimID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
