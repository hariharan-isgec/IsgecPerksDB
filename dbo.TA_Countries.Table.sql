USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_Countries](
	[CountryID] [nvarchar](30) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
	[RegionID] [nvarchar](10) NULL,
	[CurrencyID] [nvarchar](6) NULL,
	[RegionTypeID] [nvarchar](10) NULL,
	[ContingencyAmount] [int] NOT NULL,
 CONSTRAINT [PK_TA_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_Countries]  WITH CHECK ADD  CONSTRAINT [FK_TA_Countries_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[TA_Countries] CHECK CONSTRAINT [FK_TA_Countries_CurrencyID]
GO
ALTER TABLE [dbo].[TA_Countries]  WITH CHECK ADD  CONSTRAINT [FK_TA_Countries_RegionID] FOREIGN KEY([RegionID])
REFERENCES [dbo].[TA_Regions] ([RegionID])
GO
ALTER TABLE [dbo].[TA_Countries] CHECK CONSTRAINT [FK_TA_Countries_RegionID]
GO
ALTER TABLE [dbo].[TA_Countries]  WITH CHECK ADD  CONSTRAINT [FK_TA_Countries_RegionTypeID] FOREIGN KEY([RegionTypeID])
REFERENCES [dbo].[TA_RegionTypes] ([RegionTypeID])
GO
ALTER TABLE [dbo].[TA_Countries] CHECK CONSTRAINT [FK_TA_Countries_RegionTypeID]
GO
ALTER TABLE [dbo].[TA_Countries] ADD  CONSTRAINT [DF_TA_Countries_ContingencyAmount]  DEFAULT ((0)) FOR [ContingencyAmount]
GO
