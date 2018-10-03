USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_BillPrjAmounts](
	[TABillNo] [int] NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[Percentage] [decimal](6, 2) NOT NULL,
	[TotalAmountinINR] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TA_BillPrjAmounts] PRIMARY KEY CLUSTERED 
(
	[TABillNo] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_BillPrjAmounts]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillPrjAmounts_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[TA_BillPrjAmounts] CHECK CONSTRAINT [FK_TA_BillPrjAmounts_ProjectID]
GO
ALTER TABLE [dbo].[TA_BillPrjAmounts]  WITH CHECK ADD  CONSTRAINT [FK_TA_BillPrjAmounts_TABillNo] FOREIGN KEY([TABillNo])
REFERENCES [dbo].[TA_Bills] ([TABillNo])
GO
ALTER TABLE [dbo].[TA_BillPrjAmounts] CHECK CONSTRAINT [FK_TA_BillPrjAmounts_TABillNo]
GO
ALTER TABLE [dbo].[TA_BillPrjAmounts] ADD  CONSTRAINT [DF_TA_BillPrjAmounts_Percentage]  DEFAULT ((0)) FOR [Percentage]
GO
ALTER TABLE [dbo].[TA_BillPrjAmounts] ADD  CONSTRAINT [DF_TA_BillPrjAmounts_TotalAmountinINR]  DEFAULT ((0)) FOR [TotalAmountinINR]
GO
