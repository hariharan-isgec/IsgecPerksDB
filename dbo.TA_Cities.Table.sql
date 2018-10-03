USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_Cities](
	[CityID] [nvarchar](30) NOT NULL,
	[CityName] [nvarchar](80) NULL,
	[CityTypeForDA] [nvarchar](6) NULL,
	[CityTypeForHotel] [nvarchar](6) NULL,
	[CountryID] [nvarchar](30) NULL,
	[RegionID] [nvarchar](10) NULL,
	[CurrencyID] [nvarchar](6) NULL,
	[RegionTypeID] [nvarchar](10) NULL,
 CONSTRAINT [PK_TA_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_Cities]  WITH CHECK ADD  CONSTRAINT [FK_TA_Cities_CityTypeDA] FOREIGN KEY([CityTypeForDA])
REFERENCES [dbo].[TA_CityTypes] ([CityTypeID])
GO
ALTER TABLE [dbo].[TA_Cities] CHECK CONSTRAINT [FK_TA_Cities_CityTypeDA]
GO
ALTER TABLE [dbo].[TA_Cities]  WITH CHECK ADD  CONSTRAINT [FK_TA_Cities_CityTypeHotel] FOREIGN KEY([CityTypeForHotel])
REFERENCES [dbo].[TA_CityTypes] ([CityTypeID])
GO
ALTER TABLE [dbo].[TA_Cities] CHECK CONSTRAINT [FK_TA_Cities_CityTypeHotel]
GO
ALTER TABLE [dbo].[TA_Cities]  WITH CHECK ADD  CONSTRAINT [FK_TA_Cities_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[TA_Countries] ([CountryID])
GO
ALTER TABLE [dbo].[TA_Cities] CHECK CONSTRAINT [FK_TA_Cities_CountryID]
GO
ALTER TABLE [dbo].[TA_Cities]  WITH CHECK ADD  CONSTRAINT [FK_TA_Cities_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[TA_Cities] CHECK CONSTRAINT [FK_TA_Cities_CurrencyID]
GO
ALTER TABLE [dbo].[TA_Cities]  WITH CHECK ADD  CONSTRAINT [FK_TA_Cities_RegionID] FOREIGN KEY([RegionID])
REFERENCES [dbo].[TA_Regions] ([RegionID])
GO
ALTER TABLE [dbo].[TA_Cities] CHECK CONSTRAINT [FK_TA_Cities_RegionID]
GO
ALTER TABLE [dbo].[TA_Cities]  WITH CHECK ADD  CONSTRAINT [FK_TA_Cities_RegionTypeID] FOREIGN KEY([RegionTypeID])
REFERENCES [dbo].[TA_RegionTypes] ([RegionTypeID])
GO
ALTER TABLE [dbo].[TA_Cities] CHECK CONSTRAINT [FK_TA_Cities_RegionTypeID]
GO
