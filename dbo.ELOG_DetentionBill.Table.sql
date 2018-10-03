USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELOG_DetentionBill](
	[IRNo] [int] NOT NULL,
	[IRDate] [datetime] NULL,
	[SupplierID] [nvarchar](9) NULL,
	[SupplierBillNo] [nvarchar](50) NULL,
	[SupplierBillDate] [datetime] NULL,
	[BillAmount] [decimal](18, 2) NULL,
	[GRNo] [nvarchar](50) NULL,
	[GRDate] [datetime] NULL,
	[ProjectID] [nvarchar](6) NULL,
	[PONumber] [nvarchar](9) NULL,
	[StatusID] [int] NULL,
	[BillTypeID] [int] NULL,
	[OtherBillType] [nvarchar](20) NULL,
	[VehicleExeNo] [int] NULL,
	[MRNNo] [int] NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_ELOG_DetentionBill] PRIMARY KEY CLUSTERED 
(
	[IRNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ELOG_DetentionBill]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_DetentionBill_BillTypeID] FOREIGN KEY([BillTypeID])
REFERENCES [dbo].[ELOG_DetentionBillTypes] ([BillTypeID])
GO
ALTER TABLE [dbo].[ELOG_DetentionBill] CHECK CONSTRAINT [FK_ELOG_DetentionBill_BillTypeID]
GO
ALTER TABLE [dbo].[ELOG_DetentionBill]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_DetentionBill_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ELOG_DetentionBill] CHECK CONSTRAINT [FK_ELOG_DetentionBill_CreatedBy]
GO
ALTER TABLE [dbo].[ELOG_DetentionBill]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_DetentionBill_MRNNo] FOREIGN KEY([ProjectID], [MRNNo])
REFERENCES [dbo].[VR_LorryReceipts] ([ProjectID], [MRNNo])
GO
ALTER TABLE [dbo].[ELOG_DetentionBill] CHECK CONSTRAINT [FK_ELOG_DetentionBill_MRNNo]
GO
ALTER TABLE [dbo].[ELOG_DetentionBill]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_DetentionBill_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[ELOG_DetentionBill] CHECK CONSTRAINT [FK_ELOG_DetentionBill_ProjectID]
GO
ALTER TABLE [dbo].[ELOG_DetentionBill]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_DetentionBill_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[ELOG_DetentionBillStatus] ([StatusID])
GO
ALTER TABLE [dbo].[ELOG_DetentionBill] CHECK CONSTRAINT [FK_ELOG_DetentionBill_StatusID]
GO
ALTER TABLE [dbo].[ELOG_DetentionBill]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_DetentionBill_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[ELOG_DetentionBill] CHECK CONSTRAINT [FK_ELOG_DetentionBill_SupplierID]
GO
ALTER TABLE [dbo].[ELOG_DetentionBill]  WITH CHECK ADD  CONSTRAINT [FK_ELOG_DetentionBill_VehicleExeNo] FOREIGN KEY([VehicleExeNo])
REFERENCES [dbo].[VR_RequestExecution] ([SRNNo])
GO
ALTER TABLE [dbo].[ELOG_DetentionBill] CHECK CONSTRAINT [FK_ELOG_DetentionBill_VehicleExeNo]
GO
