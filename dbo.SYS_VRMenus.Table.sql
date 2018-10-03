USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_VRMenus](
	[VRMenuID] [int] IDENTITY(1,1) NOT NULL,
	[VRMenuName] [nvarchar](50) NOT NULL,
	[ToolTip] [nvarchar](100) NOT NULL,
	[ParentVRMenuID] [int] NULL,
	[VRMenuType] [nchar](1) NOT NULL,
	[CSSClass] [nvarchar](20) NOT NULL,
	[Sequence] [int] NOT NULL,
	[ApplicationID] [int] NOT NULL,
 CONSTRAINT [PK_SYS_VRMenu] PRIMARY KEY CLUSTERED 
(
	[VRMenuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SYS_VRMenus', @level2type=N'COLUMN',@level2name=N'VRMenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SYS_VRMenus', @level2type=N'COLUMN',@level2name=N'VRMenuName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SYS_VRMenus', @level2type=N'COLUMN',@level2name=N'ToolTip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SYS_VRMenus', @level2type=N'COLUMN',@level2name=N'ParentVRMenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SYS_VRMenus', @level2type=N'COLUMN',@level2name=N'VRMenuType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SYS_VRMenus', @level2type=N'COLUMN',@level2name=N'CSSClass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SYS_VRMenus', @level2type=N'COLUMN',@level2name=N'Sequence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SYS_VRMenus'
GO
ALTER TABLE [dbo].[SYS_VRMenus]  WITH CHECK ADD  CONSTRAINT [FK_SYS_VRMenus_SYS_Applications] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[SYS_Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[SYS_VRMenus] CHECK CONSTRAINT [FK_SYS_VRMenus_SYS_Applications]
GO
ALTER TABLE [dbo].[SYS_VRMenus] ADD  CONSTRAINT [DF_PMS_Menu_MenuName]  DEFAULT ('') FOR [VRMenuName]
GO
ALTER TABLE [dbo].[SYS_VRMenus] ADD  CONSTRAINT [DF_PMS_Menu_ToolTip]  DEFAULT ('') FOR [ToolTip]
GO
ALTER TABLE [dbo].[SYS_VRMenus] ADD  CONSTRAINT [DF_PMS_Menu_ParentMenuID]  DEFAULT ((0)) FOR [ParentVRMenuID]
GO
ALTER TABLE [dbo].[SYS_VRMenus] ADD  CONSTRAINT [DF_PMS_Menu_MenuType]  DEFAULT ('A') FOR [VRMenuType]
GO
ALTER TABLE [dbo].[SYS_VRMenus] ADD  CONSTRAINT [DF_PMS_VRMenu_CSSClass]  DEFAULT ('') FOR [CSSClass]
GO
ALTER TABLE [dbo].[SYS_VRMenus] ADD  CONSTRAINT [DF_PMS_Menu_Sequence]  DEFAULT ((0)) FOR [Sequence]
GO
