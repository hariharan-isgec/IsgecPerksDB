USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_VRSessionByVRMenu](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[VRMenuID] [int] NOT NULL,
	[VRSessionID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[MaintainGrid] [bit] NOT NULL,
	[InsertForm] [bit] NOT NULL,
	[UpdateForm] [bit] NOT NULL,
	[DisplayGrid] [bit] NOT NULL,
	[DisplayForm] [bit] NOT NULL,
	[DeleteOption] [bit] NOT NULL,
 CONSTRAINT [PK_SYS_SessionsByMenu] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SYS_VRSessionByVRMenu', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SYS_VRSessionByVRMenu', @level2type=N'COLUMN',@level2name=N'VRMenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SYS_VRSessionByVRMenu', @level2type=N'COLUMN',@level2name=N'VRSessionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SYS_VRSessionByVRMenu', @level2type=N'COLUMN',@level2name=N'Sequence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SYS_VRSessionByVRMenu'
GO
ALTER TABLE [dbo].[SYS_VRSessionByVRMenu]  WITH CHECK ADD  CONSTRAINT [FK_SYS_SessionsByMenu_SYS_Menu] FOREIGN KEY([VRMenuID])
REFERENCES [dbo].[SYS_VRMenus] ([VRMenuID])
GO
ALTER TABLE [dbo].[SYS_VRSessionByVRMenu] CHECK CONSTRAINT [FK_SYS_SessionsByMenu_SYS_Menu]
GO
ALTER TABLE [dbo].[SYS_VRSessionByVRMenu]  WITH CHECK ADD  CONSTRAINT [FK_SYS_SessionsByMenu_SYS_SessionMaster] FOREIGN KEY([VRSessionID])
REFERENCES [dbo].[SYS_VRSessions] ([VRSessionID])
GO
ALTER TABLE [dbo].[SYS_VRSessionByVRMenu] CHECK CONSTRAINT [FK_SYS_SessionsByMenu_SYS_SessionMaster]
GO
ALTER TABLE [dbo].[SYS_VRSessionByVRMenu]  WITH CHECK ADD  CONSTRAINT [FK_SYS_VRSessionByVRMenu_SYS_Applications] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[SYS_Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[SYS_VRSessionByVRMenu] CHECK CONSTRAINT [FK_SYS_VRSessionByVRMenu_SYS_Applications]
GO
ALTER TABLE [dbo].[SYS_VRSessionByVRMenu] ADD  CONSTRAINT [DF_PMS_SessionsByMenu_Sequence]  DEFAULT ((0)) FOR [Sequence]
GO
ALTER TABLE [dbo].[SYS_VRSessionByVRMenu] ADD  CONSTRAINT [DF_SYS_VRSessionByVRMenu_MaintainGrid]  DEFAULT ((0)) FOR [MaintainGrid]
GO
ALTER TABLE [dbo].[SYS_VRSessionByVRMenu] ADD  CONSTRAINT [DF_SYS_VRSessionByVRMenu_InsertForm]  DEFAULT ((0)) FOR [InsertForm]
GO
ALTER TABLE [dbo].[SYS_VRSessionByVRMenu] ADD  CONSTRAINT [DF_SYS_VRSessionByVRMenu_UpdateForm]  DEFAULT ((0)) FOR [UpdateForm]
GO
ALTER TABLE [dbo].[SYS_VRSessionByVRMenu] ADD  CONSTRAINT [DF_SYS_VRSessionByVRMenu_DisplayGrid]  DEFAULT ((0)) FOR [DisplayGrid]
GO
ALTER TABLE [dbo].[SYS_VRSessionByVRMenu] ADD  CONSTRAINT [DF_SYS_VRSessionByVRMenu_DisplayForm]  DEFAULT ((0)) FOR [DisplayForm]
GO
ALTER TABLE [dbo].[SYS_VRSessionByVRMenu] ADD  CONSTRAINT [DF_SYS_VRSessionByVRMenu_DeleteOption]  DEFAULT ((0)) FOR [DeleteOption]
GO
