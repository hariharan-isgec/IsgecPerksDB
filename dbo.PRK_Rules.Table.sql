USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRK_Rules](
	[RuleID] [int] IDENTITY(1,1) NOT NULL,
	[PerkID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[PercentageOfBasic] [bit] NOT NULL,
	[Percentage] [decimal](6, 2) NOT NULL,
	[FixedValue] [decimal](10, 2) NOT NULL,
	[PostedAt] [nvarchar](20) NOT NULL,
	[VehicleType] [nvarchar](20) NOT NULL,
	[InSalary] [bit] NOT NULL,
	[WithDriver] [bit] NOT NULL,
 CONSTRAINT [PK_PRK_Rules] PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRK_Rules]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Rules_PRK_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[PRK_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[PRK_Rules] CHECK CONSTRAINT [FK_PRK_Rules_PRK_Categories]
GO
ALTER TABLE [dbo].[PRK_Rules]  WITH CHECK ADD  CONSTRAINT [FK_PRK_Rules_PRK_Perks] FOREIGN KEY([PerkID])
REFERENCES [dbo].[PRK_Perks] ([PerkID])
GO
ALTER TABLE [dbo].[PRK_Rules] CHECK CONSTRAINT [FK_PRK_Rules_PRK_Perks]
GO
ALTER TABLE [dbo].[PRK_Rules] ADD  CONSTRAINT [DF_PRK_Rules_PercentageOfBasic]  DEFAULT ((0)) FOR [PercentageOfBasic]
GO
ALTER TABLE [dbo].[PRK_Rules] ADD  CONSTRAINT [DF_PRK_Rules_Percentage]  DEFAULT ((0)) FOR [Percentage]
GO
ALTER TABLE [dbo].[PRK_Rules] ADD  CONSTRAINT [DF_PRK_Rules_FixedValue]  DEFAULT ((0)) FOR [FixedValue]
GO
ALTER TABLE [dbo].[PRK_Rules] ADD  CONSTRAINT [DF_PRK_Rules_PostedAt]  DEFAULT ('OffSite') FOR [PostedAt]
GO
ALTER TABLE [dbo].[PRK_Rules] ADD  CONSTRAINT [DF_PRK_Rules_VehicleType]  DEFAULT ('None') FOR [VehicleType]
GO
ALTER TABLE [dbo].[PRK_Rules] ADD  CONSTRAINT [DF_PRK_Rules_InSalary_1]  DEFAULT ((0)) FOR [InSalary]
GO
ALTER TABLE [dbo].[PRK_Rules] ADD  CONSTRAINT [DF_PRK_Rules_WithDriver]  DEFAULT ((0)) FOR [WithDriver]
GO
