USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_PunchLocationsByOffice](
	[OfficeID] [int] NOT NULL,
	[AllowedPunchLocation] [int] NOT NULL,
 CONSTRAINT [PK_ATN_PunchLocationsByOffice] PRIMARY KEY CLUSTERED 
(
	[OfficeID] ASC,
	[AllowedPunchLocation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_PunchLocationsByOffice]  WITH CHECK ADD  CONSTRAINT [FK_LOC_Location] FOREIGN KEY([AllowedPunchLocation])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[ATN_PunchLocationsByOffice] CHECK CONSTRAINT [FK_LOC_Location]
GO
ALTER TABLE [dbo].[ATN_PunchLocationsByOffice]  WITH CHECK ADD  CONSTRAINT [FK_LOC_Office] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[ATN_PunchLocationsByOffice] CHECK CONSTRAINT [FK_LOC_Office]
GO
