USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_SitePkgH](
	[ProjectID] [nvarchar](6) NOT NULL,
	[RecNo] [int] IDENTITY(1,1) NOT NULL,
	[SerialNo] [int] NULL,
	[PkgNo] [int] NULL,
	[MRNNo] [int] NULL,
	[SupplierID] [nvarchar](9) NULL,
	[SupplierName] [nvarchar](50) NULL,
	[SupplierRefNo] [nvarchar](50) NULL,
	[TotalWeight] [decimal](18, 2) NULL,
	[UOMTotalWeight] [int] NULL,
	[TransporterID] [nvarchar](9) NULL,
	[TransporterName] [nvarchar](50) NULL,
	[VehicleNo] [nvarchar](50) NULL,
	[GRNo] [nvarchar](50) NULL,
	[GRDate] [datetime] NULL,
	[ODC] [bit] NULL,
	[MaterialStatusID] [int] NULL,
	[Remarks] [nvarchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[ReceiveStatusID] [int] NULL,
 CONSTRAINT [PK_PAK_SitePkgH] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[RecNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_SitePkgH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgH_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_SitePkgH] CHECK CONSTRAINT [FK_PAK_SitePkgH_CreatedBy]
GO
ALTER TABLE [dbo].[PAK_SitePkgH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgH_MaterialStatusID] FOREIGN KEY([MaterialStatusID])
REFERENCES [dbo].[VR_MaterialStates] ([MaterialStateID])
GO
ALTER TABLE [dbo].[PAK_SitePkgH] CHECK CONSTRAINT [FK_PAK_SitePkgH_MaterialStatusID]
GO
ALTER TABLE [dbo].[PAK_SitePkgH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgH_MRNNo] FOREIGN KEY([ProjectID], [MRNNo])
REFERENCES [dbo].[VR_LorryReceipts] ([ProjectID], [MRNNo])
GO
ALTER TABLE [dbo].[PAK_SitePkgH] CHECK CONSTRAINT [FK_PAK_SitePkgH_MRNNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgH_PkgNo] FOREIGN KEY([SerialNo], [PkgNo])
REFERENCES [dbo].[PAK_PkgListH] ([SerialNo], [PkgNo])
GO
ALTER TABLE [dbo].[PAK_SitePkgH] CHECK CONSTRAINT [FK_PAK_SitePkgH_PkgNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgH_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[PAK_SitePkgH] CHECK CONSTRAINT [FK_PAK_SitePkgH_ProjectID]
GO
ALTER TABLE [dbo].[PAK_SitePkgH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgH_ReceiveStatusID] FOREIGN KEY([ReceiveStatusID])
REFERENCES [dbo].[PAK_ReceiveStatus] ([ReceiveStatusID])
GO
ALTER TABLE [dbo].[PAK_SitePkgH] CHECK CONSTRAINT [FK_PAK_SitePkgH_ReceiveStatusID]
GO
ALTER TABLE [dbo].[PAK_SitePkgH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgH_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[PAK_PO] ([SerialNo])
GO
ALTER TABLE [dbo].[PAK_SitePkgH] CHECK CONSTRAINT [FK_PAK_SitePkgH_SerialNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgH_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[PAK_SitePkgH] CHECK CONSTRAINT [FK_PAK_SitePkgH_SupplierID]
GO
ALTER TABLE [dbo].[PAK_SitePkgH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgH_TransporterID] FOREIGN KEY([TransporterID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[PAK_SitePkgH] CHECK CONSTRAINT [FK_PAK_SitePkgH_TransporterID]
GO
ALTER TABLE [dbo].[PAK_SitePkgH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgH_UOMTotalWeight] FOREIGN KEY([UOMTotalWeight])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_SitePkgH] CHECK CONSTRAINT [FK_PAK_SitePkgH_UOMTotalWeight]
GO
