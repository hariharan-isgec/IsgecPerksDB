USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmReceiveVDSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @Filter_WBSID NVarChar(8),
  @Filter_DocumentTypeID Int,
  @Filter_ResponsibleAgencyID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @VendorDocument Bit,
  @VDReceived Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,DocumentID NVarChar(30) NOT NULL
 ,RevisionNo NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', DocumentID'
  SET @LGSQL = @LGSQL + ', RevisionNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_Documents].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [IDM_Documents].[DocumentID]'
  SET @LGSQL = @LGSQL + ', [IDM_Documents].[RevisionNo]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_Documents] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Documents].[ReceivedBy] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Documents].[VDReceivedBy] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_DocumentSizes] AS [IDM_DocumentSizes3]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Documents].[DocumentSizeID] = [IDM_DocumentSizes3].[DocumentSizeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_DocumentTypes] AS [IDM_DocumentTypes4]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Documents].[DocumentTypeID] = [IDM_DocumentTypes4].[DocumentTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Originator] AS [IDM_Originator5]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Documents].[OriginatorID] = [IDM_Originator5].[OriginatorID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects6]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Documents].[ProjectID] = [IDM_Projects6].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_ReceiveStatus] AS [IDM_ReceiveStatus7]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Documents].[ReceiveStatusID] = [IDM_ReceiveStatus7].[ReceiveStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency8]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Documents].[ResponsibleAgencyID] = [IDM_ResponsibleAgency8].[ResponsibleAgencyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_TransmittalTypes] AS [IDM_TransmittalTypes9]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Documents].[TmtlTypeID] = [IDM_TransmittalTypes9].[TmtlTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors10]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Documents].[VendorID] = [IDM_Vendors10].[VendorID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS11]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Documents].[WBSID] = [IDM_WBS11].[WBSID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [IDM_Documents].[VendorDocument] = ''' + CONVERT(NVarChar(10), @VendorDocument) + ''''
  SET @LGSQL = @LGSQL + ' AND [IDM_Documents].[VDReceived] = ''' + CONVERT(NVarChar(10), @VDReceived) + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_Documents].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_WBSID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_Documents].[WBSID] = ''' + @Filter_WBSID + ''''
  IF (@Filter_DocumentTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [IDM_Documents].[DocumentTypeID] = ' + STR(@Filter_DocumentTypeID)
  IF (@Filter_ResponsibleAgencyID > 0) 
    SET @LGSQL = @LGSQL + ' AND [IDM_Documents].[ResponsibleAgencyID] = ' + STR(@Filter_ResponsibleAgencyID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[IDM_Documents].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[IDM_Documents].[ProjectID] DESC'
                        WHEN 'DocumentID' THEN '[IDM_Documents].[DocumentID]'
                        WHEN 'DocumentID DESC' THEN '[IDM_Documents].[DocumentID] DESC'
                        WHEN 'RevisionNo' THEN '[IDM_Documents].[RevisionNo]'
                        WHEN 'RevisionNo DESC' THEN '[IDM_Documents].[RevisionNo] DESC'
                        WHEN 'Description' THEN '[IDM_Documents].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_Documents].[Description] DESC'
                        WHEN 'WBSID' THEN '[IDM_Documents].[WBSID]'
                        WHEN 'WBSID DESC' THEN '[IDM_Documents].[WBSID] DESC'
                        WHEN 'DocumentTypeID' THEN '[IDM_Documents].[DocumentTypeID]'
                        WHEN 'DocumentTypeID DESC' THEN '[IDM_Documents].[DocumentTypeID] DESC'
                        WHEN 'ResponsibleAgencyID' THEN '[IDM_Documents].[ResponsibleAgencyID]'
                        WHEN 'ResponsibleAgencyID DESC' THEN '[IDM_Documents].[ResponsibleAgencyID] DESC'
                        WHEN 'VendorDocument' THEN '[IDM_Documents].[VendorDocument]'
                        WHEN 'VendorDocument DESC' THEN '[IDM_Documents].[VendorDocument] DESC'
                        WHEN 'VDReceived' THEN '[IDM_Documents].[VDReceived]'
                        WHEN 'VDReceived DESC' THEN '[IDM_Documents].[VDReceived] DESC'
                        WHEN 'VendorID' THEN '[IDM_Documents].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[IDM_Documents].[VendorID] DESC'
                        WHEN 'AlternateDocumentID' THEN '[IDM_Documents].[AlternateDocumentID]'
                        WHEN 'AlternateDocumentID DESC' THEN '[IDM_Documents].[AlternateDocumentID] DESC'
                        WHEN 'PlannedReleaseDate' THEN '[IDM_Documents].[PlannedReleaseDate]'
                        WHEN 'PlannedReleaseDate DESC' THEN '[IDM_Documents].[PlannedReleaseDate] DESC'
                        WHEN 'VDReceiveRemarks' THEN '[IDM_Documents].[VDReceiveRemarks]'
                        WHEN 'VDReceiveRemarks DESC' THEN '[IDM_Documents].[VDReceiveRemarks] DESC'
                        WHEN 'VDReceivedBy' THEN '[IDM_Documents].[VDReceivedBy]'
                        WHEN 'VDReceivedBy DESC' THEN '[IDM_Documents].[VDReceivedBy] DESC'
                        WHEN 'VDReceivedOn' THEN '[IDM_Documents].[VDReceivedOn]'
                        WHEN 'VDReceivedOn DESC' THEN '[IDM_Documents].[VDReceivedOn] DESC'
                        WHEN 'ReceiveDate' THEN '[IDM_Documents].[ReceiveDate]'
                        WHEN 'ReceiveDate DESC' THEN '[IDM_Documents].[ReceiveDate] DESC'
                        WHEN 'ReceiveStatusID' THEN '[IDM_Documents].[ReceiveStatusID]'
                        WHEN 'ReceiveStatusID DESC' THEN '[IDM_Documents].[ReceiveStatusID] DESC'
                        WHEN 'ReceiveRemarks' THEN '[IDM_Documents].[ReceiveRemarks]'
                        WHEN 'ReceiveRemarks DESC' THEN '[IDM_Documents].[ReceiveRemarks] DESC'
                        WHEN 'ReceivedBy' THEN '[IDM_Documents].[ReceivedBy]'
                        WHEN 'ReceivedBy DESC' THEN '[IDM_Documents].[ReceivedBy] DESC'
                        WHEN 'ReceivedLocked' THEN '[IDM_Documents].[ReceivedLocked]'
                        WHEN 'ReceivedLocked DESC' THEN '[IDM_Documents].[ReceivedLocked] DESC'
                        WHEN 'Locked' THEN '[IDM_Documents].[Locked]'
                        WHEN 'Locked DESC' THEN '[IDM_Documents].[Locked] DESC'
                        WHEN 'TmtlTypeID' THEN '[IDM_Documents].[TmtlTypeID]'
                        WHEN 'TmtlTypeID DESC' THEN '[IDM_Documents].[TmtlTypeID] DESC'
                        WHEN 'TmtlID' THEN '[IDM_Documents].[TmtlID]'
                        WHEN 'TmtlID DESC' THEN '[IDM_Documents].[TmtlID] DESC'
                        WHEN 'cmba' THEN '[IDM_Documents].[cmba]'
                        WHEN 'cmba DESC' THEN '[IDM_Documents].[cmba] DESC'
                        WHEN 'ImplementReceiptLock' THEN '[IDM_Documents].[ImplementReceiptLock]'
                        WHEN 'ImplementReceiptLock DESC' THEN '[IDM_Documents].[ImplementReceiptLock] DESC'
                        WHEN 'WarnForApproval' THEN '[IDM_Documents].[WarnForApproval]'
                        WHEN 'WarnForApproval DESC' THEN '[IDM_Documents].[WarnForApproval] DESC'
                        WHEN 'OnceForApproval' THEN '[IDM_Documents].[OnceForApproval]'
                        WHEN 'OnceForApproval DESC' THEN '[IDM_Documents].[OnceForApproval] DESC'
                        WHEN 'BlockIfNotExists' THEN '[IDM_Documents].[BlockIfNotExists]'
                        WHEN 'BlockIfNotExists DESC' THEN '[IDM_Documents].[BlockIfNotExists] DESC'
                        WHEN 'ReleasedInPLM' THEN '[IDM_Documents].[ReleasedInPLM]'
                        WHEN 'ReleasedInPLM DESC' THEN '[IDM_Documents].[ReleasedInPLM] DESC'
                        WHEN 'ActualReleaseDate' THEN '[IDM_Documents].[ActualReleaseDate]'
                        WHEN 'ActualReleaseDate DESC' THEN '[IDM_Documents].[ActualReleaseDate] DESC'
                        WHEN 'Remarks' THEN '[IDM_Documents].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[IDM_Documents].[Remarks] DESC'
                        WHEN 'ForProduction' THEN '[IDM_Documents].[ForProduction]'
                        WHEN 'ForProduction DESC' THEN '[IDM_Documents].[ForProduction] DESC'
                        WHEN 'ForInternalUse' THEN '[IDM_Documents].[ForInternalUse]'
                        WHEN 'ForInternalUse DESC' THEN '[IDM_Documents].[ForInternalUse] DESC'
                        WHEN 'ForErection' THEN '[IDM_Documents].[ForErection]'
                        WHEN 'ForErection DESC' THEN '[IDM_Documents].[ForErection] DESC'
                        WHEN 'DocumentSizeID' THEN '[IDM_Documents].[DocumentSizeID]'
                        WHEN 'DocumentSizeID DESC' THEN '[IDM_Documents].[DocumentSizeID] DESC'
                        WHEN 'OriginatorID' THEN '[IDM_Documents].[OriginatorID]'
                        WHEN 'OriginatorID DESC' THEN '[IDM_Documents].[OriginatorID] DESC'
                        WHEN 'ForCustomerSubmission' THEN '[IDM_Documents].[ForCustomerSubmission]'
                        WHEN 'ForCustomerSubmission DESC' THEN '[IDM_Documents].[ForCustomerSubmission] DESC'
                        WHEN 'ValidateInPLM' THEN '[IDM_Documents].[ValidateInPLM]'
                        WHEN 'ValidateInPLM DESC' THEN '[IDM_Documents].[ValidateInPLM] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'IDM_DocumentSizes3_Description' THEN '[IDM_DocumentSizes].[Description]'
                        WHEN 'IDM_DocumentSizes3_Description DESC' THEN '[IDM_DocumentSizes3].[Description] DESC'
                        WHEN 'IDM_DocumentTypes4_Description' THEN '[IDM_DocumentTypes].[Description]'
                        WHEN 'IDM_DocumentTypes4_Description DESC' THEN '[IDM_DocumentTypes4].[Description] DESC'
                        WHEN 'IDM_Originator5_Description' THEN '[IDM_Originator].[Description]'
                        WHEN 'IDM_Originator5_Description DESC' THEN '[IDM_Originator5].[Description] DESC'
                        WHEN 'IDM_Projects6_Description' THEN '[IDM_Projects].[Description]'
                        WHEN 'IDM_Projects6_Description DESC' THEN '[IDM_Projects6].[Description] DESC'
                        WHEN 'IDM_ReceiveStatus7_Description' THEN '[IDM_ReceiveStatus].[Description]'
                        WHEN 'IDM_ReceiveStatus7_Description DESC' THEN '[IDM_ReceiveStatus7].[Description] DESC'
                        WHEN 'IDM_ResponsibleAgency8_Description' THEN '[IDM_ResponsibleAgency].[Description]'
                        WHEN 'IDM_ResponsibleAgency8_Description DESC' THEN '[IDM_ResponsibleAgency8].[Description] DESC'
                        WHEN 'IDM_TransmittalTypes9_Description' THEN '[IDM_TransmittalTypes].[Description]'
                        WHEN 'IDM_TransmittalTypes9_Description DESC' THEN '[IDM_TransmittalTypes9].[Description] DESC'
                        WHEN 'IDM_Vendors10_Description' THEN '[IDM_Vendors].[Description]'
                        WHEN 'IDM_Vendors10_Description DESC' THEN '[IDM_Vendors10].[Description] DESC'
                        WHEN 'IDM_WBS11_Description' THEN '[IDM_WBS].[Description]'
                        WHEN 'IDM_WBS11_Description DESC' THEN '[IDM_WBS11].[Description] DESC'
                        ELSE '[IDM_Documents].[ProjectID],[IDM_Documents].[DocumentID],[IDM_Documents].[RevisionNo]'
                    END
  EXEC (@LGSQL)

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
