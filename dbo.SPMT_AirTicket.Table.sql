USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_AirTicket](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[TranTypeID] [nvarchar](3) NULL,
	[AgentsIsgecGSTIN] [int] NULL,
	[AgentsStateID] [nvarchar](2) NULL,
	[AgentsBillNumber] [nvarchar](50) NULL,
	[AgentsBillDate] [datetime] NULL,
	[AgentsItemName] [nvarchar](50) NULL,
	[AgentsBPID] [nvarchar](9) NULL,
	[AgentsGSTIN] [int] NULL,
	[AgentsName] [nvarchar](50) NULL,
	[AgentsGSTINNumber] [nvarchar](50) NULL,
	[AgentsBillType] [int] NULL,
	[AgentsHSNSACCode] [nvarchar](20) NULL,
	[AgentsBasicValue] [decimal](18, 2) NOT NULL,
	[AgentsIGSTRate] [decimal](18, 2) NOT NULL,
	[AgentsIGSTAmount] [decimal](18, 2) NOT NULL,
	[AgentsSGSTRate] [decimal](18, 2) NOT NULL,
	[AgentsSGSTAmount] [decimal](18, 2) NOT NULL,
	[AgentsCGSTRate] [decimal](18, 2) NOT NULL,
	[AgentsCGSTAmount] [decimal](18, 2) NOT NULL,
	[AgentsCessRate] [decimal](18, 2) NOT NULL,
	[AgentsCessAmount] [decimal](18, 2) NOT NULL,
	[AgentsTotalGST] [decimal](18, 2) NOT NULL,
	[AgentsTotalAmount] [decimal](18, 2) NOT NULL,
	[AgentsRCMApplicable] [bit] NOT NULL,
	[AgencyIsgecGSTIN] [int] NULL,
	[AgencyStateID] [nvarchar](2) NULL,
	[AgencyBillNumber] [nvarchar](50) NULL,
	[AgencyBillDate] [datetime] NULL,
	[AgencyItemName] [nvarchar](50) NULL,
	[AgencyBPID] [nvarchar](9) NULL,
	[AgencyGSTIN] [int] NULL,
	[AgencyName] [nvarchar](50) NULL,
	[AgencyGSTINNumber] [nvarchar](50) NULL,
	[AgencyBillType] [int] NULL,
	[AgencyHSNSACCode] [nvarchar](20) NULL,
	[AgencyBasicValue] [decimal](18, 2) NOT NULL,
	[AgencyIGSTRate] [decimal](18, 2) NOT NULL,
	[AgencyIGSTAmount] [decimal](18, 2) NOT NULL,
	[AgencySGSTRate] [decimal](18, 2) NOT NULL,
	[AgencySGSTAmount] [decimal](18, 2) NOT NULL,
	[AgencyCGSTRate] [decimal](18, 2) NOT NULL,
	[AgencyCGSTAmount] [decimal](18, 2) NOT NULL,
	[AgencyCessRate] [decimal](18, 2) NOT NULL,
	[AgencyCessAmount] [decimal](18, 2) NOT NULL,
	[AgencyTotalGST] [decimal](18, 2) NOT NULL,
	[AgencyTotalAmount] [decimal](18, 2) NOT NULL,
	[AgencyRCMApplicable] [bit] NOT NULL,
	[NonGST1TaxRate] [decimal](18, 2) NOT NULL,
	[NonGST1TaxAmount] [decimal](18, 2) NOT NULL,
	[NonGST2TaxRate] [decimal](18, 2) NOT NULL,
	[NonGST2TaxAmount] [decimal](18, 2) NOT NULL,
	[TotalPayableToAgent] [decimal](18, 2) NOT NULL,
	[PaxName] [nvarchar](50) NULL,
	[Sector] [nvarchar](50) NULL,
	[TravelDate] [datetime] NULL,
	[ReferrenceNumber] [nvarchar](50) NULL,
	[EmployeeID] [nvarchar](8) NULL,
	[ProjectID] [nvarchar](6) NULL,
	[ISGECUnit] [nvarchar](10) NULL,
	[Geography] [nvarchar](20) NULL,
	[Data1Flag] [bit] NOT NULL,
	[Data2Flag] [bit] NOT NULL,
	[StatusID] [int] NULL,
	[AdviceNo] [int] NULL,
	[AgentsIRNo] [int] NULL,
	[AgencyIRNo] [int] NULL,
	[UploadBatchNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_SPMT_AirTicket] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SPMT_AirTicket] ON [dbo].[SPMT_AirTicket] 
