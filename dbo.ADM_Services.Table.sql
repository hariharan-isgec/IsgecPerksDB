USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_Services](
	[ServiceID] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[OfficeID] [int] NULL,
	[ScheduleID] [nvarchar](20) NOT NULL,
	[LastSheetDate] [datetime] NULL,
 CONSTRAINT [PK_ADM_Services] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_Services]  WITH CHECK ADD  CONSTRAINT [FK_ADM_Services_ADM_Schedules] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[ADM_Schedules] ([ScheduleID])
GO
ALTER TABLE [dbo].[ADM_Services] CHECK CONSTRAINT [FK_ADM_Services_ADM_Schedules]
GO
ALTER TABLE [dbo].[ADM_Services]  WITH CHECK ADD  CONSTRAINT [FK_ADM_Services_HRM_Offices] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[ADM_Services] CHECK CONSTRAINT [FK_ADM_Services_HRM_Offices]
GO
ALTER TABLE [dbo].[ADM_Services] ADD  CONSTRAINT [DF_ADM_Services_ScheduleID]  DEFAULT (N'daily') FOR [ScheduleID]
GO
