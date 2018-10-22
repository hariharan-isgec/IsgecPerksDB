USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sppak_LG_PakingListsReceivedAtPort]
  @LoginID NVarChar(8),
  @PortID int,
  @ProjectID NVarChar(6),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN

  SELECT
    [PAK_PkgListH].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [PAK_PO2].[PODescription] AS PAK_PO2_PODescription,
    [PAK_Units3].[Description] AS PAK_Units3_Description,
    [VR_BusinessPartner4].[BPName] AS VR_BusinessPartner4_BPName,
    [VR_RequestExecution5].[ExecutionDescription] AS VR_RequestExecution5_ExecutionDescription,
    [PAK_PkgStatus6].[Description] AS PAK_PkgStatus6_Description,
    [aspnet_Users7].[UserFullName] AS aspnet_Users7_UserFullName,
    [ELOG_Ports8].[Description] AS ELOG_Ports8_Description,
    [IDM_Projects9].[Description] AS IDM_Projects9_Description,
    [aspnet_Users10].[UserFullName] AS aspnet_Users10_UserFullName 
  FROM [PAK_PkgListH] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [PAK_PkgListH].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [PAK_PO] AS [PAK_PO2]
    ON [PAK_PkgListH].[SerialNo] = [PAK_PO2].[SerialNo]
  LEFT OUTER JOIN [PAK_Units] AS [PAK_Units3]
    ON [PAK_PkgListH].[UOMTotalWeight] = [PAK_Units3].[UnitID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner4]
    ON [PAK_PkgListH].[TransporterID] = [VR_BusinessPartner4].[BPID]
  LEFT OUTER JOIN [VR_RequestExecution] AS [VR_RequestExecution5]
    ON [PAK_PkgListH].[VRExecutionNo] = [VR_RequestExecution5].[SRNNo]
  LEFT OUTER JOIN [PAK_PkgStatus] AS [PAK_PkgStatus6]
    ON [PAK_PkgListH].[StatusID] = [PAK_PkgStatus6].[StatusID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users7]
    ON [PAK_PkgListH].[ReceivedAtPortBy] = [aspnet_users7].[LoginID]
  LEFT OUTER JOIN [ELOG_Ports] AS [ELOG_Ports8]
    ON [PAK_PkgListH].[PortID] = [ELOG_Ports8].[PortID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects9]
    ON [PAK_PkgListH].[ProjectID] = [IDM_Projects9].[ProjectID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users10]
    ON [PAK_PkgListH].[VRConvertedBy] = [aspnet_users10].[LoginID]
  WHERE [PAK_PkgListH].[PortID] =@PortID 
    AND [PAK_PkgListH].[ProjectID] = @ProjectID
	AND [PAK_PkgListH].[StatusID] = 6
  ORDER BY [PAK_PkgListH].[Serialno] 

  SET @RecordCount = @@RowCount

  END
GO
