USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomerTmtlDetailsSelectByID]
  @TmtlID Int,
  @ProjectID NVarChar(6),
  @CustomerID NVarChar(6),
  @DocumentID NVarChar(30),
  @RevisionNo NVarChar(2) 
  AS
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
  [DCM_CustomerTmtlDetails].[TmtlID] = @TmtlID
  AND [DCM_CustomerTmtlDetails].[ProjectID] = @ProjectID
  AND [DCM_CustomerTmtlDetails].[CustomerID] = @CustomerID
  AND [DCM_CustomerTmtlDetails].[DocumentID] = @DocumentID
  AND [DCM_CustomerTmtlDetails].[RevisionNo] = @RevisionNo
GO
