USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_QCListH](
	[SerialNo] [int] NOT NULL,
	[QCLNo] [int] IDENTITY(1,1) NOT NULL,
	[SupplierRef] [nvarchar](50) NULL,
	[TotalWeight] [decimal](18, 4) NULL,
	[QualityClearedWt] [decimal](18, 4) NOT NULL,
	[UOMTotalWeight] [int] NULL,
	[Remarks] [nvarchar](500) NULL,
	[StatusID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[ClearedBy] [nvarchar](8) NULL,
	[ClearedOn] [datetime] NULL,
	[PkgNo] [int] NULL,
	[QCRequestNo] [int] NULL,
 CONSTRAINT [PK_PAK_QCListH] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[QCLNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_QCListH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_QCListH_ClearedBy] FOREIGN KEY([ClearedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_QCListH] CHECK CONSTRAINT [FK_PAK_QCListH_ClearedBy]
GO
ALTER TABLE [dbo].[PAK_QCListH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_QCListH_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_QCListH] CHECK CONSTRAINT [FK_PAK_QCListH_CreatedBy]
GO
ALTER TABLE [dbo].[PAK_QCListH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_QCListH_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[PAK_PO] ([SerialNo])
GO
ALTER TABLE [dbo].[PAK_QCListH] CHECK CONSTRAINT [FK_PAK_QCListH_SerialNo]
GO
ALTER TABLE [dbo].[PAK_QCListH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_QCListH_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[PAK_QCListStatus] ([StatusID])
GO
ALTER TABLE [dbo].[PAK_QCListH] CHECK CONSTRAINT [FK_PAK_QCListH_StatusID]
GO
ALTER TABLE [dbo].[PAK_QCListH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_QCListH_UOMTotalWeight] FOREIGN KEY([UOMTotalWeight])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_QCListH] CHECK CONSTRAINT [FK_PAK_QCListH_UOMTotalWeight]
GO
ALTER TABLE [dbo].[PAK_QCListH] ADD  CONSTRAINT [DF_PAK_QCListH_QualityClearedWt]  DEFAULT ((0)) FOR [QualityClearedWt]
GO
