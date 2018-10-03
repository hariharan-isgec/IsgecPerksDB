USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRK_Entitlements](
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
	[ESI] [bit] NOT NULL,
	[WithDriver] [bit] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Selected] [bit] NOT NULL,
	[Paid] [bit] NOT NULL,
 CONSTRAINT [PK_PRK_Entitlements] PRIMARY KEY CLUSTERED 
(
	[EntitlementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PRK_Entitlements] ON [dbo].[PRK_Entitlements] 
(
	[FinYear] ASC,
	[EmployeeID] ASC,
	[PerkID] ASC,
	[EffectiveDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PRK_Entitlements_1] ON [dbo].[PRK_Entitlements] 
(
	[FinYear] ASC,
	[CategoryID] ASC,
	[EffectiveDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PRK_Entitlements_2] ON [dbo].[PRK_Entitlements] 
(
	[EmployeeID] ASC,
	[PerkID] ASC,
	[FinYear] ASC,
	[EffectiveDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRK_Entitlements]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Entitlements_PRK_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[PRK_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[PRK_Entitlements] CHECK CONSTRAINT [FK_PRK_Entitlements_PRK_Categories]
GO
ALTER TABLE [dbo].[PRK_Entitlements]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Entitlements_PRK_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[PRK_Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[PRK_Entitlements] CHECK CONSTRAINT [FK_PRK_Entitlements_PRK_Employees]
GO
ALTER TABLE [dbo].[PRK_Entitlements]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Entitlements_PRK_FinYears] FOREIGN KEY([FinYear])
REFERENCES [dbo].[PRK_FinYears] ([FinYear])
GO
ALTER TABLE [dbo].[PRK_Entitlements] CHECK CONSTRAINT [FK_PRK_Entitlements_PRK_FinYears]
GO
ALTER TABLE [dbo].[PRK_Entitlements]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Entitlements_PRK_Perks] FOREIGN KEY([PerkID])
REFERENCES [dbo].[PRK_Perks] ([PerkID])
GO
ALTER TABLE [dbo].[PRK_Entitlements] CHECK CONSTRAINT [FK_PRK_Entitlements_PRK_Perks]
GO
ALTER TABLE [dbo].[PRK_Entitlements] ADD  CONSTRAINT [DF_PRK_Entitlements_Value]  DEFAULT ((0)) FOR [Value]
GO
ALTER TABLE [dbo].[PRK_Entitlements] ADD  CONSTRAINT [DF_PRK_Entitlements_UOM]  DEFAULT ('Rs.') FOR [UOM]
GO
ALTER TABLE [dbo].[PRK_Entitlements] ADD  CONSTRAINT [DF_PRK_Entitlements_CategoryID]  DEFAULT ((1)) FOR [CategoryID]
GO
ALTER TABLE [dbo].[PRK_Entitlements] ADD  CONSTRAINT [DF_PRK_Entitlements_PostedAt]  DEFAULT ('Office') FOR [PostedAt]
GO
ALTER TABLE [dbo].[PRK_Entitlements] ADD  CONSTRAINT [DF_PRK_Entitlements_VehicleType]  DEFAULT ('None') FOR [VehicleType]
GO
ALTER TABLE [dbo].[PRK_Entitlements] ADD  CONSTRAINT [DF_PRK_Entitlements_Basic]  DEFAULT ((0)) FOR [Basic]
GO
ALTER TABLE [dbo].[PRK_Entitlements] ADD  CONSTRAINT [DF_PRK_Entitlements_ESI]  DEFAULT ((0)) FOR [ESI]
GO
ALTER TABLE [dbo].[PRK_Entitlements] ADD  CONSTRAINT [DF_PRK_Entitlements_WithDriver]  DEFAULT ((0)) FOR [WithDriver]
GO
ALTER TABLE [dbo].[PRK_Entitlements] ADD  CONSTRAINT [DF_PRK_Entitlements_Selected]  DEFAULT ((0)) FOR [Selected]
GO
ALTER TABLE [dbo].[PRK_Entitlements] ADD  CONSTRAINT [DF_PRK_Entitlements_Paid]  DEFAULT ((0)) FOR [Paid]
GO
