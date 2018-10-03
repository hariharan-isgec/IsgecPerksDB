USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcm_LG_CustomerTmtlDetailsByHeader]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @TmtlID Int,
  @ProjectID NVarChar(6),
  @CustomerID NVarChar(6), 
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TmtlID Int NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,CustomerID NVarChar(6) NOT NULL
 ,DocumentID NVarChar(30) NOT NULL
 ,RevisionNo NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TmtlID'  SET @LGSQL = @LGSQL + ', ProjectID'  SET @LGSQL = @LGSQL + ', CustomerID'  SET @LGSQL = @LGSQL + ', DocumentID'  SET @LGSQL = @LGSQL + ', RevisionNo'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[DCM_CustomerTmtlDetails].[TmtlID]'  
  SET @LGSQL = @LGSQL + ', [DCM_CustomerTmtlDetails].[ProjectID]'  
  SET @LGSQL = @LGSQL + ', [DCM_CustomerTmtlDetails].[CustomerID]'  
  SET @LGSQL = @LGSQL + ', [DCM_CustomerTmtlDetails].[DocumentID]'  
  SET @LGSQL = @LGSQL + ', [DCM_CustomerTmtlDetails].[RevisionNo]'  
  SET @LGSQL = @LGSQL + ' FROM [DCM_CustomerTmtlDetails] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_CustomerTmtlHeader] AS [DCM_CustomerTmtlHeader1]'
  SET @LGSQL = @LGSQL + '    ON [DCM_CustomerTmtlDetails].[TmtlID] = [DCM_CustomerTmtlHeader1].[TmtlID]'
  SET @LGSQL = @LGSQL + '    AND [DCM_CustomerTmtlDetails].[ProjectID] = [DCM_CustomerTmtlHeader1].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [DCM_CustomerTmtlDetails].[CustomerID] = [DCM_CustomerTmtlHeader1].[CustomerID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [DCM_Documents] AS [DCM_Documents2]'
  SET @LGSQL = @LGSQL + '    ON [DCM_CustomerTmtlDetails].[ProjectID] = [DCM_Documents2].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [DCM_CustomerTmtlDetails].[DocumentID] = [DCM_Documents2].[DocumentID]'
  SET @LGSQL = @LGSQL + '    AND [DCM_CustomerTmtlDetails].[RevisionNo] = [DCM_Documents2].[RevisionNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [DCM_Projects] AS [DCM_Projects3]'
  SET @LGSQL = @LGSQL + '    ON [DCM_CustomerTmtlDetails].[ProjectID] = [DCM_Projects3].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_Customers] AS [DCM_Customers1]'
  SET @LGSQL = @LGSQL + '    ON [DCM_CustomerTmtlDetails].[CustomerID] = [DCM_Customers1].[CustomerID]'
  SET @LGSQL = @LGSQL + '    AND [DCM_CustomerTmtlDetails].[ProjectID] = [DCM_Customers1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_ReceiveStatus] AS [DCM_ReceiveStatus1]'
  SET @LGSQL = @LGSQL + '    ON [DCM_CustomerTmtlDetails].[ReceiveStatusID] = [DCM_ReceiveStatus1].[ReceiveStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_SendStatus] AS [DCM_SendStatus2]'
  SET @LGSQL = @LGSQL + '    ON [DCM_CustomerTmtlDetails].[SendStatusID] = [DCM_SendStatus2].[SendStatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  AND [DCM_CustomerTmtlDetails].[TmtlID] = ' + str(@TmtlID) 
  SET @LGSQL = @LGSQL + '  AND [DCM_CustomerTmtlDetails].[ProjectID] = ''' + @ProjectID + ''''
  SET @LGSQL = @LGSQL + '  AND [DCM_CustomerTmtlDetails].[CustomerID] = ''' + @CustomerID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TmtlID' THEN '[DCM_CustomerTmtlDetails].[TmtlID]'
                        WHEN 'TmtlID DESC' THEN '[DCM_CustomerTmtlDetails].[TmtlID] DESC'
                        WHEN 'ProjectID' THEN '[DCM_CustomerTmtlDetails].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[DCM_CustomerTmtlDetails].[ProjectID] DESC'
                        WHEN 'CustomerID' THEN '[DCM_CustomerTmtlDetails].[CustomerID]'
                        WHEN 'CustomerID DESC' THEN '[DCM_CustomerTmtlDetails].[CustomerID] DESC'
                        WHEN 'DocumentID' THEN '[DCM_CustomerTmtlDetails].[DocumentID]'
                        WHEN 'DocumentID DESC' THEN '[DCM_CustomerTmtlDetails].[DocumentID] DESC'
                        WHEN 'RevisionNo' THEN '[DCM_CustomerTmtlDetails].[RevisionNo]'
                        WHEN 'RevisionNo DESC' THEN '[DCM_CustomerTmtlDetails].[RevisionNo] DESC'
                        WHEN 'SendStatusID' THEN '[DCM_CustomerTmtlDetails].[SendStatusID]'
                        WHEN 'SendStatusID DESC' THEN '[DCM_CustomerTmtlDetails].[SendStatusID] DESC'
                        WHEN 'SendRemarks' THEN '[DCM_CustomerTmtlDetails].[SendRemarks]'
                        WHEN 'SendRemarks DESC' THEN '[DCM_CustomerTmtlDetails].[SendRemarks] DESC'
                        WHEN 'ReceiveStatusID' THEN '[DCM_CustomerTmtlDetails].[ReceiveStatusID]'
                        WHEN 'ReceiveStatusID DESC' THEN '[DCM_CustomerTmtlDetails].[ReceiveStatusID] DESC'
                        WHEN 'ReceivedRefNo' THEN '[DCM_CustomerTmtlDetails].[ReceivedRefNo]'
                        WHEN 'ReceivedRefNo DESC' THEN '[DCM_CustomerTmtlDetails].[ReceivedRefNo] DESC'
                        WHEN 'ReceivedRemarks' THEN '[DCM_CustomerTmtlDetails].[ReceivedRemarks]'
                        WHEN 'ReceivedRemarks DESC' THEN '[DCM_CustomerTmtlDetails].[ReceivedRemarks] DESC'
                        WHEN 'ReceivedOn' THEN '[DCM_CustomerTmtlDetails].[ReceivedOn]'
                        WHEN 'ReceivedOn DESC' THEN '[DCM_CustomerTmtlDetails].[ReceivedOn] DESC'
                        WHEN 'ReceivedBy' THEN '[DCM_CustomerTmtlDetails].[ReceivedBy]'
                        WHEN 'ReceivedBy DESC' THEN '[DCM_CustomerTmtlDetails].[ReceivedBy] DESC'
                        WHEN 'DCM_CustomerTmtlHeader1_TmtlID' THEN '[DCM_CustomerTmtlHeader1].[TmtlID]'
                        WHEN 'DCM_CustomerTmtlHeader1_TmtlID DESC' THEN '[DCM_CustomerTmtlHeader1].[TmtlID] DESC'
                        WHEN 'DCM_CustomerTmtlHeader1_ProjectID' THEN '[DCM_CustomerTmtlHeader1].[ProjectID]'
                        WHEN 'DCM_CustomerTmtlHeader1_ProjectID DESC' THEN '[DCM_CustomerTmtlHeader1].[ProjectID] DESC'
                        WHEN 'DCM_CustomerTmtlHeader1_CustomerID' THEN '[DCM_CustomerTmtlHeader1].[CustomerID]'
                        WHEN 'DCM_CustomerTmtlHeader1_CustomerID DESC' THEN '[DCM_CustomerTmtlHeader1].[CustomerID] DESC'
                        WHEN 'DCM_CustomerTmtlHeader1_TmtlReference' THEN '[DCM_CustomerTmtlHeader1].[TmtlReference]'
                        WHEN 'DCM_CustomerTmtlHeader1_TmtlReference DESC' THEN '[DCM_CustomerTmtlHeader1].[TmtlReference] DESC'
                        WHEN 'DCM_CustomerTmtlHeader1_Subject' THEN '[DCM_CustomerTmtlHeader1].[Subject]'
                        WHEN 'DCM_CustomerTmtlHeader1_Subject DESC' THEN '[DCM_CustomerTmtlHeader1].[Subject] DESC'
                        WHEN 'DCM_CustomerTmtlHeader1_Remarks' THEN '[DCM_CustomerTmtlHeader1].[Remarks]'
                        WHEN 'DCM_CustomerTmtlHeader1_Remarks DESC' THEN '[DCM_CustomerTmtlHeader1].[Remarks] DESC'
                        WHEN 'DCM_CustomerTmtlHeader1_TmtlStatusID' THEN '[DCM_CustomerTmtlHeader1].[TmtlStatusID]'
                        WHEN 'DCM_CustomerTmtlHeader1_TmtlStatusID DESC' THEN '[DCM_CustomerTmtlHeader1].[TmtlStatusID] DESC'
                        WHEN 'DCM_CustomerTmtlHeader1_CreatedOn' THEN '[DCM_CustomerTmtlHeader1].[CreatedOn]'
                        WHEN 'DCM_CustomerTmtlHeader1_CreatedOn DESC' THEN '[DCM_CustomerTmtlHeader1].[CreatedOn] DESC'
                        WHEN 'DCM_CustomerTmtlHeader1_CreatedBy' THEN '[DCM_CustomerTmtlHeader1].[CreatedBy]'
                        WHEN 'DCM_CustomerTmtlHeader1_CreatedBy DESC' THEN '[DCM_CustomerTmtlHeader1].[CreatedBy] DESC'
                        WHEN 'DCM_CustomerTmtlHeader1_ApprovedOn' THEN '[DCM_CustomerTmtlHeader1].[ApprovedOn]'
                        WHEN 'DCM_CustomerTmtlHeader1_ApprovedOn DESC' THEN '[DCM_CustomerTmtlHeader1].[ApprovedOn] DESC'
                        WHEN 'DCM_CustomerTmtlHeader1_ApprovedBy' THEN '[DCM_CustomerTmtlHeader1].[ApprovedBy]'
                        WHEN 'DCM_CustomerTmtlHeader1_ApprovedBy DESC' THEN '[DCM_CustomerTmtlHeader1].[ApprovedBy] DESC'
                        WHEN 'DCM_Documents2_ProjectID' THEN '[DCM_Documents2].[ProjectID]'
                        WHEN 'DCM_Documents2_ProjectID DESC' THEN '[DCM_Documents2].[ProjectID] DESC'
                        WHEN 'DCM_Documents2_DocumentID' THEN '[DCM_Documents2].[DocumentID]'
                        WHEN 'DCM_Documents2_DocumentID DESC' THEN '[DCM_Documents2].[DocumentID] DESC'
                        WHEN 'DCM_Documents2_RevisionNo' THEN '[DCM_Documents2].[RevisionNo]'
                        WHEN 'DCM_Documents2_RevisionNo DESC' THEN '[DCM_Documents2].[RevisionNo] DESC'
                        WHEN 'DCM_Documents2_Description' THEN '[DCM_Documents2].[Description]'
                        WHEN 'DCM_Documents2_Description DESC' THEN '[DCM_Documents2].[Description] DESC'
                        WHEN 'DCM_Documents2_Locked' THEN '[DCM_Documents2].[Locked]'
                        WHEN 'DCM_Documents2_Locked DESC' THEN '[DCM_Documents2].[Locked] DESC'
                        WHEN 'DCM_Documents2_TmtlID' THEN '[DCM_Documents2].[TmtlID]'
                        WHEN 'DCM_Documents2_TmtlID DESC' THEN '[DCM_Documents2].[TmtlID] DESC'
                        WHEN 'DCM_Projects3_ProjectID' THEN '[DCM_Projects3].[ProjectID]'
                        WHEN 'DCM_Projects3_ProjectID DESC' THEN '[DCM_Projects3].[ProjectID] DESC'
                        WHEN 'DCM_Projects3_Description' THEN '[DCM_Projects3].[Description]'
                        WHEN 'DCM_Projects3_Description DESC' THEN '[DCM_Projects3].[Description] DESC'
                        WHEN 'DCM_Projects3_ProjectCode' THEN '[DCM_Projects3].[ProjectCode]'
                        WHEN 'DCM_Projects3_ProjectCode DESC' THEN '[DCM_Projects3].[ProjectCode] DESC'
                        WHEN 'DCM_Customers1_CustomerID' THEN '[DCM_Customers1].[CustomerID]'
                        WHEN 'DCM_Customers1_CustomerID DESC' THEN '[DCM_Customers1].[CustomerID] DESC'
                        WHEN 'DCM_Customers1_ProjectID' THEN '[DCM_Customers1].[ProjectID]'
                        WHEN 'DCM_Customers1_ProjectID DESC' THEN '[DCM_Customers1].[ProjectID] DESC'
                        WHEN 'DCM_Customers1_Description' THEN '[DCM_Customers1].[Description]'
                        WHEN 'DCM_Customers1_Description DESC' THEN '[DCM_Customers1].[Description] DESC'
                        WHEN 'DCM_Customers1_Address1' THEN '[DCM_Customers1].[Address1]'
                        WHEN 'DCM_Customers1_Address1 DESC' THEN '[DCM_Customers1].[Address1] DESC'
                        WHEN 'DCM_Customers1_Address2' THEN '[DCM_Customers1].[Address2]'
                        WHEN 'DCM_Customers1_Address2 DESC' THEN '[DCM_Customers1].[Address2] DESC'
                        WHEN 'DCM_Customers1_Address3' THEN '[DCM_Customers1].[Address3]'
                        WHEN 'DCM_Customers1_Address3 DESC' THEN '[DCM_Customers1].[Address3] DESC'
                        WHEN 'DCM_Customers1_Address4' THEN '[DCM_Customers1].[Address4]'
                        WHEN 'DCM_Customers1_Address4 DESC' THEN '[DCM_Customers1].[Address4] DESC'
                        WHEN 'DCM_Customers1_ToEMailID' THEN '[DCM_Customers1].[ToEMailID]'
                        WHEN 'DCM_Customers1_ToEMailID DESC' THEN '[DCM_Customers1].[ToEMailID] DESC'
                        WHEN 'DCM_Customers1_CCEmailID' THEN '[DCM_Customers1].[CCEmailID]'
                        WHEN 'DCM_Customers1_CCEmailID DESC' THEN '[DCM_Customers1].[CCEmailID] DESC'
                        WHEN 'DCM_ReceiveStatus1_ReceiveStatusID' THEN '[DCM_ReceiveStatus1].[ReceiveStatusID]'
                        WHEN 'DCM_ReceiveStatus1_ReceiveStatusID DESC' THEN '[DCM_ReceiveStatus1].[ReceiveStatusID] DESC'
                        WHEN 'DCM_ReceiveStatus1_Description' THEN '[DCM_ReceiveStatus1].[Description]'
                        WHEN 'DCM_ReceiveStatus1_Description DESC' THEN '[DCM_ReceiveStatus1].[Description] DESC'
                        WHEN 'DCM_SendStatus2_SendStatusID' THEN '[DCM_SendStatus2].[SendStatusID]'
                        WHEN 'DCM_SendStatus2_SendStatusID DESC' THEN '[DCM_SendStatus2].[SendStatusID] DESC'
                        WHEN 'DCM_SendStatus2_Description' THEN '[DCM_SendStatus2].[Description]'
                        WHEN 'DCM_SendStatus2_Description DESC' THEN '[DCM_SendStatus2].[Description] DESC'
                        ELSE '[DCM_CustomerTmtlDetails].[TmtlID],[DCM_CustomerTmtlDetails].[ProjectID],[DCM_CustomerTmtlDetails].[CustomerID],[DCM_CustomerTmtlDetails].[DocumentID],[DCM_CustomerTmtlDetails].[RevisionNo]'
                    END
  EXEC (@LGSQL)

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
