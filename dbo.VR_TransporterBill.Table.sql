USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_TransporterBill](
	[IRNo] [int] NOT NULL,
	[IRDescription] [nvarchar](50) NULL,
	[ISGECPONumber] [nvarchar](10) NOT NULL,
	[ISGECPODate] [datetime] NOT NULL,
	[ISGECPOAmount] [decimal](18, 2) NOT NULL,
	[TransporterID] [nvarchar](9) NOT NULL,
	[TransporterBillNo] [nvarchar](20) NOT NULL,
	[TransporterBillDate] [datetime] NOT NULL,
	[BillAmount] [decimal](18, 2) NOT NULL,
	[BillReceivedOn] [datetime] NOT NULL,
	[BillReceivedBy] [nvarchar](8) NOT NULL,
	[BillReceiverDivisionID] [nvarchar](6) NOT NULL,
	[BillStatusID] [int] NOT NULL,
	[DiscripantBill] [bit] NOT NULL,
	[BillReturnRemarks] [nvarchar](100) NULL,
	[BillReturnedOn] [datetime] NULL,
	[BillReturneddBy] [nvarchar](8) NULL,
	[ReceiptNo] [nvarchar](10) NULL,
	[ReceiptDate] [datetime] NULL,
	[ReceiptLine] [nvarchar](4) NULL,
	[PassedAmount] [decimal](18, 2) NOT NULL,
	[ForwardedToAccount] [bit] NOT NULL,
	[ForwardedOn] [datetime] NULL,
	[ForwardedBy] [nvarchar](8) NULL,
	[ReceiptAcknowledgement] [bit] NOT NULL,
	[ReceiptAcknowledgedOn] [datetime] NULL,
	[ReceiptAcknowledgedBy] [nvarchar](8) NULL,
	[DiscripantReceipt] [bit] NOT NULL,
	[ReceiptReturnedOn] [datetime] NULL,
	[ReceiptReturnedBy] [nvarchar](8) NULL,
	[ReceiptReturnRemarks] [nvarchar](100) NULL,
	[SerialNo] [int] NULL,
 CONSTRAINT [PK_VR_TransporterBill] PRIMARY KEY CLUSTERED 
(
	[IRNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VR_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_VR_TransporterBill_BillReceivedBy] FOREIGN KEY([BillReceivedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_TransporterBill] CHECK CONSTRAINT [FK_VR_TransporterBill_BillReceivedBy]
GO
ALTER TABLE [dbo].[VR_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_VR_TransporterBill_BillReceiverDivisionID] FOREIGN KEY([BillReceiverDivisionID])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[VR_TransporterBill] CHECK CONSTRAINT [FK_VR_TransporterBill_BillReceiverDivisionID]
GO
ALTER TABLE [dbo].[VR_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_VR_TransporterBill_BillReturnedBy] FOREIGN KEY([BillReturneddBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_TransporterBill] CHECK CONSTRAINT [FK_VR_TransporterBill_BillReturnedBy]
GO
ALTER TABLE [dbo].[VR_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_VR_TransporterBill_BillStatusID] FOREIGN KEY([BillStatusID])
REFERENCES [dbo].[VR_BillStatus] ([BillStatusID])
GO
ALTER TABLE [dbo].[VR_TransporterBill] CHECK CONSTRAINT [FK_VR_TransporterBill_BillStatusID]
GO
ALTER TABLE [dbo].[VR_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_VR_TransporterBill_ForwardedBy] FOREIGN KEY([ForwardedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_TransporterBill] CHECK CONSTRAINT [FK_VR_TransporterBill_ForwardedBy]
GO
ALTER TABLE [dbo].[VR_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_VR_TransporterBill_ReceiptAcknowledgeBy] FOREIGN KEY([ReceiptAcknowledgedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_TransporterBill] CHECK CONSTRAINT [FK_VR_TransporterBill_ReceiptAcknowledgeBy]
GO
ALTER TABLE [dbo].[VR_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_VR_TransporterBill_ReceiptReturnedBy] FOREIGN KEY([ReceiptReturnedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_TransporterBill] CHECK CONSTRAINT [FK_VR_TransporterBill_ReceiptReturnedBy]
GO
ALTER TABLE [dbo].[VR_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_VR_TransporterBill_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[VR_PaymentProcess] ([SerialNo])
GO
ALTER TABLE [dbo].[VR_TransporterBill] CHECK CONSTRAINT [FK_VR_TransporterBill_SerialNo]
GO
ALTER TABLE [dbo].[VR_TransporterBill]  WITH CHECK ADD  CONSTRAINT [FK_VR_TransporterBill_TransporterID] FOREIGN KEY([TransporterID])
REFERENCES [dbo].[VR_Transporters] ([TransporterID])
GO
ALTER TABLE [dbo].[VR_TransporterBill] CHECK CONSTRAINT [FK_VR_TransporterBill_TransporterID]
GO
ALTER TABLE [dbo].[VR_TransporterBill] ADD  CONSTRAINT [DF_VR_TransporterBill_ISGECPOAmount]  DEFAULT ((0)) FOR [ISGECPOAmount]
GO
ALTER TABLE [dbo].[VR_TransporterBill] ADD  CONSTRAINT [DF_VR_TransporterBill_BillAmount]  DEFAULT ((0)) FOR [BillAmount]
GO
ALTER TABLE [dbo].[VR_TransporterBill] ADD  CONSTRAINT [DF_VR_TransporterBill_DiscripantBill]  DEFAULT ((0)) FOR [DiscripantBill]
GO
ALTER TABLE [dbo].[VR_TransporterBill] ADD  CONSTRAINT [DF_VR_TransporterBill_PassedAmount]  DEFAULT ((0)) FOR [PassedAmount]
GO
ALTER TABLE [dbo].[VR_TransporterBill] ADD  CONSTRAINT [DF_VR_TransporterBill_ForwardedToAccount]  DEFAULT ((0)) FOR [ForwardedToAccount]
GO
ALTER TABLE [dbo].[VR_TransporterBill] ADD  CONSTRAINT [DF_VR_TransporterBill_ReceiptAcknowledgement]  DEFAULT ((0)) FOR [ReceiptAcknowledgement]
GO
ALTER TABLE [dbo].[VR_TransporterBill] ADD  CONSTRAINT [DF_VR_TransporterBill_DiscripantReceipt]  DEFAULT ((0)) FOR [DiscripantReceipt]
GO
