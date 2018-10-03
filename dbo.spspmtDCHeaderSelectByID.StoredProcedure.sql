USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCHeaderSelectByID]
  @LoginID NVarChar(8),
  @ChallanID NVarChar(20) 
  AS
  SELECT
    [SPMT_DCHeader].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [HRM_Companies2].[Description] AS HRM_Companies2_Description,
    [IDM_Projects3].[Description] AS IDM_Projects3_Description,
    [SPMT_DCStates4].[Description] AS SPMT_DCStates4_Description,
    [SPMT_ERPStates5].[Description] AS SPMT_ERPStates5_Description,
    [SPMT_ERPStates6].[Description] AS SPMT_ERPStates6_Description,
    [SPMT_ERPStates7].[Description] AS SPMT_ERPStates7_Description,
    [SPMT_ERPStates8].[Description] AS SPMT_ERPStates8_Description,
    [SPMT_IsgecGSTIN9].[Description] AS SPMT_IsgecGSTIN9_Description,
    [SPMT_IsgecGSTIN10].[Description] AS SPMT_IsgecGSTIN10_Description,
    [SPMT_IsgecGSTIN11].[Description] AS SPMT_IsgecGSTIN11_Description,
    [SPMT_ModeOfTransport12].[Description] AS SPMT_ModeOfTransport12_Description,
    [VR_BPGSTIN13].[Description] AS VR_BPGSTIN13_Description,
    [VR_BPGSTIN14].[Description] AS VR_BPGSTIN14_Description,
    [VR_BusinessPartner15].[BPName] AS VR_BusinessPartner15_BPName,
    [VR_BusinessPartner16].[BPName] AS VR_BusinessPartner16_BPName,
    [VR_BusinessPartner17].[BPName] AS VR_BusinessPartner17_BPName,
    [aspnet_Users18].[UserFullName] AS aspnet_Users18_UserFullName,
    [aspnet_Users19].[UserFullName] AS aspnet_Users19_UserFullName,
    [SPMT_DCHeader20].[Purpose] AS SPMT_DCHeader20_Purpose,
    [SPMT_ERPStates21].[Description] AS SPMT_ERPStates21_Description,
    [SPMT_IsgecGSTIN22].[Description] AS SPMT_IsgecGSTIN22_Description,
    [VR_BPGSTIN23].[Description] AS VR_BPGSTIN23_Description,
    [VR_BusinessPartner24].[BPName] AS VR_BusinessPartner24_BPName 
  FROM [SPMT_DCHeader] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [SPMT_DCHeader].[CreatedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [SPMT_DCHeader].[UnitID] = [HRM_Companies2].[CompanyID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects3]
    ON [SPMT_DCHeader].[ProjectID] = [IDM_Projects3].[ProjectID]
  LEFT OUTER JOIN [SPMT_DCStates] AS [SPMT_DCStates4]
    ON [SPMT_DCHeader].[StatusID] = [SPMT_DCStates4].[StatusID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates5]
    ON [SPMT_DCHeader].[PlaceOfSupply] = [SPMT_ERPStates5].[StateID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates6]
    ON [SPMT_DCHeader].[PlaceOfDelivery] = [SPMT_ERPStates6].[StateID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates7]
    ON [SPMT_DCHeader].[ConsignerStateID] = [SPMT_ERPStates7].[StateID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates8]
    ON [SPMT_DCHeader].[ConsigneeStateID] = [SPMT_ERPStates8].[StateID]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN9]
    ON [SPMT_DCHeader].[ConsignerIsgecID] = [SPMT_IsgecGSTIN9].[GSTID]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN10]
    ON [SPMT_DCHeader].[ConsigneeIsgecID] = [SPMT_IsgecGSTIN10].[GSTID]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN11]
    ON [SPMT_DCHeader].[IssuerID] = [SPMT_IsgecGSTIN11].[GSTID]
  LEFT OUTER JOIN [SPMT_ModeOfTransport] AS [SPMT_ModeOfTransport12]
    ON [SPMT_DCHeader].[ModeOfTransportID] = [SPMT_ModeOfTransport12].[ModeID]
  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN13]
    ON [SPMT_DCHeader].[ConsignerBPID] = [VR_BPGSTIN13].[BPID]
    AND [SPMT_DCHeader].[ConsignerGSTIN] = [VR_BPGSTIN13].[GSTIN]
  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN14]
    ON [SPMT_DCHeader].[ConsigneeBPID] = [VR_BPGSTIN14].[BPID]
    AND [SPMT_DCHeader].[ConsigneeGSTIN] = [VR_BPGSTIN14].[GSTIN]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner15]
    ON [SPMT_DCHeader].[ConsignerBPID] = [VR_BusinessPartner15].[BPID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner16]
    ON [SPMT_DCHeader].[TransporterID] = [VR_BusinessPartner16].[BPID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner17]
    ON [SPMT_DCHeader].[ConsigneeBPID] = [VR_BusinessPartner17].[BPID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users18]
    ON [SPMT_DCHeader].[ReceivedBy] = [aspnet_users18].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users19]
    ON [SPMT_DCHeader].[ClosedBy] = [aspnet_users19].[LoginID]
  LEFT OUTER JOIN [SPMT_DCHeader] AS [SPMT_DCHeader20]
    ON [SPMT_DCHeader].[LinkedChallanID] = [SPMT_DCHeader20].[ChallanID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates21]
    ON [SPMT_DCHeader].[DestinationStateID] = [SPMT_ERPStates21].[StateID]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN22]
    ON [SPMT_DCHeader].[DestinationIsgecID] = [SPMT_IsgecGSTIN22].[GSTID]
  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN23]
    ON [SPMT_DCHeader].[DestinationBPID] = [VR_BPGSTIN23].[BPID]
    AND [SPMT_DCHeader].[DestinationGSTIN] = [VR_BPGSTIN23].[GSTIN]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner24]
    ON [SPMT_DCHeader].[DestinationBPID] = [VR_BusinessPartner24].[BPID]
  WHERE
  [SPMT_DCHeader].[ChallanID] = @ChallanID
GO
