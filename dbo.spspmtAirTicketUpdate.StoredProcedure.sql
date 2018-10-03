USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtAirTicketUpdate]
  @Original_SerialNo Int, 
  @TranTypeID NVarChar(3),
  @AgentsIsgecGSTIN Int,
  @AgentsStateID NVarChar(2),
  @AgentsBillNumber NVarChar(50),
  @AgentsBillDate DateTime,
  @AgentsItemName NVarChar(50),
  @AgentsBPID NVarChar(9),
  @AgentsGSTIN Int,
  @AgentsName NVarChar(50),
  @AgentsGSTINNumber NVarChar(50),
  @AgentsBillType Int,
  @AgentsHSNSACCode NVarChar(20),
  @AgentsBasicValue Decimal(18,2),
  @AgentsIGSTRate Decimal(18,2),
  @AgentsIGSTAmount Decimal(18,2),
  @AgentsSGSTRate Decimal(18,2),
  @AgentsSGSTAmount Decimal(18,2),
  @AgentsCGSTRate Decimal(18,2),
  @AgentsCGSTAmount Decimal(18,2),
  @AgentsCessRate Decimal(18,2),
  @AgentsCessAmount Decimal(18,2),
  @AgentsTotalGST Decimal(18,2),
  @AgentsTotalAmount Decimal(18,2),
  @AgentsRCMApplicable Bit,
  @AgencyIsgecGSTIN Int,
  @AgencyStateID NVarChar(2),
  @AgencyBillNumber NVarChar(50),
  @AgencyBillDate DateTime,
  @AgencyItemName NVarChar(50),
  @AgencyBPID NVarChar(9),
  @AgencyGSTIN Int,
  @AgencyName NVarChar(50),
  @AgencyGSTINNumber NVarChar(50),
  @AgencyBillType Int,
  @AgencyHSNSACCode NVarChar(20),
  @AgencyBasicValue Decimal(18,2),
  @AgencyIGSTRate Decimal(18,2),
  @AgencyIGSTAmount Decimal(18,2),
  @AgencySGSTRate Decimal(18,2),
  @AgencySGSTAmount Decimal(18,2),
  @AgencyCGSTRate Decimal(18,2),
  @AgencyCGSTAmount Decimal(18,2),
  @AgencyCessRate Decimal(18,2),
  @AgencyCessAmount Decimal(18,2),
  @AgencyTotalGST Decimal(18,2),
  @AgencyTotalAmount Decimal(18,2),
  @AgencyRCMApplicable Bit,
  @NonGST1TaxRate Decimal(18,2),
  @NonGST1TaxAmount Decimal(18,2),
  @NonGST2TaxRate Decimal(18,2),
  @NonGST2TaxAmount Decimal(18,2),
  @TotalPayableToAgent Decimal(18,2),
  @PaxName NVarChar(50),
  @Sector NVarChar(50),
  @TravelDate DateTime,
  @ReferrenceNumber NVarChar(50),
  @EmployeeID NVarChar(8),
  @ProjectID NVarChar(6),
  @ISGECUnit NVarChar(10),
  @Geography NVarChar(20),
  @Data1Flag Bit,
  @Data2Flag Bit,
  @StatusID Int,
  @AdviceNo Int,
  @AgentsIRNo Int,
  @AgencyIRNo Int,
  @UploadBatchNo NVarChar(50), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_AirTicket] SET 
   [TranTypeID] = @TranTypeID
  ,[AgentsIsgecGSTIN] = @AgentsIsgecGSTIN
  ,[AgentsStateID] = @AgentsStateID
  ,[AgentsBillNumber] = @AgentsBillNumber
  ,[AgentsBillDate] = @AgentsBillDate
  ,[AgentsItemName] = @AgentsItemName
  ,[AgentsBPID] = @AgentsBPID
  ,[AgentsGSTIN] = @AgentsGSTIN
  ,[AgentsName] = @AgentsName
  ,[AgentsGSTINNumber] = @AgentsGSTINNumber
  ,[AgentsBillType] = @AgentsBillType
  ,[AgentsHSNSACCode] = @AgentsHSNSACCode
  ,[AgentsBasicValue] = @AgentsBasicValue
  ,[AgentsIGSTRate] = @AgentsIGSTRate
  ,[AgentsIGSTAmount] = @AgentsIGSTAmount
  ,[AgentsSGSTRate] = @AgentsSGSTRate
  ,[AgentsSGSTAmount] = @AgentsSGSTAmount
  ,[AgentsCGSTRate] = @AgentsCGSTRate
  ,[AgentsCGSTAmount] = @AgentsCGSTAmount
  ,[AgentsCessRate] = @AgentsCessRate
  ,[AgentsCessAmount] = @AgentsCessAmount
  ,[AgentsTotalGST] = @AgentsTotalGST
  ,[AgentsTotalAmount] = @AgentsTotalAmount
  ,[AgentsRCMApplicable] = @AgentsRCMApplicable
  ,[AgencyIsgecGSTIN] = @AgencyIsgecGSTIN
  ,[AgencyStateID] = @AgencyStateID
  ,[AgencyBillNumber] = @AgencyBillNumber
  ,[AgencyBillDate] = @AgencyBillDate
  ,[AgencyItemName] = @AgencyItemName
  ,[AgencyBPID] = @AgencyBPID
  ,[AgencyGSTIN] = @AgencyGSTIN
  ,[AgencyName] = @AgencyName
  ,[AgencyGSTINNumber] = @AgencyGSTINNumber
  ,[AgencyBillType] = @AgencyBillType
  ,[AgencyHSNSACCode] = @AgencyHSNSACCode
  ,[AgencyBasicValue] = @AgencyBasicValue
  ,[AgencyIGSTRate] = @AgencyIGSTRate
  ,[AgencyIGSTAmount] = @AgencyIGSTAmount
  ,[AgencySGSTRate] = @AgencySGSTRate
  ,[AgencySGSTAmount] = @AgencySGSTAmount
  ,[AgencyCGSTRate] = @AgencyCGSTRate
  ,[AgencyCGSTAmount] = @AgencyCGSTAmount
  ,[AgencyCessRate] = @AgencyCessRate
  ,[AgencyCessAmount] = @AgencyCessAmount
  ,[AgencyTotalGST] = @AgencyTotalGST
  ,[AgencyTotalAmount] = @AgencyTotalAmount
  ,[AgencyRCMApplicable] = @AgencyRCMApplicable
  ,[NonGST1TaxRate] = @NonGST1TaxRate
  ,[NonGST1TaxAmount] = @NonGST1TaxAmount
  ,[NonGST2TaxRate] = @NonGST2TaxRate
  ,[NonGST2TaxAmount] = @NonGST2TaxAmount
  ,[TotalPayableToAgent] = @TotalPayableToAgent
  ,[PaxName] = @PaxName
  ,[Sector] = @Sector
  ,[TravelDate] = @TravelDate
  ,[ReferrenceNumber] = @ReferrenceNumber
  ,[EmployeeID] = @EmployeeID
  ,[ProjectID] = @ProjectID
  ,[ISGECUnit] = @ISGECUnit
  ,[Geography] = @Geography
  ,[Data1Flag] = @Data1Flag
  ,[Data2Flag] = @Data2Flag
  ,[StatusID] = @StatusID
  ,[AdviceNo] = @AdviceNo
  ,[AgentsIRNo] = @AgentsIRNo
  ,[AgencyIRNo] = @AgencyIRNo
  ,[UploadBatchNo]=@UploadBatchNo 
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
