USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_UserDepartment](
	[UserID] [nvarchar](8) NOT NULL,
	[DepartmentID] [nvarchar](6) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_CT_UserDepartment] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CT_UserDepartment]  WITH NOCHECK ADD  CONSTRAINT [FK_CT_UserDepartment_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CT_UserDepartment] NOCHECK CONSTRAINT [FK_CT_UserDepartment_DepartmentID]
GO
ALTER TABLE [dbo].[CT_UserDepartment]  WITH CHECK ADD  CONSTRAINT [FK_CT_UserDepartment_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[CT_UserDepartment] CHECK CONSTRAINT [FK_CT_UserDepartment_UserID]
GO
ALTER TABLE [dbo].[CT_UserDepartment] ADD  CONSTRAINT [DF_CT_UserDepartment_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
