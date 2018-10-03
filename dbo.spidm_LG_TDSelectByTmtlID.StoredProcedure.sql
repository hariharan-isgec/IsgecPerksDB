USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidm_LG_TDSelectByTmtlID]
  @TmtlID Int,
  @OrderBy NVarChar(100)
  AS
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
  [IDM_TransmittalDetail].[TmtlID] = @TmtlID
GO
