USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomerTmtlDetailsSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TmtlID Int NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,CustomerID NVarChar(6) NOT NULL
 ,DocumentID NVarChar(30) NOT NULL
 ,RevisionNo NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (TmtlID, ProjectID, CustomerID, DocumentID, RevisionNo)
  SELECT [DCM_CustomerTmtlDetails].[TmtlID], [DCM_CustomerTmtlDetails].[ProjectID], [DCM_CustomerTmtlDetails].[CustomerID], [DCM_CustomerTmtlDetails].[DocumentID], [DCM_CustomerTmtlDetails].[RevisionNo] FROM [DCM_CustomerTmtlDetails]
  LEFT OUTER JOIN [DCM_CustomerTmtlHeader] AS [DCM_CustomerTmtlHeader1]
    ON [DCM_CustomerTmtlDetails].[TmtlID] = [DCM_CustomerTmtlHeader1].[TmtlID]
    AND [DCM_CustomerTmtlDetails].[ProjectID] = [DCM_CustomerTmtlHeader1].[ProjectID]
    AND [DCM_CustomerTmtlDetails].[CustomerID] = [DCM_CustomerTmtlHeader1].[CustomerID]
  INNER JOIN [DCM_Documents] AS [DCM_Documents2]
    ON [DCM_CustomerTmtlDetails].[ProjectID] = [DCM_Documents2].[ProjectID]
    AND [DCM_CustomerTmtlDetails].[DocumentID] = [DCM_Documents2].[DocumentID]
    AND [DCM_CustomerTmtlDetails].[RevisionNo] = [DCM_Documents2].[RevisionNo]
  INNER JOIN [DCM_Projects] AS [DCM_Projects3]
    ON [DCM_CustomerTmtlDetails].[ProjectID] = [DCM_Projects3].[ProjectID]
  LEFT OUTER JOIN [DCM_Customers] AS [DCM_Customers1]
    ON [DCM_CustomerTmtlDetails].[CustomerID] = [DCM_Customers1].[CustomerID]
    AND [DCM_CustomerTmtlDetails].[ProjectID] = [DCM_Customers1].[ProjectID]
  LEFT OUTER JOIN [DCM_ReceiveStatus] AS [DCM_ReceiveStatus1]
    ON [DCM_CustomerTmtlDetails].[ReceiveStatusID] = [DCM_ReceiveStatus1].[ReceiveStatusID]
  LEFT OUTER JOIN [DCM_SendStatus] AS [DCM_SendStatus2]
    ON [DCM_CustomerTmtlDetails].[SendStatusID] = [DCM_SendStatus2].[SendStatusID]
 WHERE  
   ( 
         STR(ISNULL([DCM_CustomerTmtlDetails].[TmtlID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlDetails].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlDetails].[CustomerID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlDetails].[DocumentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlDetails].[RevisionNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlDetails].[SendStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlDetails].[SendRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlDetails].[ReceiveStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlDetails].[ReceivedRefNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlDetails].[ReceivedRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlDetails].[ReceivedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader1].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader1].[CustomerID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader1].[TmtlReference],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader1].[Subject],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader1].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader1].[TmtlStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader1].[CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader1].[ApprovedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Documents2].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Documents2].[DocumentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Documents2].[RevisionNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Documents2].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([DCM_Documents2].[TmtlID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects3].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects3].[ProjectCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[CustomerID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[Address1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[Address2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[Address3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[Address4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[ToEMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[CCEmailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_ReceiveStatus1].[ReceiveStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_ReceiveStatus1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_SendStatus2].[SendStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_SendStatus2].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'TmtlID' THEN [DCM_CustomerTmtlDetails].[TmtlID] END,
     CASE @orderBy WHEN 'TmtlID DESC' THEN [DCM_CustomerTmtlDetails].[TmtlID] END DESC,
     CASE @orderBy WHEN 'ProjectID' THEN [DCM_CustomerTmtlDetails].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [DCM_CustomerTmtlDetails].[ProjectID] END DESC,
     CASE @orderBy WHEN 'CustomerID' THEN [DCM_CustomerTmtlDetails].[CustomerID] END,
     CASE @orderBy WHEN 'CustomerID DESC' THEN [DCM_CustomerTmtlDetails].[CustomerID] END DESC,
     CASE @orderBy WHEN 'DocumentID' THEN [DCM_CustomerTmtlDetails].[DocumentID] END,
     CASE @orderBy WHEN 'DocumentID DESC' THEN [DCM_CustomerTmtlDetails].[DocumentID] END DESC,
     CASE @orderBy WHEN 'RevisionNo' THEN [DCM_CustomerTmtlDetails].[RevisionNo] END,
     CASE @orderBy WHEN 'RevisionNo DESC' THEN [DCM_CustomerTmtlDetails].[RevisionNo] END DESC,
     CASE @orderBy WHEN 'SendStatusID' THEN [DCM_CustomerTmtlDetails].[SendStatusID] END,
     CASE @orderBy WHEN 'SendStatusID DESC' THEN [DCM_CustomerTmtlDetails].[SendStatusID] END DESC,
     CASE @orderBy WHEN 'SendRemarks' THEN [DCM_CustomerTmtlDetails].[SendRemarks] END,
     CASE @orderBy WHEN 'SendRemarks DESC' THEN [DCM_CustomerTmtlDetails].[SendRemarks] END DESC,
     CASE @orderBy WHEN 'ReceiveStatusID' THEN [DCM_CustomerTmtlDetails].[ReceiveStatusID] END,
     CASE @orderBy WHEN 'ReceiveStatusID DESC' THEN [DCM_CustomerTmtlDetails].[ReceiveStatusID] END DESC,
     CASE @orderBy WHEN 'ReceivedRefNo' THEN [DCM_CustomerTmtlDetails].[ReceivedRefNo] END,
     CASE @orderBy WHEN 'ReceivedRefNo DESC' THEN [DCM_CustomerTmtlDetails].[ReceivedRefNo] END DESC,
     CASE @orderBy WHEN 'ReceivedRemarks' THEN [DCM_CustomerTmtlDetails].[ReceivedRemarks] END,
     CASE @orderBy WHEN 'ReceivedRemarks DESC' THEN [DCM_CustomerTmtlDetails].[ReceivedRemarks] END DESC,
     CASE @orderBy WHEN 'ReceivedOn' THEN [DCM_CustomerTmtlDetails].[ReceivedOn] END,
     CASE @orderBy WHEN 'ReceivedOn DESC' THEN [DCM_CustomerTmtlDetails].[ReceivedOn] END DESC,
     CASE @orderBy WHEN 'ReceivedBy' THEN [DCM_CustomerTmtlDetails].[ReceivedBy] END,
     CASE @orderBy WHEN 'ReceivedBy DESC' THEN [DCM_CustomerTmtlDetails].[ReceivedBy] END DESC,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_TmtlID' THEN [DCM_CustomerTmtlHeader1].[TmtlID] END,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_TmtlID DESC' THEN [DCM_CustomerTmtlHeader1].[TmtlID] END DESC,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_ProjectID' THEN [DCM_CustomerTmtlHeader1].[ProjectID] END,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_ProjectID DESC' THEN [DCM_CustomerTmtlHeader1].[ProjectID] END DESC,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_CustomerID' THEN [DCM_CustomerTmtlHeader1].[CustomerID] END,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_CustomerID DESC' THEN [DCM_CustomerTmtlHeader1].[CustomerID] END DESC,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_TmtlReference' THEN [DCM_CustomerTmtlHeader1].[TmtlReference] END,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_TmtlReference DESC' THEN [DCM_CustomerTmtlHeader1].[TmtlReference] END DESC,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_Subject' THEN [DCM_CustomerTmtlHeader1].[Subject] END,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_Subject DESC' THEN [DCM_CustomerTmtlHeader1].[Subject] END DESC,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_Remarks' THEN [DCM_CustomerTmtlHeader1].[Remarks] END,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_Remarks DESC' THEN [DCM_CustomerTmtlHeader1].[Remarks] END DESC,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_TmtlStatusID' THEN [DCM_CustomerTmtlHeader1].[TmtlStatusID] END,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_TmtlStatusID DESC' THEN [DCM_CustomerTmtlHeader1].[TmtlStatusID] END DESC,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_CreatedOn' THEN [DCM_CustomerTmtlHeader1].[CreatedOn] END,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_CreatedOn DESC' THEN [DCM_CustomerTmtlHeader1].[CreatedOn] END DESC,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_CreatedBy' THEN [DCM_CustomerTmtlHeader1].[CreatedBy] END,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_CreatedBy DESC' THEN [DCM_CustomerTmtlHeader1].[CreatedBy] END DESC,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_ApprovedOn' THEN [DCM_CustomerTmtlHeader1].[ApprovedOn] END,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_ApprovedOn DESC' THEN [DCM_CustomerTmtlHeader1].[ApprovedOn] END DESC,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_ApprovedBy' THEN [DCM_CustomerTmtlHeader1].[ApprovedBy] END,
     CASE @orderBy WHEN 'DCM_CustomerTmtlHeader1_ApprovedBy DESC' THEN [DCM_CustomerTmtlHeader1].[ApprovedBy] END DESC,
     CASE @orderBy WHEN 'DCM_Documents2_ProjectID' THEN [DCM_Documents2].[ProjectID] END,
     CASE @orderBy WHEN 'DCM_Documents2_ProjectID DESC' THEN [DCM_Documents2].[ProjectID] END DESC,
     CASE @orderBy WHEN 'DCM_Documents2_DocumentID' THEN [DCM_Documents2].[DocumentID] END,
     CASE @orderBy WHEN 'DCM_Documents2_DocumentID DESC' THEN [DCM_Documents2].[DocumentID] END DESC,
     CASE @orderBy WHEN 'DCM_Documents2_RevisionNo' THEN [DCM_Documents2].[RevisionNo] END,
     CASE @orderBy WHEN 'DCM_Documents2_RevisionNo DESC' THEN [DCM_Documents2].[RevisionNo] END DESC,
     CASE @orderBy WHEN 'DCM_Documents2_Description' THEN [DCM_Documents2].[Description] END,
     CASE @orderBy WHEN 'DCM_Documents2_Description DESC' THEN [DCM_Documents2].[Description] END DESC,
     CASE @orderBy WHEN 'DCM_Documents2_Locked' THEN [DCM_Documents2].[Locked] END,
     CASE @orderBy WHEN 'DCM_Documents2_Locked DESC' THEN [DCM_Documents2].[Locked] END DESC,
     CASE @orderBy WHEN 'DCM_Documents2_TmtlID' THEN [DCM_Documents2].[TmtlID] END,
     CASE @orderBy WHEN 'DCM_Documents2_TmtlID DESC' THEN [DCM_Documents2].[TmtlID] END DESC,
     CASE @orderBy WHEN 'DCM_Projects3_ProjectID' THEN [DCM_Projects3].[ProjectID] END,
     CASE @orderBy WHEN 'DCM_Projects3_ProjectID DESC' THEN [DCM_Projects3].[ProjectID] END DESC,
     CASE @orderBy WHEN 'DCM_Projects3_Description' THEN [DCM_Projects3].[Description] END,
     CASE @orderBy WHEN 'DCM_Projects3_Description DESC' THEN [DCM_Projects3].[Description] END DESC,
     CASE @orderBy WHEN 'DCM_Projects3_ProjectCode' THEN [DCM_Projects3].[ProjectCode] END,
     CASE @orderBy WHEN 'DCM_Projects3_ProjectCode DESC' THEN [DCM_Projects3].[ProjectCode] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_CustomerID' THEN [DCM_Customers1].[CustomerID] END,
     CASE @orderBy WHEN 'DCM_Customers1_CustomerID DESC' THEN [DCM_Customers1].[CustomerID] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_ProjectID' THEN [DCM_Customers1].[ProjectID] END,
     CASE @orderBy WHEN 'DCM_Customers1_ProjectID DESC' THEN [DCM_Customers1].[ProjectID] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_Description' THEN [DCM_Customers1].[Description] END,
     CASE @orderBy WHEN 'DCM_Customers1_Description DESC' THEN [DCM_Customers1].[Description] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_Address1' THEN [DCM_Customers1].[Address1] END,
     CASE @orderBy WHEN 'DCM_Customers1_Address1 DESC' THEN [DCM_Customers1].[Address1] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_Address2' THEN [DCM_Customers1].[Address2] END,
     CASE @orderBy WHEN 'DCM_Customers1_Address2 DESC' THEN [DCM_Customers1].[Address2] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_Address3' THEN [DCM_Customers1].[Address3] END,
     CASE @orderBy WHEN 'DCM_Customers1_Address3 DESC' THEN [DCM_Customers1].[Address3] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_Address4' THEN [DCM_Customers1].[Address4] END,
     CASE @orderBy WHEN 'DCM_Customers1_Address4 DESC' THEN [DCM_Customers1].[Address4] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_ToEMailID' THEN [DCM_Customers1].[ToEMailID] END,
     CASE @orderBy WHEN 'DCM_Customers1_ToEMailID DESC' THEN [DCM_Customers1].[ToEMailID] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_CCEmailID' THEN [DCM_Customers1].[CCEmailID] END,
     CASE @orderBy WHEN 'DCM_Customers1_CCEmailID DESC' THEN [DCM_Customers1].[CCEmailID] END DESC,
     CASE @orderBy WHEN 'DCM_ReceiveStatus1_ReceiveStatusID' THEN [DCM_ReceiveStatus1].[ReceiveStatusID] END,
     CASE @orderBy WHEN 'DCM_ReceiveStatus1_ReceiveStatusID DESC' THEN [DCM_ReceiveStatus1].[ReceiveStatusID] END DESC,
     CASE @orderBy WHEN 'DCM_ReceiveStatus1_Description' THEN [DCM_ReceiveStatus1].[Description] END,
     CASE @orderBy WHEN 'DCM_ReceiveStatus1_Description DESC' THEN [DCM_ReceiveStatus1].[Description] END DESC,
     CASE @orderBy WHEN 'DCM_SendStatus2_SendStatusID' THEN [DCM_SendStatus2].[SendStatusID] END,
     CASE @orderBy WHEN 'DCM_SendStatus2_SendStatusID DESC' THEN [DCM_SendStatus2].[SendStatusID] END DESC,
     CASE @orderBy WHEN 'DCM_SendStatus2_Description' THEN [DCM_SendStatus2].[Description] END,
     CASE @orderBy WHEN 'DCM_SendStatus2_Description DESC' THEN [DCM_SendStatus2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[DCM_CustomerTmtlDetails].[TmtlID],
		[DCM_CustomerTmtlDetails].[ProjectID],
		[DCM_CustomerTmtlDetails].[CustomerID],
		[DCM_CustomerTmtlDetails].[DocumentID],
		[DCM_CustomerTmtlDetails].[RevisionNo],
		[DCM_CustomerTmtlDetails].[SendStatusID],
		[DCM_CustomerTmtlDetails].[SendRemarks],
		[DCM_CustomerTmtlDetails].[ReceiveStatusID],
		[DCM_CustomerTmtlDetails].[ReceivedRefNo],
		[DCM_CustomerTmtlDetails].[ReceivedRemarks],
		[DCM_CustomerTmtlDetails].[ReceivedOn],
		[DCM_CustomerTmtlDetails].[ReceivedBy],
		[DCM_CustomerTmtlHeader1].[TmtlID] AS DCM_CustomerTmtlHeader1_TmtlID,
		[DCM_CustomerTmtlHeader1].[ProjectID] AS DCM_CustomerTmtlHeader1_ProjectID,
		[DCM_CustomerTmtlHeader1].[CustomerID] AS DCM_CustomerTmtlHeader1_CustomerID,
		[DCM_CustomerTmtlHeader1].[TmtlReference] AS DCM_CustomerTmtlHeader1_TmtlReference,
		[DCM_CustomerTmtlHeader1].[Subject] AS DCM_CustomerTmtlHeader1_Subject,
		[DCM_CustomerTmtlHeader1].[Remarks] AS DCM_CustomerTmtlHeader1_Remarks,
		[DCM_CustomerTmtlHeader1].[TmtlStatusID] AS DCM_CustomerTmtlHeader1_TmtlStatusID,
		[DCM_CustomerTmtlHeader1].[CreatedOn] AS DCM_CustomerTmtlHeader1_CreatedOn,
		[DCM_CustomerTmtlHeader1].[CreatedBy] AS DCM_CustomerTmtlHeader1_CreatedBy,
		[DCM_CustomerTmtlHeader1].[ApprovedOn] AS DCM_CustomerTmtlHeader1_ApprovedOn,
		[DCM_CustomerTmtlHeader1].[ApprovedBy] AS DCM_CustomerTmtlHeader1_ApprovedBy,
		[DCM_Documents2].[ProjectID] AS DCM_Documents2_ProjectID,
		[DCM_Documents2].[DocumentID] AS DCM_Documents2_DocumentID,
		[DCM_Documents2].[RevisionNo] AS DCM_Documents2_RevisionNo,
		[DCM_Documents2].[Description] AS DCM_Documents2_Description,
		[DCM_Documents2].[Locked] AS DCM_Documents2_Locked,
		[DCM_Documents2].[TmtlID] AS DCM_Documents2_TmtlID,
		[DCM_Projects3].[ProjectID] AS DCM_Projects3_ProjectID,
		[DCM_Projects3].[Description] AS DCM_Projects3_Description,
		[DCM_Projects3].[ProjectCode] AS DCM_Projects3_ProjectCode,
		[DCM_Customers1].[CustomerID] AS DCM_Customers1_CustomerID,
		[DCM_Customers1].[ProjectID] AS DCM_Customers1_ProjectID,
		[DCM_Customers1].[Description] AS DCM_Customers1_Description,
		[DCM_Customers1].[Address1] AS DCM_Customers1_Address1,
		[DCM_Customers1].[Address2] AS DCM_Customers1_Address2,
		[DCM_Customers1].[Address3] AS DCM_Customers1_Address3,
		[DCM_Customers1].[Address4] AS DCM_Customers1_Address4,
		[DCM_Customers1].[ToEMailID] AS DCM_Customers1_ToEMailID,
		[DCM_Customers1].[CCEmailID] AS DCM_Customers1_CCEmailID,
		[DCM_ReceiveStatus1].[ReceiveStatusID] AS DCM_ReceiveStatus1_ReceiveStatusID,
		[DCM_ReceiveStatus1].[Description] AS DCM_ReceiveStatus1_Description,
		[DCM_SendStatus2].[SendStatusID] AS DCM_SendStatus2_SendStatusID,
		[DCM_SendStatus2].[Description] AS DCM_SendStatus2_Description 
  FROM [DCM_CustomerTmtlDetails] 
    	INNER JOIN #PageIndex
          ON [DCM_CustomerTmtlDetails].[TmtlID] = #PageIndex.TmtlID
          AND [DCM_CustomerTmtlDetails].[ProjectID] = #PageIndex.ProjectID
          AND [DCM_CustomerTmtlDetails].[CustomerID] = #PageIndex.CustomerID
          AND [DCM_CustomerTmtlDetails].[DocumentID] = #PageIndex.DocumentID
          AND [DCM_CustomerTmtlDetails].[RevisionNo] = #PageIndex.RevisionNo
  LEFT OUTER JOIN [DCM_CustomerTmtlHeader] AS [DCM_CustomerTmtlHeader1]
    ON [DCM_CustomerTmtlDetails].[TmtlID] = [DCM_CustomerTmtlHeader1].[TmtlID]
    AND [DCM_CustomerTmtlDetails].[ProjectID] = [DCM_CustomerTmtlHeader1].[ProjectID]
    AND [DCM_CustomerTmtlDetails].[CustomerID] = [DCM_CustomerTmtlHeader1].[CustomerID]
  INNER JOIN [DCM_Documents] AS [DCM_Documents2]
    ON [DCM_CustomerTmtlDetails].[ProjectID] = [DCM_Documents2].[ProjectID]
    AND [DCM_CustomerTmtlDetails].[DocumentID] = [DCM_Documents2].[DocumentID]
    AND [DCM_CustomerTmtlDetails].[RevisionNo] = [DCM_Documents2].[RevisionNo]
  INNER JOIN [DCM_Projects] AS [DCM_Projects3]
    ON [DCM_CustomerTmtlDetails].[ProjectID] = [DCM_Projects3].[ProjectID]
  LEFT OUTER JOIN [DCM_Customers] AS [DCM_Customers1]
    ON [DCM_CustomerTmtlDetails].[CustomerID] = [DCM_Customers1].[CustomerID]
    AND [DCM_CustomerTmtlDetails].[ProjectID] = [DCM_Customers1].[ProjectID]
  LEFT OUTER JOIN [DCM_ReceiveStatus] AS [DCM_ReceiveStatus1]
    ON [DCM_CustomerTmtlDetails].[ReceiveStatusID] = [DCM_ReceiveStatus1].[ReceiveStatusID]
  LEFT OUTER JOIN [DCM_SendStatus] AS [DCM_SendStatus2]
    ON [DCM_CustomerTmtlDetails].[SendStatusID] = [DCM_SendStatus2].[SendStatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
