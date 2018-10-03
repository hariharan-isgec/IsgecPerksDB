USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASM_TransferHeader](
	[TransferID] [int] IDENTITY(1,1) NOT NULL,
	[TransferTo] [int] NOT NULL,
	[TransferFrom] [int] NOT NULL,
	[Returnable] [bit] NOT NULL,
	[ExpectedDate] [datetime] NULL,
	[TransferRemarks] [nvarchar](100) NULL,
	[TransferStatusID] [nvarchar](30) NULL,
	[T_TakenBy] [nvarchar](30) NULL,
	[T_CreatedBy] [nvarchar](8) NULL,
	[T_CreatedOn] [datetime] NULL,
	[T_ApprovedBy] [nvarchar](8) NULL,
	[T_ApprovedOn] [datetime] NULL,
	[T_GateEntryBy] [nvarchar](30) NULL,
	[T_GateEntryOn] [datetime] NULL,
	[T_ReceiveGateEntryBy] [nvarchar](30) NULL,
	[T_ReceiveGateEntryOn] [datetime] NULL,
	[T_ReceivedBy] [nvarchar](8) NULL,
	[T_ReceivedOn] [datetime] NULL,
	[R_TakenBy] [nvarchar](30) NULL,
	[R_CreatedBy] [nvarchar](8) NULL,
	[R_CreatedOn] [datetime] NULL,
	[R_ApprovedBy] [nvarchar](8) NULL,
	[R_ApprovedOn] [datetime] NULL,
	[R_GateEntryBy] [nvarchar](30) NULL,
	[R_GateEntryOn] [datetime] NULL,
	[R_ReceiveGateEntryBy] [nvarchar](30) NULL,
	[R_ReceiveGateEntryOn] [datetime] NULL,
	[R_ReceivedBy] [nvarchar](8) NULL,
	[R_ReceivedOn] [datetime] NULL,
	[CancelledRemarks] [nvarchar](100) NULL,
 CONSTRAINT [PK_ASM_TransferHeader] PRIMARY KEY CLUSTERED 
(
	[TransferID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ASM_TransferHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_TransferHeader_ASM_AstTransferStatus] FOREIGN KEY([TransferStatusID])
REFERENCES [dbo].[ASM_AstTransferStatus] ([TransferStatusID])
GO
ALTER TABLE [dbo].[ASM_TransferHeader] CHECK CONSTRAINT [FK_ASM_TransferHeader_ASM_AstTransferStatus]
GO
ALTER TABLE [dbo].[ASM_TransferHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_TransferHeader_HRM_Employees1] FOREIGN KEY([T_ApprovedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ASM_TransferHeader] CHECK CONSTRAINT [FK_ASM_TransferHeader_HRM_Employees1]
GO
ALTER TABLE [dbo].[ASM_TransferHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_TransferHeader_HRM_Employees4] FOREIGN KEY([R_ApprovedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ASM_TransferHeader] CHECK CONSTRAINT [FK_ASM_TransferHeader_HRM_Employees4]
GO
ALTER TABLE [dbo].[ASM_TransferHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_TransferHeader_HRM_Offices] FOREIGN KEY([TransferTo])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[ASM_TransferHeader] CHECK CONSTRAINT [FK_ASM_TransferHeader_HRM_Offices]
GO
ALTER TABLE [dbo].[ASM_TransferHeader]  WITH CHECK ADD  CONSTRAINT [FK_ASM_TransferHeader_HRM_Offices1] FOREIGN KEY([TransferFrom])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[ASM_TransferHeader] CHECK CONSTRAINT [FK_ASM_TransferHeader_HRM_Offices1]
GO
ALTER TABLE [dbo].[ASM_TransferHeader] ADD  CONSTRAINT [DF_ASM_TransferHeader_Returnable]  DEFAULT ((0)) FOR [Returnable]
GO
