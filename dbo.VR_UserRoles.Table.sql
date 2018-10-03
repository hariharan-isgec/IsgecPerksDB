USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_UserRoles](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](8) NOT NULL,
	[DivisionID] [nvarchar](6) NOT NULL,
	[RoleID] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_VR_UserRoles] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VR_UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_VR_UserRoles_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_UserRoles] CHECK CONSTRAINT [FK_VR_UserRoles_UserID]
GO
ALTER TABLE [dbo].[VR_UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_VR_UserRoles_VR_DivisionID] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[VR_UserRoles] CHECK CONSTRAINT [FK_VR_UserRoles_VR_DivisionID]
GO
