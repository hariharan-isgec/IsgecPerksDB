USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_Departments](
	[DepartmentID] [nvarchar](6) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[DepartmentHead] [nvarchar](8) NULL,
	[BusinessHead] [nvarchar](8) NULL,
	[Logistic_Company] [nvarchar](10) NULL,
	[Finance_Company] [nvarchar](10) NULL,
 CONSTRAINT [PK_HRM_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_Departments]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Departments_BusinessHead] FOREIGN KEY([BusinessHead])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Departments] CHECK CONSTRAINT [FK_HRM_Departments_BusinessHead]
GO
ALTER TABLE [dbo].[HRM_Departments]  WITH CHECK ADD  CONSTRAINT [FK_HRM_Departments_DepartmentHead] FOREIGN KEY([DepartmentHead])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_Departments] CHECK CONSTRAINT [FK_HRM_Departments_DepartmentHead]
GO
ALTER TABLE [dbo].[HRM_Departments] ADD  CONSTRAINT [DF_HRM_Departments_Description]  DEFAULT ('') FOR [Description]
GO
