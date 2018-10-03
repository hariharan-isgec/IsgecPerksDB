USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapRequestsSelectByID]
  @LoginID NVarChar(8),
  @RequestNo Int 
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
  [QAP_Requests].[RequestNo] = @RequestNo
GO
