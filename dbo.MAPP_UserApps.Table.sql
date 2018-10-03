USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAPP_UserApps](
	[AppID] [int] NOT NULL,
	[UserID] [nvarchar](8) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_MAPP_UserApps] PRIMARY KEY CLUSTERED 
(
	[AppID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MAPP_UserApps]  WITH CHECK ADD  CONSTRAINT [FK_MAPP_UserApps_ApplID] FOREIGN KEY([AppID])
REFERENCES [dbo].[MAPP_Applications] ([AppID])
GO
ALTER TABLE [dbo].[MAPP_UserApps] CHECK CONSTRAINT [FK_MAPP_UserApps_ApplID]
GO
ALTER TABLE [dbo].[MAPP_UserApps]  WITH CHECK ADD  CONSTRAINT [FK_MAPP_UserApps_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[MAPP_UserApps] CHECK CONSTRAINT [FK_MAPP_UserApps_UserID]
GO
ALTER TABLE [dbo].[MAPP_UserApps] ADD  CONSTRAINT [DF_MAPP_UserApps_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO