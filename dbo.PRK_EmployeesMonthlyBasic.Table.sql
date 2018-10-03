USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRK_EmployeesMonthlyBasic](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[SalMonth] [int] NOT NULL,
	[SalYear] [int] NOT NULL,
	[NetBasic] [decimal](10, 2) NOT NULL,
	[FinYear] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[PostedAt] [nvarchar](20) NOT NULL,
	[VehicleType] [nvarchar](20) NOT NULL,
	[ESI] [bit] NOT NULL,
	[ESIAmount] [decimal](10, 2) NOT NULL,
	[MaintenanceAllowed] [bit] NOT NULL,
	[TWInSalary] [bit] NOT NULL,
	[MobileLimit] [decimal](8, 0) NULL,
	[MobileWithInternet] [bit] NOT NULL,
	[MobileBillPlanID] [int] NULL,
	[LandlineLimit] [decimal](8, 0) NULL,
	[MobileNo] [nvarchar](10) NULL,
	[LandlineNo] [nvarchar](20) NULL,
	[WithDriver] [bit] NOT NULL,
 CONSTRAINT [PK_PRK_EmployeesMonthlyBasic_1] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PRK_EmployeesMonthlyBasic] ON [dbo].[PRK_EmployeesMonthlyBasic] 
(
	[EmployeeID] ASC,
	[SalYear] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_PRK_EmployeesMonthlyBasic_1] ON [dbo].[PRK_EmployeesMonthlyBasic] 
(
	[EmployeeID] ASC,
	[SalMonth] ASC,
	[SalYear] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRK_EmployeesMonthlyBasic]  WITH CHECK ADD  CONSTRAINT [FK_PRK_EmployeesMonthlyBasic_MobileBillPlanID] FOREIGN KEY([MobileBillPlanID])
REFERENCES [dbo].[PRK_MobileBillPlans] ([MobileBillPlanID])
GO
ALTER TABLE [dbo].[PRK_EmployeesMonthlyBasic] CHECK CONSTRAINT [FK_PRK_EmployeesMonthlyBasic_MobileBillPlanID]
GO
ALTER TABLE [dbo].[PRK_EmployeesMonthlyBasic]  WITH CHECK ADD  CONSTRAINT [FK_PRK_EmployeesMonthlyBasic_PRK_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[PRK_Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[PRK_EmployeesMonthlyBasic] CHECK CONSTRAINT [FK_PRK_EmployeesMonthlyBasic_PRK_Employees]
GO
ALTER TABLE [dbo].[PRK_EmployeesMonthlyBasic] ADD  CONSTRAINT [DF_PRK_EmployeesMonthlyBasic_CategoryID_1]  DEFAULT ((1)) FOR [CategoryID]
GO
ALTER TABLE [dbo].[PRK_EmployeesMonthlyBasic] ADD  CONSTRAINT [DF_PRK_EmployeesMonthlyBasic_PostedAt_1]  DEFAULT ('Office') FOR [PostedAt]
GO
ALTER TABLE [dbo].[PRK_EmployeesMonthlyBasic] ADD  CONSTRAINT [DF_PRK_EmployeesMonthlyBasic_VehicleType_1]  DEFAULT ('None') FOR [VehicleType]
GO
ALTER TABLE [dbo].[PRK_EmployeesMonthlyBasic] ADD  CONSTRAINT [DF_PRK_EmployeesMonthlyBasic_ESI_1]  DEFAULT ((0)) FOR [ESI]
GO
ALTER TABLE [dbo].[PRK_EmployeesMonthlyBasic] ADD  CONSTRAINT [DF_PRK_EmployeesMonthlyBasic_ESIAmount_1]  DEFAULT ((0)) FOR [ESIAmount]
GO
ALTER TABLE [dbo].[PRK_EmployeesMonthlyBasic] ADD  CONSTRAINT [DF_PRK_EmployeesMonthlyBasic_MaintenanceAllowed_1]  DEFAULT ((1)) FOR [MaintenanceAllowed]
GO
ALTER TABLE [dbo].[PRK_EmployeesMonthlyBasic] ADD  CONSTRAINT [DF_PRK_EmployeesMonthlyBasic_TWInSalary]  DEFAULT ((0)) FOR [TWInSalary]
GO
ALTER TABLE [dbo].[PRK_EmployeesMonthlyBasic] ADD  CONSTRAINT [DF_PRK_EmployeesMonthlyBasic_MobileWithInternet]  DEFAULT ((0)) FOR [MobileWithInternet]
GO
ALTER TABLE [dbo].[PRK_EmployeesMonthlyBasic] ADD  CONSTRAINT [DF_PRK_EmployeesMonthlyBasic_WithDriver]  DEFAULT ((0)) FOR [WithDriver]
GO
