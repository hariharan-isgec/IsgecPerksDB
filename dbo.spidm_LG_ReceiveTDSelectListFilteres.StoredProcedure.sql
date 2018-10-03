USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidm_LG_ReceiveTDSelectListFilteres]
  @Filter_TmtlID Int,
  @Filter_ProjectID NVarChar(6),
  @Filter_DocumentID NVarChar(30),
  @Filter_ResponsibleAgencyID Int,
  @Filter_TmtlTypeID NVarChar(2),
  @Filter_CustomerID NVarChar(6),
  @Filter_VendorID NVarChar(6),
  @Filter_CardNo NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @LoginID NvarChar(8),
  @PRFilter Bit,
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TmtlID Int NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,DocumentID NVarChar(30) NOT NULL
 ,RevisionNo NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TmtlID'
  SET @LGSQL = @LGSQL + ', ProjectID'
  SET @LGSQL = @LGSQL + ', DocumentID'
  SET @LGSQL = @LGSQL + ', RevisionNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_TransmittalDetail].[TmtlID]'
  SET @LGSQL = @LGSQL + ', [IDM_TransmittalDetail].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [IDM_TransmittalDetail].[DocumentID]'
  SET @LGSQL = @LGSQL + ', [IDM_TransmittalDetail].[RevisionNo]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_TransmittalDetail] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [IDM_TransmittalDetail].[ReceivedBy] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Transmittal] AS [IDM_Transmittal2]'
  SET @LGSQL = @LGSQL + '    ON [IDM_TransmittalDetail].[TmtlID] = [IDM_Transmittal2].[TmtlID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Documents] AS [IDM_Documents3]'
  SET @LGSQL = @LGSQL + '    ON [IDM_TransmittalDetail].[ProjectID] = [IDM_Documents3].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [IDM_TransmittalDetail].[DocumentID] = [IDM_Documents3].[DocumentID]'
  SET @LGSQL = @LGSQL + '    AND [IDM_TransmittalDetail].[RevisionNo] = [IDM_Documents3].[RevisionNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_DocumentStatus] AS [IDM_DocumentStatus4]'
  SET @LGSQL = @LGSQL + '    ON [IDM_TransmittalDetail].[DocumentStatusID] = [IDM_DocumentStatus4].[DocumentStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects5]'
  SET @LGSQL = @LGSQL + '    ON [IDM_TransmittalDetail].[ProjectID] = [IDM_Projects5].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_ReceiveStatus] AS [IDM_ReceiveStatus6]'
  SET @LGSQL = @LGSQL + '    ON [IDM_TransmittalDetail].[ReceiveStatusID] = [IDM_ReceiveStatus6].[ReceiveStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency7]'
  SET @LGSQL = @LGSQL + '    ON [IDM_TransmittalDetail].[ResponsibleAgencyID] = [IDM_ResponsibleAgency7].[ResponsibleAgencyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_SendStatus] AS [IDM_SendStatus8]'
  SET @LGSQL = @LGSQL + '    ON [IDM_TransmittalDetail].[SendStatusID] = [IDM_SendStatus8].[SendStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_TransmittalStatus] AS [IDM_TransmittalStatus9]'
  SET @LGSQL = @LGSQL + '    ON [IDM_TransmittalDetail].[TmtlStatusID] = [IDM_TransmittalStatus9].[TmtlStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees10]'
  SET @LGSQL = @LGSQL + '    ON [IDM_TransmittalDetail].[CardNo] = [HRM_Employees10].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Customers] AS [IDM_Customers11]'
  SET @LGSQL = @LGSQL + '    ON [IDM_TransmittalDetail].[CustomerID] = [IDM_Customers11].[CustomerID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_TransmittalTypes] AS [IDM_TransmittalTypes12]'
  SET @LGSQL = @LGSQL + '    ON [IDM_TransmittalDetail].[TmtlTypeID] = [IDM_TransmittalTypes12].[TmtlTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors13]'
  SET @LGSQL = @LGSQL + '    ON [IDM_TransmittalDetail].[VendorID] = [IDM_Vendors13].[VendorID]'
