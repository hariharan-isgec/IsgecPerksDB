USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTSelectByID]
  @TmtlID Int 
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
  WHERE
  [IDM_Transmittal].[TmtlID] = @TmtlID
GO
