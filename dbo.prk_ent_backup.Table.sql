USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prk_ent_backup](
	[EntitlementID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[PerkID] [int] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[FinYear] [int] NOT NULL,
	[Value] [decimal](10, 2) NOT NULL,
	[UOM] [nvarchar](5) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[PostedAt] [nvarchar](20) NOT NULL,
	[VehicleType] [nvarchar](20) NOT NULL,
	[Basic] [decimal](10, 2) NOT NULL,
	[ESI] [bit] NOT NULL
) ON [PRIMARY]
GO
