USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_VRSessionByEmployee](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[VRSessionID] [int] NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[MaintainGrid] [bit] NOT NULL,
	[InsertForm] [bit] NOT NULL,
	[UpdateForm] [bit] NOT NULL,
	[DisplayGrid] [bit] NOT NULL,
	[DisplayForm] [bit] NOT NULL,
	[DeleteOption] [bit] NOT NULL,
 CONSTRAINT [PK_SYS_SessionByEmployee] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SYS_VRSessionByEmployee]  WITH CHECK ADD  CONSTRAINT [FK_SYS_SessionByEmployee_SYS_Sessions] FOREIGN KEY([VRSessionID])
REFERENCES [dbo].[SYS_VRSessions] ([VRSessionID])
GO
ALTER TABLE [dbo].[SYS_VRSessionByEmployee] CHECK CONSTRAINT [FK_SYS_SessionByEmployee_SYS_Sessions]
GO
ALTER TABLE [dbo].[SYS_VRSessionByEmployee]  WITH CHECK ADD  CONSTRAINT [FK_SYS_VRSessionByEmployee_SYS_Applications] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[SYS_Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[SYS_VRSessionByEmployee] CHECK CONSTRAINT [FK_SYS_VRSessionByEmployee_SYS_Applications]
GO
ALTER TABLE [dbo].[SYS_VRSessionByEmployee] ADD  CONSTRAINT [DF_SYS_VRSessionByEmployee_UserName]  DEFAULT ('') FOR [UserName]
GO
ALTER TABLE [dbo].[SYS_VRSessionByEmployee] ADD  CONSTRAINT [DF_SYS_VRSessionByEmployee_MaintainGrid]  DEFAULT ((0)) FOR [MaintainGrid]
GO
ALTER TABLE [dbo].[SYS_VRSessionByEmployee] ADD  CONSTRAINT [DF_SYS_VRSessionByEmployee_InsertForm]  DEFAULT ((0)) FOR [InsertForm]
GO
ALTER TABLE [dbo].[SYS_VRSessionByEmployee] ADD  CONSTRAINT [DF_SYS_VRSessionByEmployee_UpdateForm]  DEFAULT ((0)) FOR [UpdateForm]
GO
ALTER TABLE [dbo].[SYS_VRSessionByEmployee] ADD  CONSTRAINT [DF_SYS_VRSessionByEmployee_DisplayGrid]  DEFAULT ((0)) FOR [DisplayGrid]
GO
ALTER TABLE [dbo].[SYS_VRSessionByEmployee] ADD  CONSTRAINT [DF_SYS_VRSessionByEmployee_DisplayForm]  DEFAULT ((0)) FOR [DisplayForm]
GO
ALTER TABLE [dbo].[SYS_VRSessionByEmployee] ADD  CONSTRAINT [DF_SYS_VRSessionByEmployee_DeleteOption]  DEFAULT ((0)) FOR [DeleteOption]
GO
