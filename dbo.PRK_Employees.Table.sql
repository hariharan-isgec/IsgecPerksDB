USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRK_Employees](
	[EmployeeID] [int] NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[EmployeeName] [nvarchar](40) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[PostedAt] [nvarchar](20) NOT NULL,
	[VehicleType] [nvarchar](20) NOT NULL,
	[Basic] [decimal](10, 2) NOT NULL,
	[ESI] [bit] NOT NULL,
	[DOJ] [datetime] NULL,
	[DOR] [datetime] NULL,
	[Department] [nvarchar](30) NULL,
	[Company] [nvarchar](50) NULL,
	[MaintenanceAllowed] [bit] NOT NULL,
	[TWInSalary] [bit] NOT NULL,
	[MobileLimit] [decimal](8, 0) NULL,
	[MobileWithInternet] [bit] NOT NULL,
	[MobileBillPlanID] [int] NULL,
	[LandlineLimit] [decimal](8, 0) NULL,
	[MobileNo] [nvarchar](10) NULL,
	[LandlineNo] [nvarchar](20) NULL,
	[VehicleOwnedByEmployee] [bit] NOT NULL,
	[WithDriver] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_PRK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRK_Employees]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Employees_MobileBillPlanID] FOREIGN KEY([MobileBillPlanID])
REFERENCES [dbo].[PRK_MobileBillPlans] ([MobileBillPlanID])
GO
ALTER TABLE [dbo].[PRK_Employees] CHECK CONSTRAINT [FK_PRK_Employees_MobileBillPlanID]
GO
ALTER TABLE [dbo].[PRK_Employees]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Employees_PRK_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[PRK_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[PRK_Employees] CHECK CONSTRAINT [FK_PRK_Employees_PRK_Categories]
GO
ALTER TABLE [dbo].[PRK_Employees] ADD  CONSTRAINT [DF_PRK_Employees_CardNo]  DEFAULT ('') FOR [CardNo]
GO
ALTER TABLE [dbo].[PRK_Employees] ADD  CONSTRAINT [DF_PRK_Employees_EmployeeName]  DEFAULT ('') FOR [EmployeeName]
GO
ALTER TABLE [dbo].[PRK_Employees] ADD  CONSTRAINT [DF_PRK_Employees_CategoryID]  DEFAULT ((1)) FOR [CategoryID]
GO
ALTER TABLE [dbo].[PRK_Employees] ADD  CONSTRAINT [DF_PRK_Employees_PostedAt]  DEFAULT ('Office') FOR [PostedAt]
GO
ALTER TABLE [dbo].[PRK_Employees] ADD  CONSTRAINT [DF_PRK_Employees_VehicleType]  DEFAULT ('None') FOR [VehicleType]
GO
ALTER TABLE [dbo].[PRK_Employees] ADD  CONSTRAINT [DF_PRK_Employees_Basic]  DEFAULT ((0)) FOR [Basic]
GO
ALTER TABLE [dbo].[PRK_Employees] ADD  CONSTRAINT [DF_PRK_Employees_ESI]  DEFAULT ((0)) FOR [ESI]
GO
ALTER TABLE [dbo].[PRK_Employees] ADD  CONSTRAINT [DF_PRK_Employees_MaintenanceAllowed]  DEFAULT ((1)) FOR [MaintenanceAllowed]
GO
ALTER TABLE [dbo].[PRK_Employees] ADD  CONSTRAINT [DF_PRK_Employees_TWInSalary_1]  DEFAULT ((0)) FOR [TWInSalary]
GO
ALTER TABLE [dbo].[PRK_Employees] ADD  CONSTRAINT [DF_PRK_Employees_MobileWithInternet]  DEFAULT ((0)) FOR [MobileWithInternet]
GO
ALTER TABLE [dbo].[PRK_Employees] ADD  CONSTRAINT [DF_PRK_Employees_VehicleOwnedByEmployee]  DEFAULT ((1)) FOR [VehicleOwnedByEmployee]
GO
ALTER TABLE [dbo].[PRK_Employees] ADD  CONSTRAINT [DF_PRK_Employees_WithDriver]  DEFAULT ((0)) FOR [WithDriver]
GO
ALTER TABLE [dbo].[PRK_Employees] ADD  CONSTRAINT [DF_PRK_Employees_Active]  DEFAULT ((0)) FOR [Active]
GO
