USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCPOSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @Filter_BuyerID NVarChar(8),
  @Filter_IssuedBy NVarChar(8),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @SupplierID NVarChar(9),
  @POStatusID Int,
  @POFOR NVarChar(2),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_PO].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_PO] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PO].[BuyerID] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PO].[IssuedBy] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PO].[ClosedBy] = [aspnet_users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PO].[ProjectID] = [IDM_Projects4].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Divisions] AS [PAK_Divisions5]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PO].[DivisionID] = [PAK_Divisions5].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_POStatus] AS [PAK_POStatus6]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PO].[POStatusID] = [PAK_POStatus6].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_POTypes] AS [PAK_POTypes7]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PO].[POTypeID] = [PAK_POTypes7].[POTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Reasons] AS [PAK_Reasons8]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PO].[IssueReasonID] = [PAK_Reasons8].[ReasonID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner9]'
  SET @LGSQL = @LGSQL + '    ON [PAK_PO].[SupplierID] = [VR_BusinessPartner9].[BPID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [PAK_PO].[SupplierID] = (''' + @SupplierID + ''')'
  SET @LGSQL = @LGSQL + ' AND [PAK_PO].[POStatusID] = ''' + STR(@POStatusID) + '''' 
  SET @LGSQL = @LGSQL + ' AND [PAK_PO].[POFOR] = (''' + @POFOR + ''')'
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_PO].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_BuyerID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_PO].[BuyerID] = ''' + @Filter_BuyerID + ''''
  IF (@Filter_IssuedBy > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_PO].[IssuedBy] = ''' + @Filter_IssuedBy + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[PAK_PO].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[PAK_PO].[SerialNo] DESC'
                        WHEN 'POConsignee' THEN '[PAK_PO].[POConsignee]'
                        WHEN 'POConsignee DESC' THEN '[PAK_PO].[POConsignee] DESC'
                        WHEN 'POOtherDetails' THEN '[PAK_PO].[POOtherDetails]'
                        WHEN 'POOtherDetails DESC' THEN '[PAK_PO].[POOtherDetails] DESC'
                        WHEN 'IssueReasonID' THEN '[PAK_PO].[IssueReasonID]'
                        WHEN 'IssueReasonID DESC' THEN '[PAK_PO].[IssueReasonID] DESC'
                        WHEN 'PONumber' THEN '[PAK_PO].[PONumber]'
                        WHEN 'PONumber DESC' THEN '[PAK_PO].[PONumber] DESC'
                        WHEN 'PORevision' THEN '[PAK_PO].[PORevision]'
                        WHEN 'PORevision DESC' THEN '[PAK_PO].[PORevision] DESC'
                        WHEN 'PODate' THEN '[PAK_PO].[PODate]'
                        WHEN 'PODate DESC' THEN '[PAK_PO].[PODate] DESC'
                        WHEN 'PODescription' THEN '[PAK_PO].[PODescription]'
                        WHEN 'PODescription DESC' THEN '[PAK_PO].[PODescription] DESC'
                        WHEN 'POTypeID' THEN '[PAK_PO].[POTypeID]'
                        WHEN 'POTypeID DESC' THEN '[PAK_PO].[POTypeID] DESC'
                        WHEN 'SupplierID' THEN '[PAK_PO].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[PAK_PO].[SupplierID] DESC'
                        WHEN 'ProjectID' THEN '[PAK_PO].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[PAK_PO].[ProjectID] DESC'
                        WHEN 'BuyerID' THEN '[PAK_PO].[BuyerID]'
                        WHEN 'BuyerID DESC' THEN '[PAK_PO].[BuyerID] DESC'
                        WHEN 'POStatusID' THEN '[PAK_PO].[POStatusID]'
                        WHEN 'POStatusID DESC' THEN '[PAK_PO].[POStatusID] DESC'
                        WHEN 'IssuedBy' THEN '[PAK_PO].[IssuedBy]'
                        WHEN 'IssuedBy DESC' THEN '[PAK_PO].[IssuedBy] DESC'
                        WHEN 'IssuedOn' THEN '[PAK_PO].[IssuedOn]'
                        WHEN 'IssuedOn DESC' THEN '[PAK_PO].[IssuedOn] DESC'
                        WHEN 'ClosedBy' THEN '[PAK_PO].[ClosedBy]'
                        WHEN 'ClosedBy DESC' THEN '[PAK_PO].[ClosedBy] DESC'
                        WHEN 'ClosedOn' THEN '[PAK_PO].[ClosedOn]'
                        WHEN 'ClosedOn DESC' THEN '[PAK_PO].[ClosedOn] DESC'
                        WHEN 'ISGECRemarks' THEN '[PAK_PO].[ISGECRemarks]'
                        WHEN 'ISGECRemarks DESC' THEN '[PAK_PO].[ISGECRemarks] DESC'
                        WHEN 'SupplierRemarks' THEN '[PAK_PO].[SupplierRemarks]'
                        WHEN 'SupplierRemarks DESC' THEN '[PAK_PO].[SupplierRemarks] DESC'
                        WHEN 'DivisionID' THEN '[PAK_PO].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[PAK_PO].[DivisionID] DESC'
                        WHEN 'POFOR' THEN '[PAK_PO].[POFOR]'
                        WHEN 'POFOR DESC' THEN '[PAK_PO].[POFOR] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'IDM_Projects4_Description' THEN '[IDM_Projects4].[Description]'
                        WHEN 'IDM_Projects4_Description DESC' THEN '[IDM_Projects4].[Description] DESC'
                        WHEN 'PAK_Divisions5_Description' THEN '[PAK_Divisions5].[Description]'
                        WHEN 'PAK_Divisions5_Description DESC' THEN '[PAK_Divisions5].[Description] DESC'
                        WHEN 'PAK_POStatus6_Description' THEN '[PAK_POStatus6].[Description]'
                        WHEN 'PAK_POStatus6_Description DESC' THEN '[PAK_POStatus6].[Description] DESC'
                        WHEN 'PAK_POTypes7_Description' THEN '[PAK_POTypes7].[Description]'
                        WHEN 'PAK_POTypes7_Description DESC' THEN '[PAK_POTypes7].[Description] DESC'
                        WHEN 'PAK_Reasons8_Description' THEN '[PAK_Reasons8].[Description]'
                        WHEN 'PAK_Reasons8_Description DESC' THEN '[PAK_Reasons8].[Description] DESC'
                        WHEN 'VR_BusinessPartner9_BPName' THEN '[VR_BusinessPartner9].[BPName]'
                        WHEN 'VR_BusinessPartner9_BPName DESC' THEN '[VR_BusinessPartner9].[BPName] DESC'
                        ELSE '[PAK_PO].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_PO].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [IDM_Projects4].[Description] AS IDM_Projects4_Description,
    [PAK_Divisions5].[Description] AS PAK_Divisions5_Description,
    [PAK_POStatus6].[Description] AS PAK_POStatus6_Description,
    [PAK_POTypes7].[Description] AS PAK_POTypes7_Description,
    [PAK_Reasons8].[Description] AS PAK_Reasons8_Description,
    [VR_BusinessPartner9].[BPName] AS VR_BusinessPartner9_BPName 
  FROM [PAK_PO] 
      INNER JOIN #PageIndex
          ON [PAK_PO].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_PO].[BuyerID] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [PAK_PO].[IssuedBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [PAK_PO].[ClosedBy] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [PAK_PO].[ProjectID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [PAK_Divisions] AS [PAK_Divisions5]
    ON [PAK_PO].[DivisionID] = [PAK_Divisions5].[DivisionID]
  LEFT OUTER JOIN [PAK_POStatus] AS [PAK_POStatus6]
    ON [PAK_PO].[POStatusID] = [PAK_POStatus6].[StatusID]
  LEFT OUTER JOIN [PAK_POTypes] AS [PAK_POTypes7]
    ON [PAK_PO].[POTypeID] = [PAK_POTypes7].[POTypeID]
  LEFT OUTER JOIN [PAK_Reasons] AS [PAK_Reasons8]
    ON [PAK_PO].[IssueReasonID] = [PAK_Reasons8].[ReasonID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner9]
    ON [PAK_PO].[SupplierID] = [VR_BusinessPartner9].[BPID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
