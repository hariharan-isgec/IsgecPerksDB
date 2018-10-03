USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchPrkBillDetails]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  AttachmentID Int NOT NULL
  )
  INSERT INTO #PageIndex (AttachmentID)
  SELECT [PRK_BillDetails].[AttachmentID] FROM [PRK_BillDetails]
  INNER JOIN [PRK_Applications] AS [PRK_Applications1]
    ON [PRK_BillDetails].[ApplicationID] = [PRK_Applications1].[ApplicationID]
  WHERE STR(ISNULL([PRK_BillDetails].[AttachmentID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_BillDetails].[ApplicationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_BillDetails].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_BillDetails].[BillNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_BillDetails].[Particulars],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_BillDetails].[Quantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_BillDetails].[Amount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications1].[EmployeeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications1].[PerkID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications1].[Value], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications1].[UserRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications1].[ApprovedValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications1].[ApprovedAmt], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications1].[ApprovedBy], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications1].[ApproverRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications1].[VerifiedValue], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications1].[VerifiedAmt], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications1].[VerifiedBy], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications1].[PostedBy], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications1].[UpdatedBy], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications1].[VerifierRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications1].[PaymentMethod],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications1].[StatusID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications1].[FinYear], 0)) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [PRK_BillDetails].[AttachmentID] AS SearchCode, 
  STR(ISNULL([PRK_BillDetails].[ApplicationID],0)) 
  + ',' + STR(ISNULL([PRK_BillDetails].[SerialNo],0)) 
  + ',' + ISNULL([PRK_BillDetails].[BillNo],'') 
  + ',' + ISNULL([PRK_BillDetails].[Particulars],'') 
  + ',' + STR(ISNULL([PRK_BillDetails].[Quantity],0)) 
  + ',' + STR(ISNULL([PRK_BillDetails].[Amount],0)) 
  + ',' + STR(ISNULL([PRK_Applications1].[EmployeeID],0)) 
  + ',' + STR(ISNULL([PRK_Applications1].[PerkID],0)) 
  + ',' + STR(ISNULL([PRK_Applications1].[Value],0)) 
  + ',' + ISNULL([PRK_Applications1].[UserRemark],'') 
  + ',' + STR(ISNULL([PRK_Applications1].[ApprovedValue],0)) 
  + ',' + STR(ISNULL([PRK_Applications1].[ApprovedAmt],0)) 
  + ',' + STR(ISNULL([PRK_Applications1].[ApprovedBy],0)) 
  + ',' + ISNULL([PRK_Applications1].[ApproverRemark],'') 
  + ',' + STR(ISNULL([PRK_Applications1].[VerifiedValue],0)) 
  + ',' + STR(ISNULL([PRK_Applications1].[VerifiedAmt],0)) 
  + ',' + STR(ISNULL([PRK_Applications1].[VerifiedBy],0)) 
  + ',' + STR(ISNULL([PRK_Applications1].[PostedBy],0)) 
  + ',' + STR(ISNULL([PRK_Applications1].[UpdatedBy],0)) 
  + ',' + ISNULL([PRK_Applications1].[VerifierRemark],'') 
  + ',' + ISNULL([PRK_Applications1].[PaymentMethod],'') 
  + ',' + STR(ISNULL([PRK_Applications1].[StatusID],0)) 
  + ',' + STR(ISNULL([PRK_Applications1].[FinYear],0)) 
  AS SearchDescription 
  FROM [PRK_BillDetails] 
    	INNER JOIN #PageIndex
          ON [PRK_BillDetails].[AttachmentID] = #PageIndex.AttachmentID
  INNER JOIN [PRK_Applications] AS [PRK_Applications1]
    ON [PRK_BillDetails].[ApplicationID] = [PRK_Applications1].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
