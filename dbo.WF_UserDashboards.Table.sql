USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_UserDashboards](
	[UserID] [nvarchar](8) NOT NULL,
	[DashboardID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[ActionAllowed] [bit] NOT NULL,
	[UpdateAllowed] [bit] NOT NULL,
 CONSTRAINT [PK_WF_UserDashboards] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[DashboardID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WF_UserDashboards]  WITH CHECK ADD  CONSTRAINT [FK_WF_UserDashboards_DashboardID] FOREIGN KEY([DashboardID])
REFERENCES [dbo].[WF_Dashboards] ([DashboardID])
GO
ALTER TABLE [dbo].[WF_UserDashboards] CHECK CONSTRAINT [FK_WF_UserDashboards_DashboardID]
GO
ALTER TABLE [dbo].[WF_UserDashboards]  WITH CHECK ADD  CONSTRAINT [FK_WF_UserDashboards_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[WF_UserDashboards] CHECK CONSTRAINT [FK_WF_UserDashboards_UserID]
GO
ALTER TABLE [dbo].[WF_UserDashboards] ADD  CONSTRAINT [DF_WF_UserDashboards_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[WF_UserDashboards] ADD  CONSTRAINT [DF_WF_UserDashboards_ActionAllowed]  DEFAULT ((0)) FOR [ActionAllowed]
GO
ALTER TABLE [dbo].[WF_UserDashboards] ADD  CONSTRAINT [DF_WF_UserDashboards_UpdateAllowed]  DEFAULT ((0)) FOR [UpdateAllowed]
GO
