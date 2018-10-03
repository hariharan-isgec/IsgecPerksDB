USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_PkgListH](
	[SerialNo] [int] NOT NULL,
	[PkgNo] [int] IDENTITY(1,1) NOT NULL,
	[SupplierRefNo] [nvarchar](50) NULL,
	[Additional1Info] [nvarchar](50) NULL,
	[Additional2Info] [nvarchar](50) NULL,
	[TotalWeight] [decimal](18, 2) NULL,
	[UOMTotalWeight] [int] NULL,
	[TransporterID] [nvarchar](9) NULL,
	[TransporterName] [nvarchar](50) NULL,
	[VehicleNo] [nvarchar](50) NULL,
	[GRNo] [nvarchar](50) NULL,
	[GRDate] [datetime] NULL,
	[VRExecutionNo] [int] NULL,
	[Remarks] [nvarchar](500) NULL,
	[StatusID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](8) NULL,
 CONSTRAINT [PK_PAK_PkgListH] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[PkgNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_PkgListH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListH_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_PkgListH] CHECK CONSTRAINT [FK_PAK_PkgListH_CreatedBy]
GO
ALTER TABLE [dbo].[PAK_PkgListH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListH_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[PAK_PO] ([SerialNo])
GO
ALTER TABLE [dbo].[PAK_PkgListH] CHECK CONSTRAINT [FK_PAK_PkgListH_SerialNo]
GO
ALTER TABLE [dbo].[PAK_PkgListH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListH_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[PAK_PkgStatus] ([StatusID])
GO
ALTER TABLE [dbo].[PAK_PkgListH] CHECK CONSTRAINT [FK_PAK_PkgListH_StatusID]
GO
ALTER TABLE [dbo].[PAK_PkgListH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListH_TransporterID] FOREIGN KEY([TransporterID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[PAK_PkgListH] CHECK CONSTRAINT [FK_PAK_PkgListH_TransporterID]
GO
ALTER TABLE [dbo].[PAK_PkgListH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListH_UOMTotalWeight] FOREIGN KEY([UOMTotalWeight])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_PkgListH] CHECK CONSTRAINT [FK_PAK_PkgListH_UOMTotalWeight]
GO
ALTER TABLE [dbo].[PAK_PkgListH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_PkgListH_VRExecutionNo] FOREIGN KEY([VRExecutionNo])
REFERENCES [dbo].[VR_RequestExecution] ([SRNNo])
GO
ALTER TABLE [dbo].[PAK_PkgListH] CHECK CONSTRAINT [FK_PAK_PkgListH_VRExecutionNo]
GO
