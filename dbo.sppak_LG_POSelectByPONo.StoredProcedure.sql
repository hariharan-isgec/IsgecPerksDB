USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sppak_LG_POSelectByPONo]
  @LoginID NVarChar(8),
  @PONo NvarChar(9)  
  AS
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
  [PAK_PO].[PONumber] = @PONo 
  AND [PAK_PO].[POFor] = 'PK'
GO
