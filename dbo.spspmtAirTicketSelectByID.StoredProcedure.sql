USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtAirTicketSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
    [SPMT_AirTicket].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [IDM_Projects2].[Description] AS IDM_Projects2_Description,
    [SPMT_BillTypes3].[Description] AS SPMT_BillTypes3_Description,
    [SPMT_BillTypes4].[Description] AS SPMT_BillTypes4_Description,
    [SPMT_ERPStates5].[Description] AS SPMT_ERPStates5_Description,
    [SPMT_ERPStates6].[Description] AS SPMT_ERPStates6_Description,
    [SPMT_HSNSACCodes7].[HSNSACCode] AS SPMT_HSNSACCodes7_HSNSACCode,
    [SPMT_HSNSACCodes8].[HSNSACCode] AS SPMT_HSNSACCodes8_HSNSACCode,
    [SPMT_IsgecGSTIN9].[Description] AS SPMT_IsgecGSTIN9_Description,
    [SPMT_IsgecGSTIN10].[Description] AS SPMT_IsgecGSTIN10_Description,
    [SPMT_PaymentAdvice11].[BPID] AS SPMT_PaymentAdvice11_BPID,
    [SPMT_TranTypes12].[Description] AS SPMT_TranTypes12_Description,
    [VR_BPGSTIN13].[Description] AS VR_BPGSTIN13_Description,
    [VR_BPGSTIN14].[Description] AS VR_BPGSTIN14_Description,
    [VR_BusinessPartner15].[BPName] AS VR_BusinessPartner15_BPName,
    [VR_BusinessPartner16].[BPName] AS VR_BusinessPartner16_BPName,
    [SPMT_AirTicketStatus17].[Descriptionn] AS SPMT_AirTicketStatus17_Descriptionn,
    [SPMT_SupplierBill18].[BillNumber] AS SPMT_SupplierBill18_BillNumber,
    [SPMT_SupplierBill19].[BillNumber] AS SPMT_SupplierBill19_BillNumber 
  FROM [SPMT_AirTicket] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [SPMT_AirTicket].[EmployeeID] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [SPMT_AirTicket].[ProjectID] = [IDM_Projects2].[ProjectID]
  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes3]
    ON [SPMT_AirTicket].[AgencyBillType] = [SPMT_BillTypes3].[BillType]
  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes4]
    ON [SPMT_AirTicket].[AgentsBillType] = [SPMT_BillTypes4].[BillType]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates5]
    ON [SPMT_AirTicket].[AgentsStateID] = [SPMT_ERPStates5].[StateID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates6]
    ON [SPMT_AirTicket].[AgencyStateID] = [SPMT_ERPStates6].[StateID]
  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes7]
    ON [SPMT_AirTicket].[AgencyBillType] = [SPMT_HSNSACCodes7].[BillType]
    AND [SPMT_AirTicket].[AgencyHSNSACCode] = [SPMT_HSNSACCodes7].[HSNSACCode]
  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes8]
    ON [SPMT_AirTicket].[AgentsBillType] = [SPMT_HSNSACCodes8].[BillType]
    AND [SPMT_AirTicket].[AgentsHSNSACCode] = [SPMT_HSNSACCodes8].[HSNSACCode]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN9]
    ON [SPMT_AirTicket].[AgencyIsgecGSTIN] = [SPMT_IsgecGSTIN9].[GSTID]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN10]
    ON [SPMT_AirTicket].[AgentsIsgecGSTIN] = [SPMT_IsgecGSTIN10].[GSTID]
  LEFT OUTER JOIN [SPMT_PaymentAdvice] AS [SPMT_PaymentAdvice11]
    ON [SPMT_AirTicket].[AdviceNo] = [SPMT_PaymentAdvice11].[AdviceNo]
  LEFT OUTER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes12]
    ON [SPMT_AirTicket].[TranTypeID] = [SPMT_TranTypes12].[TranTypeID]
  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN13]
    ON [SPMT_AirTicket].[AgencyBPID] = [VR_BPGSTIN13].[BPID]
    AND [SPMT_AirTicket].[AgencyGSTIN] = [VR_BPGSTIN13].[GSTIN]
  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN14]
    ON [SPMT_AirTicket].[AgentsBPID] = [VR_BPGSTIN14].[BPID]
    AND [SPMT_AirTicket].[AgentsGSTIN] = [VR_BPGSTIN14].[GSTIN]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner15]
    ON [SPMT_AirTicket].[AgencyBPID] = [VR_BusinessPartner15].[BPID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner16]
    ON [SPMT_AirTicket].[AgentsBPID] = [VR_BusinessPartner16].[BPID]
  LEFT OUTER JOIN [SPMT_AirTicketStatus] AS [SPMT_AirTicketStatus17]
    ON [SPMT_AirTicket].[StatusID] = [SPMT_AirTicketStatus17].[StatusID]
  LEFT OUTER JOIN [SPMT_SupplierBill] AS [SPMT_SupplierBill18]
    ON [SPMT_AirTicket].[AgentsIRNo] = [SPMT_SupplierBill18].[IRNo]
  LEFT OUTER JOIN [SPMT_SupplierBill] AS [SPMT_SupplierBill19]
    ON [SPMT_AirTicket].[AgencyIRNo] = [SPMT_SupplierBill19].[IRNo]
  WHERE
  [SPMT_AirTicket].[SerialNo] = @SerialNo
GO
