USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLSelectByID]
  @LoginID NVarChar(8),
  @IRNo Int 
  AS
  SELECT
    [ELOG_IRBL].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [ELOG_BLHeader2].[BLNumber] AS ELOG_BLHeader2_BLNumber,
    [ELOG_BLTypes3].[Description] AS ELOG_BLTypes3_Description,
    [ELOG_CargoTypes4].[Description] AS ELOG_CargoTypes4_Description,
    [ELOG_Carriers5].[Description] AS ELOG_Carriers5_Description,
    [ELOG_LocationCountries6].[Description] AS ELOG_LocationCountries6_Description,
    [ELOG_Ports7].[Description] AS ELOG_Ports7_Description,
    [ELOG_ShipmentModes8].[Description] AS ELOG_ShipmentModes8_Description,
    [IDM_Projects9].[Description] AS IDM_Projects9_Description,
    [VR_BusinessPartner10].[BPName] AS VR_BusinessPartner10_BPName,
    [ELOG_IRBLStates11].[Description] AS ELOG_IRBLStates11_Description 
  FROM [ELOG_IRBL] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [ELOG_IRBL].[CreatedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [ELOG_BLHeader] AS [ELOG_BLHeader2]
    ON [ELOG_IRBL].[BLID] = [ELOG_BLHeader2].[BLID]
  LEFT OUTER JOIN [ELOG_BLTypes] AS [ELOG_BLTypes3]
    ON [ELOG_IRBL].[BLType] = [ELOG_BLTypes3].[BLTypeID]
  LEFT OUTER JOIN [ELOG_CargoTypes] AS [ELOG_CargoTypes4]
    ON [ELOG_IRBL].[CargoTypeID] = [ELOG_CargoTypes4].[CargoTypeID]
  LEFT OUTER JOIN [ELOG_Carriers] AS [ELOG_Carriers5]
    ON [ELOG_IRBL].[CarrierID] = [ELOG_Carriers5].[CarrierID]
  LEFT OUTER JOIN [ELOG_LocationCountries] AS [ELOG_LocationCountries6]
    ON [ELOG_IRBL].[LocationCountryID] = [ELOG_LocationCountries6].[LocationCountryID]
  LEFT OUTER JOIN [ELOG_Ports] AS [ELOG_Ports7]
    ON [ELOG_IRBL].[PortID] = [ELOG_Ports7].[PortID]
  LEFT OUTER JOIN [ELOG_ShipmentModes] AS [ELOG_ShipmentModes8]
    ON [ELOG_IRBL].[ShipmentModeID] = [ELOG_ShipmentModes8].[ShipmentModeID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects9]
    ON [ELOG_IRBL].[ProjectID] = [IDM_Projects9].[ProjectID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner10]
    ON [ELOG_IRBL].[SupplierID] = [VR_BusinessPartner10].[BPID]
  LEFT OUTER JOIN [ELOG_IRBLStates] AS [ELOG_IRBLStates11]
    ON [ELOG_IRBL].[StatusID] = [ELOG_IRBLStates11].[StatusID]
  WHERE
  [ELOG_IRBL].[IRNo] = @IRNo
GO
