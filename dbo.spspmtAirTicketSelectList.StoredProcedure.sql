USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtAirTicketSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [SPMT_AirTicket].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [SPMT_AirTicket].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'TranTypeID' THEN [SPMT_AirTicket].[TranTypeID] END,
     CASE @OrderBy WHEN 'TranTypeID DESC' THEN [SPMT_AirTicket].[TranTypeID] END DESC,
     CASE @OrderBy WHEN 'AgentsIsgecGSTIN' THEN [SPMT_AirTicket].[AgentsIsgecGSTIN] END,
     CASE @OrderBy WHEN 'AgentsIsgecGSTIN DESC' THEN [SPMT_AirTicket].[AgentsIsgecGSTIN] END DESC,
     CASE @OrderBy WHEN 'AgentsStateID' THEN [SPMT_AirTicket].[AgentsStateID] END,
     CASE @OrderBy WHEN 'AgentsStateID DESC' THEN [SPMT_AirTicket].[AgentsStateID] END DESC,
     CASE @OrderBy WHEN 'AgentsBillNumber' THEN [SPMT_AirTicket].[AgentsBillNumber] END,
     CASE @OrderBy WHEN 'AgentsBillNumber DESC' THEN [SPMT_AirTicket].[AgentsBillNumber] END DESC,
     CASE @OrderBy WHEN 'AgentsBillDate' THEN [SPMT_AirTicket].[AgentsBillDate] END,
     CASE @OrderBy WHEN 'AgentsBillDate DESC' THEN [SPMT_AirTicket].[AgentsBillDate] END DESC,
     CASE @OrderBy WHEN 'AgentsItemName' THEN [SPMT_AirTicket].[AgentsItemName] END,
     CASE @OrderBy WHEN 'AgentsItemName DESC' THEN [SPMT_AirTicket].[AgentsItemName] END DESC,
     CASE @OrderBy WHEN 'AgentsBPID' THEN [SPMT_AirTicket].[AgentsBPID] END,
     CASE @OrderBy WHEN 'AgentsBPID DESC' THEN [SPMT_AirTicket].[AgentsBPID] END DESC,
     CASE @OrderBy WHEN 'AgentsGSTIN' THEN [SPMT_AirTicket].[AgentsGSTIN] END,
     CASE @OrderBy WHEN 'AgentsGSTIN DESC' THEN [SPMT_AirTicket].[AgentsGSTIN] END DESC,
     CASE @OrderBy WHEN 'AgentsName' THEN [SPMT_AirTicket].[AgentsName] END,
     CASE @OrderBy WHEN 'AgentsName DESC' THEN [SPMT_AirTicket].[AgentsName] END DESC,
     CASE @OrderBy WHEN 'AgentsGSTINNumber' THEN [SPMT_AirTicket].[AgentsGSTINNumber] END,
     CASE @OrderBy WHEN 'AgentsGSTINNumber DESC' THEN [SPMT_AirTicket].[AgentsGSTINNumber] END DESC,
     CASE @OrderBy WHEN 'AgentsBillType' THEN [SPMT_AirTicket].[AgentsBillType] END,
     CASE @OrderBy WHEN 'AgentsBillType DESC' THEN [SPMT_AirTicket].[AgentsBillType] END DESC,
     CASE @OrderBy WHEN 'AgentsHSNSACCode' THEN [SPMT_AirTicket].[AgentsHSNSACCode] END,
     CASE @OrderBy WHEN 'AgentsHSNSACCode DESC' THEN [SPMT_AirTicket].[AgentsHSNSACCode] END DESC,
     CASE @OrderBy WHEN 'AgentsBasicValue' THEN [SPMT_AirTicket].[AgentsBasicValue] END,
     CASE @OrderBy WHEN 'AgentsBasicValue DESC' THEN [SPMT_AirTicket].[AgentsBasicValue] END DESC,
     CASE @OrderBy WHEN 'AgentsIGSTRate' THEN [SPMT_AirTicket].[AgentsIGSTRate] END,
     CASE @OrderBy WHEN 'AgentsIGSTRate DESC' THEN [SPMT_AirTicket].[AgentsIGSTRate] END DESC,
     CASE @OrderBy WHEN 'AgentsIGSTAmount' THEN [SPMT_AirTicket].[AgentsIGSTAmount] END,
     CASE @OrderBy WHEN 'AgentsIGSTAmount DESC' THEN [SPMT_AirTicket].[AgentsIGSTAmount] END DESC,
     CASE @OrderBy WHEN 'AgentsSGSTRate' THEN [SPMT_AirTicket].[AgentsSGSTRate] END,
     CASE @OrderBy WHEN 'AgentsSGSTRate DESC' THEN [SPMT_AirTicket].[AgentsSGSTRate] END DESC,
     CASE @OrderBy WHEN 'AgentsSGSTAmount' THEN [SPMT_AirTicket].[AgentsSGSTAmount] END,
     CASE @OrderBy WHEN 'AgentsSGSTAmount DESC' THEN [SPMT_AirTicket].[AgentsSGSTAmount] END DESC,
     CASE @OrderBy WHEN 'AgentsCGSTRate' THEN [SPMT_AirTicket].[AgentsCGSTRate] END,
     CASE @OrderBy WHEN 'AgentsCGSTRate DESC' THEN [SPMT_AirTicket].[AgentsCGSTRate] END DESC,
     CASE @OrderBy WHEN 'AgentsCGSTAmount' THEN [SPMT_AirTicket].[AgentsCGSTAmount] END,
     CASE @OrderBy WHEN 'AgentsCGSTAmount DESC' THEN [SPMT_AirTicket].[AgentsCGSTAmount] END DESC,
     CASE @OrderBy WHEN 'AgentsCessRate' THEN [SPMT_AirTicket].[AgentsCessRate] END,
     CASE @OrderBy WHEN 'AgentsCessRate DESC' THEN [SPMT_AirTicket].[AgentsCessRate] END DESC,
     CASE @OrderBy WHEN 'AgentsCessAmount' THEN [SPMT_AirTicket].[AgentsCessAmount] END,
     CASE @OrderBy WHEN 'AgentsCessAmount DESC' THEN [SPMT_AirTicket].[AgentsCessAmount] END DESC,
     CASE @OrderBy WHEN 'AgentsTotalGST' THEN [SPMT_AirTicket].[AgentsTotalGST] END,
     CASE @OrderBy WHEN 'AgentsTotalGST DESC' THEN [SPMT_AirTicket].[AgentsTotalGST] END DESC,
     CASE @OrderBy WHEN 'AgentsTotalAmount' THEN [SPMT_AirTicket].[AgentsTotalAmount] END,
     CASE @OrderBy WHEN 'AgentsTotalAmount DESC' THEN [SPMT_AirTicket].[AgentsTotalAmount] END DESC,
     CASE @OrderBy WHEN 'AgentsRCMApplicable' THEN [SPMT_AirTicket].[AgentsRCMApplicable] END,
     CASE @OrderBy WHEN 'AgentsRCMApplicable DESC' THEN [SPMT_AirTicket].[AgentsRCMApplicable] END DESC,
     CASE @OrderBy WHEN 'AgencyIsgecGSTIN' THEN [SPMT_AirTicket].[AgencyIsgecGSTIN] END,
     CASE @OrderBy WHEN 'AgencyIsgecGSTIN DESC' THEN [SPMT_AirTicket].[AgencyIsgecGSTIN] END DESC,
     CASE @OrderBy WHEN 'AgencyStateID' THEN [SPMT_AirTicket].[AgencyStateID] END,
     CASE @OrderBy WHEN 'AgencyStateID DESC' THEN [SPMT_AirTicket].[AgencyStateID] END DESC,
     CASE @OrderBy WHEN 'AgencyBillNumber' THEN [SPMT_AirTicket].[AgencyBillNumber] END,
     CASE @OrderBy WHEN 'AgencyBillNumber DESC' THEN [SPMT_AirTicket].[AgencyBillNumber] END DESC,
     CASE @OrderBy WHEN 'AgencyBillDate' THEN [SPMT_AirTicket].[AgencyBillDate] END,
     CASE @OrderBy WHEN 'AgencyBillDate DESC' THEN [SPMT_AirTicket].[AgencyBillDate] END DESC,
     CASE @OrderBy WHEN 'AgencyItemName' THEN [SPMT_AirTicket].[AgencyItemName] END,
     CASE @OrderBy WHEN 'AgencyItemName DESC' THEN [SPMT_AirTicket].[AgencyItemName] END DESC,
     CASE @OrderBy WHEN 'AgencyBPID' THEN [SPMT_AirTicket].[AgencyBPID] END,
     CASE @OrderBy WHEN 'AgencyBPID DESC' THEN [SPMT_AirTicket].[AgencyBPID] END DESC,
     CASE @OrderBy WHEN 'AgencyGSTIN' THEN [SPMT_AirTicket].[AgencyGSTIN] END,
     CASE @OrderBy WHEN 'AgencyGSTIN DESC' THEN [SPMT_AirTicket].[AgencyGSTIN] END DESC,
     CASE @OrderBy WHEN 'AgencyName' THEN [SPMT_AirTicket].[AgencyName] END,
     CASE @OrderBy WHEN 'AgencyName DESC' THEN [SPMT_AirTicket].[AgencyName] END DESC,
     CASE @OrderBy WHEN 'AgencyGSTINNumber' THEN [SPMT_AirTicket].[AgencyGSTINNumber] END,
     CASE @OrderBy WHEN 'AgencyGSTINNumber DESC' THEN [SPMT_AirTicket].[AgencyGSTINNumber] END DESC,
     CASE @OrderBy WHEN 'AgencyBillType' THEN [SPMT_AirTicket].[AgencyBillType] END,
     CASE @OrderBy WHEN 'AgencyBillType DESC' THEN [SPMT_AirTicket].[AgencyBillType] END DESC,
     CASE @OrderBy WHEN 'AgencyHSNSACCode' THEN [SPMT_AirTicket].[AgencyHSNSACCode] END,
     CASE @OrderBy WHEN 'AgencyHSNSACCode DESC' THEN [SPMT_AirTicket].[AgencyHSNSACCode] END DESC,
     CASE @OrderBy WHEN 'AgencyBasicValue' THEN [SPMT_AirTicket].[AgencyBasicValue] END,
     CASE @OrderBy WHEN 'AgencyBasicValue DESC' THEN [SPMT_AirTicket].[AgencyBasicValue] END DESC,
     CASE @OrderBy WHEN 'AgencyIGSTRate' THEN [SPMT_AirTicket].[AgencyIGSTRate] END,
     CASE @OrderBy WHEN 'AgencyIGSTRate DESC' THEN [SPMT_AirTicket].[AgencyIGSTRate] END DESC,
     CASE @OrderBy WHEN 'AgencyIGSTAmount' THEN [SPMT_AirTicket].[AgencyIGSTAmount] END,
     CASE @OrderBy WHEN 'AgencyIGSTAmount DESC' THEN [SPMT_AirTicket].[AgencyIGSTAmount] END DESC,
     CASE @OrderBy WHEN 'AgencySGSTRate' THEN [SPMT_AirTicket].[AgencySGSTRate] END,
     CASE @OrderBy WHEN 'AgencySGSTRate DESC' THEN [SPMT_AirTicket].[AgencySGSTRate] END DESC,
     CASE @OrderBy WHEN 'AgencySGSTAmount' THEN [SPMT_AirTicket].[AgencySGSTAmount] END,
     CASE @OrderBy WHEN 'AgencySGSTAmount DESC' THEN [SPMT_AirTicket].[AgencySGSTAmount] END DESC,
     CASE @OrderBy WHEN 'AgencyCGSTRate' THEN [SPMT_AirTicket].[AgencyCGSTRate] END,
     CASE @OrderBy WHEN 'AgencyCGSTRate DESC' THEN [SPMT_AirTicket].[AgencyCGSTRate] END DESC,
     CASE @OrderBy WHEN 'AgencyCGSTAmount' THEN [SPMT_AirTicket].[AgencyCGSTAmount] END,
     CASE @OrderBy WHEN 'AgencyCGSTAmount DESC' THEN [SPMT_AirTicket].[AgencyCGSTAmount] END DESC,
     CASE @OrderBy WHEN 'AgencyCessRate' THEN [SPMT_AirTicket].[AgencyCessRate] END,
     CASE @OrderBy WHEN 'AgencyCessRate DESC' THEN [SPMT_AirTicket].[AgencyCessRate] END DESC,
     CASE @OrderBy WHEN 'AgencyCessAmount' THEN [SPMT_AirTicket].[AgencyCessAmount] END,
     CASE @OrderBy WHEN 'AgencyCessAmount DESC' THEN [SPMT_AirTicket].[AgencyCessAmount] END DESC,
     CASE @OrderBy WHEN 'AgencyTotalGST' THEN [SPMT_AirTicket].[AgencyTotalGST] END,
     CASE @OrderBy WHEN 'AgencyTotalGST DESC' THEN [SPMT_AirTicket].[AgencyTotalGST] END DESC,
     CASE @OrderBy WHEN 'AgencyTotalAmount' THEN [SPMT_AirTicket].[AgencyTotalAmount] END,
     CASE @OrderBy WHEN 'AgencyTotalAmount DESC' THEN [SPMT_AirTicket].[AgencyTotalAmount] END DESC,
     CASE @OrderBy WHEN 'AgencyRCMApplicable' THEN [SPMT_AirTicket].[AgencyRCMApplicable] END,
     CASE @OrderBy WHEN 'AgencyRCMApplicable DESC' THEN [SPMT_AirTicket].[AgencyRCMApplicable] END DESC,
     CASE @OrderBy WHEN 'NonGST1TaxRate' THEN [SPMT_AirTicket].[NonGST1TaxRate] END,
     CASE @OrderBy WHEN 'NonGST1TaxRate DESC' THEN [SPMT_AirTicket].[NonGST1TaxRate] END DESC,
     CASE @OrderBy WHEN 'NonGST1TaxAmount' THEN [SPMT_AirTicket].[NonGST1TaxAmount] END,
     CASE @OrderBy WHEN 'NonGST1TaxAmount DESC' THEN [SPMT_AirTicket].[NonGST1TaxAmount] END DESC,
     CASE @OrderBy WHEN 'NonGST2TaxRate' THEN [SPMT_AirTicket].[NonGST2TaxRate] END,
     CASE @OrderBy WHEN 'NonGST2TaxRate DESC' THEN [SPMT_AirTicket].[NonGST2TaxRate] END DESC,
     CASE @OrderBy WHEN 'NonGST2TaxAmount' THEN [SPMT_AirTicket].[NonGST2TaxAmount] END,
     CASE @OrderBy WHEN 'NonGST2TaxAmount DESC' THEN [SPMT_AirTicket].[NonGST2TaxAmount] END DESC,
     CASE @OrderBy WHEN 'TotalPayableToAgent' THEN [SPMT_AirTicket].[TotalPayableToAgent] END,
     CASE @OrderBy WHEN 'TotalPayableToAgent DESC' THEN [SPMT_AirTicket].[TotalPayableToAgent] END DESC,
     CASE @OrderBy WHEN 'PaxName' THEN [SPMT_AirTicket].[PaxName] END,
     CASE @OrderBy WHEN 'PaxName DESC' THEN [SPMT_AirTicket].[PaxName] END DESC,
     CASE @OrderBy WHEN 'Sector' THEN [SPMT_AirTicket].[Sector] END,
     CASE @OrderBy WHEN 'Sector DESC' THEN [SPMT_AirTicket].[Sector] END DESC,
     CASE @OrderBy WHEN 'TravelDate' THEN [SPMT_AirTicket].[TravelDate] END,
     CASE @OrderBy WHEN 'TravelDate DESC' THEN [SPMT_AirTicket].[TravelDate] END DESC,
     CASE @OrderBy WHEN 'ReferrenceNumber' THEN [SPMT_AirTicket].[ReferrenceNumber] END,
     CASE @OrderBy WHEN 'ReferrenceNumber DESC' THEN [SPMT_AirTicket].[ReferrenceNumber] END DESC,
     CASE @OrderBy WHEN 'EmployeeID' THEN [SPMT_AirTicket].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [SPMT_AirTicket].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [SPMT_AirTicket].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [SPMT_AirTicket].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ISGECUnit' THEN [SPMT_AirTicket].[ISGECUnit] END,
     CASE @OrderBy WHEN 'ISGECUnit DESC' THEN [SPMT_AirTicket].[ISGECUnit] END DESC,
     CASE @OrderBy WHEN 'Geography' THEN [SPMT_AirTicket].[Geography] END,
     CASE @OrderBy WHEN 'Geography DESC' THEN [SPMT_AirTicket].[Geography] END DESC,
     CASE @OrderBy WHEN 'Data1Flag' THEN [SPMT_AirTicket].[Data1Flag] END,
     CASE @OrderBy WHEN 'Data1Flag DESC' THEN [SPMT_AirTicket].[Data1Flag] END DESC,
     CASE @OrderBy WHEN 'Data2Flag' THEN [SPMT_AirTicket].[Data2Flag] END,
     CASE @OrderBy WHEN 'Data2Flag DESC' THEN [SPMT_AirTicket].[Data2Flag] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [SPMT_AirTicket].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [SPMT_AirTicket].[StatusID] END DESC,
     CASE @OrderBy WHEN 'AdviceNo' THEN [SPMT_AirTicket].[AdviceNo] END,
     CASE @OrderBy WHEN 'AdviceNo DESC' THEN [SPMT_AirTicket].[AdviceNo] END DESC,
     CASE @OrderBy WHEN 'AgentsIRNo' THEN [SPMT_AirTicket].[AgentsIRNo] END,
     CASE @OrderBy WHEN 'AgentsIRNo DESC' THEN [SPMT_AirTicket].[AgentsIRNo] END DESC,
     CASE @OrderBy WHEN 'AgencyIRNo' THEN [SPMT_AirTicket].[AgencyIRNo] END,
     CASE @OrderBy WHEN 'AgencyIRNo DESC' THEN [SPMT_AirTicket].[AgencyIRNo] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_BillTypes3_Description' THEN [SPMT_BillTypes3].[Description] END,
     CASE @OrderBy WHEN 'SPMT_BillTypes3_Description DESC' THEN [SPMT_BillTypes3].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_BillTypes4_Description' THEN [SPMT_BillTypes4].[Description] END,
     CASE @OrderBy WHEN 'SPMT_BillTypes4_Description DESC' THEN [SPMT_BillTypes4].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPStates5_Description' THEN [SPMT_ERPStates5].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPStates5_Description DESC' THEN [SPMT_ERPStates5].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPStates6_Description' THEN [SPMT_ERPStates6].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPStates6_Description DESC' THEN [SPMT_ERPStates6].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes7_HSNSACCode' THEN [SPMT_HSNSACCodes7].[HSNSACCode] END,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes7_HSNSACCode DESC' THEN [SPMT_HSNSACCodes7].[HSNSACCode] END DESC,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes8_HSNSACCode' THEN [SPMT_HSNSACCodes8].[HSNSACCode] END,
     CASE @OrderBy WHEN 'SPMT_HSNSACCodes8_HSNSACCode DESC' THEN [SPMT_HSNSACCodes8].[HSNSACCode] END DESC,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN9_Description' THEN [SPMT_IsgecGSTIN9].[Description] END,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN9_Description DESC' THEN [SPMT_IsgecGSTIN9].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN10_Description' THEN [SPMT_IsgecGSTIN10].[Description] END,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN10_Description DESC' THEN [SPMT_IsgecGSTIN10].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_PaymentAdvice11_BPID' THEN [SPMT_PaymentAdvice11].[BPID] END,
     CASE @OrderBy WHEN 'SPMT_PaymentAdvice11_BPID DESC' THEN [SPMT_PaymentAdvice11].[BPID] END DESC,
     CASE @OrderBy WHEN 'SPMT_TranTypes12_Description' THEN [SPMT_TranTypes12].[Description] END,
     CASE @OrderBy WHEN 'SPMT_TranTypes12_Description DESC' THEN [SPMT_TranTypes12].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BPGSTIN13_Description' THEN [VR_BPGSTIN13].[Description] END,
     CASE @OrderBy WHEN 'VR_BPGSTIN13_Description DESC' THEN [VR_BPGSTIN13].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BPGSTIN14_Description' THEN [VR_BPGSTIN14].[Description] END,
     CASE @OrderBy WHEN 'VR_BPGSTIN14_Description DESC' THEN [VR_BPGSTIN14].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner15_BPName' THEN [VR_BusinessPartner15].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner15_BPName DESC' THEN [VR_BusinessPartner15].[BPName] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner16_BPName' THEN [VR_BusinessPartner16].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner16_BPName DESC' THEN [VR_BusinessPartner16].[BPName] END DESC,
     CASE @OrderBy WHEN 'SPMT_AirTicketStatus17_Descriptionn' THEN [SPMT_AirTicketStatus17].[Descriptionn] END,
     CASE @OrderBy WHEN 'SPMT_AirTicketStatus17_Descriptionn DESC' THEN [SPMT_AirTicketStatus17].[Descriptionn] END DESC,
     CASE @OrderBy WHEN 'SPMT_SupplierBill18_BillNumber' THEN [SPMT_SupplierBill18].[BillNumber] END,
     CASE @OrderBy WHEN 'SPMT_SupplierBill18_BillNumber DESC' THEN [SPMT_SupplierBill18].[BillNumber] END DESC,
     CASE @OrderBy WHEN 'SPMT_SupplierBill19_BillNumber' THEN [SPMT_SupplierBill19].[BillNumber] END,
     CASE @OrderBy WHEN 'SPMT_SupplierBill19_BillNumber DESC' THEN [SPMT_SupplierBill19].[BillNumber] END DESC 
  SET @RecordCount = @@RowCount
GO
