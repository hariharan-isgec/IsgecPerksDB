USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_UserDBRows](
	[UserID] [nvarchar](8) NOT NULL,
	[DashboardID] [int] NOT NULL,
	[DBRows] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[ActionAllowed] [bit] NOT NULL,
	[UpdateAllowed] [bit] NOT NULL,
	[ReminderOnCount] [bit] NOT NULL,
	[ReminderCountThreshold] [int] NOT NULL,
	[ReminderCountDBDataID] [int] NULL,
	[ReminderOnAvg] [bit] NOT NULL,
	[ReminderLapsDaysAvg] [int] NOT NULL,
	[ReminderAvgDBDataID] [int] NULL,
	[ReminderOnMax] [bit] NOT NULL,
	[ReminderLapsDaysMax] [int] NOT NULL,
	[ReminderMaxDBDataID] [int] NULL,
	[ReminderFrequencyDays] [int] NOT NULL,
	[RunDate] [datetime] NULL,
	[NextRunDate] [datetime] NULL,
 CONSTRAINT [PK_WF_UserDBRows] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[DashboardID] ASC,
	[DBRows] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WF_UserDBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_UserDBRows_DBRows] FOREIGN KEY([DashboardID], [DBRows])
REFERENCES [dbo].[WF_DBRows] ([DashboardID], [DBRows])
GO
ALTER TABLE [dbo].[WF_UserDBRows] CHECK CONSTRAINT [FK_WF_UserDBRows_DBRows]
GO
ALTER TABLE [dbo].[WF_UserDBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_UserDBRows_ReminderAvgDBDataID] FOREIGN KEY([ReminderAvgDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_UserDBRows] CHECK CONSTRAINT [FK_WF_UserDBRows_ReminderAvgDBDataID]
GO
ALTER TABLE [dbo].[WF_UserDBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_UserDBRows_ReminderCountDBDataID] FOREIGN KEY([ReminderCountDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_UserDBRows] CHECK CONSTRAINT [FK_WF_UserDBRows_ReminderCountDBDataID]
GO
ALTER TABLE [dbo].[WF_UserDBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_UserDBRows_ReminderMaxDBDataID] FOREIGN KEY([ReminderMaxDBDataID])
REFERENCES [dbo].[WF_DBData] ([DBDataID])
GO
ALTER TABLE [dbo].[WF_UserDBRows] CHECK CONSTRAINT [FK_WF_UserDBRows_ReminderMaxDBDataID]
GO
ALTER TABLE [dbo].[WF_UserDBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_UserDBRows_UserDashboard] FOREIGN KEY([UserID], [DashboardID])
REFERENCES [dbo].[WF_UserDashboards] ([UserID], [DashboardID])
GO
ALTER TABLE [dbo].[WF_UserDBRows] CHECK CONSTRAINT [FK_WF_UserDBRows_UserDashboard]
GO
ALTER TABLE [dbo].[WF_UserDBRows]  WITH CHECK ADD  CONSTRAINT [FK_WF_UserDBRows_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[WF_UserDBRows] CHECK CONSTRAINT [FK_WF_UserDBRows_UserID]
GO
ALTER TABLE [dbo].[WF_UserDBRows] ADD  CONSTRAINT [DF_WF_UserDBRows_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[WF_UserDBRows] ADD  CONSTRAINT [DF_WF_UserDBRows_ActionAllowed]  DEFAULT ((0)) FOR [ActionAllowed]
GO
ALTER TABLE [dbo].[WF_UserDBRows] ADD  CONSTRAINT [DF_WF_UserDBRows_UpdateAllowed]  DEFAULT ((0)) FOR [UpdateAllowed]
GO
ALTER TABLE [dbo].[WF_UserDBRows] ADD  CONSTRAINT [DF_WF_UserDBRows_ReminderOnCount_1]  DEFAULT ((0)) FOR [ReminderOnCount]
GO
ALTER TABLE [dbo].[WF_UserDBRows] ADD  CONSTRAINT [DF_WF_UserDBRows_ReminderCountThreshold]  DEFAULT ((0)) FOR [ReminderCountThreshold]
GO
ALTER TABLE [dbo].[WF_UserDBRows] ADD  CONSTRAINT [DF_WF_UserDBRows_ReminderOnAvg]  DEFAULT ((0)) FOR [ReminderOnAvg]
GO
ALTER TABLE [dbo].[WF_UserDBRows] ADD  CONSTRAINT [DF_WF_UserDBRows_ReminderLapsDaysAvg_1]  DEFAULT ((0)) FOR [ReminderLapsDaysAvg]
GO
ALTER TABLE [dbo].[WF_UserDBRows] ADD  CONSTRAINT [DF_WF_UserDBRows_ReminderOnMax_1]  DEFAULT ((0)) FOR [ReminderOnMax]
GO
ALTER TABLE [dbo].[WF_UserDBRows] ADD  CONSTRAINT [DF_WF_UserDBRows_ReminderLapsDaysMax_1]  DEFAULT ((0)) FOR [ReminderLapsDaysMax]
GO
ALTER TABLE [dbo].[WF_UserDBRows] ADD  CONSTRAINT [DF_WF_UserDBRows_ReminderFrequencyDays]  DEFAULT ((0)) FOR [ReminderFrequencyDays]
GO
