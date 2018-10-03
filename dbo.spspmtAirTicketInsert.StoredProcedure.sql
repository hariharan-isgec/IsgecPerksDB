USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtAirTicketInsert]
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
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [SPMT_AirTicket]
  (
   [TranTypeID]
  ,[AgentsIsgecGSTIN]
  ,[AgentsStateID]
  ,[AgentsBillNumber]
  ,[AgentsBillDate]
  ,[AgentsItemName]
  ,[AgentsBPID]
  ,[AgentsGSTIN]
  ,[AgentsName]
  ,[AgentsGSTINNumber]
  ,[AgentsBillType]
  ,[AgentsHSNSACCode]
  ,[AgentsBasicValue]
  ,[AgentsIGSTRate]
  ,[AgentsIGSTAmount]
  ,[AgentsSGSTRate]
  ,[AgentsSGSTAmount]
  ,[AgentsCGSTRate]
  ,[AgentsCGSTAmount]
  ,[AgentsCessRate]
  ,[AgentsCessAmount]
  ,[AgentsTotalGST]
  ,[AgentsTotalAmount]
  ,[AgentsRCMApplicable]
  ,[AgencyIsgecGSTIN]
  ,[AgencyStateID]
  ,[AgencyBillNumber]
  ,[AgencyBillDate]
  ,[AgencyItemName]
  ,[AgencyBPID]
  ,[AgencyGSTIN]
  ,[AgencyName]
  ,[AgencyGSTINNumber]
  ,[AgencyBillType]
  ,[AgencyHSNSACCode]
  ,[AgencyBasicValue]
  ,[AgencyIGSTRate]
  ,[AgencyIGSTAmount]
  ,[AgencySGSTRate]
  ,[AgencySGSTAmount]
  ,[AgencyCGSTRate]
  ,[AgencyCGSTAmount]
  ,[AgencyCessRate]
  ,[AgencyCessAmount]
  ,[AgencyTotalGST]
  ,[AgencyTotalAmount]
  ,[AgencyRCMApplicable]
  ,[NonGST1TaxRate]
  ,[NonGST1TaxAmount]
  ,[NonGST2TaxRate]
  ,[NonGST2TaxAmount]
  ,[TotalPayableToAgent]
  ,[PaxName]
  ,[Sector]
  ,[TravelDate]
  ,[ReferrenceNumber]
  ,[EmployeeID]
  ,[ProjectID]
  ,[ISGECUnit]
  ,[Geography]
  ,[Data1Flag]
  ,[Data2Flag]
  ,[StatusID]
  ,[AdviceNo]
  ,[AgentsIRNo]
  ,[AgencyIRNo]
  ,[UploadBatchNo]
  )
  VALUES
  (
   @TranTypeID
  ,@AgentsIsgecGSTIN
  ,@AgentsStateID
  ,@AgentsBillNumber
  ,@AgentsBillDate
  ,@AgentsItemName
  ,@AgentsBPID
  ,@AgentsGSTIN
  ,@AgentsName
  ,@AgentsGSTINNumber
  ,@AgentsBillType
  ,@AgentsHSNSACCode
  ,@AgentsBasicValue
  ,@AgentsIGSTRate
  ,@AgentsIGSTAmount
  ,@AgentsSGSTRate
  ,@AgentsSGSTAmount
  ,@AgentsCGSTRate
  ,@AgentsCGSTAmount
  ,@AgentsCessRate
  ,@AgentsCessAmount
  ,@AgentsTotalGST
  ,@AgentsTotalAmount
  ,@AgentsRCMApplicable
  ,@AgencyIsgecGSTIN
  ,@AgencyStateID
  ,@AgencyBillNumber
  ,@AgencyBillDate
  ,@AgencyItemName
  ,@AgencyBPID
  ,@AgencyGSTIN
  ,@AgencyName
  ,@AgencyGSTINNumber
  ,@AgencyBillType
  ,@AgencyHSNSACCode
  ,@AgencyBasicValue
  ,@AgencyIGSTRate
  ,@AgencyIGSTAmount
  ,@AgencySGSTRate
  ,@AgencySGSTAmount
  ,@AgencyCGSTRate
  ,@AgencyCGSTAmount
  ,@AgencyCessRate
  ,@AgencyCessAmount
  ,@AgencyTotalGST
  ,@AgencyTotalAmount
  ,@AgencyRCMApplicable
  ,@NonGST1TaxRate
  ,@NonGST1TaxAmount
  ,@NonGST2TaxRate
  ,@NonGST2TaxAmount
  ,@TotalPayableToAgent
  ,@PaxName
  ,@Sector
  ,@TravelDate
  ,@ReferrenceNumber
  ,@EmployeeID
  ,@ProjectID
  ,@ISGECUnit
  ,@Geography
  ,@Data1Flag
  ,@Data2Flag
  ,@StatusID
  ,@AdviceNo
  ,@AgentsIRNo
  ,@AgencyIRNo
  ,@UploadBatchNo 
  )
  SET @Return_SerialNo = Scope_Identity()
GO
