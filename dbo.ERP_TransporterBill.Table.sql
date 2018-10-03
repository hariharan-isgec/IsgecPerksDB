USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ERP_TransporterBill](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[IRNumber] [nvarchar](10) NULL,
	[TPTBillNo] [nvarchar](30) NULL,
	[TPTBillDate] [datetime] NULL,
	[TPTBillReceivedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[CreatedOn] [datetime] NULL,
	[GRNos] [nvarchar](500) NULL,
	[TPTCode] [nvarchar](9) NULL,
	[PONumber] [nvarchar](9) NULL,
	[ProjectID] [nvarchar](6) NULL,
	[TPTBillAmount] [decimal](18, 2) NULL,
	[BasicFreightValue] [decimal](18, 2) NULL,
	[BasicFvODC] [decimal](18, 2) NULL,
	[DetentionatLP] [decimal](18, 2) NULL,
	[DetentionatDaysLP] [decimal](8, 2) NULL,
	[LPisISGECWorks] [bit] NOT NULL,
	[DetentionatULP] [decimal](18, 2) NULL,
	[DetentionatDaysULP] [decimal](8, 2) NULL,
	[ULPisICDCFSPort] [bit] NOT NULL,
	[ODCChargesInContract] [decimal](18, 2) NULL,
	[ODCChargesOutOfContract] [decimal](18, 2) NULL,
	[BackToTownCharges] [decimal](18, 2) NULL,
	[TarpaulinCharges] [decimal](18, 2) NULL,
	[WoodenSleeperCharges] [decimal](18, 2) NULL,
	[EmptyReturnCharges] [decimal](18, 2) NULL,
	[RTOChallanAmount] [decimal](18, 2) NULL,
	[OtherAmount] [decimal](18, 2) NULL,
	[ServiceTax] [decimal](18, 2) NULL,
	[TotalBillPassedAmount] [decimal](18, 2) NULL,
	[FWDToAccountsOn] [datetime] NULL,
	[FWDToAccountsBy] [nvarchar](8) NULL,
	[RECDByAccountsOn] [datetime] NULL,
	[RECDinAccountsBy] [nvarchar](8) NULL,
	[DiscReturnedByACOn] [datetime] NULL,
	[DiscReturnedinAcBy] [nvarchar](8) NULL,
	[DiscReturnedToByAC] [nvarchar](8) NULL,
	[DiscRecdInLgstBy] [nvarchar](8) NULL,
	[DiscRecdInLgstOn] [datetime] NULL,
	[ReFwdToAcBy] [nvarchar](8) NULL,
	[ReFwdToACOn] [datetime] NULL,
	[PTRNo] [nvarchar](10) NULL,
	[PTRAmount] [decimal](18, 2) NULL,
	[PTRDate] [datetime] NULL,
	[BankVCHNo] [nvarchar](15) NULL,
	[BankVCHAmount] [decimal](18, 2) NULL,
	[BankVCHDate] [datetime] NULL,
	[AccountsRemarks] [nvarchar](500) NULL,
	[LgstRemarks] [nvarchar](500) NULL,
	[BillStatus] [int] NULL,
	[ChequeNo] [nvarchar](20) NULL,
	[ReasonID] [int] NULL,
 CONSTRAINT [PK_ERP_TransporterBill] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ERP_TransporterBill] ON [dbo].[ERP_TransporterBill] 
(
	[IRNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ERP_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_ERP_TransporterBill_BillStatus] FOREIGN KEY([BillStatus])
REFERENCES [dbo].[ERP_TPTBillStatus] ([BillStatusID])
GO
ALTER TABLE [dbo].[ERP_TransporterBill] CHECK CONSTRAINT [FK_ERP_TransporterBill_BillStatus]
GO
ALTER TABLE [dbo].[ERP_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_ERP_TransporterBill_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ERP_TransporterBill] CHECK CONSTRAINT [FK_ERP_TransporterBill_CreatedBy]
GO
ALTER TABLE [dbo].[ERP_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_ERP_TransporterBill_DiscRecdInLgstBy] FOREIGN KEY([DiscRecdInLgstBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ERP_TransporterBill] CHECK CONSTRAINT [FK_ERP_TransporterBill_DiscRecdInLgstBy]
GO
ALTER TABLE [dbo].[ERP_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_ERP_TransporterBill_DiscReturnedInAcBy] FOREIGN KEY([DiscReturnedinAcBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ERP_TransporterBill] CHECK CONSTRAINT [FK_ERP_TransporterBill_DiscReturnedInAcBy]
GO
ALTER TABLE [dbo].[ERP_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_ERP_TransporterBill_DiscReturnedToByAc] FOREIGN KEY([DiscReturnedToByAC])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ERP_TransporterBill] CHECK CONSTRAINT [FK_ERP_TransporterBill_DiscReturnedToByAc]
GO
ALTER TABLE [dbo].[ERP_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_ERP_TransporterBill_FWDToAccountsBy] FOREIGN KEY([FWDToAccountsBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ERP_TransporterBill] CHECK CONSTRAINT [FK_ERP_TransporterBill_FWDToAccountsBy]
GO
ALTER TABLE [dbo].[ERP_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_ERP_TransporterBill_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[ERP_TransporterBill] CHECK CONSTRAINT [FK_ERP_TransporterBill_ProjectID]
GO
ALTER TABLE [dbo].[ERP_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_ERP_TransporterBill_RecdInAccountsBy] FOREIGN KEY([RECDinAccountsBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ERP_TransporterBill] CHECK CONSTRAINT [FK_ERP_TransporterBill_RecdInAccountsBy]
GO
ALTER TABLE [dbo].[ERP_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_ERP_TransporterBill_ReFwdToAcBy] FOREIGN KEY([ReFwdToAcBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ERP_TransporterBill] CHECK CONSTRAINT [FK_ERP_TransporterBill_ReFwdToAcBy]
GO
ALTER TABLE [dbo].[ERP_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_ERP_TransporterBill_TPTCode] FOREIGN KEY([TPTCode])
REFERENCES [dbo].[VR_Transporters] ([TransporterID])
GO
ALTER TABLE [dbo].[ERP_TransporterBill] CHECK CONSTRAINT [FK_ERP_TransporterBill_TPTCode]
GO
ALTER TABLE [dbo].[ERP_TransporterBill] ADD  CONSTRAINT [DF_ERP_TransporterBill_LPisISGECWorks]  DEFAULT ((0)) FOR [LPisISGECWorks]
GO
ALTER TABLE [dbo].[ERP_TransporterBill] ADD  CONSTRAINT [DF_ERP_TransporterBill_ULPisICDCFSPort]  DEFAULT ((0)) FOR [ULPisICDCFSPort]
GO
