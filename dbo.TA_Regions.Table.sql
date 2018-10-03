USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_Regions](
	[RegionID] [nvarchar](10) NOT NULL,
	[RegionName] [nvarchar](50) NULL,
	[RegionTypeID] [nvarchar](10) NOT NULL,
	[CurrencyID] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_TA_Regions] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_Regions]  WITH CHECK ADD  CONSTRAINT [FK_TA_Regions_Currency] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[TA_Regions] CHECK CONSTRAINT [FK_TA_Regions_Currency]
GO
ALTER TABLE [dbo].[TA_Regions]  WITH CHECK ADD  CONSTRAINT [FK_TA_Regions_RegionTypeID] FOREIGN KEY([RegionTypeID])
REFERENCES [dbo].[TA_RegionTypes] ([RegionTypeID])
GO
ALTER TABLE [dbo].[TA_Regions] CHECK CONSTRAINT [FK_TA_Regions_RegionTypeID]
GO
