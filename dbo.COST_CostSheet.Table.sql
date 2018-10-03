USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COST_CostSheet](
	[ProjectGroupID] [int] NOT NULL,
	[FinYear] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[Revision] [int] NOT NULL,
	[StatusID] [int] NULL,
	[AutoUpdateERPData] [bit] NOT NULL,
	[LockERPData] [bit] NOT NULL,
	[LockAdjustmentEntry] [bit] NOT NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[CreatedOn] [datetime] NULL,
	[Remarks] [nvarchar](250) NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[ApprovedOn] [datetime] NULL,
	[ApproverRemarks] [nvarchar](250) NULL,
 CONSTRAINT [PK_COST_CostSheet] PRIMARY KEY CLUSTERED 
(
	[ProjectGroupID] ASC,
	[FinYear] ASC,
	[Quarter] ASC,
	[Revision] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COST_CostSheet]  WITH CHECK ADD  CONSTRAINT [FK_COST_CostSheet_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[COST_CostSheet] CHECK CONSTRAINT [FK_COST_CostSheet_ApprovedBy]
GO
ALTER TABLE [dbo].[COST_CostSheet]  WITH CHECK ADD  CONSTRAINT [FK_COST_CostSheet_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[COST_CostSheet] CHECK CONSTRAINT [FK_COST_CostSheet_CreatedBy]
GO
ALTER TABLE [dbo].[COST_CostSheet]  WITH CHECK ADD  CONSTRAINT [FK_COST_CostSheet_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[COST_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[COST_CostSheet] CHECK CONSTRAINT [FK_COST_CostSheet_FinYear]
GO
ALTER TABLE [dbo].[COST_CostSheet]  WITH CHECK ADD  CONSTRAINT [FK_COST_CostSheet_ProjectGroupID] FOREIGN KEY([ProjectGroupID])
REFERENCES [dbo].[COST_ProjectGroups] ([ProjectGroupID])
GO
ALTER TABLE [dbo].[COST_CostSheet] CHECK CONSTRAINT [FK_COST_CostSheet_ProjectGroupID]
GO
ALTER TABLE [dbo].[COST_CostSheet]  WITH CHECK ADD  CONSTRAINT [FK_COST_CostSheet_Quarter] FOREIGN KEY([Quarter])
REFERENCES [dbo].[COST_Quarters] ([Quarter])
GO
ALTER TABLE [dbo].[COST_CostSheet] CHECK CONSTRAINT [FK_COST_CostSheet_Quarter]
GO
ALTER TABLE [dbo].[COST_CostSheet]  WITH CHECK ADD  CONSTRAINT [FK_COST_CostSheet_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[COST_CostSheetStates] ([StatusID])
GO
ALTER TABLE [dbo].[COST_CostSheet] CHECK CONSTRAINT [FK_COST_CostSheet_StatusID]
GO
ALTER TABLE [dbo].[COST_CostSheet] ADD  CONSTRAINT [DF_COST_CostSheet_LockERPData1]  DEFAULT ((0)) FOR [AutoUpdateERPData]
GO
ALTER TABLE [dbo].[COST_CostSheet] ADD  CONSTRAINT [DF_COST_CostSheet_LockERPData]  DEFAULT ((0)) FOR [LockERPData]
GO
ALTER TABLE [dbo].[COST_CostSheet] ADD  CONSTRAINT [DF_COST_CostSheet_LockAdjustmentEntry]  DEFAULT ((0)) FOR [LockAdjustmentEntry]
GO
