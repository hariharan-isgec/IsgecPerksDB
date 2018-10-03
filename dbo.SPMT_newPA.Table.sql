USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_newPA](
	[AdviceNo] [int] IDENTITY(1,1) NOT NULL,
	[TranTypeID] [nvarchar](3) NULL,
	[BPID] [nvarchar](9) NULL,
	[SupplierName] [nvarchar](100) NULL,
	[ConcernedHOD] [nvarchar](8) NULL,
	[StatusID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[Remarks] [nvarchar](500) NULL,
	[ReceivedInACBy] [nvarchar](8) NULL,
	[ReceivedInACOn] [datetime] NULL,
	[AccountsRemarks] [nvarchar](100) NULL,
	[PostedInACBy] [nvarchar](8) NULL,
	[PostedInACOn] [datetime] NULL,
	[LockedInACBy] [nvarchar](8) NULL,
	[LockedInACOn] [datetime] NULL,
	[VoucherType] [nvarchar](3) NULL,
	[VoucherNo] [nvarchar](10) NULL,
	[ERPCompany] [nvarchar](3) NULL,
	[AdvanceRate] [decimal](18, 2) NULL,
	[AdvanceAmount] [decimal](18, 2) NULL,
	[RetensionRate] [decimal](18, 2) NULL,
	[RetensionAmount] [decimal](18, 2) NULL,
	[UploadBatchNo] [nvarchar](50) NULL,
	[TotalAdviceAmount] [decimal](18, 2) NULL,
	[OldAdviceNo] [int] NULL,
 CONSTRAINT [PK_SPMT_newPA] PRIMARY KEY CLUSTERED 
(
	[AdviceNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SPMT_newPA] ON [dbo].[SPMT_newPA] 
(
	[OldAdviceNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_newPA]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newPA_BPID] FOREIGN KEY([BPID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[SPMT_newPA] CHECK CONSTRAINT [FK_SPMT_newPA_BPID]
GO
ALTER TABLE [dbo].[SPMT_newPA]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newPA_ConcernedHOD] FOREIGN KEY([ConcernedHOD])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[SPMT_newPA] CHECK CONSTRAINT [FK_SPMT_newPA_ConcernedHOD]
GO
ALTER TABLE [dbo].[SPMT_newPA]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newPA_CreatedOn] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_newPA] CHECK CONSTRAINT [FK_SPMT_newPA_CreatedOn]
GO
ALTER TABLE [dbo].[SPMT_newPA]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newPA_LockedInACBy] FOREIGN KEY([LockedInACBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_newPA] CHECK CONSTRAINT [FK_SPMT_newPA_LockedInACBy]
GO
ALTER TABLE [dbo].[SPMT_newPA]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newPA_PostedInACBy] FOREIGN KEY([PostedInACBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_newPA] CHECK CONSTRAINT [FK_SPMT_newPA_PostedInACBy]
GO
ALTER TABLE [dbo].[SPMT_newPA]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newPA_ReceivedInACBy] FOREIGN KEY([ReceivedInACBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SPMT_newPA] CHECK CONSTRAINT [FK_SPMT_newPA_ReceivedInACBy]
GO
ALTER TABLE [dbo].[SPMT_newPA]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newPA_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[SPMT_PAStatus] ([AdviceStatusID])
GO
ALTER TABLE [dbo].[SPMT_newPA] CHECK CONSTRAINT [FK_SPMT_newPA_StatusID]
GO
ALTER TABLE [dbo].[SPMT_newPA]  WITH CHECK ADD  CONSTRAINT [FK_SPMT_newPA_TranTypeID] FOREIGN KEY([TranTypeID])
REFERENCES [dbo].[SPMT_TranTypes] ([TranTypeID])
GO
ALTER TABLE [dbo].[SPMT_newPA] CHECK CONSTRAINT [FK_SPMT_newPA_TranTypeID]
GO
