USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_VRMenuByVRRole](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[VRRoleID] [int] NOT NULL,
	[VRMenuID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[ApplicationID] [int] NOT NULL,
 CONSTRAINT [PK_SYS_VRMenuByVRRole] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SYS_VRMenuByVRRole]  WITH CHECK ADD  CONSTRAINT [FK_SYS_VRMenuByVRRole_SYS_Applications] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[SYS_Applications] ([ApplicationID])
GO
ALTER TABLE [dbo].[SYS_VRMenuByVRRole] CHECK CONSTRAINT [FK_SYS_VRMenuByVRRole_SYS_Applications]
GO
ALTER TABLE [dbo].[SYS_VRMenuByVRRole]  WITH CHECK ADD  CONSTRAINT [FK_SYS_VRMenuByVRRole_SYS_VRMenus] FOREIGN KEY([VRMenuID])
REFERENCES [dbo].[SYS_VRMenus] ([VRMenuID])
GO
ALTER TABLE [dbo].[SYS_VRMenuByVRRole] CHECK CONSTRAINT [FK_SYS_VRMenuByVRRole_SYS_VRMenus]
GO
ALTER TABLE [dbo].[SYS_VRMenuByVRRole]  WITH CHECK ADD  CONSTRAINT [FK_SYS_VRMenuByVRRole_SYS_VRRoles] FOREIGN KEY([VRRoleID])
REFERENCES [dbo].[SYS_VRRoles] ([VRRoleID])
GO
ALTER TABLE [dbo].[SYS_VRMenuByVRRole] CHECK CONSTRAINT [FK_SYS_VRMenuByVRRole_SYS_VRRoles]
GO