USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptsSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6),
  @MRNNo Int 
  AS
  SELECT
    [VR_LorryReceipts].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [IDM_Projects2].[Description] AS IDM_Projects2_Description,
    [VR_BusinessPartner3].[BPName] AS VR_BusinessPartner3_BPName,
    [VR_LorryReceiptStatus4].[Description] AS VR_LorryReceiptStatus4_Description,
    [VR_MaterialStates5].[Description] AS VR_MaterialStates5_Description,
    [VR_RequestExecution6].[ExecutionDescription] AS VR_RequestExecution6_ExecutionDescription,
    [VR_Transporters7].[TransporterName] AS VR_Transporters7_TransporterName,
    [VR_VehicleTypes8].[cmba] AS VR_VehicleTypes8_cmba 
  FROM [VR_LorryReceipts] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [VR_LorryReceipts].[CreatedBy] = [aspnet_users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [VR_LorryReceipts].[ProjectID] = [IDM_Projects2].[ProjectID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner3]
    ON [VR_LorryReceipts].[CustomerID] = [VR_BusinessPartner3].[BPID]
  INNER JOIN [VR_LorryReceiptStatus] AS [VR_LorryReceiptStatus4]
    ON [VR_LorryReceipts].[LRStatusID] = [VR_LorryReceiptStatus4].[LRStatusID]
  LEFT OUTER JOIN [VR_MaterialStates] AS [VR_MaterialStates5]
    ON [VR_LorryReceipts].[MaterialStateID] = [VR_MaterialStates5].[MaterialStateID]
  LEFT OUTER JOIN [VR_RequestExecution] AS [VR_RequestExecution6]
    ON [VR_LorryReceipts].[RequestExecutionNo] = [VR_RequestExecution6].[SRNNo]
  LEFT OUTER JOIN [VR_Transporters] AS [VR_Transporters7]
    ON [VR_LorryReceipts].[TransporterID] = [VR_Transporters7].[TransporterID]
  LEFT OUTER JOIN [VR_VehicleTypes] AS [VR_VehicleTypes8]
    ON [VR_LorryReceipts].[VehicleTypeID] = [VR_VehicleTypes8].[VehicleTypeID]
  WHERE
  [VR_LorryReceipts].[ProjectID] = @ProjectID
  AND [VR_LorryReceipts].[MRNNo] = @MRNNo
GO
