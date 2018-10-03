USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COST_AdjustmentEntry](
	[ProjectGroupID] [int] NOT NULL,
	[FinYear] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[Revision] [int] NOT NULL,
	[AdjustmentSerialNo] [int] IDENTITY(1,1) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
	[ProjectID] [nvarchar](6) NULL,
	[CrGLCode] [nvarchar](7) NULL,
	[DrGLCode] [nvarchar](7) NULL,
	[Amount] [decimal](14, 2) NOT NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[CreatedOn] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_COST_AdjustmentEntry] PRIMARY KEY CLUSTERED 
(
	[ProjectGroupID] ASC,
	[FinYear] ASC,
	[Quarter] ASC,
	[Revision] ASC,
	[AdjustmentSerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry]  WITH CHECK ADD  CONSTRAINT [FK_COST_AdjustmentEntry_CostSheet] FOREIGN KEY([ProjectGroupID], [FinYear], [Quarter], [Revision])
REFERENCES [dbo].[COST_CostSheet] ([ProjectGroupID], [FinYear], [Quarter], [Revision])
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry] CHECK CONSTRAINT [FK_COST_AdjustmentEntry_CostSheet]
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry]  WITH CHECK ADD  CONSTRAINT [FK_COST_AdjustmentEntry_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry] CHECK CONSTRAINT [FK_COST_AdjustmentEntry_CreatedBy]
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry]  WITH CHECK ADD  CONSTRAINT [FK_COST_AdjustmentEntry_CrGLCode] FOREIGN KEY([CrGLCode])
REFERENCES [dbo].[COST_ERPGLCodes] ([GLCode])
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry] CHECK CONSTRAINT [FK_COST_AdjustmentEntry_CrGLCode]
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry]  WITH CHECK ADD  CONSTRAINT [FK_COST_AdjustmentEntry_DrGLCode] FOREIGN KEY([DrGLCode])
REFERENCES [dbo].[COST_ERPGLCodes] ([GLCode])
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry] CHECK CONSTRAINT [FK_COST_AdjustmentEntry_DrGLCode]
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry]  WITH CHECK ADD  CONSTRAINT [FK_COST_AdjustmentEntry_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[COST_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry] CHECK CONSTRAINT [FK_COST_AdjustmentEntry_FinYear]
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry]  WITH CHECK ADD  CONSTRAINT [FK_COST_AdjustmentEntry_ProjectGroupID] FOREIGN KEY([ProjectGroupID])
REFERENCES [dbo].[COST_ProjectGroups] ([ProjectGroupID])
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry] CHECK CONSTRAINT [FK_COST_AdjustmentEntry_ProjectGroupID]
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry]  WITH CHECK ADD  CONSTRAINT [FK_COST_AdjustmentEntry_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry] CHECK CONSTRAINT [FK_COST_AdjustmentEntry_ProjectID]
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry]  WITH CHECK ADD  CONSTRAINT [FK_COST_AdjustmentEntry_Quarter] FOREIGN KEY([Quarter])
REFERENCES [dbo].[COST_Quarters] ([Quarter])
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry] CHECK CONSTRAINT [FK_COST_AdjustmentEntry_Quarter]
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry] ADD  CONSTRAINT [DF_COST_AdjustmentEntry_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[COST_AdjustmentEntry] ADD  CONSTRAINT [DF_COST_AdjustmentEntry_Active]  DEFAULT ((1)) FOR [Active]
GO
