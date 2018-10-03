USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COST_ProjectsInput](
	[ProjectGroupID] [int] NOT NULL,
	[FinYear] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[CurrencyGOV] [nvarchar](6) NULL,
	[CFforGOV] [decimal](10, 4) NULL,
	[GroupOrderValue] [decimal](14, 2) NULL,
	[GroupOrderValueINR] [decimal](14, 2) NULL,
	[CurrencyPR] [nvarchar](6) NULL,
	[CFforPR] [decimal](10, 4) NULL,
	[ProjectRevenue] [decimal](14, 2) NULL,
	[ProjectMargin] [decimal](14, 2) NULL,
	[ExportIncentive] [decimal](14, 2) NULL,
	[ProjectRevenueINR] [decimal](14, 2) NULL,
	[ProjectMarginINR] [decimal](14, 2) NULL,
	[ExportIncentiveINR] [decimal](14, 2) NULL,
	[CurrencyPRByAC] [nvarchar](6) NULL,
	[CFforPRByAC] [decimal](10, 4) NULL,
	[ProjectRevenueByAC] [decimal](14, 2) NULL,
	[ProjectMarginByAC] [decimal](14, 2) NULL,
	[ExportIncentiveByAC] [decimal](14, 2) NULL,
	[ProjectRevenueByACINR] [decimal](14, 2) NULL,
	[ProjectMarginByACINR] [decimal](14, 2) NULL,
	[ExportIncentiveByACINR] [decimal](14, 2) NULL,
	[CFforBalanceCalculationByAC] [decimal](10, 4) NULL,
	[Remarks] [nvarchar](250) NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[CreatedOn] [datetime] NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[ApprovedOn] [datetime] NULL,
	[ApproverRemarks] [nvarchar](250) NULL,
	[StatusID] [int] NULL,
	[ReceivedBy] [nvarchar](8) NULL,
	[ReceivedOn] [datetime] NULL,
	[ReceiverRemarks] [nvarchar](250) NULL,
 CONSTRAINT [PK_COST_ProjectsInput] PRIMARY KEY CLUSTERED 
(
	[ProjectGroupID] ASC,
	[FinYear] ASC,
	[Quarter] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COST_ProjectsInput]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectsInput_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[COST_ProjectsInput] CHECK CONSTRAINT [FK_COST_ProjectsInput_ApprovedBy]
GO
ALTER TABLE [dbo].[COST_ProjectsInput]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectsInput_CraetedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[COST_ProjectsInput] CHECK CONSTRAINT [FK_COST_ProjectsInput_CraetedBy]
GO
ALTER TABLE [dbo].[COST_ProjectsInput]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectsInput_CurrencyGOV] FOREIGN KEY([CurrencyGOV])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[COST_ProjectsInput] CHECK CONSTRAINT [FK_COST_ProjectsInput_CurrencyGOV]
GO
ALTER TABLE [dbo].[COST_ProjectsInput]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectsInput_CurrencyPR] FOREIGN KEY([CurrencyPR])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[COST_ProjectsInput] CHECK CONSTRAINT [FK_COST_ProjectsInput_CurrencyPR]
GO
ALTER TABLE [dbo].[COST_ProjectsInput]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectsInput_CurrencyPRByAC] FOREIGN KEY([CurrencyPRByAC])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[COST_ProjectsInput] CHECK CONSTRAINT [FK_COST_ProjectsInput_CurrencyPRByAC]
GO
ALTER TABLE [dbo].[COST_ProjectsInput]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectsInput_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[COST_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[COST_ProjectsInput] CHECK CONSTRAINT [FK_COST_ProjectsInput_FinYear]
GO
ALTER TABLE [dbo].[COST_ProjectsInput]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectsInput_ProjectGroupID] FOREIGN KEY([ProjectGroupID])
REFERENCES [dbo].[COST_ProjectGroups] ([ProjectGroupID])
GO
ALTER TABLE [dbo].[COST_ProjectsInput] CHECK CONSTRAINT [FK_COST_ProjectsInput_ProjectGroupID]
GO
ALTER TABLE [dbo].[COST_ProjectsInput]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectsInput_Quarter] FOREIGN KEY([Quarter])
REFERENCES [dbo].[COST_Quarters] ([Quarter])
GO
ALTER TABLE [dbo].[COST_ProjectsInput] CHECK CONSTRAINT [FK_COST_ProjectsInput_Quarter]
GO
ALTER TABLE [dbo].[COST_ProjectsInput]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectsInput_ReceivedBy] FOREIGN KEY([ReceivedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[COST_ProjectsInput] CHECK CONSTRAINT [FK_COST_ProjectsInput_ReceivedBy]
GO
ALTER TABLE [dbo].[COST_ProjectsInput]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectsInput_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[COST_ProjectInputStatus] ([StatusID])
GO
ALTER TABLE [dbo].[COST_ProjectsInput] CHECK CONSTRAINT [FK_COST_ProjectsInput_StatusID]
GO
