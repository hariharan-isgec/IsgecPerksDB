USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_SitePkgDLocation](
	[ProjectID] [nvarchar](6) NOT NULL,
	[RecNo] [int] NOT NULL,
	[RecSrNo] [int] NOT NULL,
	[RecSrLNo] [int] IDENTITY(1,1) NOT NULL,
	[SerialNo] [int] NOT NULL,
	[PkgNo] [int] NOT NULL,
	[BOMNo] [int] NOT NULL,
	[ItemNo] [int] NOT NULL,
	[SiteMarkNo] [nvarchar](30) NULL,
	[LocationID] [int] NULL,
	[UOMQuantity] [int] NULL,
	[Quantity] [decimal](18, 4) NOT NULL,
	[Remarks] [nvarchar](100) NULL,
	[Support] [bit] NOT NULL,
 CONSTRAINT [PK_PAK_SitePkgDLocation] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[RecNo] ASC,
	[RecSrNo] ASC,
	[RecSrLNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgDLocation_ItemNo] FOREIGN KEY([SerialNo], [PkgNo], [BOMNo], [ItemNo])
REFERENCES [dbo].[PAK_PkgListD] ([SerialNo], [PkgNo], [BOMNo], [ItemNo])
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation] CHECK CONSTRAINT [FK_PAK_SitePkgDLocation_ItemNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgDLocation_LocationID] FOREIGN KEY([LocationID])
REFERENCES [dbo].[PAK_SiteLocations] ([LocationID])
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation] CHECK CONSTRAINT [FK_PAK_SitePkgDLocation_LocationID]
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgDLocation_PkgNo] FOREIGN KEY([SerialNo], [PkgNo])
REFERENCES [dbo].[PAK_PkgListH] ([SerialNo], [PkgNo])
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation] CHECK CONSTRAINT [FK_PAK_SitePkgDLocation_PkgNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgDLocation_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation] CHECK CONSTRAINT [FK_PAK_SitePkgDLocation_ProjectID]
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgDLocation_RecNo] FOREIGN KEY([ProjectID], [RecNo])
REFERENCES [dbo].[PAK_SitePkgH] ([ProjectID], [RecNo])
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation] CHECK CONSTRAINT [FK_PAK_SitePkgDLocation_RecNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgDLocation_RecSrNo] FOREIGN KEY([ProjectID], [RecNo], [RecSrNo])
REFERENCES [dbo].[PAK_SitePkgD] ([ProjectID], [RecNo], [RecSrNo])
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation] CHECK CONSTRAINT [FK_PAK_SitePkgDLocation_RecSrNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgDLocation_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[PAK_PO] ([SerialNo])
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation] CHECK CONSTRAINT [FK_PAK_SitePkgDLocation_SerialNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_PAK_SitePkgDLocation_SiteMarkNo] FOREIGN KEY([ProjectID], [SiteMarkNo])
REFERENCES [dbo].[PAK_SiteItemMaster] ([ProjectID], [SiteMarkNo])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation] NOCHECK CONSTRAINT [FK_PAK_SitePkgDLocation_SiteMarkNo]
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SitePkgDLocation_UOMQuantity] FOREIGN KEY([UOMQuantity])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation] CHECK CONSTRAINT [FK_PAK_SitePkgDLocation_UOMQuantity]
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation] ADD  CONSTRAINT [DF_PAK_SitePkgDLocation_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PAK_SitePkgDLocation] ADD  CONSTRAINT [DF_PAK_SitePkgDLocation_Support]  DEFAULT ((0)) FOR [Support]
GO
