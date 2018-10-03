USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_OfficeLocation](
	[LocationID] [int] NOT NULL,
	[OfficeID] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_HRM_OfficeLocation] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC,
	[OfficeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_OfficeLocation]  WITH CHECK ADD  CONSTRAINT [FK_HRM_OfficeLocation_LocationID] FOREIGN KEY([LocationID])
REFERENCES [dbo].[HRM_Locations] ([LocationID])
GO
ALTER TABLE [dbo].[HRM_OfficeLocation] CHECK CONSTRAINT [FK_HRM_OfficeLocation_LocationID]
GO
ALTER TABLE [dbo].[HRM_OfficeLocation]  WITH CHECK ADD  CONSTRAINT [FK_HRM_OfficeLocation_OfficeID] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[HRM_OfficeLocation] CHECK CONSTRAINT [FK_HRM_OfficeLocation_OfficeID]
GO
