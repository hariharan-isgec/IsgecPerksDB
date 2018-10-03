USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_Schedules](
	[ScheduleID] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](20) NOT NULL,
	[FixDate] [bit] NOT NULL,
	[DaysOrDate] [int] NULL,
	[IncludeHolidays] [bit] NOT NULL,
 CONSTRAINT [PK_ADM_Schedules] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_Schedules] ADD  CONSTRAINT [DF_ADM_Schedules_FixDate]  DEFAULT ((0)) FOR [FixDate]
GO
ALTER TABLE [dbo].[ADM_Schedules] ADD  CONSTRAINT [DF_ADM_Schedules_IncludeHolidays]  DEFAULT ((0)) FOR [IncludeHolidays]
GO
