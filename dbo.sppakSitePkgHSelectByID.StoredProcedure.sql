USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgHSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6),
  @RecNo Int 
  AS
  SELECT
    [PAK_SitePkgH].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [IDM_Projects2].[Description] AS IDM_Projects2_Description,
    [PAK_PkgListH3].[SupplierRefNo] AS PAK_PkgListH3_SupplierRefNo,
    [PAK_PO4].[PODescription] AS PAK_PO4_PODescription,
    [PAK_ReceiveStatus5].[Description] AS PAK_ReceiveStatus5_Description,
    [PAK_Units6].[Description] AS PAK_Units6_Description,
    [VR_BusinessPartner7].[BPName] AS VR_BusinessPartner7_BPName,
    [VR_BusinessPartner8].[BPName] AS VR_BusinessPartner8_BPName,
    [VR_LorryReceipts9].[TransporterName] AS VR_LorryReceipts9_TransporterName,
    [VR_MaterialStates10].[Description] AS VR_MaterialStates10_Description 
  FROM [PAK_SitePkgH] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_SitePkgH].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [PAK_SitePkgH].[ProjectID] = [IDM_Projects2].[ProjectID]
  LEFT OUTER JOIN [PAK_PkgListH] AS [PAK_PkgListH3]
    ON [PAK_SitePkgH].[SerialNo] = [PAK_PkgListH3].[SerialNo]
    AND [PAK_SitePkgH].[PkgNo] = [PAK_PkgListH3].[PkgNo]
  LEFT OUTER JOIN [PAK_PO] AS [PAK_PO4]
    ON [PAK_SitePkgH].[SerialNo] = [PAK_PO4].[SerialNo]
  LEFT OUTER JOIN [PAK_ReceiveStatus] AS [PAK_ReceiveStatus5]
    ON [PAK_SitePkgH].[ReceiveStatusID] = [PAK_ReceiveStatus5].[ReceiveStatusID]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units6]
    ON [PAK_SitePkgH].[UOMTotalWeight] = [PAK_Units6].[UnitID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner7]
    ON [PAK_SitePkgH].[TransporterID] = [VR_BusinessPartner7].[BPID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner8]
    ON [PAK_SitePkgH].[SupplierID] = [VR_BusinessPartner8].[BPID]
  LEFT OUTER JOIN [VR_LorryReceipts] AS [VR_LorryReceipts9]
    ON [PAK_SitePkgH].[ProjectID] = [VR_LorryReceipts9].[ProjectID]
    AND [PAK_SitePkgH].[MRNNo] = [VR_LorryReceipts9].[MRNNo]
  LEFT OUTER JOIN [VR_MaterialStates] AS [VR_MaterialStates10]
    ON [PAK_SitePkgH].[MaterialStatusID] = [VR_MaterialStates10].[MaterialStateID]
  WHERE
  [PAK_SitePkgH].[ProjectID] = @ProjectID
  AND [PAK_SitePkgH].[RecNo] = @RecNo
GO
