USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_VRSessions](
	[VRSessionID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[FolderLocation] [nvarchar](250) NOT NULL,
	[VRMenuName] [nvarchar](50) NOT NULL,
	[ToolTip] [nvarchar](100) NOT NULL,
	[VRSessionType] [nchar](1) NOT NULL,
	[CSSClass] [nvarchar](30) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[MaintainGrid] [bit] NOT NULL,
	[InsertForm] [bit] NOT NULL,
	[UpdateForm] [bit] NOT NULL,
	[DisplayGrid] [bit] NOT NULL,
	[DisplayForm] [bit] NOT NULL,
	[DeleteOption] [bit] NOT NULL,
 CONSTRAINT [PK_SYS_Sessions] PRIMARY KEY CLUSTERED 
(
	[VRSessionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SYS_VRSessions]  WITH CHECK ADD  CONSTRAINT [FK_SYS_VRSessions_SYS_Applications] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[SYS_Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[SYS_VRSessions] CHECK CONSTRAINT [FK_SYS_VRSessions_SYS_Applications]
GO
ALTER TABLE [dbo].[SYS_VRSessions] ADD  CONSTRAINT [DF_SYS_Sessions_FileName]  DEFAULT ('') FOR [FileName]
GO
ALTER TABLE [dbo].[SYS_VRSessions] ADD  CONSTRAINT [DF_SYS_Sessions_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[SYS_VRSessions] ADD  CONSTRAINT [DF_SYS_Sessions_FolderLocation]  DEFAULT ('') FOR [FolderLocation]
GO
ALTER TABLE [dbo].[SYS_VRSessions] ADD  CONSTRAINT [DF_SYS_Sessions_MenuName]  DEFAULT ('') FOR [VRMenuName]
GO
ALTER TABLE [dbo].[SYS_VRSessions] ADD  CONSTRAINT [DF_SYS_Sessions_ToolTip]  DEFAULT ('') FOR [ToolTip]
GO
ALTER TABLE [dbo].[SYS_VRSessions] ADD  CONSTRAINT [DF_SYS_Sessions_SessionType]  DEFAULT ('M') FOR [VRSessionType]
GO
ALTER TABLE [dbo].[SYS_VRSessions] ADD  CONSTRAINT [DF_SYS_Sessions_CSSClass]  DEFAULT ('') FOR [CSSClass]
GO
ALTER TABLE [dbo].[SYS_VRSessions] ADD  CONSTRAINT [DF_SYS_VRSessions_MaintainList]  DEFAULT ((0)) FOR [MaintainGrid]
GO
ALTER TABLE [dbo].[SYS_VRSessions] ADD  CONSTRAINT [DF_SYS_VRSessions_InsertForm]  DEFAULT ((0)) FOR [InsertForm]
GO
ALTER TABLE [dbo].[SYS_VRSessions] ADD  CONSTRAINT [DF_SYS_VRSessions_UpdateForm]  DEFAULT ((0)) FOR [UpdateForm]
GO
ALTER TABLE [dbo].[SYS_VRSessions] ADD  CONSTRAINT [DF_SYS_VRSessions_DisplayGrid]  DEFAULT ((0)) FOR [DisplayGrid]
GO
ALTER TABLE [dbo].[SYS_VRSessions] ADD  CONSTRAINT [DF_SYS_VRSessions_DisplayForm]  DEFAULT ((0)) FOR [DisplayForm]
GO
ALTER TABLE [dbo].[SYS_VRSessions] ADD  CONSTRAINT [DF_SYS_VRSessions_DeleteOption]  DEFAULT ((0)) FOR [DeleteOption]
GO
