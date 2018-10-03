USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_BillAmount](
	[TABillNo] [int] NOT NULL,
	[ComponentID] [int] NOT NULL,
	[CurrencyID] [nvarchar](6) NOT NULL,
	[CostCenterID] [nvarchar](6) NOT NULL,
	[TotalInCurrency] [decimal](18, 2) NOT NULL,
	[ConversionFactorINR] [decimal](8, 2) NOT NULL,
	[CalculationTypeID] [nvarchar](10) NULL,
	[TotalInINR] [decimal](18, 2) NOT NULL,
	[ProjectID] [nvarchar](6) NULL,
 CONSTRAINT [PK_TA_BillAmount] PRIMARY KEY CLUSTERED 
(
	[TABillNo] ASC,
	[ComponentID] ASC,
	[CurrencyID] ASC,
	[CostCenterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_BillAmount]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillAmount_CalculationTypeID] FOREIGN KEY([CalculationTypeID])
REFERENCES [dbo].[TA_CalcMethod] ([CalculationTypeID])
GO
ALTER TABLE [dbo].[TA_BillAmount] CHECK CONSTRAINT [FK_TA_BillAmount_CalculationTypeID]
GO
ALTER TABLE [dbo].[TA_BillAmount]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillAmount_ComponentID] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[TA_Components] ([ComponentID])
GO
ALTER TABLE [dbo].[TA_BillAmount] CHECK CONSTRAINT [FK_TA_BillAmount_ComponentID]
GO
ALTER TABLE [dbo].[TA_BillAmount]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillAmount_CostCenterID] FOREIGN KEY([CostCenterID])
REFERENCES [dbo].[HRM_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[TA_BillAmount] CHECK CONSTRAINT [FK_TA_BillAmount_CostCenterID]
GO
ALTER TABLE [dbo].[TA_BillAmount]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillAmount_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[TA_Currencies] ([CurrencyID])
GO
ALTER TABLE [dbo].[TA_BillAmount] CHECK CONSTRAINT [FK_TA_BillAmount_CurrencyID]
GO
ALTER TABLE [dbo].[TA_BillAmount]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillAmount_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[TA_BillAmount] CHECK CONSTRAINT [FK_TA_BillAmount_ProjectID]
GO
ALTER TABLE [dbo].[TA_BillAmount]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillAmount_TABillNo] FOREIGN KEY([TABillNo])
REFERENCES [dbo].[TA_Bills] ([TABillNo])
GO
ALTER TABLE [dbo].[TA_BillAmount] CHECK CONSTRAINT [FK_TA_BillAmount_TABillNo]
GO
ALTER TABLE [dbo].[TA_BillAmount] ADD  CONSTRAINT [DF_TA_BillAmount_TotalInCurrency]  DEFAULT ((0)) FOR [TotalInCurrency]
GO
ALTER TABLE [dbo].[TA_BillAmount] ADD  CONSTRAINT [DF_TA_BillAmount_ConversionFactorINR]  DEFAULT ((0)) FOR [ConversionFactorINR]
GO
ALTER TABLE [dbo].[TA_BillAmount] ADD  CONSTRAINT [DF_TA_BillAmount_TotalInINR]  DEFAULT ((0)) FOR [TotalInINR]
GO
