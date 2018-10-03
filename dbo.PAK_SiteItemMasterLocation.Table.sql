USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_SiteItemMasterLocation](
	[ProjectID] [nvarchar](6) NOT NULL,
	[SiteMarkNo] [nvarchar](30) NOT NULL,
	[LocationID] [int] NOT NULL,
	[UOMQuantity] [int] NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_PAK_SiteItemMasterLocation_1] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[SiteMarkNo] ASC,
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_SiteItemMasterLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteItemMasterLocation_LocationID] FOREIGN KEY([LocationID])
REFERENCES [dbo].[PAK_SiteLocations] ([LocationID])
GO
ALTER TABLE [dbo].[PAK_SiteItemMasterLocation] CHECK CONSTRAINT [FK_PAK_SiteItemMasterLocation_LocationID]
GO
ALTER TABLE [dbo].[PAK_SiteItemMasterLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteItemMasterLocation_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[PAK_SiteItemMasterLocation] CHECK CONSTRAINT [FK_PAK_SiteItemMasterLocation_ProjectID]
GO
ALTER TABLE [dbo].[PAK_SiteItemMasterLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteItemMasterLocation_SiteMarkNo] FOREIGN KEY([ProjectID], [SiteMarkNo])
REFERENCES [dbo].[PAK_SiteItemMaster] ([ProjectID], [SiteMarkNo])
GO
ALTER TABLE [dbo].[PAK_SiteItemMasterLocation] CHECK CONSTRAINT [FK_PAK_SiteItemMasterLocation_SiteMarkNo]
GO
ALTER TABLE [dbo].[PAK_SiteItemMasterLocation]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteItemMasterLocation_UOMQuantity] FOREIGN KEY([UOMQuantity])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_SiteItemMasterLocation] CHECK CONSTRAINT [FK_PAK_SiteItemMasterLocation_UOMQuantity]
GO
ALTER TABLE [dbo].[PAK_SiteItemMasterLocation] ADD  CONSTRAINT [DF_PAK_SiteItemMasterLocation_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
