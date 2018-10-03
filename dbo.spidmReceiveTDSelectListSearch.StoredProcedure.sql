USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmReceiveTDSelectListSearch]
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
 ,DocumentID NVarChar(30) NOT NULL
 ,RevisionNo NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (TmtlID, ProjectID, DocumentID, RevisionNo)
  SELECT [IDM_TransmittalDetail].[TmtlID], [IDM_TransmittalDetail].[ProjectID], [IDM_TransmittalDetail].[DocumentID], [IDM_TransmittalDetail].[RevisionNo] FROM [IDM_TransmittalDetail]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [IDM_TransmittalDetail].[ReceivedBy] = [HRM_Employees1].[CardNo]
  INNER JOIN [IDM_Transmittal] AS [IDM_Transmittal2]
    ON [IDM_TransmittalDetail].[TmtlID] = [IDM_Transmittal2].[TmtlID]
  INNER JOIN [IDM_Documents] AS [IDM_Documents3]
    ON [IDM_TransmittalDetail].[ProjectID] = [IDM_Documents3].[ProjectID]
    AND [IDM_TransmittalDetail].[DocumentID] = [IDM_Documents3].[DocumentID]
    AND [IDM_TransmittalDetail].[RevisionNo] = [IDM_Documents3].[RevisionNo]
  LEFT OUTER JOIN [IDM_DocumentStatus] AS [IDM_DocumentStatus4]
    ON [IDM_TransmittalDetail].[DocumentStatusID] = [IDM_DocumentStatus4].[DocumentStatusID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects5]
    ON [IDM_TransmittalDetail].[ProjectID] = [IDM_Projects5].[ProjectID]
  LEFT OUTER JOIN [IDM_ReceiveStatus] AS [IDM_ReceiveStatus6]
    ON [IDM_TransmittalDetail].[ReceiveStatusID] = [IDM_ReceiveStatus6].[ReceiveStatusID]
  LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency7]
    ON [IDM_TransmittalDetail].[ResponsibleAgencyID] = [IDM_ResponsibleAgency7].[ResponsibleAgencyID]
  LEFT OUTER JOIN [IDM_SendStatus] AS [IDM_SendStatus8]
    ON [IDM_TransmittalDetail].[SendStatusID] = [IDM_SendStatus8].[SendStatusID]
  LEFT OUTER JOIN [IDM_TransmittalStatus] AS [IDM_TransmittalStatus9]
    ON [IDM_TransmittalDetail].[TmtlStatusID] = [IDM_TransmittalStatus9].[TmtlStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees10]
    ON [IDM_TransmittalDetail].[CardNo] = [HRM_Employees10].[CardNo]
  LEFT OUTER JOIN [IDM_Customers] AS [IDM_Customers11]
    ON [IDM_TransmittalDetail].[CustomerID] = [IDM_Customers11].[CustomerID]
  LEFT OUTER JOIN [IDM_TransmittalTypes] AS [IDM_TransmittalTypes12]
    ON [IDM_TransmittalDetail].[TmtlTypeID] = [IDM_TransmittalTypes12].[TmtlTypeID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors13]
    ON [IDM_TransmittalDetail].[VendorID] = [IDM_Vendors13].[VendorID]
 WHERE  
   ( 
         STR(ISNULL([IDM_TransmittalDetail].[TmtlID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalDetail].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalDetail].[DocumentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalDetail].[RevisionNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalDetail].[SendStatusID],'')) LIKE @KeyWord1
     OR STR(ISNULL([IDM_TransmittalDetail].[NoOfCopies], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalDetail].[SendRemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([IDM_TransmittalDetail].[TmtlStatusID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([IDM_TransmittalDetail].[DocumentStatusID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([IDM_TransmittalDetail].[ResponsibleAgencyID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalDetail].[TmtlTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalDetail].[CustomerID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalDetail].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalDetail].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalDetail].[ReceiveStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalDetail].[ReceivedRefNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalDetail].[ReceivedRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_TransmittalDetail].[ReceivedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'TmtlID' THEN [IDM_TransmittalDetail].[TmtlID] END,
     CASE @orderBy WHEN 'TmtlID DESC' THEN [IDM_TransmittalDetail].[TmtlID] END DESC,
     CASE @orderBy WHEN 'ProjectID' THEN [IDM_TransmittalDetail].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [IDM_TransmittalDetail].[ProjectID] END DESC,
     CASE @orderBy WHEN 'DocumentID' THEN [IDM_TransmittalDetail].[DocumentID] END,
     CASE @orderBy WHEN 'DocumentID DESC' THEN [IDM_TransmittalDetail].[DocumentID] END DESC,
     CASE @orderBy WHEN 'RevisionNo' THEN [IDM_TransmittalDetail].[RevisionNo] END,
     CASE @orderBy WHEN 'RevisionNo DESC' THEN [IDM_TransmittalDetail].[RevisionNo] END DESC,
     CASE @orderBy WHEN 'SendStatusID' THEN [IDM_TransmittalDetail].[SendStatusID] END,
     CASE @orderBy WHEN 'SendStatusID DESC' THEN [IDM_TransmittalDetail].[SendStatusID] END DESC,
     CASE @orderBy WHEN 'NoOfCopies' THEN [IDM_TransmittalDetail].[NoOfCopies] END,
     CASE @orderBy WHEN 'NoOfCopies DESC' THEN [IDM_TransmittalDetail].[NoOfCopies] END DESC,
     CASE @orderBy WHEN 'SendRemarks' THEN [IDM_TransmittalDetail].[SendRemarks] END,
     CASE @orderBy WHEN 'SendRemarks DESC' THEN [IDM_TransmittalDetail].[SendRemarks] END DESC,
     CASE @orderBy WHEN 'TmtlStatusID' THEN [IDM_TransmittalDetail].[TmtlStatusID] END,
     CASE @orderBy WHEN 'TmtlStatusID DESC' THEN [IDM_TransmittalDetail].[TmtlStatusID] END DESC,
     CASE @orderBy WHEN 'DocumentStatusID' THEN [IDM_TransmittalDetail].[DocumentStatusID] END,
     CASE @orderBy WHEN 'DocumentStatusID DESC' THEN [IDM_TransmittalDetail].[DocumentStatusID] END DESC,
     CASE @orderBy WHEN 'ResponsibleAgencyID' THEN [IDM_TransmittalDetail].[ResponsibleAgencyID] END,
     CASE @orderBy WHEN 'ResponsibleAgencyID DESC' THEN [IDM_TransmittalDetail].[ResponsibleAgencyID] END DESC,
     CASE @orderBy WHEN 'TmtlTypeID' THEN [IDM_TransmittalDetail].[TmtlTypeID] END,
     CASE @orderBy WHEN 'TmtlTypeID DESC' THEN [IDM_TransmittalDetail].[TmtlTypeID] END DESC,
     CASE @orderBy WHEN 'CustomerID' THEN [IDM_TransmittalDetail].[CustomerID] END,
     CASE @orderBy WHEN 'CustomerID DESC' THEN [IDM_TransmittalDetail].[CustomerID] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [IDM_TransmittalDetail].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [IDM_TransmittalDetail].[VendorID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [IDM_TransmittalDetail].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [IDM_TransmittalDetail].[CardNo] END DESC,
     CASE @orderBy WHEN 'ReceiveStatusID' THEN [IDM_TransmittalDetail].[ReceiveStatusID] END,
     CASE @orderBy WHEN 'ReceiveStatusID DESC' THEN [IDM_TransmittalDetail].[ReceiveStatusID] END DESC,
     CASE @orderBy WHEN 'ReceivedRefNo' THEN [IDM_TransmittalDetail].[ReceivedRefNo] END,
     CASE @orderBy WHEN 'ReceivedRefNo DESC' THEN [IDM_TransmittalDetail].[ReceivedRefNo] END DESC,
     CASE @orderBy WHEN 'ReceivedRemarks' THEN [IDM_TransmittalDetail].[ReceivedRemarks] END,
     CASE @orderBy WHEN 'ReceivedRemarks DESC' THEN [IDM_TransmittalDetail].[ReceivedRemarks] END DESC,
     CASE @orderBy WHEN 'ReceiveLocked' THEN [IDM_TransmittalDetail].[ReceiveLocked] END,
     CASE @orderBy WHEN 'ReceiveLocked DESC' THEN [IDM_TransmittalDetail].[ReceiveLocked] END DESC,
     CASE @orderBy WHEN 'ReceivedOn' THEN [IDM_TransmittalDetail].[ReceivedOn] END,
     CASE @orderBy WHEN 'ReceivedOn DESC' THEN [IDM_TransmittalDetail].[ReceivedOn] END DESC,
     CASE @orderBy WHEN 'ReceivedBy' THEN [IDM_TransmittalDetail].[ReceivedBy] END,
     CASE @orderBy WHEN 'ReceivedBy DESC' THEN [IDM_TransmittalDetail].[ReceivedBy] END DESC,
     CASE @orderBy WHEN 'cmba' THEN [IDM_TransmittalDetail].[cmba] END,
     CASE @orderBy WHEN 'cmba DESC' THEN [IDM_TransmittalDetail].[cmba] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'IDM_Transmittal2_TmtlReference' THEN [IDM_Transmittal2].[TmtlReference] END,
     CASE @orderBy WHEN 'IDM_Transmittal2_TmtlReference DESC' THEN [IDM_Transmittal2].[TmtlReference] END DESC,
     CASE @orderBy WHEN 'IDM_Documents3_DocumentID' THEN [IDM_Documents3].[DocumentID] END,
     CASE @orderBy WHEN 'IDM_Documents3_DocumentID DESC' THEN [IDM_Documents3].[DocumentID] END DESC,
     CASE @orderBy WHEN 'IDM_DocumentStatus4_Description' THEN [IDM_DocumentStatus4].[Description] END,
     CASE @orderBy WHEN 'IDM_DocumentStatus4_Description DESC' THEN [IDM_DocumentStatus4].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Projects5_Description' THEN [IDM_Projects5].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects5_Description DESC' THEN [IDM_Projects5].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_ReceiveStatus6_Description' THEN [IDM_ReceiveStatus6].[Description] END,
     CASE @orderBy WHEN 'IDM_ReceiveStatus6_Description DESC' THEN [IDM_ReceiveStatus6].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_ResponsibleAgency7_Description' THEN [IDM_ResponsibleAgency7].[Description] END,
     CASE @orderBy WHEN 'IDM_ResponsibleAgency7_Description DESC' THEN [IDM_ResponsibleAgency7].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_SendStatus8_Description' THEN [IDM_SendStatus8].[Description] END,
     CASE @orderBy WHEN 'IDM_SendStatus8_Description DESC' THEN [IDM_SendStatus8].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_TransmittalStatus9_Description' THEN [IDM_TransmittalStatus9].[Description] END,
     CASE @orderBy WHEN 'IDM_TransmittalStatus9_Description DESC' THEN [IDM_TransmittalStatus9].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees10_EmployeeName' THEN [HRM_Employees10].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees10_EmployeeName DESC' THEN [HRM_Employees10].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'IDM_Customers11_Description' THEN [IDM_Customers11].[Description] END,
     CASE @orderBy WHEN 'IDM_Customers11_Description DESC' THEN [IDM_Customers11].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_TransmittalTypes12_Description' THEN [IDM_TransmittalTypes12].[Description] END,
     CASE @orderBy WHEN 'IDM_TransmittalTypes12_Description DESC' THEN [IDM_TransmittalTypes12].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Vendors13_Description' THEN [IDM_Vendors13].[Description] END,
     CASE @orderBy WHEN 'IDM_Vendors13_Description DESC' THEN [IDM_Vendors13].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_TransmittalDetail].[TmtlID] ,
		[IDM_TransmittalDetail].[ProjectID] ,
		[IDM_TransmittalDetail].[DocumentID] ,
		[IDM_TransmittalDetail].[RevisionNo] ,
		[IDM_TransmittalDetail].[SendStatusID] ,
		[IDM_TransmittalDetail].[NoOfCopies] ,
		[IDM_TransmittalDetail].[SendRemarks] ,
		[IDM_TransmittalDetail].[TmtlStatusID] ,
		[IDM_TransmittalDetail].[DocumentStatusID] ,
		[IDM_TransmittalDetail].[ResponsibleAgencyID] ,
		[IDM_TransmittalDetail].[TmtlTypeID] ,
		[IDM_TransmittalDetail].[CustomerID] ,
		[IDM_TransmittalDetail].[VendorID] ,
		[IDM_TransmittalDetail].[CardNo] ,
		[IDM_TransmittalDetail].[ReceiveStatusID] ,
		[IDM_TransmittalDetail].[ReceivedRefNo] ,
		[IDM_TransmittalDetail].[ReceivedRemarks] ,
		[IDM_TransmittalDetail].[ReceiveLocked] ,
		[IDM_TransmittalDetail].[ReceivedOn] ,
		[IDM_TransmittalDetail].[ReceivedBy] ,
		[IDM_TransmittalDetail].[cmba] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[IDM_Transmittal2].[TmtlReference] AS IDM_Transmittal2_TmtlReference,
		[IDM_Documents3].[DocumentID] AS IDM_Documents3_DocumentID,
		[IDM_DocumentStatus4].[Description] AS IDM_DocumentStatus4_Description,
		[IDM_Projects5].[Description] AS IDM_Projects5_Description,
		[IDM_ReceiveStatus6].[Description] AS IDM_ReceiveStatus6_Description,
		[IDM_ResponsibleAgency7].[Description] AS IDM_ResponsibleAgency7_Description,
		[IDM_SendStatus8].[Description] AS IDM_SendStatus8_Description,
		[IDM_TransmittalStatus9].[Description] AS IDM_TransmittalStatus9_Description,
		[HRM_Employees10].[EmployeeName] AS HRM_Employees10_EmployeeName,
		[IDM_Customers11].[Description] AS IDM_Customers11_Description,
		[IDM_TransmittalTypes12].[Description] AS IDM_TransmittalTypes12_Description,
		[IDM_Vendors13].[Description] AS IDM_Vendors13_Description 
  FROM [IDM_TransmittalDetail] 
    	INNER JOIN #PageIndex
          ON [IDM_TransmittalDetail].[TmtlID] = #PageIndex.TmtlID
          AND [IDM_TransmittalDetail].[ProjectID] = #PageIndex.ProjectID
          AND [IDM_TransmittalDetail].[DocumentID] = #PageIndex.DocumentID
          AND [IDM_TransmittalDetail].[RevisionNo] = #PageIndex.RevisionNo
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [IDM_TransmittalDetail].[ReceivedBy] = [HRM_Employees1].[CardNo]
  INNER JOIN [IDM_Transmittal] AS [IDM_Transmittal2]
    ON [IDM_TransmittalDetail].[TmtlID] = [IDM_Transmittal2].[TmtlID]
  INNER JOIN [IDM_Documents] AS [IDM_Documents3]
    ON [IDM_TransmittalDetail].[ProjectID] = [IDM_Documents3].[ProjectID]
    AND [IDM_TransmittalDetail].[DocumentID] = [IDM_Documents3].[DocumentID]
    AND [IDM_TransmittalDetail].[RevisionNo] = [IDM_Documents3].[RevisionNo]
  LEFT OUTER JOIN [IDM_DocumentStatus] AS [IDM_DocumentStatus4]
    ON [IDM_TransmittalDetail].[DocumentStatusID] = [IDM_DocumentStatus4].[DocumentStatusID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects5]
    ON [IDM_TransmittalDetail].[ProjectID] = [IDM_Projects5].[ProjectID]
  LEFT OUTER JOIN [IDM_ReceiveStatus] AS [IDM_ReceiveStatus6]
    ON [IDM_TransmittalDetail].[ReceiveStatusID] = [IDM_ReceiveStatus6].[ReceiveStatusID]
  LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency7]
    ON [IDM_TransmittalDetail].[ResponsibleAgencyID] = [IDM_ResponsibleAgency7].[ResponsibleAgencyID]
  LEFT OUTER JOIN [IDM_SendStatus] AS [IDM_SendStatus8]
    ON [IDM_TransmittalDetail].[SendStatusID] = [IDM_SendStatus8].[SendStatusID]
  LEFT OUTER JOIN [IDM_TransmittalStatus] AS [IDM_TransmittalStatus9]
    ON [IDM_TransmittalDetail].[TmtlStatusID] = [IDM_TransmittalStatus9].[TmtlStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees10]
    ON [IDM_TransmittalDetail].[CardNo] = [HRM_Employees10].[CardNo]
  LEFT OUTER JOIN [IDM_Customers] AS [IDM_Customers11]
    ON [IDM_TransmittalDetail].[CustomerID] = [IDM_Customers11].[CustomerID]
  LEFT OUTER JOIN [IDM_TransmittalTypes] AS [IDM_TransmittalTypes12]
    ON [IDM_TransmittalDetail].[TmtlTypeID] = [IDM_TransmittalTypes12].[TmtlTypeID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors13]
    ON [IDM_TransmittalDetail].[VendorID] = [IDM_Vendors13].[VendorID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
