USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_ServiceSheetHeader](
	[SheetID] [int] IDENTITY(1,1) NOT NULL,
	[SheetDate] [datetime] NULL,
	[Description] [nvarchar](50) NULL,
	[ServiceID] [nvarchar](10) NULL,
	[ScheduleID] [nvarchar](20) NULL,
	[Initiated] [bit] NOT NULL,
	[Monitored] [bit] NOT NULL,
	[ProblemIdentified] [bit] NOT NULL,
	[Closed] [bit] NOT NULL,
 CONSTRAINT [PK_ADM_ServiceSheetHeader] PRIMARY KEY CLUSTERED 
(
	[SheetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetHeader]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ServiceSheetHeader_ADM_Schedules] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[ADM_Schedules] ([ScheduleID])
GO
ALTER TABLE [dbo].[ADM_ServiceSheetHeader] CHECK CONSTRAINT [FK_ADM_ServiceSheetHeader_ADM_Schedules]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetHeader]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ServiceSheetHeader_ADM_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[ADM_Services] ([ServiceID])
GO
ALTER TABLE [dbo].[ADM_ServiceSheetHeader] CHECK CONSTRAINT [FK_ADM_ServiceSheetHeader_ADM_Services]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetHeader] ADD  CONSTRAINT [DF_ADM_ServiceSheetHeader_Initiated]  DEFAULT ((0)) FOR [Initiated]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetHeader] ADD  CONSTRAINT [DF_ADM_ServiceSheetHeader_ProblemIdentified]  DEFAULT ((0)) FOR [ProblemIdentified]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetHeader] ADD  CONSTRAINT [DF_ADM_ServiceSheetHeader_Closed]  DEFAULT ((0)) FOR [Closed]
GO
