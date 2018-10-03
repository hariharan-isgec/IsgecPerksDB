USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_SiteLocations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationTypeID] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[GPSLocation] [nvarchar](50) NULL,
 CONSTRAINT [PK_PAK_SiteLocations_1] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_SiteLocations]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteLocations_LocationTypeID] FOREIGN KEY([LocationTypeID])
REFERENCES [dbo].[PAK_SiteLocationTypes] ([LocationTypeID])
GO
ALTER TABLE [dbo].[PAK_SiteLocations] CHECK CONSTRAINT [FK_PAK_SiteLocations_LocationTypeID]
GO
