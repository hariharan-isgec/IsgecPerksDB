USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRK_SiteAllowanceAdvice](
	[FinancialYear] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[AdviceNumber] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[Remarks] [nvarchar](100) NULL,
	[VoucherType] [nvarchar](10) NULL,
	[VoucherId] [int] NULL,
	[ERPCompany] [nvarchar](10) NULL,
	[TotalAdviceAmount] [decimal](18, 2) NULL,
	[StatusID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRK_SiteAllowanceAdvice]  WITH CHECK ADD  CONSTRAINT [FK_PRK_SiteAllowanceAdvice_Quarter] FOREIGN KEY([Quarter])
REFERENCES [dbo].[COST_Quarters] ([Quarter])
GO
ALTER TABLE [dbo].[PRK_SiteAllowanceAdvice] CHECK CONSTRAINT [FK_PRK_SiteAllowanceAdvice_Quarter]
GO
ALTER TABLE [dbo].[PRK_SiteAllowanceAdvice]  WITH CHECK ADD  CONSTRAINT [FK_PRK_SiteAllowanceAdvice_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[PRK_SAAdviceStatus] ([StatusID])
GO
ALTER TABLE [dbo].[PRK_SiteAllowanceAdvice] CHECK CONSTRAINT [FK_PRK_SiteAllowanceAdvice_StatusID]
GO
