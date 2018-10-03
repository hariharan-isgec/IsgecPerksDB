USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_Transmittal].[TmtlID] ,
		[IDM_Transmittal].[TmtlTypeID] ,
		[IDM_Transmittal].[ProjectID] ,
		[IDM_Transmittal].[CustomerID] ,
		[IDM_Transmittal].[VendorID] ,
		[IDM_Transmittal].[CardNo] ,
		[IDM_Transmittal].[UseSpecificContact] ,
		[IDM_Transmittal].[SerialNo] ,
		[IDM_Transmittal].[ProjectSerialNo] ,
		[IDM_Transmittal].[CustomerSerialNo] ,
		[IDM_Transmittal].[VendorSerialNo] ,
		[IDM_Transmittal].[TmtlReference] ,
		[IDM_Transmittal].[Subject] ,
		[IDM_Transmittal].[Remarks] ,
		[IDM_Transmittal].[ToEMailID] ,
		[IDM_Transmittal].[CCEmailID] ,
		[IDM_Transmittal].[TmtlStatusID] ,
		[IDM_Transmittal].[CreatedOn] ,
		[IDM_Transmittal].[CreatedBy] ,
		[IDM_Transmittal].[ModifiedOn] ,
		[IDM_Transmittal].[ModifiedBy] ,
		[IDM_Transmittal].[ResponsibleAgencyID] ,
		[IDM_Transmittal].[ApprovedOn] ,
		[IDM_Transmittal].[ApprovedBy] ,
		[IDM_Transmittal].[IssuedViaID] ,
		[IDM_Transmittal].[IssueRemarks] ,
		[IDM_Transmittal].[IssuedOn] ,
		[IDM_Transmittal].[IssuedBy] ,
		[HRM_Employees13].[EmployeeName] AS HRM_Employees13_EmployeeName,
		[HRM_Employees10].[EmployeeName] AS HRM_Employees10_EmployeeName,
		[HRM_Employees15].[EmployeeName] AS HRM_Employees15_EmployeeName,
		[HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName,
		[IDM_Customers3].[Description] AS IDM_Customers3_Description,
		[IDM_IssuedVia14].[Description] AS IDM_IssuedVia14_Description,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description,
		[IDM_ResponsibleAgency12].[Description] AS IDM_ResponsibleAgency12_Description,
		[IDM_TransmittalStatus9].[Description] AS IDM_TransmittalStatus9_Description,
		[IDM_TransmittalTypes1].[Description] AS IDM_TransmittalTypes1_Description,
		[IDM_Vendors4].[Description] AS IDM_Vendors4_Description,
		[HRM_Employees11].[EmployeeName] AS HRM_Employees11_EmployeeName,
		[IDM_CustomerContacts7].[ContactPerson] AS IDM_CustomerContacts7_ContactPerson,
		[IDM_ProjectContacts6].[ContactPerson] AS IDM_ProjectContacts6_ContactPerson,
		[IDM_VendorContacts8].[ContactPerson] AS IDM_VendorContacts8_ContactPerson 
  FROM [IDM_Transmittal] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees13]
    ON [IDM_Transmittal].[ApprovedBy] = [HRM_Employees13].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees10]
    ON [IDM_Transmittal].[CreatedBy] = [HRM_Employees10].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees15]
    ON [IDM_Transmittal].[IssuedBy] = [HRM_Employees15].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [IDM_Transmittal].[CardNo] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [IDM_Customers] AS [IDM_Customers3]
    ON [IDM_Transmittal].[CustomerID] = [IDM_Customers3].[CustomerID]
  LEFT OUTER JOIN [IDM_IssuedVia] AS [IDM_IssuedVia14]
    ON [IDM_Transmittal].[IssuedViaID] = [IDM_IssuedVia14].[IssuedViaID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [IDM_Transmittal].[ProjectID] = [IDM_Projects2].[ProjectID]
  LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency12]
    ON [IDM_Transmittal].[ResponsibleAgencyID] = [IDM_ResponsibleAgency12].[ResponsibleAgencyID]
  LEFT OUTER JOIN [IDM_TransmittalStatus] AS [IDM_TransmittalStatus9]
    ON [IDM_Transmittal].[TmtlStatusID] = [IDM_TransmittalStatus9].[TmtlStatusID]
  INNER JOIN [IDM_TransmittalTypes] AS [IDM_TransmittalTypes1]
    ON [IDM_Transmittal].[TmtlTypeID] = [IDM_TransmittalTypes1].[TmtlTypeID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors4]
    ON [IDM_Transmittal].[VendorID] = [IDM_Vendors4].[VendorID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees11]
    ON [IDM_Transmittal].[ModifiedBy] = [HRM_Employees11].[CardNo]
  LEFT OUTER JOIN [IDM_CustomerContacts] AS [IDM_CustomerContacts7]
    ON [IDM_Transmittal].[CustomerID] = [IDM_CustomerContacts7].[CustomerID]
    AND [IDM_Transmittal].[CustomerSerialNo] = [IDM_CustomerContacts7].[SerialNo]
  LEFT OUTER JOIN [IDM_ProjectContacts] AS [IDM_ProjectContacts6]
    ON [IDM_Transmittal].[ProjectID] = [IDM_ProjectContacts6].[ProjectID]
    AND [IDM_Transmittal].[ProjectSerialNo] = [IDM_ProjectContacts6].[SerialNo]
  LEFT OUTER JOIN [IDM_VendorContacts] AS [IDM_VendorContacts8]
    ON [IDM_Transmittal].[VendorID] = [IDM_VendorContacts8].[VendorID]
    AND [IDM_Transmittal].[VendorSerialNo] = [IDM_VendorContacts8].[SerialNo]
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'TmtlID' THEN [IDM_Transmittal].[TmtlID] END,
     CASE @orderBy WHEN 'TmtlID DESC' THEN [IDM_Transmittal].[TmtlID] END DESC,
     CASE @orderBy WHEN 'TmtlTypeID' THEN [IDM_Transmittal].[TmtlTypeID] END,
     CASE @orderBy WHEN 'TmtlTypeID DESC' THEN [IDM_Transmittal].[TmtlTypeID] END DESC,
     CASE @orderBy WHEN 'ProjectID' THEN [IDM_Transmittal].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [IDM_Transmittal].[ProjectID] END DESC,
     CASE @orderBy WHEN 'CustomerID' THEN [IDM_Transmittal].[CustomerID] END,
     CASE @orderBy WHEN 'CustomerID DESC' THEN [IDM_Transmittal].[CustomerID] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [IDM_Transmittal].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [IDM_Transmittal].[VendorID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [IDM_Transmittal].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [IDM_Transmittal].[CardNo] END DESC,
     CASE @orderBy WHEN 'UseSpecificContact' THEN [IDM_Transmittal].[UseSpecificContact] END,
     CASE @orderBy WHEN 'UseSpecificContact DESC' THEN [IDM_Transmittal].[UseSpecificContact] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [IDM_Transmittal].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [IDM_Transmittal].[SerialNo] END DESC,
     CASE @orderBy WHEN 'ProjectSerialNo' THEN [IDM_Transmittal].[ProjectSerialNo] END,
     CASE @orderBy WHEN 'ProjectSerialNo DESC' THEN [IDM_Transmittal].[ProjectSerialNo] END DESC,
     CASE @orderBy WHEN 'CustomerSerialNo' THEN [IDM_Transmittal].[CustomerSerialNo] END,
     CASE @orderBy WHEN 'CustomerSerialNo DESC' THEN [IDM_Transmittal].[CustomerSerialNo] END DESC,
     CASE @orderBy WHEN 'VendorSerialNo' THEN [IDM_Transmittal].[VendorSerialNo] END,
     CASE @orderBy WHEN 'VendorSerialNo DESC' THEN [IDM_Transmittal].[VendorSerialNo] END DESC,
     CASE @orderBy WHEN 'TmtlReference' THEN [IDM_Transmittal].[TmtlReference] END,
     CASE @orderBy WHEN 'TmtlReference DESC' THEN [IDM_Transmittal].[TmtlReference] END DESC,
     CASE @orderBy WHEN 'Subject' THEN [IDM_Transmittal].[Subject] END,
     CASE @orderBy WHEN 'Subject DESC' THEN [IDM_Transmittal].[Subject] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [IDM_Transmittal].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [IDM_Transmittal].[Remarks] END DESC,
     CASE @orderBy WHEN 'ToEMailID' THEN [IDM_Transmittal].[ToEMailID] END,
     CASE @orderBy WHEN 'ToEMailID DESC' THEN [IDM_Transmittal].[ToEMailID] END DESC,
     CASE @orderBy WHEN 'CCEmailID' THEN [IDM_Transmittal].[CCEmailID] END,
     CASE @orderBy WHEN 'CCEmailID DESC' THEN [IDM_Transmittal].[CCEmailID] END DESC,
     CASE @orderBy WHEN 'TmtlStatusID' THEN [IDM_Transmittal].[TmtlStatusID] END,
     CASE @orderBy WHEN 'TmtlStatusID DESC' THEN [IDM_Transmittal].[TmtlStatusID] END DESC,
     CASE @orderBy WHEN 'CreatedOn' THEN [IDM_Transmittal].[CreatedOn] END,
     CASE @orderBy WHEN 'CreatedOn DESC' THEN [IDM_Transmittal].[CreatedOn] END DESC,
     CASE @orderBy WHEN 'CreatedBy' THEN [IDM_Transmittal].[CreatedBy] END,
     CASE @orderBy WHEN 'CreatedBy DESC' THEN [IDM_Transmittal].[CreatedBy] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [IDM_Transmittal].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [IDM_Transmittal].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [IDM_Transmittal].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [IDM_Transmittal].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'ResponsibleAgencyID' THEN [IDM_Transmittal].[ResponsibleAgencyID] END,
     CASE @orderBy WHEN 'ResponsibleAgencyID DESC' THEN [IDM_Transmittal].[ResponsibleAgencyID] END DESC,
     CASE @orderBy WHEN 'ApprovedOn' THEN [IDM_Transmittal].[ApprovedOn] END,
     CASE @orderBy WHEN 'ApprovedOn DESC' THEN [IDM_Transmittal].[ApprovedOn] END DESC,
     CASE @orderBy WHEN 'ApprovedBy' THEN [IDM_Transmittal].[ApprovedBy] END,
     CASE @orderBy WHEN 'ApprovedBy DESC' THEN [IDM_Transmittal].[ApprovedBy] END DESC,
     CASE @orderBy WHEN 'IssuedViaID' THEN [IDM_Transmittal].[IssuedViaID] END,
     CASE @orderBy WHEN 'IssuedViaID DESC' THEN [IDM_Transmittal].[IssuedViaID] END DESC,
     CASE @orderBy WHEN 'IssueRemarks' THEN [IDM_Transmittal].[IssueRemarks] END,
     CASE @orderBy WHEN 'IssueRemarks DESC' THEN [IDM_Transmittal].[IssueRemarks] END DESC,
     CASE @orderBy WHEN 'IssuedOn' THEN [IDM_Transmittal].[IssuedOn] END,
     CASE @orderBy WHEN 'IssuedOn DESC' THEN [IDM_Transmittal].[IssuedOn] END DESC,
     CASE @orderBy WHEN 'IssuedBy' THEN [IDM_Transmittal].[IssuedBy] END,
     CASE @orderBy WHEN 'IssuedBy DESC' THEN [IDM_Transmittal].[IssuedBy] END DESC,
     CASE @orderBy WHEN 'HRM_Employees13_EmployeeName' THEN [HRM_Employees13].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees13_EmployeeName DESC' THEN [HRM_Employees13].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees10_EmployeeName' THEN [HRM_Employees10].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees10_EmployeeName DESC' THEN [HRM_Employees10].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees15_EmployeeName' THEN [HRM_Employees15].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees15_EmployeeName DESC' THEN [HRM_Employees15].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees5_EmployeeName' THEN [HRM_Employees5].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees5_EmployeeName DESC' THEN [HRM_Employees5].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'IDM_Customers3_Description' THEN [IDM_Customers3].[Description] END,
     CASE @orderBy WHEN 'IDM_Customers3_Description DESC' THEN [IDM_Customers3].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_IssuedVia14_Description' THEN [IDM_IssuedVia14].[Description] END,
     CASE @orderBy WHEN 'IDM_IssuedVia14_Description DESC' THEN [IDM_IssuedVia14].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_ResponsibleAgency12_Description' THEN [IDM_ResponsibleAgency12].[Description] END,
     CASE @orderBy WHEN 'IDM_ResponsibleAgency12_Description DESC' THEN [IDM_ResponsibleAgency12].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_TransmittalStatus9_Description' THEN [IDM_TransmittalStatus9].[Description] END,
     CASE @orderBy WHEN 'IDM_TransmittalStatus9_Description DESC' THEN [IDM_TransmittalStatus9].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_TransmittalTypes1_Description' THEN [IDM_TransmittalTypes1].[Description] END,
     CASE @orderBy WHEN 'IDM_TransmittalTypes1_Description DESC' THEN [IDM_TransmittalTypes1].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Vendors4_Description' THEN [IDM_Vendors4].[Description] END,
     CASE @orderBy WHEN 'IDM_Vendors4_Description DESC' THEN [IDM_Vendors4].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees11_EmployeeName' THEN [HRM_Employees11].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees11_EmployeeName DESC' THEN [HRM_Employees11].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'IDM_CustomerContacts7_ContactPerson' THEN [IDM_CustomerContacts7].[ContactPerson] END,
     CASE @orderBy WHEN 'IDM_CustomerContacts7_ContactPerson DESC' THEN [IDM_CustomerContacts7].[ContactPerson] END DESC,
     CASE @orderBy WHEN 'IDM_ProjectContacts6_ContactPerson' THEN [IDM_ProjectContacts6].[ContactPerson] END,
     CASE @orderBy WHEN 'IDM_ProjectContacts6_ContactPerson DESC' THEN [IDM_ProjectContacts6].[ContactPerson] END DESC,
     CASE @orderBy WHEN 'IDM_VendorContacts8_ContactPerson' THEN [IDM_VendorContacts8].[ContactPerson] END,
     CASE @orderBy WHEN 'IDM_VendorContacts8_ContactPerson DESC' THEN [IDM_VendorContacts8].[ContactPerson] END DESC 
  SET @RecordCount = @@RowCount
GO