(
	[UploadBatchNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SPMT_AirTicket_1] ON [dbo].[SPMT_AirTicket] 
(
	[AgentsIRNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AdviceNo] FOREIGN KEY([AdviceNo])
REFERENCES [dbo].[SPMT_PaymentAdvice] ([AdviceNo])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AdviceNo]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgencyBillType] FOREIGN KEY([AgencyBillType])
REFERENCES [dbo].[SPMT_BillTypes] ([BillType])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgencyBillType]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgencyBPID] FOREIGN KEY([AgencyBPID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgencyBPID]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgencyGSTIN] FOREIGN KEY([AgencyBPID], [AgencyGSTIN])
REFERENCES [dbo].[VR_BPGSTIN] ([BPID], [GSTIN])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgencyGSTIN]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgencyHSNSACCode] FOREIGN KEY([AgencyBillType], [AgencyHSNSACCode])
REFERENCES [dbo].[SPMT_HSNSACCodes] ([BillType], [HSNSACCode])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgencyHSNSACCode]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgencyIRNo] FOREIGN KEY([AgencyIRNo])
REFERENCES [dbo].[SPMT_SupplierBill] ([IRNo])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgencyIRNo]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgencyIsgecGSTIN] FOREIGN KEY([AgencyIsgecGSTIN])
REFERENCES [dbo].[SPMT_IsgecGSTIN] ([GSTID])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgencyIsgecGSTIN]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgencyStateID] FOREIGN KEY([AgencyStateID])
REFERENCES [dbo].[SPMT_ERPStates] ([StateID])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgencyStateID]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgentsBillType] FOREIGN KEY([AgentsBillType])
REFERENCES [dbo].[SPMT_BillTypes] ([BillType])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgentsBillType]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgentsBPID] FOREIGN KEY([AgentsBPID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgentsBPID]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgentsGSTIN] FOREIGN KEY([AgentsBPID], [AgentsGSTIN])
REFERENCES [dbo].[VR_BPGSTIN] ([BPID], [GSTIN])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgentsGSTIN]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgentsHSNSACCode] FOREIGN KEY([AgentsBillType], [AgentsHSNSACCode])
REFERENCES [dbo].[SPMT_HSNSACCodes] ([BillType], [HSNSACCode])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgentsHSNSACCode]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgentsIRNo] FOREIGN KEY([AgentsIRNo])
REFERENCES [dbo].[SPMT_SupplierBill] ([IRNo])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgentsIRNo]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgentsIsgecGSTIN] FOREIGN KEY([AgentsIsgecGSTIN])
REFERENCES [dbo].[SPMT_IsgecGSTIN] ([GSTID])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgentsIsgecGSTIN]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_AgentsStateID] FOREIGN KEY([AgentsStateID])
REFERENCES [dbo].[SPMT_ERPStates] ([StateID])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_AgentsStateID]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_EmployeeID]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_ProjectID]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[SPMT_AirTicketStatus] ([StatusID])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_StatusID]
GO
ALTER TABLE [dbo].[SPMT_AirTicket]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_AirTicket_TranTypeID] FOREIGN KEY([TranTypeID])
REFERENCES [dbo].[SPMT_TranTypes] ([TranTypeID])
GO
ALTER TABLE [dbo].[SPMT_AirTicket] CHECK CONSTRAINT [FK_SPMT_AirTicket_TranTypeID]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AssessableValue]  DEFAULT ((0)) FOR [AgentsBasicValue]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_IGSTRate]  DEFAULT ((0)) FOR [AgentsIGSTRate]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_IGSTAmount]  DEFAULT ((0)) FOR [AgentsIGSTAmount]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_SGSTRate]  DEFAULT ((0)) FOR [AgentsSGSTRate]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_SGSTAmount]  DEFAULT ((0)) FOR [AgentsSGSTAmount]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_CGSTRate]  DEFAULT ((0)) FOR [AgentsCGSTRate]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_CGSTAmount]  DEFAULT ((0)) FOR [AgentsCGSTAmount]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_CessRate]  DEFAULT ((0)) FOR [AgentsCessRate]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_CessAmount]  DEFAULT ((0)) FOR [AgentsCessAmount]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_TotalGST]  DEFAULT ((0)) FOR [AgentsTotalGST]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_TotalAmount]  DEFAULT ((0)) FOR [AgentsTotalAmount]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_RCMApplicable]  DEFAULT ((0)) FOR [AgentsRCMApplicable]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AgentsBasicValue1]  DEFAULT ((0)) FOR [AgencyBasicValue]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AgentsIGSTRate1]  DEFAULT ((0)) FOR [AgencyIGSTRate]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AgentsIGSTAmount1]  DEFAULT ((0)) FOR [AgencyIGSTAmount]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AgentsSGSTRate1]  DEFAULT ((0)) FOR [AgencySGSTRate]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AgentsSGSTAmount1]  DEFAULT ((0)) FOR [AgencySGSTAmount]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AgentsCGSTRate1]  DEFAULT ((0)) FOR [AgencyCGSTRate]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AgentsCGSTAmount1]  DEFAULT ((0)) FOR [AgencyCGSTAmount]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AgentsCessRate1]  DEFAULT ((0)) FOR [AgencyCessRate]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AgentsCessAmount1]  DEFAULT ((0)) FOR [AgencyCessAmount]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AgentsTotalGST1]  DEFAULT ((0)) FOR [AgencyTotalGST]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AgentsTotalAmount1]  DEFAULT ((0)) FOR [AgencyTotalAmount]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AgentsRCMApplicable1]  DEFAULT ((0)) FOR [AgencyRCMApplicable]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_BasicFare]  DEFAULT ((0)) FOR [NonGST1TaxRate]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_YQTax]  DEFAULT ((0)) FOR [NonGST1TaxAmount]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_AllOtherTaxes]  DEFAULT ((0)) FOR [NonGST2TaxRate]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_TotalFare]  DEFAULT ((0)) FOR [NonGST2TaxAmount]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_BillAmount]  DEFAULT ((0)) FOR [TotalPayableToAgent]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_CancelledTicket]  DEFAULT ((0)) FOR [Data1Flag]
GO
ALTER TABLE [dbo].[SPMT_AirTicket] ADD  CONSTRAINT [DF_SPMT_AirTicket_ModifiedTicket]  DEFAULT ((0)) FOR [Data2Flag]
GO
