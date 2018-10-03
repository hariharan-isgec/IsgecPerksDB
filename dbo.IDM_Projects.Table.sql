USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDM_Projects](
	[ProjectID] [nvarchar](6) NOT NULL,
	[Description] [nvarchar](60) NOT NULL,
	[CustomerOrderReference] [nvarchar](50) NULL,
	[CustomerID] [nvarchar](6) NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[EmailID] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](20) NULL,
	[Address1] [nvarchar](60) NULL,
	[Address2] [nvarchar](60) NULL,
	[Address3] [nvarchar](60) NULL,
	[Address4] [nvarchar](60) NULL,
	[ToEMailID] [nvarchar](250) NULL,
	[CCEmailID] [nvarchar](250) NULL,
	[ProjectSiteEMailID] [nvarchar](250) NULL,
	[ProjectSiteEMailPassword] [nvarchar](50) NULL,
	[LastNumber] [int] NULL,
	[BusinessPartnerID] [nvarchar](9) NULL,
	[ProjectTypeID] [nvarchar](10) NULL,
	[WorkOrderTypeID] [int] NULL,
	[DivisionID] [int] NULL,
	[CurrencyID] [nvarchar](6) NULL,
	[CFforPOV] [decimal](10, 4) NOT NULL,
	[ProjectOrderValue] [decimal](12, 2) NOT NULL,
	[ProjectOrderValueINR] [decimal](12, 2) NOT NULL,
	[WarrantyPercentage] [decimal](6, 2) NOT NULL,
	[ProjectCost] [decimal](12, 2) NOT NULL,
	[ProjectCostINR] [decimal](12, 2) NOT NULL,
	[MarginCurrentYear] [decimal](12, 2) NOT NULL,
	[MarginCurrentYearINR] [decimal](12, 2) NOT NULL,
	[ERPCompany] [nvarchar](10) NOT NULL,
	[LogisticCompany] [nvarchar](10) NULL,
	[FinanceCompany] [nvarchar](10) NULL,
 CONSTRAINT [PK_IDM_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IDM_Projects]  WITH NOCHECK ADD  CONSTRAINT [FK_IDM_Projects_BusinessPartnerID] FOREIGN KEY([BusinessPartnerID])
REFERENCES [dbo].[EITL_Suppliers] ([SupplierID])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[IDM_Projects] NOCHECK CONSTRAINT [FK_IDM_Projects_BusinessPartnerID]
GO
ALTER TABLE [dbo].[IDM_Projects]  WITH CHECK ADD  CONSTRAINT [FK_IDM_Projects_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[IDM_Projects] CHECK CONSTRAINT [FK_IDM_Projects_CurrencyID]
GO
ALTER TABLE [dbo].[IDM_Projects]  WITH CHECK ADD  CONSTRAINT [FK_IDM_Projects_DivisionID] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[COST_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[IDM_Projects] CHECK CONSTRAINT [FK_IDM_Projects_DivisionID]
GO
ALTER TABLE [dbo].[IDM_Projects]  WITH NOCHECK ADD  CONSTRAINT [FK_IDM_Projects_IDM_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[IDM_Customers] ([CustomerID])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[IDM_Projects] NOCHECK CONSTRAINT [FK_IDM_Projects_IDM_Customers]
GO
ALTER TABLE [dbo].[IDM_Projects]  WITH CHECK ADD  CONSTRAINT [FK_IDM_Projects_ProjectTypeID] FOREIGN KEY([ProjectTypeID])
REFERENCES [dbo].[COST_ProjectTypes] ([ProjectTypeID])
GO
ALTER TABLE [dbo].[IDM_Projects] CHECK CONSTRAINT [FK_IDM_Projects_ProjectTypeID]
GO
ALTER TABLE [dbo].[IDM_Projects]  WITH CHECK ADD  CONSTRAINT [FK_IDM_Projects_WorkOrderTypeID] FOREIGN KEY([WorkOrderTypeID])
REFERENCES [dbo].[COST_WorkOrderTypes] ([WorkOrderTypeID])
GO
ALTER TABLE [dbo].[IDM_Projects] CHECK CONSTRAINT [FK_IDM_Projects_WorkOrderTypeID]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_Address1_1]  DEFAULT ('') FOR [Address1]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_Address2_1]  DEFAULT ('') FOR [Address2]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_Address3_1]  DEFAULT ('') FOR [Address3]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_Address4_1]  DEFAULT ('') FOR [Address4]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_LastNumber]  DEFAULT ((0)) FOR [LastNumber]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_CFforPOV]  DEFAULT ((0)) FOR [CFforPOV]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_ProjectOrderValue]  DEFAULT ((0)) FOR [ProjectOrderValue]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_ProjectOrderValueINR]  DEFAULT ((0)) FOR [ProjectOrderValueINR]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_WarrantyPercentage]  DEFAULT ((0)) FOR [WarrantyPercentage]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_ProjectOrderValue1]  DEFAULT ((0)) FOR [ProjectCost]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_ProjectOrderValueINR1]  DEFAULT ((0)) FOR [ProjectCostINR]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_MarginCurrentYear]  DEFAULT ((0)) FOR [MarginCurrentYear]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_MarginCurrentYear1]  DEFAULT ((0)) FOR [MarginCurrentYearINR]
GO
ALTER TABLE [dbo].[IDM_Projects] ADD  CONSTRAINT [DF_IDM_Projects_ERPCompany]  DEFAULT ((200)) FOR [ERPCompany]
GO
