USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_CheckPoints](
	[CheckPointID] [int] IDENTITY(1,1) NOT NULL,
	[Descriptions] [nvarchar](50) NOT NULL,
	[ScheduleID] [nvarchar](20) NOT NULL,
	[StartDate] [datetime] NULL,
	[DayOfSchedule] [int] NULL,
	[Floating] [bit] NOT NULL,
	[LastGeneratedOn] [datetime] NULL,
	[LastEntryUpdated] [bit] NOT NULL,
	[LastEntryUpdatedOn] [datetime] NULL,
	[Initiator] [nvarchar](8) NULL,
 CONSTRAINT [PK_ADM_CheckPoints] PRIMARY KEY CLUSTERED 
(
	[CheckPointID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_CheckPoints]  WITH CHECK ADD  CONSTRAINT [FK_ADM_CheckPoints_ADM_Schedules] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[ADM_Schedules] ([ScheduleID])
GO
ALTER TABLE [dbo].[ADM_CheckPoints] CHECK CONSTRAINT [FK_ADM_CheckPoints_ADM_Schedules]
GO
ALTER TABLE [dbo].[ADM_CheckPoints] ADD  CONSTRAINT [DF_ADM_CheckPoints_ScheduleID_1]  DEFAULT (N'daily') FOR [ScheduleID]
GO
ALTER TABLE [dbo].[ADM_CheckPoints] ADD  CONSTRAINT [DF_ADM_CheckPoints_Floating_1]  DEFAULT ((0)) FOR [Floating]
GO
ALTER TABLE [dbo].[ADM_CheckPoints] ADD  CONSTRAINT [DF_ADM_CheckPoints_LastEntryUpdated_1]  DEFAULT ((0)) FOR [LastEntryUpdated]
GO
