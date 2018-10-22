USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_SitePkgD](
	[ProjectID] [nvarchar](6) NOT NULL,
	[RecNo] [int] NOT NULL,
	[RecSrNo] [int] IDENTITY(1,1) NOT NULL,
	[SerialNo] [int] NOT NULL,
	[PkgNo] [int] NOT NULL,
	[BOMNo] [int] NOT NULL,
	[ItemNo] [int] NOT NULL,
	[SiteMarkNo] [nvarchar](30) NULL,
	[UOMQuantity] [int] NULL,
	[Quantity] [decimal](18, 4) NOT NULL,
	[DocumentNo] [int] NULL,
	[DocumentRevision] [nvarchar](10) NULL,
	[PackTypeID] [int] NULL,
	[PackingMark] [nvarchar](50) NULL,
	[PackLength] [decimal](18, 4) NOT NULL,
	[PackWidth] [decimal](18, 4) NOT NULL,
	[PackHeight] [decimal](18, 4) NOT NULL,
	[UOMPack] [int] NULL,
	[Remarks] [nvarchar](100) NULL,
	[DocumentReceived] [bit] NOT NULL,
	[NotFromPackingList] [bit] NOT NULL,
	[OnlyPackageReceived] [bit] NOT NULL,
	[MaterialStatusID] [int] NULL,
	[InventoryStatusID] [int] NULL,
	[InventoryUpdatedOn] [datetime] NULL,
	[InventoryUpdatedBy] [nvarchar](8) NULL,
	[TotalWeight] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_PAK_SitePkgD] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[RecNo] ASC,
	[RecSrNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_SitePkgD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgD_DocumentNo] FOREIGN KEY([DocumentNo])
REFERENCES [dbo].[PAK_Documents] ([DocumentNo])
GO
ALTER TABLE [dbo].[PAK_SitePkgD] CHECK CONSTRAINT [FK_PAK_SitePkgD_DocumentNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgD_InventoryStatusID] FOREIGN KEY([InventoryStatusID])
REFERENCES [dbo].[PAK_InventoryStatus] ([InventoryStatusID])
GO
ALTER TABLE [dbo].[PAK_SitePkgD] CHECK CONSTRAINT [FK_PAK_SitePkgD_InventoryStatusID]
GO
ALTER TABLE [dbo].[PAK_SitePkgD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgD_InventoryUpdatedBy] FOREIGN KEY([InventoryUpdatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_SitePkgD] CHECK CONSTRAINT [FK_PAK_SitePkgD_InventoryUpdatedBy]
GO
ALTER TABLE [dbo].[PAK_SitePkgD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgD_ItemNo] FOREIGN KEY([SerialNo], [PkgNo], [BOMNo], [ItemNo])
REFERENCES [dbo].[PAK_PkgListD] ([SerialNo], [PkgNo], [BOMNo], [ItemNo])
GO
ALTER TABLE [dbo].[PAK_SitePkgD] CHECK CONSTRAINT [FK_PAK_SitePkgD_ItemNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgD_MaterialStatusID] FOREIGN KEY([MaterialStatusID])
REFERENCES [dbo].[VR_MaterialStates] ([MaterialStateID])
GO
ALTER TABLE [dbo].[PAK_SitePkgD] CHECK CONSTRAINT [FK_PAK_SitePkgD_MaterialStatusID]
GO
ALTER TABLE [dbo].[PAK_SitePkgD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgD_PAKTypeID] FOREIGN KEY([PackTypeID])
REFERENCES [dbo].[PAK_PakTypes] ([PackTypeID])
GO
ALTER TABLE [dbo].[PAK_SitePkgD] CHECK CONSTRAINT [FK_PAK_SitePkgD_PAKTypeID]
GO
ALTER TABLE [dbo].[PAK_SitePkgD]  WITH NOCHECK ADD  CONSTRAINT [FK_PAK_SitePkgD_PkgNo] FOREIGN KEY([SerialNo], [PkgNo])
REFERENCES [dbo].[PAK_PkgListH] ([SerialNo], [PkgNo])
GO
ALTER TABLE [dbo].[PAK_SitePkgD] NOCHECK CONSTRAINT [FK_PAK_SitePkgD_PkgNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgD_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[PAK_SitePkgD] CHECK CONSTRAINT [FK_PAK_SitePkgD_ProjectID]
GO
ALTER TABLE [dbo].[PAK_SitePkgD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgD_RecNo] FOREIGN KEY([ProjectID], [RecNo])
REFERENCES [dbo].[PAK_SitePkgH] ([ProjectID], [RecNo])
GO
ALTER TABLE [dbo].[PAK_SitePkgD] CHECK CONSTRAINT [FK_PAK_SitePkgD_RecNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgD_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[PAK_PO] ([SerialNo])
GO
ALTER TABLE [dbo].[PAK_SitePkgD] CHECK CONSTRAINT [FK_PAK_SitePkgD_SerialNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgD]  WITH NOCHECK ADD  CONSTRAINT [FK_PAK_SitePkgD_SiteMarkNo] FOREIGN KEY([ProjectID], [SiteMarkNo])
REFERENCES [dbo].[PAK_SiteItemMaster] ([ProjectID], [SiteMarkNo])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[PAK_SitePkgD] NOCHECK CONSTRAINT [FK_PAK_SitePkgD_SiteMarkNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgD_UOMPack] FOREIGN KEY([UOMPack])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_SitePkgD] CHECK CONSTRAINT [FK_PAK_SitePkgD_UOMPack]
GO
ALTER TABLE [dbo].[PAK_SitePkgD]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgD_UOMQuantity] FOREIGN KEY([UOMQuantity])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_SitePkgD] CHECK CONSTRAINT [FK_PAK_SitePkgD_UOMQuantity]
GO
ALTER TABLE [dbo].[PAK_SitePkgD] ADD  CONSTRAINT [DF_PAK_SitePkgD_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PAK_SitePkgD] ADD  CONSTRAINT [DF_PAK_SitePkgD_PackLength]  DEFAULT ((0)) FOR [PackLength]
GO
ALTER TABLE [dbo].[PAK_SitePkgD] ADD  CONSTRAINT [DF_PAK_SitePkgD_PackWidth]  DEFAULT ((0)) FOR [PackWidth]
GO
ALTER TABLE [dbo].[PAK_SitePkgD] ADD  CONSTRAINT [DF_PAK_SitePkgD_PackHeight]  DEFAULT ((0)) FOR [PackHeight]
GO
ALTER TABLE [dbo].[PAK_SitePkgD] ADD  CONSTRAINT [DF_PAK_SitePkgD_DocumentReceived]  DEFAULT ((1)) FOR [DocumentReceived]
GO
ALTER TABLE [dbo].[PAK_SitePkgD] ADD  CONSTRAINT [DF_PAK_SitePkgD_NotFromPackingList]  DEFAULT ((0)) FOR [NotFromPackingList]
GO
ALTER TABLE [dbo].[PAK_SitePkgD] ADD  CONSTRAINT [DF_PAK_SitePkgD_OnlyPackageReceived]  DEFAULT ((1)) FOR [OnlyPackageReceived]
GO
ALTER TABLE [dbo].[PAK_SitePkgD] ADD  CONSTRAINT [DF_PAK_SitePkgD_PackHeight1]  DEFAULT ((0)) FOR [TotalWeight]
GO
