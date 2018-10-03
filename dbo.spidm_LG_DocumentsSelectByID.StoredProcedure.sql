USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spidm_LG_DocumentsSelectByID]
  @LoginID NvarChar(8),
  @PRFilter Bit,
  @ProjectID NVarChar(6),
  @DocumentID NVarChar(30),
  @RevisionNo NVarChar(2) 
  AS
  IF (@PRFilter = 0)
		SELECT
			[IDM_Documents].[ProjectID] ,
			[IDM_Documents].[DocumentID] ,
			[IDM_Documents].[RevisionNo] ,
			[IDM_Documents].[Description] ,
			[IDM_Documents].[AlternateDocumentID] ,
			[IDM_Documents].[WBSID] ,
			[IDM_Documents].[DocumentTypeID] ,
			[IDM_Documents].[DocumentSizeID] ,
			[IDM_Documents].[ResponsibleAgencyID] ,
			[IDM_Documents].[OriginatorID] ,
			[IDM_Documents].[ForCustomerSubmission] ,
			[IDM_Documents].[ForInternalUse] ,
			[IDM_Documents].[ForProduction] ,
			[IDM_Documents].[ForErection] ,
			[IDM_Documents].[Remarks] ,
			[IDM_Documents].[PlannedReleaseDate] ,
			[IDM_Documents].[ActualReleaseDate] ,
			[IDM_Documents].[ReleasedInPLM] ,
			[IDM_Documents].[ValidateInPLM] ,
			[IDM_Documents].[BlockIfNotExists] ,
			[IDM_Documents].[OnceForApproval] ,
			[IDM_Documents].[WarnForApproval] ,
			[IDM_Documents].[ImplementReceiptLock] ,
			[IDM_Documents].[VendorDocument] ,
			[IDM_Documents].[VDReceived] ,
			[IDM_Documents].[VendorID] ,
			[IDM_Documents].[VDReceiveRemarks] ,
			[IDM_Documents].[VDReceivedBy] ,
			[IDM_Documents].[VDReceivedOn] ,
			[IDM_Documents].[ReceiveDate] ,
			[IDM_Documents].[ReceiveStatusID] ,
			[IDM_Documents].[ReceiveRemarks] ,
			[IDM_Documents].[ReceivedBy] ,
			[IDM_Documents].[ReceivedLocked] ,
			[IDM_Documents].[Locked] ,
			[IDM_Documents].[TmtlTypeID] ,
			[IDM_Documents].[TmtlID] ,
			[IDM_Documents].[cmba] ,
			[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
			[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
			[IDM_DocumentSizes3].[Description] AS IDM_DocumentSizes3_Description,
			[IDM_DocumentTypes4].[Description] AS IDM_DocumentTypes4_Description,
			[IDM_Originator5].[Description] AS IDM_Originator5_Description,
			[IDM_Projects6].[Description] AS IDM_Projects6_Description,
			[IDM_ReceiveStatus7].[Description] AS IDM_ReceiveStatus7_Description,
			[IDM_ResponsibleAgency8].[Description] AS IDM_ResponsibleAgency8_Description,
			[IDM_TransmittalTypes9].[Description] AS IDM_TransmittalTypes9_Description,
			[IDM_Vendors10].[Description] AS IDM_Vendors10_Description,
			[IDM_WBS11].[Description] AS IDM_WBS11_Description 
		FROM [IDM_Documents] 
		LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
			ON [IDM_Documents].[ReceivedBy] = [HRM_Employees1].[CardNo]
		LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
			ON [IDM_Documents].[VDReceivedBy] = [HRM_Employees2].[CardNo]
		LEFT OUTER JOIN [IDM_DocumentSizes] AS [IDM_DocumentSizes3]
			ON [IDM_Documents].[DocumentSizeID] = [IDM_DocumentSizes3].[DocumentSizeID]
		LEFT OUTER JOIN [IDM_DocumentTypes] AS [IDM_DocumentTypes4]
			ON [IDM_Documents].[DocumentTypeID] = [IDM_DocumentTypes4].[DocumentTypeID]
		LEFT OUTER JOIN [IDM_Originator] AS [IDM_Originator5]
			ON [IDM_Documents].[OriginatorID] = [IDM_Originator5].[OriginatorID]
		INNER JOIN [IDM_Projects] AS [IDM_Projects6]
			ON [IDM_Documents].[ProjectID] = [IDM_Projects6].[ProjectID]
		LEFT OUTER JOIN [IDM_ReceiveStatus] AS [IDM_ReceiveStatus7]
			ON [IDM_Documents].[ReceiveStatusID] = [IDM_ReceiveStatus7].[ReceiveStatusID]
		LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency8]
			ON [IDM_Documents].[ResponsibleAgencyID] = [IDM_ResponsibleAgency8].[ResponsibleAgencyID]
		LEFT OUTER JOIN [IDM_TransmittalTypes] AS [IDM_TransmittalTypes9]
			ON [IDM_Documents].[TmtlTypeID] = [IDM_TransmittalTypes9].[TmtlTypeID]
		LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors10]
			ON [IDM_Documents].[VendorID] = [IDM_Vendors10].[VendorID]
		LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS11]
			ON [IDM_Documents].[WBSID] = [IDM_WBS11].[WBSID]
		WHERE
		[IDM_Documents].[ProjectID] = @ProjectID
		AND [IDM_Documents].[DocumentID] = @DocumentID
		AND [IDM_Documents].[RevisionNo] = @RevisionNo   
  ELSE
		SELECT
			[IDM_Documents].[ProjectID] ,
			[IDM_Documents].[DocumentID] ,
			[IDM_Documents].[RevisionNo] ,
			[IDM_Documents].[Description] ,
			[IDM_Documents].[AlternateDocumentID] ,
			[IDM_Documents].[WBSID] ,
			[IDM_Documents].[DocumentTypeID] ,
			[IDM_Documents].[DocumentSizeID] ,
			[IDM_Documents].[ResponsibleAgencyID] ,
			[IDM_Documents].[OriginatorID] ,
			[IDM_Documents].[ForCustomerSubmission] ,
			[IDM_Documents].[ForInternalUse] ,
			[IDM_Documents].[ForProduction] ,
			[IDM_Documents].[ForErection] ,
			[IDM_Documents].[Remarks] ,
			[IDM_Documents].[PlannedReleaseDate] ,
			[IDM_Documents].[ActualReleaseDate] ,
			[IDM_Documents].[ReleasedInPLM] ,
			[IDM_Documents].[ValidateInPLM] ,
			[IDM_Documents].[BlockIfNotExists] ,
			[IDM_Documents].[OnceForApproval] ,
			[IDM_Documents].[WarnForApproval] ,
			[IDM_Documents].[ImplementReceiptLock] ,
			[IDM_Documents].[VendorDocument] ,
			[IDM_Documents].[VDReceived] ,
			[IDM_Documents].[VendorID] ,
			[IDM_Documents].[VDReceiveRemarks] ,
			[IDM_Documents].[VDReceivedBy] ,
			[IDM_Documents].[VDReceivedOn] ,
			[IDM_Documents].[ReceiveDate] ,
			[IDM_Documents].[ReceiveStatusID] ,
			[IDM_Documents].[ReceiveRemarks] ,
			[IDM_Documents].[ReceivedBy] ,
			[IDM_Documents].[ReceivedLocked] ,
			[IDM_Documents].[Locked] ,
			[IDM_Documents].[TmtlTypeID] ,
			[IDM_Documents].[TmtlID] ,
			[IDM_Documents].[cmba] ,
			[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
			[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
			[IDM_DocumentSizes3].[Description] AS IDM_DocumentSizes3_Description,
			[IDM_DocumentTypes4].[Description] AS IDM_DocumentTypes4_Description,
			[IDM_Originator5].[Description] AS IDM_Originator5_Description,
			[IDM_Projects6].[Description] AS IDM_Projects6_Description,
			[IDM_ReceiveStatus7].[Description] AS IDM_ReceiveStatus7_Description,
			[IDM_ResponsibleAgency8].[Description] AS IDM_ResponsibleAgency8_Description,
			[IDM_TransmittalTypes9].[Description] AS IDM_TransmittalTypes9_Description,
			[IDM_Vendors10].[Description] AS IDM_Vendors10_Description,
			[IDM_WBS11].[Description] AS IDM_WBS11_Description 
		FROM [IDM_Documents] 
		LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
			ON [IDM_Documents].[ReceivedBy] = [HRM_Employees1].[CardNo]
		LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
			ON [IDM_Documents].[VDReceivedBy] = [HRM_Employees2].[CardNo]
		LEFT OUTER JOIN [IDM_DocumentSizes] AS [IDM_DocumentSizes3]
			ON [IDM_Documents].[DocumentSizeID] = [IDM_DocumentSizes3].[DocumentSizeID]
		LEFT OUTER JOIN [IDM_DocumentTypes] AS [IDM_DocumentTypes4]
			ON [IDM_Documents].[DocumentTypeID] = [IDM_DocumentTypes4].[DocumentTypeID]
		LEFT OUTER JOIN [IDM_Originator] AS [IDM_Originator5]
			ON [IDM_Documents].[OriginatorID] = [IDM_Originator5].[OriginatorID]
		INNER JOIN [IDM_Projects] AS [IDM_Projects6]
			ON [IDM_Documents].[ProjectID] = [IDM_Projects6].[ProjectID]
		LEFT OUTER JOIN [IDM_ReceiveStatus] AS [IDM_ReceiveStatus7]
			ON [IDM_Documents].[ReceiveStatusID] = [IDM_ReceiveStatus7].[ReceiveStatusID]
		LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency8]
			ON [IDM_Documents].[ResponsibleAgencyID] = [IDM_ResponsibleAgency8].[ResponsibleAgencyID]
		LEFT OUTER JOIN [IDM_TransmittalTypes] AS [IDM_TransmittalTypes9]
			ON [IDM_Documents].[TmtlTypeID] = [IDM_TransmittalTypes9].[TmtlTypeID]
		LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors10]
			ON [IDM_Documents].[VendorID] = [IDM_Vendors10].[VendorID]
		LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS11]
			ON [IDM_Documents].[WBSID] = [IDM_WBS11].[WBSID]
		WHERE  [IDM_Documents].[ProjectID] IN (SELECT PROJECTID FROM IDM_ProjectsByEmployee WHERE CardNo = @LoginID)  
		AND [IDM_Documents].[ProjectID] = @ProjectID
		AND [IDM_Documents].[DocumentID] = @DocumentID
		AND [IDM_Documents].[RevisionNo] = @RevisionNo
GO