------------------------------
  SET @LGSQL = @LGSQL + '  WHERE [IDM_TransmittalDetail].[DocumentStatusID] = 3 '
  IF (@PRFilter = 1) 
    SET @LGSQL = @LGSQL + ' AND [IDM_TransmittalDetail].[ProjectID] IN (SELECT PROJECTID FROM IDM_ProjectsByEmployee WHERE CardNo = ''' + @LoginID + ''') '
------------------------------
  IF (@Filter_TmtlID > 0) 
    SET @LGSQL = @LGSQL + ' AND [IDM_TransmittalDetail].[TmtlID] = ' + STR(@Filter_TmtlID)
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_TransmittalDetail].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_DocumentID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_TransmittalDetail].[DocumentID] = ''' + @Filter_DocumentID + ''''
  IF (@Filter_ResponsibleAgencyID > 0) 
    SET @LGSQL = @LGSQL + ' AND [IDM_TransmittalDetail].[ResponsibleAgencyID] = ' + STR(@Filter_ResponsibleAgencyID)
  IF (@Filter_TmtlTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_TransmittalDetail].[TmtlTypeID] = ''' + @Filter_TmtlTypeID + ''''
  IF (@Filter_CustomerID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_TransmittalDetail].[CustomerID] = ''' + @Filter_CustomerID + ''''
  IF (@Filter_VendorID > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_TransmittalDetail].[VendorID] = ''' + @Filter_VendorID + ''''
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [IDM_TransmittalDetail].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TmtlID' THEN '[IDM_TransmittalDetail].[TmtlID]'
                        WHEN 'TmtlID DESC' THEN '[IDM_TransmittalDetail].[TmtlID] DESC'
                        WHEN 'ProjectID' THEN '[IDM_TransmittalDetail].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[IDM_TransmittalDetail].[ProjectID] DESC'
                        WHEN 'DocumentID' THEN '[IDM_TransmittalDetail].[DocumentID]'
                        WHEN 'DocumentID DESC' THEN '[IDM_TransmittalDetail].[DocumentID] DESC'
                        WHEN 'RevisionNo' THEN '[IDM_TransmittalDetail].[RevisionNo]'
                        WHEN 'RevisionNo DESC' THEN '[IDM_TransmittalDetail].[RevisionNo] DESC'
                        WHEN 'SendStatusID' THEN '[IDM_TransmittalDetail].[SendStatusID]'
                        WHEN 'SendStatusID DESC' THEN '[IDM_TransmittalDetail].[SendStatusID] DESC'
                        WHEN 'NoOfCopies' THEN '[IDM_TransmittalDetail].[NoOfCopies]'
                        WHEN 'NoOfCopies DESC' THEN '[IDM_TransmittalDetail].[NoOfCopies] DESC'
                        WHEN 'SendRemarks' THEN '[IDM_TransmittalDetail].[SendRemarks]'
                        WHEN 'SendRemarks DESC' THEN '[IDM_TransmittalDetail].[SendRemarks] DESC'
                        WHEN 'TmtlStatusID' THEN '[IDM_TransmittalDetail].[TmtlStatusID]'
                        WHEN 'TmtlStatusID DESC' THEN '[IDM_TransmittalDetail].[TmtlStatusID] DESC'
                        WHEN 'DocumentStatusID' THEN '[IDM_TransmittalDetail].[DocumentStatusID]'
                        WHEN 'DocumentStatusID DESC' THEN '[IDM_TransmittalDetail].[DocumentStatusID] DESC'
                        WHEN 'ResponsibleAgencyID' THEN '[IDM_TransmittalDetail].[ResponsibleAgencyID]'
                        WHEN 'ResponsibleAgencyID DESC' THEN '[IDM_TransmittalDetail].[ResponsibleAgencyID] DESC'
                        WHEN 'TmtlTypeID' THEN '[IDM_TransmittalDetail].[TmtlTypeID]'
                        WHEN 'TmtlTypeID DESC' THEN '[IDM_TransmittalDetail].[TmtlTypeID] DESC'
                        WHEN 'CustomerID' THEN '[IDM_TransmittalDetail].[CustomerID]'
                        WHEN 'CustomerID DESC' THEN '[IDM_TransmittalDetail].[CustomerID] DESC'
                        WHEN 'VendorID' THEN '[IDM_TransmittalDetail].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[IDM_TransmittalDetail].[VendorID] DESC'
                        WHEN 'CardNo' THEN '[IDM_TransmittalDetail].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[IDM_TransmittalDetail].[CardNo] DESC'
                        WHEN 'ReceiveStatusID' THEN '[IDM_TransmittalDetail].[ReceiveStatusID]'
                        WHEN 'ReceiveStatusID DESC' THEN '[IDM_TransmittalDetail].[ReceiveStatusID] DESC'
                        WHEN 'ReceivedRefNo' THEN '[IDM_TransmittalDetail].[ReceivedRefNo]'
                        WHEN 'ReceivedRefNo DESC' THEN '[IDM_TransmittalDetail].[ReceivedRefNo] DESC'
                        WHEN 'ReceivedRemarks' THEN '[IDM_TransmittalDetail].[ReceivedRemarks]'
                        WHEN 'ReceivedRemarks DESC' THEN '[IDM_TransmittalDetail].[ReceivedRemarks] DESC'
                        WHEN 'ReceiveLocked' THEN '[IDM_TransmittalDetail].[ReceiveLocked]'
                        WHEN 'ReceiveLocked DESC' THEN '[IDM_TransmittalDetail].[ReceiveLocked] DESC'
                        WHEN 'ReceivedOn' THEN '[IDM_TransmittalDetail].[ReceivedOn]'
                        WHEN 'ReceivedOn DESC' THEN '[IDM_TransmittalDetail].[ReceivedOn] DESC'
                        WHEN 'ReceivedBy' THEN '[IDM_TransmittalDetail].[ReceivedBy]'
                        WHEN 'ReceivedBy DESC' THEN '[IDM_TransmittalDetail].[ReceivedBy] DESC'
                        WHEN 'cmba' THEN '[IDM_TransmittalDetail].[cmba]'
                        WHEN 'cmba DESC' THEN '[IDM_TransmittalDetail].[cmba] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'IDM_Transmittal2_TmtlReference' THEN '[IDM_Transmittal].[TmtlReference]'
                        WHEN 'IDM_Transmittal2_TmtlReference DESC' THEN '[IDM_Transmittal2].[TmtlReference] DESC'
                        WHEN 'IDM_Documents3_DocumentID' THEN '[IDM_Documents].[DocumentID]'
                        WHEN 'IDM_Documents3_DocumentID DESC' THEN '[IDM_Documents3].[DocumentID] DESC'
                        WHEN 'IDM_DocumentStatus4_Description' THEN '[IDM_DocumentStatus].[Description]'
                        WHEN 'IDM_DocumentStatus4_Description DESC' THEN '[IDM_DocumentStatus4].[Description] DESC'
                        WHEN 'IDM_Projects5_Description' THEN '[IDM_Projects].[Description]'
                        WHEN 'IDM_Projects5_Description DESC' THEN '[IDM_Projects5].[Description] DESC'
                        WHEN 'IDM_ReceiveStatus6_Description' THEN '[IDM_ReceiveStatus].[Description]'
                        WHEN 'IDM_ReceiveStatus6_Description DESC' THEN '[IDM_ReceiveStatus6].[Description] DESC'
                        WHEN 'IDM_ResponsibleAgency7_Description' THEN '[IDM_ResponsibleAgency].[Description]'
                        WHEN 'IDM_ResponsibleAgency7_Description DESC' THEN '[IDM_ResponsibleAgency7].[Description] DESC'
                        WHEN 'IDM_SendStatus8_Description' THEN '[IDM_SendStatus].[Description]'
                        WHEN 'IDM_SendStatus8_Description DESC' THEN '[IDM_SendStatus8].[Description] DESC'
                        WHEN 'IDM_TransmittalStatus9_Description' THEN '[IDM_TransmittalStatus].[Description]'
                        WHEN 'IDM_TransmittalStatus9_Description DESC' THEN '[IDM_TransmittalStatus9].[Description] DESC'
                        WHEN 'HRM_Employees10_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees10_EmployeeName DESC' THEN '[HRM_Employees10].[EmployeeName] DESC'
                        WHEN 'IDM_Customers11_Description' THEN '[IDM_Customers].[Description]'
                        WHEN 'IDM_Customers11_Description DESC' THEN '[IDM_Customers11].[Description] DESC'
                        WHEN 'IDM_TransmittalTypes12_Description' THEN '[IDM_TransmittalTypes].[Description]'
                        WHEN 'IDM_TransmittalTypes12_Description DESC' THEN '[IDM_TransmittalTypes12].[Description] DESC'
                        WHEN 'IDM_Vendors13_Description' THEN '[IDM_Vendors].[Description]'
                        WHEN 'IDM_Vendors13_Description DESC' THEN '[IDM_Vendors13].[Description] DESC'
                        ELSE '[IDM_TransmittalDetail].[TmtlID],[IDM_TransmittalDetail].[ProjectID],[IDM_TransmittalDetail].[DocumentID],[IDM_TransmittalDetail].[RevisionNo]'
                    END
  EXEC (@LGSQL)

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
