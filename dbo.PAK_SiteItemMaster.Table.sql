USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_SiteItemMaster](
	[ProjectID] [nvarchar](6) NOT NULL,
	[SiteMarkNo] [nvarchar](30) NOT NULL,
	[ItemDescription] [nvarchar](100) NULL,
	[UOMQuantity] [int] NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_PAK_SiteItemMaster] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[SiteMarkNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_SiteItemMaster]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteItemMaster_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[PAK_SiteItemMaster] CHECK CONSTRAINT [FK_PAK_SiteItemMaster_ProjectID]
GO
ALTER TABLE [dbo].[PAK_SiteItemMaster]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteItemMaster_UOMQuantity] FOREIGN KEY([UOMQuantity])
REFERENCES [dbo].[PAK_Units] ([UnitID])
GO
ALTER TABLE [dbo].[PAK_SiteItemMaster] CHECK CONSTRAINT [FK_PAK_SiteItemMaster_UOMQuantity]
GO
ALTER TABLE [dbo].[PAK_SiteItemMaster] ADD  CONSTRAINT [DF_PAK_SiteItemMaster_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
