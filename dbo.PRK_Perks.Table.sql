USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRK_Perks](
	[PerkID] [int] IDENTITY(1,1) NOT NULL,
	[Claimable] [bit] NOT NULL,
	[PerkCode] [nvarchar](3) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Sequence] [int] NULL,
	[AdvanceApplicable] [bit] NOT NULL,
	[AdvanceMonths] [int] NOT NULL,
	[LockedMonths] [int] NOT NULL,
	[NoOfPayments] [int] NOT NULL,
	[CarryForward] [bit] NOT NULL,
	[UOM] [nvarchar](5) NOT NULL,
	[Active] [bit] NOT NULL,
	[BaaNGL] [nvarchar](7) NOT NULL,
	[BaaNReference] [nvarchar](30) NOT NULL,
	[cmba]  AS ((((([perkcode]+' : ')+[description])+'[')+[uom])+']'),
	[CreditGLForCheque] [nvarchar](7) NULL,
	[CreditGLForCash24] [nvarchar](7) NULL,
	[CreditGLForImprest] [nvarchar](7) NULL,
	[CreditGLForCash63] [nvarchar](7) NULL,
 CONSTRAINT [PK_PRK_Perks] PRIMARY KEY CLUSTERED 
(
	[PerkID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRK_Perks] ADD  CONSTRAINT [DF_PRK_Perks_Claimable]  DEFAULT ((0)) FOR [Claimable]
GO
ALTER TABLE [dbo].[PRK_Perks] ADD  CONSTRAINT [DF_PRK_Perks_PerkCode]  DEFAULT ('') FOR [PerkCode]
GO
ALTER TABLE [dbo].[PRK_Perks] ADD  CONSTRAINT [DF_PRK_Perks_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[PRK_Perks] ADD  CONSTRAINT [DF_PRK_Perks_AdvanceApplicable]  DEFAULT ((1)) FOR [AdvanceApplicable]
GO
ALTER TABLE [dbo].[PRK_Perks] ADD  CONSTRAINT [DF_PRK_Perks_AdvanceMonths]  DEFAULT ((1)) FOR [AdvanceMonths]
GO
ALTER TABLE [dbo].[PRK_Perks] ADD  CONSTRAINT [DF_PRK_Perks_LockedMonths]  DEFAULT ((1)) FOR [LockedMonths]
GO
ALTER TABLE [dbo].[PRK_Perks] ADD  CONSTRAINT [DF_Table_1_No.OfPayments]  DEFAULT ((1)) FOR [NoOfPayments]
GO
ALTER TABLE [dbo].[PRK_Perks] ADD  CONSTRAINT [DF_PRK_Perks_CarryForward]  DEFAULT ((1)) FOR [CarryForward]
GO
ALTER TABLE [dbo].[PRK_Perks] ADD  CONSTRAINT [DF_PRK_Perks_UOM]  DEFAULT ('Rs.') FOR [UOM]
GO
ALTER TABLE [dbo].[PRK_Perks] ADD  CONSTRAINT [DF_PRK_Perks_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[PRK_Perks] ADD  CONSTRAINT [DF_PRK_Perks_BaaNGL]  DEFAULT ('') FOR [BaaNGL]
GO
ALTER TABLE [dbo].[PRK_Perks] ADD  CONSTRAINT [DF_PRK_Perks_BaaNReference]  DEFAULT ('') FOR [BaaNReference]
GO
