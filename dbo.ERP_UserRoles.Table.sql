USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ERP_UserRoles](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[RequesterID] [nvarchar](8) NOT NULL,
	[ApproverID] [nvarchar](8) NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_ERP_UserRoles] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ERP_UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_ERP_UserRoles_ApproverID] FOREIGN KEY([ApproverID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ERP_UserRoles] CHECK CONSTRAINT [FK_ERP_UserRoles_ApproverID]
GO
ALTER TABLE [dbo].[ERP_UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_ERP_UserRoles_RequesterID] FOREIGN KEY([RequesterID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[ERP_UserRoles] CHECK CONSTRAINT [FK_ERP_UserRoles_RequesterID]
GO
ALTER TABLE [dbo].[ERP_UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_ERP_UserRoles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[ERP_Roles] ([RoleID])
GO
ALTER TABLE [dbo].[ERP_UserRoles] CHECK CONSTRAINT [FK_ERP_UserRoles_RoleID]
GO
