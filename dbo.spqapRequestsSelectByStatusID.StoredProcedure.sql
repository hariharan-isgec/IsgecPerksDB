USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapRequestsSelectByStatusID]
  @StatusID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
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
		[QAP_Requests].[Division] ,
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
  [QAP_Requests].[StatusID] = @StatusID
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [QAP_Requests].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [QAP_Requests].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'DocumentTypeID' THEN [QAP_Requests].[DocumentTypeID] END,
     CASE @OrderBy WHEN 'DocumentTypeID DESC' THEN [QAP_Requests].[DocumentTypeID] END DESC,
     CASE @OrderBy WHEN 'QAPRevisionNo' THEN [QAP_Requests].[QAPRevisionNo] END,
     CASE @OrderBy WHEN 'QAPRevisionNo DESC' THEN [QAP_Requests].[QAPRevisionNo] END DESC,
     CASE @OrderBy WHEN 'QAPNo' THEN [QAP_Requests].[QAPNo] END,
     CASE @OrderBy WHEN 'QAPNo DESC' THEN [QAP_Requests].[QAPNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [QAP_Requests].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [QAP_Requests].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [QAP_Requests].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [QAP_Requests].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SubSupplier' THEN [QAP_Requests].[SubSupplier] END,
     CASE @OrderBy WHEN 'SubSupplier DESC' THEN [QAP_Requests].[SubSupplier] END DESC,
     CASE @OrderBy WHEN 'MainItem' THEN [QAP_Requests].[MainItem] END,
     CASE @OrderBy WHEN 'MainItem DESC' THEN [QAP_Requests].[MainItem] END DESC,
     CASE @OrderBy WHEN 'SubItem' THEN [QAP_Requests].[SubItem] END,
     CASE @OrderBy WHEN 'SubItem DESC' THEN [QAP_Requests].[SubItem] END DESC,
     CASE @OrderBy WHEN 'ClientApprovalRequired' THEN [QAP_Requests].[ClientApprovalRequired] END,
     CASE @OrderBy WHEN 'ClientApprovalRequired DESC' THEN [QAP_Requests].[ClientApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [QAP_Requests].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [QAP_Requests].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [QAP_Requests].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [QAP_Requests].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [QAP_Requests].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [QAP_Requests].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatersDivision' THEN [QAP_Requests].[CreatersDivision] END,
     CASE @OrderBy WHEN 'CreatersDivision DESC' THEN [QAP_Requests].[CreatersDivision] END DESC,
     CASE @OrderBy WHEN 'ReviewBy' THEN [QAP_Requests].[ReviewBy] END,
     CASE @OrderBy WHEN 'ReviewBy DESC' THEN [QAP_Requests].[ReviewBy] END DESC,
     CASE @OrderBy WHEN 'ReviewOn' THEN [QAP_Requests].[ReviewOn] END,
     CASE @OrderBy WHEN 'ReviewOn DESC' THEN [QAP_Requests].[ReviewOn] END DESC,
     CASE @OrderBy WHEN 'ReviewerRemarks' THEN [QAP_Requests].[ReviewerRemarks] END,
     CASE @OrderBy WHEN 'ReviewerRemarks DESC' THEN [QAP_Requests].[ReviewerRemarks] END DESC,
     CASE @OrderBy WHEN 'ReviewerDivision' THEN [QAP_Requests].[ReviewerDivision] END,
     CASE @OrderBy WHEN 'ReviewerDivision DESC' THEN [QAP_Requests].[ReviewerDivision] END DESC,
     CASE @OrderBy WHEN 'ApproveBy' THEN [QAP_Requests].[ApproveBy] END,
     CASE @OrderBy WHEN 'ApproveBy DESC' THEN [QAP_Requests].[ApproveBy] END DESC,
     CASE @OrderBy WHEN 'ApproveOn' THEN [QAP_Requests].[ApproveOn] END,
     CASE @OrderBy WHEN 'ApproveOn DESC' THEN [QAP_Requests].[ApproveOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [QAP_Requests].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [QAP_Requests].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApproverDivision' THEN [QAP_Requests].[ApproverDivision] END,
     CASE @OrderBy WHEN 'ApproverDivision DESC' THEN [QAP_Requests].[ApproverDivision] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_Requests].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_Requests].[StatusID] END DESC,
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Requests].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Requests].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'Division' THEN [QAP_Requests].[Division] END,
     CASE @OrderBy WHEN 'Division DESC' THEN [QAP_Requests].[Division] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description' THEN [HRM_Divisions5].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description DESC' THEN [HRM_Divisions5].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description' THEN [HRM_Divisions6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description DESC' THEN [HRM_Divisions6].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects7_Description' THEN [IDM_Projects7].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects7_Description DESC' THEN [IDM_Projects7].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description' THEN [IDM_Vendors8].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description DESC' THEN [IDM_Vendors8].[Description] END DESC,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName' THEN [QAP_DocumentTypes9].[DocumentName] END,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName DESC' THEN [QAP_DocumentTypes9].[DocumentName] END DESC,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus' THEN [QAP_States12].[QAPStatus] END,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus DESC' THEN [QAP_States12].[QAPStatus] END DESC,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName' THEN [QAP_Purpose1].[PurposeName] END,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName DESC' THEN [QAP_Purpose1].[PurposeName] END DESC 
  SET @RecordCount = @@RowCount
GO
