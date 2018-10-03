USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_EmployeeEMailGroup](
	[CardNo] [nvarchar](8) NOT NULL,
	[EMailGroup] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HRM_EmployeeEMailGroup] PRIMARY KEY CLUSTERED 
(
	[CardNo] ASC,
	[EMailGroup] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_EmployeeEMailGroup]  WITH CHECK ADD  CONSTRAINT [FK_HRM_EmployeeEMailGroup_HRM_EMailGroups] FOREIGN KEY([EMailGroup])
REFERENCES [dbo].[HRM_EMailGroups] ([EMailGroup])
GO
ALTER TABLE [dbo].[HRM_EmployeeEMailGroup] CHECK CONSTRAINT [FK_HRM_EmployeeEMailGroup_HRM_EMailGroups]
GO
ALTER TABLE [dbo].[HRM_EmployeeEMailGroup]  WITH CHECK ADD  CONSTRAINT [FK_HRM_EmployeeEMailGroup_HRM_Employees] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_EmployeeEMailGroup] CHECK CONSTRAINT [FK_HRM_EmployeeEMailGroup_HRM_Employees]
GO
