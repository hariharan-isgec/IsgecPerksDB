USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkBillDetailsSelectListSearch]
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
 ,ApplicationID Int NOT NULL
 ,AttachmentID Int NOT NULL
  )
  INSERT INTO #PageIndex (ClaimID, ApplicationID, AttachmentID)
  SELECT [PRK_BillDetails].[ClaimID], [PRK_BillDetails].[ApplicationID], [PRK_BillDetails].[AttachmentID] FROM [PRK_BillDetails]
  LEFT OUTER JOIN [PRK_Applications] AS [PRK_Applications2]
    ON [PRK_BillDetails].[ClaimID] = [PRK_Applications2].[ClaimID]
    AND [PRK_BillDetails].[ApplicationID] = [PRK_Applications2].[ApplicationID]
  LEFT OUTER JOIN [PRK_UserClaims] AS [PRK_UserClaims1]
    ON [PRK_BillDetails].[ClaimID] = [PRK_UserClaims1].[ClaimID]
 WHERE  
   ( 
         STR(ISNULL([PRK_BillDetails].[ClaimID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_BillDetails].[ApplicationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_BillDetails].[AttachmentID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_BillDetails].[BillNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_BillDetails].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_BillDetails].[Particulars],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_BillDetails].[Quantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_BillDetails].[Amount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_BillDetails].[SerialNo], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ClaimID' THEN [PRK_BillDetails].[ClaimID] END,
     CASE @OrderBy WHEN 'ClaimID DESC' THEN [PRK_BillDetails].[ClaimID] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [PRK_BillDetails].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [PRK_BillDetails].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'AttachmentID' THEN [PRK_BillDetails].[AttachmentID] END,
     CASE @OrderBy WHEN 'AttachmentID DESC' THEN [PRK_BillDetails].[AttachmentID] END DESC,
     CASE @OrderBy WHEN 'BillNo' THEN [PRK_BillDetails].[BillNo] END,
     CASE @OrderBy WHEN 'BillNo DESC' THEN [PRK_BillDetails].[BillNo] END DESC,
     CASE @OrderBy WHEN 'BillDate' THEN [PRK_BillDetails].[BillDate] END,
     CASE @OrderBy WHEN 'BillDate DESC' THEN [PRK_BillDetails].[BillDate] END DESC,
     CASE @OrderBy WHEN 'FromDate' THEN [PRK_BillDetails].[FromDate] END,
     CASE @OrderBy WHEN 'FromDate DESC' THEN [PRK_BillDetails].[FromDate] END DESC,
     CASE @OrderBy WHEN 'ToDate' THEN [PRK_BillDetails].[ToDate] END,
     CASE @OrderBy WHEN 'ToDate DESC' THEN [PRK_BillDetails].[ToDate] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PRK_BillDetails].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PRK_BillDetails].[Description] END DESC,
     CASE @OrderBy WHEN 'Particulars' THEN [PRK_BillDetails].[Particulars] END,
     CASE @OrderBy WHEN 'Particulars DESC' THEN [PRK_BillDetails].[Particulars] END DESC,
     CASE @OrderBy WHEN 'Quantity' THEN [PRK_BillDetails].[Quantity] END,
     CASE @OrderBy WHEN 'Quantity DESC' THEN [PRK_BillDetails].[Quantity] END DESC,
     CASE @OrderBy WHEN 'Amount' THEN [PRK_BillDetails].[Amount] END,
     CASE @OrderBy WHEN 'Amount DESC' THEN [PRK_BillDetails].[Amount] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [PRK_BillDetails].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PRK_BillDetails].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'PRK_Applications2_UserRemark' THEN [PRK_Applications2].[UserRemark] END,
     CASE @OrderBy WHEN 'PRK_Applications2_UserRemark DESC' THEN [PRK_Applications2].[UserRemark] END DESC,
     CASE @OrderBy WHEN 'PRK_UserClaims1_Description' THEN [PRK_UserClaims1].[Description] END,
     CASE @OrderBy WHEN 'PRK_UserClaims1_Description DESC' THEN [PRK_UserClaims1].[Description] END DESC 

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
