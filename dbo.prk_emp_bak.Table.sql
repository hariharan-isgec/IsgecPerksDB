USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prk_emp_bak](
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
	[Active] [bit] NOT NULL
) ON [PRIMARY]
GO
