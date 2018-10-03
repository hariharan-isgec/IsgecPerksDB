USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgHSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [PAK_SitePkgH].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [PAK_SitePkgH].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'RecNo' THEN [PAK_SitePkgH].[RecNo] END,
     CASE @OrderBy WHEN 'RecNo DESC' THEN [PAK_SitePkgH].[RecNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [PAK_SitePkgH].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [PAK_SitePkgH].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'PkgNo' THEN [PAK_SitePkgH].[PkgNo] END,
     CASE @OrderBy WHEN 'PkgNo DESC' THEN [PAK_SitePkgH].[PkgNo] END DESC,
     CASE @OrderBy WHEN 'MRNNo' THEN [PAK_SitePkgH].[MRNNo] END,
     CASE @OrderBy WHEN 'MRNNo DESC' THEN [PAK_SitePkgH].[MRNNo] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [PAK_SitePkgH].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [PAK_SitePkgH].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SupplierName' THEN [PAK_SitePkgH].[SupplierName] END,
     CASE @OrderBy WHEN 'SupplierName DESC' THEN [PAK_SitePkgH].[SupplierName] END DESC,
     CASE @OrderBy WHEN 'SupplierRefNo' THEN [PAK_SitePkgH].[SupplierRefNo] END,
     CASE @OrderBy WHEN 'SupplierRefNo DESC' THEN [PAK_SitePkgH].[SupplierRefNo] END DESC,
     CASE @OrderBy WHEN 'TransporterID' THEN [PAK_SitePkgH].[TransporterID] END,
     CASE @OrderBy WHEN 'TransporterID DESC' THEN [PAK_SitePkgH].[TransporterID] END DESC,
     CASE @OrderBy WHEN 'TransporterName' THEN [PAK_SitePkgH].[TransporterName] END,
     CASE @OrderBy WHEN 'TransporterName DESC' THEN [PAK_SitePkgH].[TransporterName] END DESC,
     CASE @OrderBy WHEN 'VehicleNo' THEN [PAK_SitePkgH].[VehicleNo] END,
     CASE @OrderBy WHEN 'VehicleNo DESC' THEN [PAK_SitePkgH].[VehicleNo] END DESC,
     CASE @OrderBy WHEN 'GRNo' THEN [PAK_SitePkgH].[GRNo] END,
     CASE @OrderBy WHEN 'GRNo DESC' THEN [PAK_SitePkgH].[GRNo] END DESC,
     CASE @OrderBy WHEN 'GRDate' THEN [PAK_SitePkgH].[GRDate] END,
     CASE @OrderBy WHEN 'GRDate DESC' THEN [PAK_SitePkgH].[GRDate] END DESC,
     CASE @OrderBy WHEN 'UOMTotalWeight' THEN [PAK_SitePkgH].[UOMTotalWeight] END,
     CASE @OrderBy WHEN 'UOMTotalWeight DESC' THEN [PAK_SitePkgH].[UOMTotalWeight] END DESC,
     CASE @OrderBy WHEN 'TotalWeight' THEN [PAK_SitePkgH].[TotalWeight] END,
     CASE @OrderBy WHEN 'TotalWeight DESC' THEN [PAK_SitePkgH].[TotalWeight] END DESC,
     CASE @OrderBy WHEN 'ODC' THEN [PAK_SitePkgH].[ODC] END,
     CASE @OrderBy WHEN 'ODC DESC' THEN [PAK_SitePkgH].[ODC] END DESC,
     CASE @OrderBy WHEN 'MaterialStatusID' THEN [PAK_SitePkgH].[MaterialStatusID] END,
     CASE @OrderBy WHEN 'MaterialStatusID DESC' THEN [PAK_SitePkgH].[MaterialStatusID] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [PAK_SitePkgH].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [PAK_SitePkgH].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [PAK_SitePkgH].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [PAK_SitePkgH].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [PAK_SitePkgH].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [PAK_SitePkgH].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'ReceiveStatusID' THEN [PAK_SitePkgH].[ReceiveStatusID] END,
     CASE @OrderBy WHEN 'ReceiveStatusID DESC' THEN [PAK_SitePkgH].[ReceiveStatusID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_PkgListH3_SupplierRefNo' THEN [PAK_PkgListH3].[SupplierRefNo] END,
     CASE @OrderBy WHEN 'PAK_PkgListH3_SupplierRefNo DESC' THEN [PAK_PkgListH3].[SupplierRefNo] END DESC,
     CASE @OrderBy WHEN 'PAK_PO4_PODescription' THEN [PAK_PO4].[PODescription] END,
     CASE @OrderBy WHEN 'PAK_PO4_PODescription DESC' THEN [PAK_PO4].[PODescription] END DESC,
     CASE @OrderBy WHEN 'PAK_ReceiveStatus5_Description' THEN [PAK_ReceiveStatus5].[Description] END,
     CASE @OrderBy WHEN 'PAK_ReceiveStatus5_Description DESC' THEN [PAK_ReceiveStatus5].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_Units6_Description' THEN [PAK_Units6].[Description] END,
     CASE @OrderBy WHEN 'PAK_Units6_Description DESC' THEN [PAK_Units6].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner7_BPName' THEN [VR_BusinessPartner7].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner7_BPName DESC' THEN [VR_BusinessPartner7].[BPName] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner8_BPName' THEN [VR_BusinessPartner8].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner8_BPName DESC' THEN [VR_BusinessPartner8].[BPName] END DESC,
     CASE @OrderBy WHEN 'VR_LorryReceipts9_TransporterName' THEN [VR_LorryReceipts9].[TransporterName] END,
     CASE @OrderBy WHEN 'VR_LorryReceipts9_TransporterName DESC' THEN [VR_LorryReceipts9].[TransporterName] END DESC,
     CASE @OrderBy WHEN 'VR_MaterialStates10_Description' THEN [VR_MaterialStates10].[Description] END,
     CASE @OrderBy WHEN 'VR_MaterialStates10_Description DESC' THEN [VR_MaterialStates10].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
