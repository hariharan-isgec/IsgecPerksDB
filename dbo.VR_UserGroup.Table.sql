USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_UserGroup](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](8) NULL,
	[GroupID] [int] NULL,
	[RoleID] [nvarchar](20) NULL,
	[OutOfContractApprover] [bit] NOT NULL,
 CONSTRAINT [PK_VR_UserGroup] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VR_UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_VR_UserGroup_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[VR_Groups] ([GroupID])
GO
ALTER TABLE [dbo].[VR_UserGroup] CHECK CONSTRAINT [FK_VR_UserGroup_GroupID]
GO
ALTER TABLE [dbo].[VR_UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_VR_UserGroup_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VR_UserGroup] CHECK CONSTRAINT [FK_VR_UserGroup_UserID]
GO
ALTER TABLE [dbo].[VR_UserGroup] ADD  CONSTRAINT [DF_VR_UserGroup_OutOfContractApprover]  DEFAULT ((0)) FOR [OutOfContractApprover]
GO
