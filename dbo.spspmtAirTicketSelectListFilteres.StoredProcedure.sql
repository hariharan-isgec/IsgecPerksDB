USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtAirTicketSelectListFilteres]
  @Filter_TranTypeID NVarChar(3),
  @Filter_AgentsBPID NVarChar(9),
  @Filter_AgencyBPID NVarChar(9),
  @Filter_EmployeeID NVarChar(8),
  @Filter_ProjectID NVarChar(6),
  @Filter_ISGECUnit NVarChar(10),
  @Filter_Geography NVarChar(10),
  @Filter_StatusID Int,
  @Filter_AdviceNo Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_AirTicket].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_AirTicket] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[EmployeeID] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[ProjectID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgencyBillType] = [SPMT_BillTypes3].[BillType]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_BillTypes] AS [SPMT_BillTypes4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgentsBillType] = [SPMT_BillTypes4].[BillType]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates5]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgentsStateID] = [SPMT_ERPStates5].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates6]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgencyStateID] = [SPMT_ERPStates6].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes7]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgencyBillType] = [SPMT_HSNSACCodes7].[BillType]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_AirTicket].[AgencyHSNSACCode] = [SPMT_HSNSACCodes7].[HSNSACCode]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_HSNSACCodes] AS [SPMT_HSNSACCodes8]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgentsBillType] = [SPMT_HSNSACCodes8].[BillType]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_AirTicket].[AgentsHSNSACCode] = [SPMT_HSNSACCodes8].[HSNSACCode]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN9]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgencyIsgecGSTIN] = [SPMT_IsgecGSTIN9].[GSTID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN10]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgentsIsgecGSTIN] = [SPMT_IsgecGSTIN10].[GSTID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_PaymentAdvice] AS [SPMT_PaymentAdvice11]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AdviceNo] = [SPMT_PaymentAdvice11].[AdviceNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes12]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[TranTypeID] = [SPMT_TranTypes12].[TranTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN13]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgencyBPID] = [VR_BPGSTIN13].[BPID]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_AirTicket].[AgencyGSTIN] = [VR_BPGSTIN13].[GSTIN]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN14]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgentsBPID] = [VR_BPGSTIN14].[BPID]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_AirTicket].[AgentsGSTIN] = [VR_BPGSTIN14].[GSTIN]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner15]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgencyBPID] = [VR_BusinessPartner15].[BPID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner16]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgentsBPID] = [VR_BusinessPartner16].[BPID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_AirTicketStatus] AS [SPMT_AirTicketStatus17]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[StatusID] = [SPMT_AirTicketStatus17].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_SupplierBill] AS [SPMT_SupplierBill18]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgentsIRNo] = [SPMT_SupplierBill18].[IRNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_SupplierBill] AS [SPMT_SupplierBill19]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_AirTicket].[AgencyIRNo] = [SPMT_SupplierBill19].[IRNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_TranTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_AirTicket].[TranTypeID] = ''' + @Filter_TranTypeID + ''''
  IF (@Filter_AgentsBPID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_AirTicket].[AgentsBPID] = ''' + @Filter_AgentsBPID + ''''
  IF (@Filter_AgencyBPID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_AirTicket].[AgencyBPID] = ''' + @Filter_AgencyBPID + ''''
  IF (@Filter_EmployeeID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_AirTicket].[EmployeeID] = ''' + @Filter_EmployeeID + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_AirTicket].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_ISGECUnit > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_AirTicket].[ISGECUnit] = ''' + @Filter_ISGECUnit + ''''
  IF (@Filter_Geography > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_AirTicket].[Geography] = ''' + @Filter_Geography + ''''
  IF (@Filter_StatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SPMT_AirTicket].[StatusID] = ' + STR(@Filter_StatusID)
  IF (@Filter_AdviceNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [SPMT_AirTicket].[AdviceNo] = ' + STR(@Filter_AdviceNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[SPMT_AirTicket].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[SPMT_AirTicket].[SerialNo] DESC'
                        WHEN 'TranTypeID' THEN '[SPMT_AirTicket].[TranTypeID]'
                        WHEN 'TranTypeID DESC' THEN '[SPMT_AirTicket].[TranTypeID] DESC'
                        WHEN 'AgentsIsgecGSTIN' THEN '[SPMT_AirTicket].[AgentsIsgecGSTIN]'
                        WHEN 'AgentsIsgecGSTIN DESC' THEN '[SPMT_AirTicket].[AgentsIsgecGSTIN] DESC'
                        WHEN 'AgentsStateID' THEN '[SPMT_AirTicket].[AgentsStateID]'
                        WHEN 'AgentsStateID DESC' THEN '[SPMT_AirTicket].[AgentsStateID] DESC'
                        WHEN 'AgentsBillNumber' THEN '[SPMT_AirTicket].[AgentsBillNumber]'
                        WHEN 'AgentsBillNumber DESC' THEN '[SPMT_AirTicket].[AgentsBillNumber] DESC'
                        WHEN 'AgentsBillDate' THEN '[SPMT_AirTicket].[AgentsBillDate]'
                        WHEN 'AgentsBillDate DESC' THEN '[SPMT_AirTicket].[AgentsBillDate] DESC'
                        WHEN 'AgentsItemName' THEN '[SPMT_AirTicket].[AgentsItemName]'
                        WHEN 'AgentsItemName DESC' THEN '[SPMT_AirTicket].[AgentsItemName] DESC'
                        WHEN 'AgentsBPID' THEN '[SPMT_AirTicket].[AgentsBPID]'
                        WHEN 'AgentsBPID DESC' THEN '[SPMT_AirTicket].[AgentsBPID] DESC'
                        WHEN 'AgentsGSTIN' THEN '[SPMT_AirTicket].[AgentsGSTIN]'
                        WHEN 'AgentsGSTIN DESC' THEN '[SPMT_AirTicket].[AgentsGSTIN] DESC'
                        WHEN 'AgentsName' THEN '[SPMT_AirTicket].[AgentsName]'
                        WHEN 'AgentsName DESC' THEN '[SPMT_AirTicket].[AgentsName] DESC'
                        WHEN 'AgentsGSTINNumber' THEN '[SPMT_AirTicket].[AgentsGSTINNumber]'
                        WHEN 'AgentsGSTINNumber DESC' THEN '[SPMT_AirTicket].[AgentsGSTINNumber] DESC'
                        WHEN 'AgentsBillType' THEN '[SPMT_AirTicket].[AgentsBillType]'
                        WHEN 'AgentsBillType DESC' THEN '[SPMT_AirTicket].[AgentsBillType] DESC'
                        WHEN 'AgentsHSNSACCode' THEN '[SPMT_AirTicket].[AgentsHSNSACCode]'
                        WHEN 'AgentsHSNSACCode DESC' THEN '[SPMT_AirTicket].[AgentsHSNSACCode] DESC'
                        WHEN 'AgentsBasicValue' THEN '[SPMT_AirTicket].[AgentsBasicValue]'
                        WHEN 'AgentsBasicValue DESC' THEN '[SPMT_AirTicket].[AgentsBasicValue] DESC'
                        WHEN 'AgentsIGSTRate' THEN '[SPMT_AirTicket].[AgentsIGSTRate]'
                        WHEN 'AgentsIGSTRate DESC' THEN '[SPMT_AirTicket].[AgentsIGSTRate] DESC'
                        WHEN 'AgentsIGSTAmount' THEN '[SPMT_AirTicket].[AgentsIGSTAmount]'
                        WHEN 'AgentsIGSTAmount DESC' THEN '[SPMT_AirTicket].[AgentsIGSTAmount] DESC'
                        WHEN 'AgentsSGSTRate' THEN '[SPMT_AirTicket].[AgentsSGSTRate]'
                        WHEN 'AgentsSGSTRate DESC' THEN '[SPMT_AirTicket].[AgentsSGSTRate] DESC'
                        WHEN 'AgentsSGSTAmount' THEN '[SPMT_AirTicket].[AgentsSGSTAmount]'
                        WHEN 'AgentsSGSTAmount DESC' THEN '[SPMT_AirTicket].[AgentsSGSTAmount] DESC'
                        WHEN 'AgentsCGSTRate' THEN '[SPMT_AirTicket].[AgentsCGSTRate]'
                        WHEN 'AgentsCGSTRate DESC' THEN '[SPMT_AirTicket].[AgentsCGSTRate] DESC'
                        WHEN 'AgentsCGSTAmount' THEN '[SPMT_AirTicket].[AgentsCGSTAmount]'
                        WHEN 'AgentsCGSTAmount DESC' THEN '[SPMT_AirTicket].[AgentsCGSTAmount] DESC'
                        WHEN 'AgentsCessRate' THEN '[SPMT_AirTicket].[AgentsCessRate]'
                        WHEN 'AgentsCessRate DESC' THEN '[SPMT_AirTicket].[AgentsCessRate] DESC'
                        WHEN 'AgentsCessAmount' THEN '[SPMT_AirTicket].[AgentsCessAmount]'
                        WHEN 'AgentsCessAmount DESC' THEN '[SPMT_AirTicket].[AgentsCessAmount] DESC'
                        WHEN 'AgentsTotalGST' THEN '[SPMT_AirTicket].[AgentsTotalGST]'
                        WHEN 'AgentsTotalGST DESC' THEN '[SPMT_AirTicket].[AgentsTotalGST] DESC'
                        WHEN 'AgentsTotalAmount' THEN '[SPMT_AirTicket].[AgentsTotalAmount]'
                        WHEN 'AgentsTotalAmount DESC' THEN '[SPMT_AirTicket].[AgentsTotalAmount] DESC'
                        WHEN 'AgentsRCMApplicable' THEN '[SPMT_AirTicket].[AgentsRCMApplicable]'
                        WHEN 'AgentsRCMApplicable DESC' THEN '[SPMT_AirTicket].[AgentsRCMApplicable] DESC'
                        WHEN 'AgencyIsgecGSTIN' THEN '[SPMT_AirTicket].[AgencyIsgecGSTIN]'
                        WHEN 'AgencyIsgecGSTIN DESC' THEN '[SPMT_AirTicket].[AgencyIsgecGSTIN] DESC'
                        WHEN 'AgencyStateID' THEN '[SPMT_AirTicket].[AgencyStateID]'
                        WHEN 'AgencyStateID DESC' THEN '[SPMT_AirTicket].[AgencyStateID] DESC'
                        WHEN 'AgencyBillNumber' THEN '[SPMT_AirTicket].[AgencyBillNumber]'
                        WHEN 'AgencyBillNumber DESC' THEN '[SPMT_AirTicket].[AgencyBillNumber] DESC'
                        WHEN 'AgencyBillDate' THEN '[SPMT_AirTicket].[AgencyBillDate]'
                        WHEN 'AgencyBillDate DESC' THEN '[SPMT_AirTicket].[AgencyBillDate] DESC'
                        WHEN 'AgencyItemName' THEN '[SPMT_AirTicket].[AgencyItemName]'
                        WHEN 'AgencyItemName DESC' THEN '[SPMT_AirTicket].[AgencyItemName] DESC'
                        WHEN 'AgencyBPID' THEN '[SPMT_AirTicket].[AgencyBPID]'
                        WHEN 'AgencyBPID DESC' THEN '[SPMT_AirTicket].[AgencyBPID] DESC'
                        WHEN 'AgencyGSTIN' THEN '[SPMT_AirTicket].[AgencyGSTIN]'
                        WHEN 'AgencyGSTIN DESC' THEN '[SPMT_AirTicket].[AgencyGSTIN] DESC'
                        WHEN 'AgencyName' THEN '[SPMT_AirTicket].[AgencyName]'
                        WHEN 'AgencyName DESC' THEN '[SPMT_AirTicket].[AgencyName] DESC'
                        WHEN 'AgencyGSTINNumber' THEN '[SPMT_AirTicket].[AgencyGSTINNumber]'
                        WHEN 'AgencyGSTINNumber DESC' THEN '[SPMT_AirTicket].[AgencyGSTINNumber] DESC'
                        WHEN 'AgencyBillType' THEN '[SPMT_AirTicket].[AgencyBillType]'
                        WHEN 'AgencyBillType DESC' THEN '[SPMT_AirTicket].[AgencyBillType] DESC'
                        WHEN 'AgencyHSNSACCode' THEN '[SPMT_AirTicket].[AgencyHSNSACCode]'
                        WHEN 'AgencyHSNSACCode DESC' THEN '[SPMT_AirTicket].[AgencyHSNSACCode] DESC'
                        WHEN 'AgencyBasicValue' THEN '[SPMT_AirTicket].[AgencyBasicValue]'
                        WHEN 'AgencyBasicValue DESC' THEN '[SPMT_AirTicket].[AgencyBasicValue] DESC'
                        WHEN 'AgencyIGSTRate' THEN '[SPMT_AirTicket].[AgencyIGSTRate]'
                        WHEN 'AgencyIGSTRate DESC' THEN '[SPMT_AirTicket].[AgencyIGSTRate] DESC'
                        WHEN 'AgencyIGSTAmount' THEN '[SPMT_AirTicket].[AgencyIGSTAmount]'
                        WHEN 'AgencyIGSTAmount DESC' THEN '[SPMT_AirTicket].[AgencyIGSTAmount] DESC'
                        WHEN 'AgencySGSTRate' THEN '[SPMT_AirTicket].[AgencySGSTRate]'
                        WHEN 'AgencySGSTRate DESC' THEN '[SPMT_AirTicket].[AgencySGSTRate] DESC'
                        WHEN 'AgencySGSTAmount' THEN '[SPMT_AirTicket].[AgencySGSTAmount]'
                        WHEN 'AgencySGSTAmount DESC' THEN '[SPMT_AirTicket].[AgencySGSTAmount] DESC'
                        WHEN 'AgencyCGSTRate' THEN '[SPMT_AirTicket].[AgencyCGSTRate]'
                        WHEN 'AgencyCGSTRate DESC' THEN '[SPMT_AirTicket].[AgencyCGSTRate] DESC'
                        WHEN 'AgencyCGSTAmount' THEN '[SPMT_AirTicket].[AgencyCGSTAmount]'
                        WHEN 'AgencyCGSTAmount DESC' THEN '[SPMT_AirTicket].[AgencyCGSTAmount] DESC'
                        WHEN 'AgencyCessRate' THEN '[SPMT_AirTicket].[AgencyCessRate]'
                        WHEN 'AgencyCessRate DESC' THEN '[SPMT_AirTicket].[AgencyCessRate] DESC'
                        WHEN 'AgencyCessAmount' THEN '[SPMT_AirTicket].[AgencyCessAmount]'
                        WHEN 'AgencyCessAmount DESC' THEN '[SPMT_AirTicket].[AgencyCessAmount] DESC'
                        WHEN 'AgencyTotalGST' THEN '[SPMT_AirTicket].[AgencyTotalGST]'
                        WHEN 'AgencyTotalGST DESC' THEN '[SPMT_AirTicket].[AgencyTotalGST] DESC'
                        WHEN 'AgencyTotalAmount' THEN '[SPMT_AirTicket].[AgencyTotalAmount]'
                        WHEN 'AgencyTotalAmount DESC' THEN '[SPMT_AirTicket].[AgencyTotalAmount] DESC'
                        WHEN 'AgencyRCMApplicable' THEN '[SPMT_AirTicket].[AgencyRCMApplicable]'
                        WHEN 'AgencyRCMApplicable DESC' THEN '[SPMT_AirTicket].[AgencyRCMApplicable] DESC'
                        WHEN 'NonGST1TaxRate' THEN '[SPMT_AirTicket].[NonGST1TaxRate]'
                        WHEN 'NonGST1TaxRate DESC' THEN '[SPMT_AirTicket].[NonGST1TaxRate] DESC'
                        WHEN 'NonGST1TaxAmount' THEN '[SPMT_AirTicket].[NonGST1TaxAmount]'
                        WHEN 'NonGST1TaxAmount DESC' THEN '[SPMT_AirTicket].[NonGST1TaxAmount] DESC'
                        WHEN 'NonGST2TaxRate' THEN '[SPMT_AirTicket].[NonGST2TaxRate]'
                        WHEN 'NonGST2TaxRate DESC' THEN '[SPMT_AirTicket].[NonGST2TaxRate] DESC'
                        WHEN 'NonGST2TaxAmount' THEN '[SPMT_AirTicket].[NonGST2TaxAmount]'
                        WHEN 'NonGST2TaxAmount DESC' THEN '[SPMT_AirTicket].[NonGST2TaxAmount] DESC'
                        WHEN 'TotalPayableToAgent' THEN '[SPMT_AirTicket].[TotalPayableToAgent]'
                        WHEN 'TotalPayableToAgent DESC' THEN '[SPMT_AirTicket].[TotalPayableToAgent] DESC'
                        WHEN 'PaxName' THEN '[SPMT_AirTicket].[PaxName]'
                        WHEN 'PaxName DESC' THEN '[SPMT_AirTicket].[PaxName] DESC'
                        WHEN 'Sector' THEN '[SPMT_AirTicket].[Sector]'
                        WHEN 'Sector DESC' THEN '[SPMT_AirTicket].[Sector] DESC'
                        WHEN 'TravelDate' THEN '[SPMT_AirTicket].[TravelDate]'
                        WHEN 'TravelDate DESC' THEN '[SPMT_AirTicket].[TravelDate] DESC'
                        WHEN 'ReferrenceNumber' THEN '[SPMT_AirTicket].[ReferrenceNumber]'
                        WHEN 'ReferrenceNumber DESC' THEN '[SPMT_AirTicket].[ReferrenceNumber] DESC'
                        WHEN 'EmployeeID' THEN '[SPMT_AirTicket].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[SPMT_AirTicket].[EmployeeID] DESC'
                        WHEN 'ProjectID' THEN '[SPMT_AirTicket].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[SPMT_AirTicket].[ProjectID] DESC'
                        WHEN 'ISGECUnit' THEN '[SPMT_AirTicket].[ISGECUnit]'
                        WHEN 'ISGECUnit DESC' THEN '[SPMT_AirTicket].[ISGECUnit] DESC'
                        WHEN 'Geography' THEN '[SPMT_AirTicket].[Geography]'
                        WHEN 'Geography DESC' THEN '[SPMT_AirTicket].[Geography] DESC'
                        WHEN 'Data1Flag' THEN '[SPMT_AirTicket].[Data1Flag]'
                        WHEN 'Data1Flag DESC' THEN '[SPMT_AirTicket].[Data1Flag] DESC'
                        WHEN 'Data2Flag' THEN '[SPMT_AirTicket].[Data2Flag]'
                        WHEN 'Data2Flag DESC' THEN '[SPMT_AirTicket].[Data2Flag] DESC'
                        WHEN 'StatusID' THEN '[SPMT_AirTicket].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[SPMT_AirTicket].[StatusID] DESC'
                        WHEN 'AdviceNo' THEN '[SPMT_AirTicket].[AdviceNo]'
                        WHEN 'AdviceNo DESC' THEN '[SPMT_AirTicket].[AdviceNo] DESC'
                        WHEN 'AgentsIRNo' THEN '[SPMT_AirTicket].[AgentsIRNo]'
                        WHEN 'AgentsIRNo DESC' THEN '[SPMT_AirTicket].[AgentsIRNo] DESC'
                        WHEN 'AgencyIRNo' THEN '[SPMT_AirTicket].[AgencyIRNo]'
                        WHEN 'AgencyIRNo DESC' THEN '[SPMT_AirTicket].[AgencyIRNo] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects2].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        WHEN 'SPMT_BillTypes3_Description' THEN '[SPMT_BillTypes3].[Description]'
                        WHEN 'SPMT_BillTypes3_Description DESC' THEN '[SPMT_BillTypes3].[Description] DESC'
                        WHEN 'SPMT_BillTypes4_Description' THEN '[SPMT_BillTypes4].[Description]'
                        WHEN 'SPMT_BillTypes4_Description DESC' THEN '[SPMT_BillTypes4].[Description] DESC'
                        WHEN 'SPMT_ERPStates5_Description' THEN '[SPMT_ERPStates5].[Description]'
                        WHEN 'SPMT_ERPStates5_Description DESC' THEN '[SPMT_ERPStates5].[Description] DESC'
                        WHEN 'SPMT_ERPStates6_Description' THEN '[SPMT_ERPStates6].[Description]'
                        WHEN 'SPMT_ERPStates6_Description DESC' THEN '[SPMT_ERPStates6].[Description] DESC'
                        WHEN 'SPMT_HSNSACCodes7_HSNSACCode' THEN '[SPMT_HSNSACCodes7].[HSNSACCode]'
                        WHEN 'SPMT_HSNSACCodes7_HSNSACCode DESC' THEN '[SPMT_HSNSACCodes7].[HSNSACCode] DESC'
                        WHEN 'SPMT_HSNSACCodes8_HSNSACCode' THEN '[SPMT_HSNSACCodes8].[HSNSACCode]'
                        WHEN 'SPMT_HSNSACCodes8_HSNSACCode DESC' THEN '[SPMT_HSNSACCodes8].[HSNSACCode] DESC'
                        WHEN 'SPMT_IsgecGSTIN9_Description' THEN '[SPMT_IsgecGSTIN9].[Description]'
                        WHEN 'SPMT_IsgecGSTIN9_Description DESC' THEN '[SPMT_IsgecGSTIN9].[Description] DESC'
                        WHEN 'SPMT_IsgecGSTIN10_Description' THEN '[SPMT_IsgecGSTIN10].[Description]'
                        WHEN 'SPMT_IsgecGSTIN10_Description DESC' THEN '[SPMT_IsgecGSTIN10].[Description] DESC'
                        WHEN 'SPMT_PaymentAdvice11_BPID' THEN '[SPMT_PaymentAdvice11].[BPID]'
                        WHEN 'SPMT_PaymentAdvice11_BPID DESC' THEN '[SPMT_PaymentAdvice11].[BPID] DESC'
                        WHEN 'SPMT_TranTypes12_Description' THEN '[SPMT_TranTypes12].[Description]'
                        WHEN 'SPMT_TranTypes12_Description DESC' THEN '[SPMT_TranTypes12].[Description] DESC'
                        WHEN 'VR_BPGSTIN13_Description' THEN '[VR_BPGSTIN13].[Description]'
                        WHEN 'VR_BPGSTIN13_Description DESC' THEN '[VR_BPGSTIN13].[Description] DESC'
                        WHEN 'VR_BPGSTIN14_Description' THEN '[VR_BPGSTIN14].[Description]'
                        WHEN 'VR_BPGSTIN14_Description DESC' THEN '[VR_BPGSTIN14].[Description] DESC'
                        WHEN 'VR_BusinessPartner15_BPName' THEN '[VR_BusinessPartner15].[BPName]'
                        WHEN 'VR_BusinessPartner15_BPName DESC' THEN '[VR_BusinessPartner15].[BPName] DESC'
                        WHEN 'VR_BusinessPartner16_BPName' THEN '[VR_BusinessPartner16].[BPName]'
                        WHEN 'VR_BusinessPartner16_BPName DESC' THEN '[VR_BusinessPartner16].[BPName] DESC'
                        WHEN 'SPMT_AirTicketStatus17_Descriptionn' THEN '[SPMT_AirTicketStatus17].[Descriptionn]'
                        WHEN 'SPMT_AirTicketStatus17_Descriptionn DESC' THEN '[SPMT_AirTicketStatus17].[Descriptionn] DESC'
                        WHEN 'SPMT_SupplierBill18_BillNumber' THEN '[SPMT_SupplierBill18].[BillNumber]'
                        WHEN 'SPMT_SupplierBill18_BillNumber DESC' THEN '[SPMT_SupplierBill18].[BillNumber] DESC'
                        WHEN 'SPMT_SupplierBill19_BillNumber' THEN '[SPMT_SupplierBill19].[BillNumber]'
                        WHEN 'SPMT_SupplierBill19_BillNumber DESC' THEN '[SPMT_SupplierBill19].[BillNumber] DESC'
                        ELSE '[SPMT_AirTicket].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
      INNER JOIN #PageIndex
          ON [SPMT_AirTicket].[SerialNo] = #PageIndex.SerialNo
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
