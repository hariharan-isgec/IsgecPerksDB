USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqap_LG_qapList]
  @Filter_DocumentTypeID Int,
  @Filter_ProjectID NVarChar(6),
  @Filter_SupplierID NVarChar(9),
  @LoginID NVarChar(8),
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
  SET @LGSQL = @LGSQL + '  WHERE [QAP_Requests].[CreatersDivision] = (SELECT TOP 1 [aspnet_Users].[C_DivisionID] FROM [aspnet_Users] WHERE [aspnet_Users].[LoginID]='''+@LoginID+''') '
  IF (@Filter_DocumentTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QAP_Requests].[DocumentTypeID] = ' + STR(@Filter_DocumentTypeID)
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [QAP_Requests].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_SupplierID > '') 
    SET @LGSQL = @LGSQL + ' AND [QAP_Requests].[SupplierID] = ''' + @Filter_SupplierID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY [QAP_Requests].[RequestNo] DESC '

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
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus 
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
  ORDER BY
    #PageIndex.IndexID
  END
GO
