USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_ServiceSheetDetails](
	[SheetID] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[SheetDate] [datetime] NULL,
	[ServiceID] [nvarchar](10) NULL,
	[ScheduleID] [nvarchar](20) NULL,
	[MeasureID] [int] NULL,
	[CheckPointID] [int] NULL,
	[Initiated] [bit] NOT NULL,
	[InitiatedBy] [nvarchar](8) NULL,
	[InitiatedOn] [datetime] NULL,
	[InitiatorRemarks] [nvarchar](100) NULL,
	[Monitored] [bit] NOT NULL,
	[MonitoredBy] [nvarchar](8) NULL,
	[MonitoredOn] [datetime] NULL,
	[MonitorRemarks] [nvarchar](100) NULL,
	[ProblemIdentified] [bit] NOT NULL,
	[ProblemClosed] [bit] NOT NULL,
	[ClosedBy] [nvarchar](8) NULL,
	[ClosedOn] [datetime] NULL,
	[ClosingRemarks] [nvarchar](100) NULL,
	[CPInitiator] [nvarchar](8) NULL,
 CONSTRAINT [PK_ADM_ServiceSheetDetails] PRIMARY KEY CLUSTERED 
(
	[SheetID] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ADM_ServiceSheetDetails] ON [dbo].[ADM_ServiceSheetDetails] 
(
	[SheetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ServiceSheetDetails_ADM_CheckPoints] FOREIGN KEY([CheckPointID])
REFERENCES [dbo].[ADM_CheckPoints] ([CheckPointID])
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails] CHECK CONSTRAINT [FK_ADM_ServiceSheetDetails_ADM_CheckPoints]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ServiceSheetDetails_ADM_Schedules] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[ADM_Schedules] ([ScheduleID])
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails] CHECK CONSTRAINT [FK_ADM_ServiceSheetDetails_ADM_Schedules]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ServiceSheetDetails_ADM_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[ADM_Services] ([ServiceID])
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails] CHECK CONSTRAINT [FK_ADM_ServiceSheetDetails_ADM_Services]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ServiceSheetDetails_ADM_ServiceSheetDetails] FOREIGN KEY([MeasureID])
REFERENCES [dbo].[ADM_Measures] ([MeasureID])
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails] CHECK CONSTRAINT [FK_ADM_ServiceSheetDetails_ADM_ServiceSheetDetails]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ServiceSheetDetails_ADM_ServiceSheetHeader] FOREIGN KEY([SheetID])
REFERENCES [dbo].[ADM_ServiceSheetHeader] ([SheetID])
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails] CHECK CONSTRAINT [FK_ADM_ServiceSheetDetails_ADM_ServiceSheetHeader]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ServiceSheetDetails_aspnet_Users] FOREIGN KEY([CPInitiator])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails] CHECK CONSTRAINT [FK_ADM_ServiceSheetDetails_aspnet_Users]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails] ADD  CONSTRAINT [DF_ADM_ServiceSheetDetails_Initiated]  DEFAULT ((0)) FOR [Initiated]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails] ADD  CONSTRAINT [DF_ADM_ServiceSheetDetails_Monitored]  DEFAULT ((0)) FOR [Monitored]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails] ADD  CONSTRAINT [DF_ADM_ServiceSheetDetails_ProblemIdentified]  DEFAULT ((0)) FOR [ProblemIdentified]
GO
ALTER TABLE [dbo].[ADM_ServiceSheetDetails] ADD  CONSTRAINT [DF_ADM_ServiceSheetDetails_ProblemClosed]  DEFAULT ((0)) FOR [ProblemClosed]
GO
