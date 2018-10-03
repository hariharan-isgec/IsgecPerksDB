USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COST_CostSheetLiability](
	[ProjectGroupID] [int] NOT NULL,
	[FinYear] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[Revision] [int] NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[GLCode] [nvarchar](7) NOT NULL,
	[AdjustmentSerialNo] [int] NOT NULL,
	[AdjustmentCredit] [bit] NOT NULL,
	[CrAmount] [decimal](14, 2) NULL,
	[DrAmount] [decimal](14, 2) NULL,
	[Amount] [decimal](14, 2) NULL,
	[AdjustmentEntry] [bit] NOT NULL,
	[CrFC] [decimal](14, 2) NULL,
	[DrFC] [decimal](14, 2) NULL,
	[NetFC] [decimal](14, 2) NULL,
	[FC] [nvarchar](10) NULL,
 CONSTRAINT [PK_COST_CostSheetLiability] PRIMARY KEY CLUSTERED 
(
	[ProjectGroupID] ASC,
	[FinYear] ASC,
	[Quarter] ASC,
	[Revision] ASC,
	[ProjectID] ASC,
	[GLCode] ASC,
	[AdjustmentSerialNo] ASC,
	[AdjustmentCredit] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COST_CostSheetLiability]  WITH CHECK ADD  CONSTRAINT [FK_COST_CostSheetLiability_CostSheet] FOREIGN KEY([ProjectGroupID], [FinYear], [Quarter], [Revision])
REFERENCES [dbo].[COST_CostSheet] ([ProjectGroupID], [FinYear], [Quarter], [Revision])
GO
ALTER TABLE [dbo].[COST_CostSheetLiability] CHECK CONSTRAINT [FK_COST_CostSheetLiability_CostSheet]
GO
ALTER TABLE [dbo].[COST_CostSheetLiability]  WITH CHECK ADD  CONSTRAINT [FK_COST_CostSheetLiability_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[COST_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[COST_CostSheetLiability] CHECK CONSTRAINT [FK_COST_CostSheetLiability_FinYear]
GO
ALTER TABLE [dbo].[COST_CostSheetLiability]  WITH CHECK ADD  CONSTRAINT [FK_COST_CostSheetLiability_GLCode] FOREIGN KEY([GLCode])
REFERENCES [dbo].[COST_ERPGLCodes] ([GLCode])
GO
ALTER TABLE [dbo].[COST_CostSheetLiability] CHECK CONSTRAINT [FK_COST_CostSheetLiability_GLCode]
GO
ALTER TABLE [dbo].[COST_CostSheetLiability]  WITH CHECK ADD  CONSTRAINT [FK_COST_CostSheetLiability_ProjectGroupID] FOREIGN KEY([ProjectGroupID])
REFERENCES [dbo].[COST_ProjectGroups] ([ProjectGroupID])
GO
ALTER TABLE [dbo].[COST_CostSheetLiability] CHECK CONSTRAINT [FK_COST_CostSheetLiability_ProjectGroupID]
GO
ALTER TABLE [dbo].[COST_CostSheetLiability]  WITH CHECK ADD  CONSTRAINT [FK_COST_CostSheetLiability_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[COST_CostSheetLiability] CHECK CONSTRAINT [FK_COST_CostSheetLiability_ProjectID]
GO
ALTER TABLE [dbo].[COST_CostSheetLiability]  WITH CHECK ADD  CONSTRAINT [FK_COST_CostSheetLiability_Quarter] FOREIGN KEY([Quarter])
REFERENCES [dbo].[COST_Quarters] ([Quarter])
GO
ALTER TABLE [dbo].[COST_CostSheetLiability] CHECK CONSTRAINT [FK_COST_CostSheetLiability_Quarter]
GO
ALTER TABLE [dbo].[COST_CostSheetLiability] ADD  CONSTRAINT [DF_COST_CostSheetLiability_AdjustmentSerialNo]  DEFAULT ((0)) FOR [AdjustmentSerialNo]
GO
ALTER TABLE [dbo].[COST_CostSheetLiability] ADD  CONSTRAINT [DF_COST_CostSheetLiability_AdjustmentCredit]  DEFAULT ((0)) FOR [AdjustmentCredit]
GO
ALTER TABLE [dbo].[COST_CostSheetLiability] ADD  CONSTRAINT [DF_COST_CostSheetLiability_ManuallyCreated]  DEFAULT ((0)) FOR [AdjustmentEntry]
GO
