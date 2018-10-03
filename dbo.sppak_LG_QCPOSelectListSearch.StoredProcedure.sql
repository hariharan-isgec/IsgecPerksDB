USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppak_LG_QCPOSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @SupplierID NVarChar(9),
  @POStatusID Int,
  @POFOR NVarChar(2),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [PAK_PO].[SerialNo] FROM [PAK_PO]
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
 WHERE [PAK_PO].[QCRequired] = 1 
   AND [PAK_PO].[SupplierID] = case when substring(@LoginID,1,2)='UP' then  'S' + @LoginID else [PAK_PO].[SupplierID] end 
   AND   [PAK_PO].[SupplierID] = (@SupplierID)
   AND [PAK_PO].[POStatusID] = (@POStatusID)
   AND [PAK_PO].[POFOR] = (@POFOR)
   AND ( 
         STR(ISNULL([PAK_PO].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PO].[POConsignee],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PO].[POOtherDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PO].[IssueReasonID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PO].[PONumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PO].[PORevision],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PO].[PODescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PO].[POTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PO].[SupplierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PO].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PO].[BuyerID],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PO].[POStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PO].[IssuedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PO].[ClosedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PO].[ISGECRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PO].[SupplierRemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_PO].[DivisionID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_PO].[POFOR],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_PO].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_PO].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'POConsignee' THEN [PAK_PO].[POConsignee] END,
     CASE @OrderBy WHEN 'POConsignee DESC' THEN [PAK_PO].[POConsignee] END DESC,
     CASE @OrderBy WHEN 'POOtherDetails' THEN [PAK_PO].[POOtherDetails] END,
     CASE @OrderBy WHEN 'POOtherDetails DESC' THEN [PAK_PO].[POOtherDetails] END DESC,
     CASE @OrderBy WHEN 'IssueReasonID' THEN [PAK_PO].[IssueReasonID] END,
     CASE @OrderBy WHEN 'IssueReasonID DESC' THEN [PAK_PO].[IssueReasonID] END DESC,
     CASE @OrderBy WHEN 'PONumber' THEN [PAK_PO].[PONumber] END,
     CASE @OrderBy WHEN 'PONumber DESC' THEN [PAK_PO].[PONumber] END DESC,
     CASE @OrderBy WHEN 'PORevision' THEN [PAK_PO].[PORevision] END,
     CASE @OrderBy WHEN 'PORevision DESC' THEN [PAK_PO].[PORevision] END DESC,
     CASE @OrderBy WHEN 'PODate' THEN [PAK_PO].[PODate] END,
     CASE @OrderBy WHEN 'PODate DESC' THEN [PAK_PO].[PODate] END DESC,
     CASE @OrderBy WHEN 'PODescription' THEN [PAK_PO].[PODescription] END,
     CASE @OrderBy WHEN 'PODescription DESC' THEN [PAK_PO].[PODescription] END DESC,
     CASE @OrderBy WHEN 'POTypeID' THEN [PAK_PO].[POTypeID] END,
     CASE @OrderBy WHEN 'POTypeID DESC' THEN [PAK_PO].[POTypeID] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [PAK_PO].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [PAK_PO].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [PAK_PO].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [PAK_PO].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'BuyerID' THEN [PAK_PO].[BuyerID] END,
     CASE @OrderBy WHEN 'BuyerID DESC' THEN [PAK_PO].[BuyerID] END DESC,
     CASE @OrderBy WHEN 'POStatusID' THEN [PAK_PO].[POStatusID] END,
     CASE @OrderBy WHEN 'POStatusID DESC' THEN [PAK_PO].[POStatusID] END DESC,
     CASE @OrderBy WHEN 'IssuedBy' THEN [PAK_PO].[IssuedBy] END,
     CASE @OrderBy WHEN 'IssuedBy DESC' THEN [PAK_PO].[IssuedBy] END DESC,
     CASE @OrderBy WHEN 'IssuedOn' THEN [PAK_PO].[IssuedOn] END,
     CASE @OrderBy WHEN 'IssuedOn DESC' THEN [PAK_PO].[IssuedOn] END DESC,
     CASE @OrderBy WHEN 'ClosedBy' THEN [PAK_PO].[ClosedBy] END,
     CASE @OrderBy WHEN 'ClosedBy DESC' THEN [PAK_PO].[ClosedBy] END DESC,
     CASE @OrderBy WHEN 'ClosedOn' THEN [PAK_PO].[ClosedOn] END,
     CASE @OrderBy WHEN 'ClosedOn DESC' THEN [PAK_PO].[ClosedOn] END DESC,
     CASE @OrderBy WHEN 'ISGECRemarks' THEN [PAK_PO].[ISGECRemarks] END,
     CASE @OrderBy WHEN 'ISGECRemarks DESC' THEN [PAK_PO].[ISGECRemarks] END DESC,
     CASE @OrderBy WHEN 'SupplierRemarks' THEN [PAK_PO].[SupplierRemarks] END,
     CASE @OrderBy WHEN 'SupplierRemarks DESC' THEN [PAK_PO].[SupplierRemarks] END DESC,
     CASE @OrderBy WHEN 'DivisionID' THEN [PAK_PO].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [PAK_PO].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'POFOR' THEN [PAK_PO].[POFOR] END,
     CASE @OrderBy WHEN 'POFOR DESC' THEN [PAK_PO].[POFOR] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects4_Description' THEN [IDM_Projects4].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects4_Description DESC' THEN [IDM_Projects4].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Divisions5_Description' THEN [PAK_Divisions5].[Description] END,
     CASE @OrderBy WHEN 'PAK_Divisions5_Description DESC' THEN [PAK_Divisions5].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_POStatus6_Description' THEN [PAK_POStatus6].[Description] END,
     CASE @OrderBy WHEN 'PAK_POStatus6_Description DESC' THEN [PAK_POStatus6].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_POTypes7_Description' THEN [PAK_POTypes7].[Description] END,
     CASE @OrderBy WHEN 'PAK_POTypes7_Description DESC' THEN [PAK_POTypes7].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Reasons8_Description' THEN [PAK_Reasons8].[Description] END,
     CASE @OrderBy WHEN 'PAK_Reasons8_Description DESC' THEN [PAK_Reasons8].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner9_BPName' THEN [VR_BusinessPartner9].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner9_BPName DESC' THEN [VR_BusinessPartner9].[BPName] END DESC 

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
