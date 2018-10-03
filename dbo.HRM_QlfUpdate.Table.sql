USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_QlfUpdate](
	[CardNo] [nvarchar](8) NOT NULL,
	[emailid] [nvarchar](100) NULL,
	[DepartmentID] [nvarchar](6) NULL,
	[Qlf1ID] [int] NULL,
	[Qlf1Yr] [nvarchar](4) NULL,
	[Qlf2ID] [int] NULL,
	[Qlf2Yr] [nvarchar](4) NULL,
	[FatherName] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[BloodGroupID] [nvarchar](5) NULL,
	[N_CellNo] [nvarchar](50) NULL,
	[N_Qlf1ID] [int] NULL,
	[N_Qlf1Yr] [nvarchar](4) NULL,
	[Qlf1NotInList] [bit] NOT NULL,
	[Qlf1Specified] [nvarchar](50) NULL,
	[N_Qlf2ID] [int] NULL,
	[N_Qlf2Yr] [nvarchar](4) NULL,
	[Qlf2NotInList] [bit] NOT NULL,
	[Qlf2Specified] [nvarchar](50) NULL,
	[N_FatherName] [nvarchar](50) NULL,
	[N_DateOfBirth] [datetime] NULL,
	[N_BloodGroupID] [nvarchar](5) NULL,
	[uid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Updated] [bit] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[Changed] [bit] NOT NULL,
	[sendmail] [bit] NOT NULL,
 CONSTRAINT [PK_HRM_QlfUpdate] PRIMARY KEY CLUSTERED 
(
	[CardNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_QlfUpdate]  WITH CHECK ADD  CONSTRAINT [FK_HRM_QlfUpdate_HRM_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[HRM_QlfUpdate] CHECK CONSTRAINT [FK_HRM_QlfUpdate_HRM_Departments]
GO
ALTER TABLE [dbo].[HRM_QlfUpdate]  WITH CHECK ADD  CONSTRAINT [FK_HRM_QlfUpdate_HRM_Employees] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[HRM_QlfUpdate] CHECK CONSTRAINT [FK_HRM_QlfUpdate_HRM_Employees]
GO
ALTER TABLE [dbo].[HRM_QlfUpdate]  WITH CHECK ADD  CONSTRAINT [FK_HRM_QlfUpdate_HRM_Qualifications] FOREIGN KEY([Qlf1ID])
REFERENCES [dbo].[HRM_Qualifications] ([QualificationID])
GO
ALTER TABLE [dbo].[HRM_QlfUpdate] CHECK CONSTRAINT [FK_HRM_QlfUpdate_HRM_Qualifications]
GO
ALTER TABLE [dbo].[HRM_QlfUpdate]  WITH CHECK ADD  CONSTRAINT [FK_HRM_QlfUpdate_HRM_Qualifications1] FOREIGN KEY([Qlf2ID])
REFERENCES [dbo].[HRM_Qualifications] ([QualificationID])
GO
ALTER TABLE [dbo].[HRM_QlfUpdate] CHECK CONSTRAINT [FK_HRM_QlfUpdate_HRM_Qualifications1]
GO
ALTER TABLE [dbo].[HRM_QlfUpdate] ADD  CONSTRAINT [DF_HRM_QlfUpdate_NotInList]  DEFAULT ((0)) FOR [Qlf1NotInList]
GO
ALTER TABLE [dbo].[HRM_QlfUpdate] ADD  CONSTRAINT [DF_HRM_QlfUpdate_Qlf1NotInList1]  DEFAULT ((0)) FOR [Qlf2NotInList]
GO
ALTER TABLE [dbo].[HRM_QlfUpdate] ADD  CONSTRAINT [DF_HRM_QlfUpdate_uid]  DEFAULT (newid()) FOR [uid]
GO
ALTER TABLE [dbo].[HRM_QlfUpdate] ADD  CONSTRAINT [DF_HRM_QlfUpdate_Updated]  DEFAULT ((0)) FOR [Updated]
GO
ALTER TABLE [dbo].[HRM_QlfUpdate] ADD  CONSTRAINT [DF_HRM_QlfUpdate_Changed]  DEFAULT ((0)) FOR [Changed]
GO
ALTER TABLE [dbo].[HRM_QlfUpdate] ADD  CONSTRAINT [DF_HRM_QlfUpdate_sendmail]  DEFAULT ((1)) FOR [sendmail]
GO
