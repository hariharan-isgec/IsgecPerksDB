USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmReceiveVDSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @VendorDocument Bit,
  @VDReceived Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,DocumentID NVarChar(30) NOT NULL
 ,RevisionNo NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, DocumentID, RevisionNo)
  SELECT [IDM_Documents].[ProjectID], [IDM_Documents].[DocumentID], [IDM_Documents].[RevisionNo] FROM [IDM_Documents]
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
      [IDM_Documents].[VendorDocument] = (@VendorDocument)
  AND [IDM_Documents].[VDReceived] = (@VDReceived)
   AND ( 
         LOWER(ISNULL([IDM_Documents].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[DocumentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[RevisionNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[WBSID],'')) LIKE @KeyWord1
     OR STR(ISNULL([IDM_Documents].[DocumentTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([IDM_Documents].[ResponsibleAgencyID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[AlternateDocumentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[VDReceiveRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[VDReceivedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[ReceiveStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[ReceiveRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[ReceivedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[TmtlTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([IDM_Documents].[TmtlID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[DocumentSizeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Documents].[OriginatorID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ProjectID' THEN [IDM_Documents].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [IDM_Documents].[ProjectID] END DESC,
     CASE @orderBy WHEN 'DocumentID' THEN [IDM_Documents].[DocumentID] END,
     CASE @orderBy WHEN 'DocumentID DESC' THEN [IDM_Documents].[DocumentID] END DESC,
     CASE @orderBy WHEN 'RevisionNo' THEN [IDM_Documents].[RevisionNo] END,
     CASE @orderBy WHEN 'RevisionNo DESC' THEN [IDM_Documents].[RevisionNo] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_Documents].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_Documents].[Description] END DESC,
     CASE @orderBy WHEN 'WBSID' THEN [IDM_Documents].[WBSID] END,
     CASE @orderBy WHEN 'WBSID DESC' THEN [IDM_Documents].[WBSID] END DESC,
     CASE @orderBy WHEN 'DocumentTypeID' THEN [IDM_Documents].[DocumentTypeID] END,
     CASE @orderBy WHEN 'DocumentTypeID DESC' THEN [IDM_Documents].[DocumentTypeID] END DESC,
     CASE @orderBy WHEN 'ResponsibleAgencyID' THEN [IDM_Documents].[ResponsibleAgencyID] END,
     CASE @orderBy WHEN 'ResponsibleAgencyID DESC' THEN [IDM_Documents].[ResponsibleAgencyID] END DESC,
     CASE @orderBy WHEN 'VendorDocument' THEN [IDM_Documents].[VendorDocument] END,
     CASE @orderBy WHEN 'VendorDocument DESC' THEN [IDM_Documents].[VendorDocument] END DESC,
     CASE @orderBy WHEN 'VDReceived' THEN [IDM_Documents].[VDReceived] END,
     CASE @orderBy WHEN 'VDReceived DESC' THEN [IDM_Documents].[VDReceived] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [IDM_Documents].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [IDM_Documents].[VendorID] END DESC,
     CASE @orderBy WHEN 'AlternateDocumentID' THEN [IDM_Documents].[AlternateDocumentID] END,
     CASE @orderBy WHEN 'AlternateDocumentID DESC' THEN [IDM_Documents].[AlternateDocumentID] END DESC,
     CASE @orderBy WHEN 'PlannedReleaseDate' THEN [IDM_Documents].[PlannedReleaseDate] END,
     CASE @orderBy WHEN 'PlannedReleaseDate DESC' THEN [IDM_Documents].[PlannedReleaseDate] END DESC,
     CASE @orderBy WHEN 'VDReceiveRemarks' THEN [IDM_Documents].[VDReceiveRemarks] END,
     CASE @orderBy WHEN 'VDReceiveRemarks DESC' THEN [IDM_Documents].[VDReceiveRemarks] END DESC,
     CASE @orderBy WHEN 'VDReceivedBy' THEN [IDM_Documents].[VDReceivedBy] END,
     CASE @orderBy WHEN 'VDReceivedBy DESC' THEN [IDM_Documents].[VDReceivedBy] END DESC,
     CASE @orderBy WHEN 'VDReceivedOn' THEN [IDM_Documents].[VDReceivedOn] END,
     CASE @orderBy WHEN 'VDReceivedOn DESC' THEN [IDM_Documents].[VDReceivedOn] END DESC,
     CASE @orderBy WHEN 'ReceiveDate' THEN [IDM_Documents].[ReceiveDate] END,
     CASE @orderBy WHEN 'ReceiveDate DESC' THEN [IDM_Documents].[ReceiveDate] END DESC,
     CASE @orderBy WHEN 'ReceiveStatusID' THEN [IDM_Documents].[ReceiveStatusID] END,
     CASE @orderBy WHEN 'ReceiveStatusID DESC' THEN [IDM_Documents].[ReceiveStatusID] END DESC,
     CASE @orderBy WHEN 'ReceiveRemarks' THEN [IDM_Documents].[ReceiveRemarks] END,
     CASE @orderBy WHEN 'ReceiveRemarks DESC' THEN [IDM_Documents].[ReceiveRemarks] END DESC,
     CASE @orderBy WHEN 'ReceivedBy' THEN [IDM_Documents].[ReceivedBy] END,
     CASE @orderBy WHEN 'ReceivedBy DESC' THEN [IDM_Documents].[ReceivedBy] END DESC,
     CASE @orderBy WHEN 'ReceivedLocked' THEN [IDM_Documents].[ReceivedLocked] END,
     CASE @orderBy WHEN 'ReceivedLocked DESC' THEN [IDM_Documents].[ReceivedLocked] END DESC,
     CASE @orderBy WHEN 'Locked' THEN [IDM_Documents].[Locked] END,
     CASE @orderBy WHEN 'Locked DESC' THEN [IDM_Documents].[Locked] END DESC,
     CASE @orderBy WHEN 'TmtlTypeID' THEN [IDM_Documents].[TmtlTypeID] END,
     CASE @orderBy WHEN 'TmtlTypeID DESC' THEN [IDM_Documents].[TmtlTypeID] END DESC,
     CASE @orderBy WHEN 'TmtlID' THEN [IDM_Documents].[TmtlID] END,
     CASE @orderBy WHEN 'TmtlID DESC' THEN [IDM_Documents].[TmtlID] END DESC,
     CASE @orderBy WHEN 'cmba' THEN [IDM_Documents].[cmba] END,
     CASE @orderBy WHEN 'cmba DESC' THEN [IDM_Documents].[cmba] END DESC,
     CASE @orderBy WHEN 'ImplementReceiptLock' THEN [IDM_Documents].[ImplementReceiptLock] END,
     CASE @orderBy WHEN 'ImplementReceiptLock DESC' THEN [IDM_Documents].[ImplementReceiptLock] END DESC,
     CASE @orderBy WHEN 'WarnForApproval' THEN [IDM_Documents].[WarnForApproval] END,
     CASE @orderBy WHEN 'WarnForApproval DESC' THEN [IDM_Documents].[WarnForApproval] END DESC,
     CASE @orderBy WHEN 'OnceForApproval' THEN [IDM_Documents].[OnceForApproval] END,
     CASE @orderBy WHEN 'OnceForApproval DESC' THEN [IDM_Documents].[OnceForApproval] END DESC,
     CASE @orderBy WHEN 'BlockIfNotExists' THEN [IDM_Documents].[BlockIfNotExists] END,
     CASE @orderBy WHEN 'BlockIfNotExists DESC' THEN [IDM_Documents].[BlockIfNotExists] END DESC,
     CASE @orderBy WHEN 'ReleasedInPLM' THEN [IDM_Documents].[ReleasedInPLM] END,
     CASE @orderBy WHEN 'ReleasedInPLM DESC' THEN [IDM_Documents].[ReleasedInPLM] END DESC,
     CASE @orderBy WHEN 'ActualReleaseDate' THEN [IDM_Documents].[ActualReleaseDate] END,
     CASE @orderBy WHEN 'ActualReleaseDate DESC' THEN [IDM_Documents].[ActualReleaseDate] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [IDM_Documents].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [IDM_Documents].[Remarks] END DESC,
     CASE @orderBy WHEN 'ForProduction' THEN [IDM_Documents].[ForProduction] END,
     CASE @orderBy WHEN 'ForProduction DESC' THEN [IDM_Documents].[ForProduction] END DESC,
     CASE @orderBy WHEN 'ForInternalUse' THEN [IDM_Documents].[ForInternalUse] END,
     CASE @orderBy WHEN 'ForInternalUse DESC' THEN [IDM_Documents].[ForInternalUse] END DESC,
     CASE @orderBy WHEN 'ForErection' THEN [IDM_Documents].[ForErection] END,
     CASE @orderBy WHEN 'ForErection DESC' THEN [IDM_Documents].[ForErection] END DESC,
     CASE @orderBy WHEN 'DocumentSizeID' THEN [IDM_Documents].[DocumentSizeID] END,
     CASE @orderBy WHEN 'DocumentSizeID DESC' THEN [IDM_Documents].[DocumentSizeID] END DESC,
     CASE @orderBy WHEN 'OriginatorID' THEN [IDM_Documents].[OriginatorID] END,
     CASE @orderBy WHEN 'OriginatorID DESC' THEN [IDM_Documents].[OriginatorID] END DESC,
     CASE @orderBy WHEN 'ForCustomerSubmission' THEN [IDM_Documents].[ForCustomerSubmission] END,
     CASE @orderBy WHEN 'ForCustomerSubmission DESC' THEN [IDM_Documents].[ForCustomerSubmission] END DESC,
     CASE @orderBy WHEN 'ValidateInPLM' THEN [IDM_Documents].[ValidateInPLM] END,
     CASE @orderBy WHEN 'ValidateInPLM DESC' THEN [IDM_Documents].[ValidateInPLM] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'IDM_DocumentSizes3_Description' THEN [IDM_DocumentSizes3].[Description] END,
     CASE @orderBy WHEN 'IDM_DocumentSizes3_Description DESC' THEN [IDM_DocumentSizes3].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_DocumentTypes4_Description' THEN [IDM_DocumentTypes4].[Description] END,
     CASE @orderBy WHEN 'IDM_DocumentTypes4_Description DESC' THEN [IDM_DocumentTypes4].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Originator5_Description' THEN [IDM_Originator5].[Description] END,
     CASE @orderBy WHEN 'IDM_Originator5_Description DESC' THEN [IDM_Originator5].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Projects6_Description' THEN [IDM_Projects6].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects6_Description DESC' THEN [IDM_Projects6].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_ReceiveStatus7_Description' THEN [IDM_ReceiveStatus7].[Description] END,
     CASE @orderBy WHEN 'IDM_ReceiveStatus7_Description DESC' THEN [IDM_ReceiveStatus7].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_ResponsibleAgency8_Description' THEN [IDM_ResponsibleAgency8].[Description] END,
     CASE @orderBy WHEN 'IDM_ResponsibleAgency8_Description DESC' THEN [IDM_ResponsibleAgency8].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_TransmittalTypes9_Description' THEN [IDM_TransmittalTypes9].[Description] END,
     CASE @orderBy WHEN 'IDM_TransmittalTypes9_Description DESC' THEN [IDM_TransmittalTypes9].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Vendors10_Description' THEN [IDM_Vendors10].[Description] END,
     CASE @orderBy WHEN 'IDM_Vendors10_Description DESC' THEN [IDM_Vendors10].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_WBS11_Description' THEN [IDM_WBS11].[Description] END,
     CASE @orderBy WHEN 'IDM_WBS11_Description DESC' THEN [IDM_WBS11].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_Documents].[ProjectID] ,
		[IDM_Documents].[DocumentID] ,
		[IDM_Documents].[RevisionNo] ,
		[IDM_Documents].[Description] ,
		[IDM_Documents].[WBSID] ,
		[IDM_Documents].[DocumentTypeID] ,
		[IDM_Documents].[ResponsibleAgencyID] ,
		[IDM_Documents].[VendorDocument] ,
		[IDM_Documents].[VDReceived] ,
		[IDM_Documents].[VendorID] ,
		[IDM_Documents].[AlternateDocumentID] ,
		[IDM_Documents].[PlannedReleaseDate] ,
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
		[IDM_Documents].[ImplementReceiptLock] ,
		[IDM_Documents].[WarnForApproval] ,
		[IDM_Documents].[OnceForApproval] ,
		[IDM_Documents].[BlockIfNotExists] ,
		[IDM_Documents].[ReleasedInPLM] ,
		[IDM_Documents].[ActualReleaseDate] ,
		[IDM_Documents].[Remarks] ,
		[IDM_Documents].[ForProduction] ,
		[IDM_Documents].[ForInternalUse] ,
		[IDM_Documents].[ForErection] ,
		[IDM_Documents].[DocumentSizeID] ,
		[IDM_Documents].[OriginatorID] ,
		[IDM_Documents].[ForCustomerSubmission] ,
		[IDM_Documents].[ValidateInPLM] ,
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
    	INNER JOIN #PageIndex
          ON [IDM_Documents].[ProjectID] = #PageIndex.ProjectID
          AND [IDM_Documents].[DocumentID] = #PageIndex.DocumentID
          AND [IDM_Documents].[RevisionNo] = #PageIndex.RevisionNo
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
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
