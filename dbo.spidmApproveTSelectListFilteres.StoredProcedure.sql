USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmApproveTSelectListFilteres]
  @Filter_TmtlTypeID NVarChar(2),
  @Filter_ProjectID NVarChar(6),
  @Filter_VendorID NVarChar(6),
  @Filter_CardNo NVarChar(8),
  @Filter_ResponsibleAgencyID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @TmtlStatusID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TmtlID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TmtlID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_Transmittal].[TmtlID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_Transmittal] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees13]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[ApprovedBy] = [HRM_Employees13].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees10]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[CreatedBy] = [HRM_Employees10].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees15]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[IssuedBy] = [HRM_Employees15].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[CardNo] = [HRM_Employees5].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Customers] AS [IDM_Customers3]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[CustomerID] = [IDM_Customers3].[CustomerID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_IssuedVia] AS [IDM_IssuedVia14]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[IssuedViaID] = [IDM_IssuedVia14].[IssuedViaID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[ProjectID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency12]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[ResponsibleAgencyID] = [IDM_ResponsibleAgency12].[ResponsibleAgencyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_TransmittalStatus] AS [IDM_TransmittalStatus9]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[TmtlStatusID] = [IDM_TransmittalStatus9].[TmtlStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_TransmittalTypes] AS [IDM_TransmittalTypes1]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[TmtlTypeID] = [IDM_TransmittalTypes1].[TmtlTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors4]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[VendorID] = [IDM_Vendors4].[VendorID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees11]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[ModifiedBy] = [HRM_Employees11].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_CustomerContacts] AS [IDM_CustomerContacts7]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[CustomerID] = [IDM_CustomerContacts7].[CustomerID]'
  SET @LGSQL = @LGSQL + '    AND [IDM_Transmittal].[CustomerSerialNo] = [IDM_CustomerContacts7].[SerialNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_ProjectContacts] AS [IDM_ProjectContacts6]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[ProjectID] = [IDM_ProjectContacts6].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [IDM_Transmittal].[ProjectSerialNo] = [IDM_ProjectContacts6].[SerialNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_VendorContacts] AS [IDM_VendorContacts8]'
  SET @LGSQL = @LGSQL + '    ON [IDM_Transmittal].[VendorID] = [IDM_VendorContacts8].[VendorID]'
  SET @LGSQL = @LGSQL + '    AND [IDM_Transmittal].[VendorSerialNo] = [IDM_VendorContacts8].[SerialNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  AND [IDM_Transmittal].[TmtlStatusID] = ''' + STR(@TmtlStatusID) + '''' 
  IF (@Filter_TmtlTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_Transmittal].[TmtlTypeID] = ''' + @Filter_TmtlTypeID + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_Transmittal].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_VendorID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_Transmittal].[VendorID] = ''' + @Filter_VendorID + ''''
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_Transmittal].[CardNo] = ''' + @Filter_CardNo + ''''
  IF (@Filter_ResponsibleAgencyID > 0) 
    SET @LGSQL = @LGSQL + ' AND [IDM_Transmittal].[ResponsibleAgencyID] = ' + STR(@Filter_ResponsibleAgencyID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TmtlID' THEN '[IDM_Transmittal].[TmtlID]'
                        WHEN 'TmtlID DESC' THEN '[IDM_Transmittal].[TmtlID] DESC'
                        WHEN 'TmtlTypeID' THEN '[IDM_Transmittal].[TmtlTypeID]'
                        WHEN 'TmtlTypeID DESC' THEN '[IDM_Transmittal].[TmtlTypeID] DESC'
                        WHEN 'ProjectID' THEN '[IDM_Transmittal].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[IDM_Transmittal].[ProjectID] DESC'
                        WHEN 'CustomerID' THEN '[IDM_Transmittal].[CustomerID]'
                        WHEN 'CustomerID DESC' THEN '[IDM_Transmittal].[CustomerID] DESC'
                        WHEN 'VendorID' THEN '[IDM_Transmittal].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[IDM_Transmittal].[VendorID] DESC'
                        WHEN 'CardNo' THEN '[IDM_Transmittal].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[IDM_Transmittal].[CardNo] DESC'
                        WHEN 'UseSpecificContact' THEN '[IDM_Transmittal].[UseSpecificContact]'
                        WHEN 'UseSpecificContact DESC' THEN '[IDM_Transmittal].[UseSpecificContact] DESC'
                        WHEN 'SerialNo' THEN '[IDM_Transmittal].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[IDM_Transmittal].[SerialNo] DESC'
                        WHEN 'ProjectSerialNo' THEN '[IDM_Transmittal].[ProjectSerialNo]'
                        WHEN 'ProjectSerialNo DESC' THEN '[IDM_Transmittal].[ProjectSerialNo] DESC'
                        WHEN 'CustomerSerialNo' THEN '[IDM_Transmittal].[CustomerSerialNo]'
                        WHEN 'CustomerSerialNo DESC' THEN '[IDM_Transmittal].[CustomerSerialNo] DESC'
                        WHEN 'VendorSerialNo' THEN '[IDM_Transmittal].[VendorSerialNo]'
                        WHEN 'VendorSerialNo DESC' THEN '[IDM_Transmittal].[VendorSerialNo] DESC'
                        WHEN 'TmtlReference' THEN '[IDM_Transmittal].[TmtlReference]'
                        WHEN 'TmtlReference DESC' THEN '[IDM_Transmittal].[TmtlReference] DESC'
                        WHEN 'Subject' THEN '[IDM_Transmittal].[Subject]'
                        WHEN 'Subject DESC' THEN '[IDM_Transmittal].[Subject] DESC'
                        WHEN 'Remarks' THEN '[IDM_Transmittal].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[IDM_Transmittal].[Remarks] DESC'
                        WHEN 'ToEMailID' THEN '[IDM_Transmittal].[ToEMailID]'
                        WHEN 'ToEMailID DESC' THEN '[IDM_Transmittal].[ToEMailID] DESC'
                        WHEN 'CCEmailID' THEN '[IDM_Transmittal].[CCEmailID]'
                        WHEN 'CCEmailID DESC' THEN '[IDM_Transmittal].[CCEmailID] DESC'
                        WHEN 'TmtlStatusID' THEN '[IDM_Transmittal].[TmtlStatusID]'
                        WHEN 'TmtlStatusID DESC' THEN '[IDM_Transmittal].[TmtlStatusID] DESC'
                        WHEN 'CreatedOn' THEN '[IDM_Transmittal].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[IDM_Transmittal].[CreatedOn] DESC'
                        WHEN 'CreatedBy' THEN '[IDM_Transmittal].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[IDM_Transmittal].[CreatedBy] DESC'
                        WHEN 'ModifiedOn' THEN '[IDM_Transmittal].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[IDM_Transmittal].[ModifiedOn] DESC'
                        WHEN 'ModifiedBy' THEN '[IDM_Transmittal].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[IDM_Transmittal].[ModifiedBy] DESC'
                        WHEN 'ResponsibleAgencyID' THEN '[IDM_Transmittal].[ResponsibleAgencyID]'
                        WHEN 'ResponsibleAgencyID DESC' THEN '[IDM_Transmittal].[ResponsibleAgencyID] DESC'
                        WHEN 'ApprovedOn' THEN '[IDM_Transmittal].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[IDM_Transmittal].[ApprovedOn] DESC'
                        WHEN 'ApprovedBy' THEN '[IDM_Transmittal].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[IDM_Transmittal].[ApprovedBy] DESC'
                        WHEN 'IssuedViaID' THEN '[IDM_Transmittal].[IssuedViaID]'
                        WHEN 'IssuedViaID DESC' THEN '[IDM_Transmittal].[IssuedViaID] DESC'
                        WHEN 'IssueRemarks' THEN '[IDM_Transmittal].[IssueRemarks]'
                        WHEN 'IssueRemarks DESC' THEN '[IDM_Transmittal].[IssueRemarks] DESC'
                        WHEN 'IssuedOn' THEN '[IDM_Transmittal].[IssuedOn]'
                        WHEN 'IssuedOn DESC' THEN '[IDM_Transmittal].[IssuedOn] DESC'
                        WHEN 'IssuedBy' THEN '[IDM_Transmittal].[IssuedBy]'
                        WHEN 'IssuedBy DESC' THEN '[IDM_Transmittal].[IssuedBy] DESC'
                        WHEN 'HRM_Employees13_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees13_EmployeeName DESC' THEN '[HRM_Employees13].[EmployeeName] DESC'
                        WHEN 'HRM_Employees10_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees10_EmployeeName DESC' THEN '[HRM_Employees10].[EmployeeName] DESC'
                        WHEN 'HRM_Employees15_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees15_EmployeeName DESC' THEN '[HRM_Employees15].[EmployeeName] DESC'
                        WHEN 'HRM_Employees5_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees5_EmployeeName DESC' THEN '[HRM_Employees5].[EmployeeName] DESC'
                        WHEN 'IDM_Customers3_Description' THEN '[IDM_Customers].[Description]'
                        WHEN 'IDM_Customers3_Description DESC' THEN '[IDM_Customers3].[Description] DESC'
                        WHEN 'IDM_IssuedVia14_Description' THEN '[IDM_IssuedVia].[Description]'
                        WHEN 'IDM_IssuedVia14_Description DESC' THEN '[IDM_IssuedVia14].[Description] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        WHEN 'IDM_ResponsibleAgency12_Description' THEN '[IDM_ResponsibleAgency].[Description]'
                        WHEN 'IDM_ResponsibleAgency12_Description DESC' THEN '[IDM_ResponsibleAgency12].[Description] DESC'
                        WHEN 'IDM_TransmittalStatus9_Description' THEN '[IDM_TransmittalStatus].[Description]'
                        WHEN 'IDM_TransmittalStatus9_Description DESC' THEN '[IDM_TransmittalStatus9].[Description] DESC'
                        WHEN 'IDM_TransmittalTypes1_Description' THEN '[IDM_TransmittalTypes].[Description]'
                        WHEN 'IDM_TransmittalTypes1_Description DESC' THEN '[IDM_TransmittalTypes1].[Description] DESC'
                        WHEN 'IDM_Vendors4_Description' THEN '[IDM_Vendors].[Description]'
                        WHEN 'IDM_Vendors4_Description DESC' THEN '[IDM_Vendors4].[Description] DESC'
                        WHEN 'HRM_Employees11_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees11_EmployeeName DESC' THEN '[HRM_Employees11].[EmployeeName] DESC'
                        WHEN 'IDM_CustomerContacts7_ContactPerson' THEN '[IDM_CustomerContacts].[ContactPerson]'
                        WHEN 'IDM_CustomerContacts7_ContactPerson DESC' THEN '[IDM_CustomerContacts7].[ContactPerson] DESC'
                        WHEN 'IDM_ProjectContacts6_ContactPerson' THEN '[IDM_ProjectContacts].[ContactPerson]'
                        WHEN 'IDM_ProjectContacts6_ContactPerson DESC' THEN '[IDM_ProjectContacts6].[ContactPerson] DESC'
                        WHEN 'IDM_VendorContacts8_ContactPerson' THEN '[IDM_VendorContacts].[ContactPerson]'
                        WHEN 'IDM_VendorContacts8_ContactPerson DESC' THEN '[IDM_VendorContacts8].[ContactPerson] DESC'
                        ELSE '[IDM_Transmittal].[TmtlID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [IDM_Transmittal].[TmtlID] = #PageIndex.TmtlID
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
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
