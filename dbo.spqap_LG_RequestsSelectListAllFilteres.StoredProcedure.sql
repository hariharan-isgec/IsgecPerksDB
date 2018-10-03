USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqap_LG_RequestsSelectListAllFilteres]
  @Filter_DocumentTypeID Int,
  @Filter_ProjectID NVarChar(6),
  @Filter_SupplierID NVarChar(9),
  @Filter_StatusID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RequestNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QAP_Requests].[RequestNo]'
  SET @LGSQL = @LGSQL + ' FROM [QAP_Requests] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_DocumentTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QAP_Requests].[DocumentTypeID] = ' + STR(@Filter_DocumentTypeID)
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [QAP_Requests].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_SupplierID > '') 
    SET @LGSQL = @LGSQL + ' AND [QAP_Requests].[SupplierID] = ''' + @Filter_SupplierID + ''''
  IF (@Filter_StatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QAP_Requests].[StatusID] = ' + STR(@Filter_StatusID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestNo' THEN '[QAP_Requests].[RequestNo]'
                        WHEN 'RequestNo DESC' THEN '[QAP_Requests].[RequestNo] DESC'
                        WHEN 'DocumentTypeID' THEN '[QAP_Requests].[DocumentTypeID]'
                        WHEN 'DocumentTypeID DESC' THEN '[QAP_Requests].[DocumentTypeID] DESC'
                        WHEN 'QAPRevisionNo' THEN '[QAP_Requests].[QAPRevisionNo]'
                        WHEN 'QAPRevisionNo DESC' THEN '[QAP_Requests].[QAPRevisionNo] DESC'
                        WHEN 'QAPNo' THEN '[QAP_Requests].[QAPNo]'
                        WHEN 'QAPNo DESC' THEN '[QAP_Requests].[QAPNo] DESC'
                        WHEN 'ProjectID' THEN '[QAP_Requests].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[QAP_Requests].[ProjectID] DESC'
                        WHEN 'SupplierID' THEN '[QAP_Requests].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[QAP_Requests].[SupplierID] DESC'
                        WHEN 'SubSupplier' THEN '[QAP_Requests].[SubSupplier]'
                        WHEN 'SubSupplier DESC' THEN '[QAP_Requests].[SubSupplier] DESC'
                        WHEN 'MainItem' THEN '[QAP_Requests].[MainItem]'
                        WHEN 'MainItem DESC' THEN '[QAP_Requests].[MainItem] DESC'
                        WHEN 'SubItem' THEN '[QAP_Requests].[SubItem]'
                        WHEN 'SubItem DESC' THEN '[QAP_Requests].[SubItem] DESC'
                        WHEN 'ClientApprovalRequired' THEN '[QAP_Requests].[ClientApprovalRequired]'
                        WHEN 'ClientApprovalRequired DESC' THEN '[QAP_Requests].[ClientApprovalRequired] DESC'
                        WHEN 'Remarks' THEN '[QAP_Requests].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[QAP_Requests].[Remarks] DESC'
                        WHEN 'CreatedBy' THEN '[QAP_Requests].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[QAP_Requests].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[QAP_Requests].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[QAP_Requests].[CreatedOn] DESC'
                        WHEN 'CreatersDivision' THEN '[QAP_Requests].[CreatersDivision]'
                        WHEN 'CreatersDivision DESC' THEN '[QAP_Requests].[CreatersDivision] DESC'
                        WHEN 'ReviewBy' THEN '[QAP_Requests].[ReviewBy]'
                        WHEN 'ReviewBy DESC' THEN '[QAP_Requests].[ReviewBy] DESC'
                        WHEN 'ReviewOn' THEN '[QAP_Requests].[ReviewOn]'
                        WHEN 'ReviewOn DESC' THEN '[QAP_Requests].[ReviewOn] DESC'
                        WHEN 'ReviewerRemarks' THEN '[QAP_Requests].[ReviewerRemarks]'
                        WHEN 'ReviewerRemarks DESC' THEN '[QAP_Requests].[ReviewerRemarks] DESC'
                        WHEN 'ReviewerDivision' THEN '[QAP_Requests].[ReviewerDivision]'
                        WHEN 'ReviewerDivision DESC' THEN '[QAP_Requests].[ReviewerDivision] DESC'
                        WHEN 'ApproveBy' THEN '[QAP_Requests].[ApproveBy]'
                        WHEN 'ApproveBy DESC' THEN '[QAP_Requests].[ApproveBy] DESC'
                        WHEN 'ApproveOn' THEN '[QAP_Requests].[ApproveOn]'
                        WHEN 'ApproveOn DESC' THEN '[QAP_Requests].[ApproveOn] DESC'
                        WHEN 'ApproverRemarks' THEN '[QAP_Requests].[ApproverRemarks]'
                        WHEN 'ApproverRemarks DESC' THEN '[QAP_Requests].[ApproverRemarks] DESC'
                        WHEN 'ApproverDivision' THEN '[QAP_Requests].[ApproverDivision]'
                        WHEN 'ApproverDivision DESC' THEN '[QAP_Requests].[ApproverDivision] DESC'
                        WHEN 'StatusID' THEN '[QAP_Requests].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[QAP_Requests].[StatusID] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'HRM_Divisions4_Description' THEN '[HRM_Divisions4].[Description]'
                        WHEN 'HRM_Divisions4_Description DESC' THEN '[HRM_Divisions4].[Description] DESC'
                        WHEN 'HRM_Divisions5_Description' THEN '[HRM_Divisions5].[Description]'
                        WHEN 'HRM_Divisions5_Description DESC' THEN '[HRM_Divisions5].[Description] DESC'
                        WHEN 'HRM_Divisions6_Description' THEN '[HRM_Divisions6].[Description]'
                        WHEN 'HRM_Divisions6_Description DESC' THEN '[HRM_Divisions6].[Description] DESC'
                        WHEN 'IDM_Projects7_Description' THEN '[IDM_Projects7].[Description]'
                        WHEN 'IDM_Projects7_Description DESC' THEN '[IDM_Projects7].[Description] DESC'
                        WHEN 'IDM_Vendors8_Description' THEN '[IDM_Vendors8].[Description]'
                        WHEN 'IDM_Vendors8_Description DESC' THEN '[IDM_Vendors8].[Description] DESC'
                        WHEN 'QAP_DocumentTypes9_DocumentName' THEN '[QAP_DocumentTypes9].[DocumentName]'
                        WHEN 'QAP_DocumentTypes9_DocumentName DESC' THEN '[QAP_DocumentTypes9].[DocumentName] DESC'
                        WHEN 'QAP_States12_QAPStatus' THEN '[QAP_States12].[QAPStatus]'
                        WHEN 'QAP_States12_QAPStatus DESC' THEN '[QAP_States12].[QAPStatus] DESC'
                        ELSE '[QAP_Requests].[RequestNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QAP_Requests].[RequestNo] ,
		[QAP_Requests].[DocumentTypeID] ,
		[QAP_Requests].[QAPRevisionNo] ,
		[QAP_Requests].[QAPNo] ,
		[QAP_Requests].[ProjectID] ,
		[QAP_Requests].[SupplierID] ,
		[QAP_Requests].[SubSupplier] ,
		[QAP_Requests].[MainItem] ,
		[QAP_Requests].[SubItem] ,
		[QAP_Requests].[ClientApprovalRequired] ,
		[QAP_Requests].[Remarks] ,
		[QAP_Requests].[CreatedBy] ,
		[QAP_Requests].[CreatedOn] ,
		[QAP_Requests].[CreatersDivision] ,
		[QAP_Requests].[ReviewBy] ,
		[QAP_Requests].[ReviewOn] ,
		[QAP_Requests].[ReviewerRemarks] ,
		[QAP_Requests].[ReviewerDivision] ,
		[QAP_Requests].[ApproveBy] ,
		[QAP_Requests].[ApproveOn] ,
		[QAP_Requests].[ApproverRemarks] ,
		[QAP_Requests].[ApproverDivision] ,
		[QAP_Requests].[StatusID] ,
		[QAP_Requests].[PurposeID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus, 
		[QAP_Purpose1].[PurposeName] AS QAP_Purpose1_PurposeName 
  FROM [QAP_Requests] 
    	INNER JOIN #PageIndex
          ON [QAP_Requests].[RequestNo] = #PageIndex.RequestNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
