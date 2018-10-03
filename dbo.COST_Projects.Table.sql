USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COST_Projects](
	[ProjectID] [nvarchar](6) NOT NULL,
	[FinYear] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[Description] [nvarchar](60) NOT NULL,
	[BusinessPartnerID] [nvarchar](9) NULL,
	[ProjectTypeID] [nvarchar](10) NULL,
	[WorkOrderTypeID] [int] NULL,
	[DivisionID] [int] NULL,
	[CurrencyID] [nvarchar](6) NULL,
	[CFforPOV] [decimal](10, 6) NOT NULL,
	[ProjectOrderValue] [decimal](12, 2) NOT NULL,
	[ProjectOrderValueINR] [decimal](12, 2) NOT NULL,
	[WarrantyPercentage] [decimal](6, 2) NOT NULL,
	[ProjectCost] [decimal](12, 2) NOT NULL,
	[ProjectCostINR] [decimal](12, 2) NOT NULL,
	[MarginCurrentYear] [decimal](12, 2) NOT NULL,
	[MarginCurrentYearINR] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_COST_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[FinYear] ASC,
	[Quarter] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COST_Projects]  WITH CHECK ADD  CONSTRAINT [FK_COST_Projects_BPID] FOREIGN KEY([BusinessPartnerID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[COST_Projects] CHECK CONSTRAINT [FK_COST_Projects_BPID]
GO
ALTER TABLE [dbo].[COST_Projects]  WITH CHECK ADD  CONSTRAINT [FK_COST_Projects_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[COST_Projects] CHECK CONSTRAINT [FK_COST_Projects_CurrencyID]
GO
ALTER TABLE [dbo].[COST_Projects]  WITH CHECK ADD  CONSTRAINT [FK_COST_Projects_DivisionID] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[COST_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[COST_Projects] CHECK CONSTRAINT [FK_COST_Projects_DivisionID]
GO
ALTER TABLE [dbo].[COST_Projects]  WITH CHECK ADD  CONSTRAINT [FK_COST_Projects_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[COST_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[COST_Projects] CHECK CONSTRAINT [FK_COST_Projects_FinYear]
GO
ALTER TABLE [dbo].[COST_Projects]  WITH CHECK ADD  CONSTRAINT [FK_COST_Projects_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[COST_Projects] CHECK CONSTRAINT [FK_COST_Projects_ProjectID]
GO
ALTER TABLE [dbo].[COST_Projects]  WITH CHECK ADD  CONSTRAINT [FK_COST_Projects_ProjectTypeID] FOREIGN KEY([ProjectTypeID])
REFERENCES [dbo].[COST_ProjectTypes] ([ProjectTypeID])
GO
ALTER TABLE [dbo].[COST_Projects] CHECK CONSTRAINT [FK_COST_Projects_ProjectTypeID]
GO
ALTER TABLE [dbo].[COST_Projects]  WITH CHECK ADD  CONSTRAINT [FK_COST_Projects_Quarter] FOREIGN KEY([Quarter])
REFERENCES [dbo].[COST_Quarters] ([Quarter])
GO
ALTER TABLE [dbo].[COST_Projects] CHECK CONSTRAINT [FK_COST_Projects_Quarter]
GO
ALTER TABLE [dbo].[COST_Projects]  WITH CHECK ADD  CONSTRAINT [FK_COST_Projects_WorkOrderTypeID] FOREIGN KEY([WorkOrderTypeID])
REFERENCES [dbo].[COST_WorkOrderTypes] ([WorkOrderTypeID])
GO
ALTER TABLE [dbo].[COST_Projects] CHECK CONSTRAINT [FK_COST_Projects_WorkOrderTypeID]
GO
ALTER TABLE [dbo].[COST_Projects] ADD  CONSTRAINT [DF_COST_Projects_CFforPOV]  DEFAULT ((0)) FOR [CFforPOV]
GO
ALTER TABLE [dbo].[COST_Projects] ADD  CONSTRAINT [DF_COST_Projects_ProjectOrderValue]  DEFAULT ((0)) FOR [ProjectOrderValue]
GO
ALTER TABLE [dbo].[COST_Projects] ADD  CONSTRAINT [DF_COST_Projects_ProjectOrderValueINR]  DEFAULT ((0)) FOR [ProjectOrderValueINR]
GO
ALTER TABLE [dbo].[COST_Projects] ADD  CONSTRAINT [DF_COST_Projects_WarrantyPercentage]  DEFAULT ((0)) FOR [WarrantyPercentage]
GO
ALTER TABLE [dbo].[COST_Projects] ADD  CONSTRAINT [DF_COST_Projects_ProjectCost]  DEFAULT ((0)) FOR [ProjectCost]
GO
ALTER TABLE [dbo].[COST_Projects] ADD  CONSTRAINT [DF_COST_Projects_ProjectCostINR]  DEFAULT ((0)) FOR [ProjectCostINR]
GO
ALTER TABLE [dbo].[COST_Projects] ADD  CONSTRAINT [DF_COST_Projects_MarginCurrentYear]  DEFAULT ((0)) FOR [MarginCurrentYear]
GO
ALTER TABLE [dbo].[COST_Projects] ADD  CONSTRAINT [DF_COST_Projects_MarginCurrentYearINR]  DEFAULT ((0)) FOR [MarginCurrentYearINR]
GO
