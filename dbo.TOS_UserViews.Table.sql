USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOS_UserViews](
	[UserID] [nvarchar](8) NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[CLPView] [bit] NOT NULL,
	[OTPView] [bit] NOT NULL,
	[CanEnterCLPNotes] [bit] NOT NULL,
	[CanSendCLPAlerts] [bit] NOT NULL,
	[CanCreateCLPRevision] [bit] NOT NULL,
	[CanEnterOTPProgress] [bit] NOT NULL,
	[CanChangePlanning] [bit] NOT NULL,
 CONSTRAINT [PK_TOS_UserViews] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TOS_UserViews]  WITH NOCHECK ADD  CONSTRAINT [FK_TOS_UserViews_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[TOS_Projects] ([ProjectID])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[TOS_UserViews] NOCHECK CONSTRAINT [FK_TOS_UserViews_ProjectID]
GO
ALTER TABLE [dbo].[TOS_UserViews]  WITH CHECK ADD  CONSTRAINT [FK_TOS_UserViews_UseID] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[TOS_UserViews] CHECK CONSTRAINT [FK_TOS_UserViews_UseID]
GO
ALTER TABLE [dbo].[TOS_UserViews] ADD  CONSTRAINT [DF_TOS_UserViews_CLPView]  DEFAULT ((1)) FOR [CLPView]
GO
ALTER TABLE [dbo].[TOS_UserViews] ADD  CONSTRAINT [DF_TOS_UserViews_TaskView]  DEFAULT ((1)) FOR [OTPView]
GO
ALTER TABLE [dbo].[TOS_UserViews] ADD  CONSTRAINT [DF_TOS_UserViews_CanEnterCLPNotes]  DEFAULT ((0)) FOR [CanEnterCLPNotes]
GO
ALTER TABLE [dbo].[TOS_UserViews] ADD  CONSTRAINT [DF_TOS_UserViews_DelayNotification]  DEFAULT ((0)) FOR [CanSendCLPAlerts]
GO
ALTER TABLE [dbo].[TOS_UserViews] ADD  CONSTRAINT [DF_TOS_UserViews_CreateCLPRevision]  DEFAULT ((0)) FOR [CanCreateCLPRevision]
GO
ALTER TABLE [dbo].[TOS_UserViews] ADD  CONSTRAINT [DF_TOS_UserViews_CanEnterOTPProgress]  DEFAULT ((0)) FOR [CanEnterOTPProgress]
GO
ALTER TABLE [dbo].[TOS_UserViews] ADD  CONSTRAINT [DF_TOS_UserViews_CanChangePlanning]  DEFAULT ((0)) FOR [CanChangePlanning]
GO
