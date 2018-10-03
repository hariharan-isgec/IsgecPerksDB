USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PSF_HSBCMain](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[PaymentRequestNo] [nvarchar](9) NULL,
	[OurRefNo] [nvarchar](7) NOT NULL,
	[BankVoucherDate] [datetime] NOT NULL,
	[SupplierCode] [nvarchar](9) NOT NULL,
	[IRN] [nvarchar](10) NOT NULL,
	[InvoiceNumber] [nvarchar](30) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[InvoiceAmount] [int] NOT NULL,
	[TotalAmountDisbursed] [int] NOT NULL,
	[InterestForDays] [int] NOT NULL,
	[InterestAmount] [int] NOT NULL,
	[PDNNo] [nvarchar](12) NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[PaymentDateToBank] [datetime] NULL,
	[ChequeNoPaidToBank] [nvarchar](10) NULL,
	[AmountInWords] [nvarchar](500) NULL,
	[TDSAmount] [int] NULL,
	[ServiceTax] [int] NULL,
	[HSBCToVendor] [datetime] NULL,
	[HSBCInterestDays] [int] NULL,
	[HSBCInterestAmountInStatement] [int] NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[CreatedOn] [datetime] NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[ApprovedOn] [datetime] NULL,
	[PSFStatus] [int] NOT NULL,
	[ModifiedBy] [nvarchar](8) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_PSF_HSBCMain] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PSF_HSBCMain] ON [dbo].[PSF_HSBCMain] 
(
	[OurRefNo] ASC,
	[PSFStatus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PSF_HSBCMain]  WITH CHECK ADD  CONSTRAINT [FK_PSF_HSBCMain_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[PSF_HSBCMain] CHECK CONSTRAINT [FK_PSF_HSBCMain_ApprovedBy]
GO
ALTER TABLE [dbo].[PSF_HSBCMain]  WITH CHECK ADD  CONSTRAINT [FK_PSF_HSBCMain_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[PSF_HSBCMain] CHECK CONSTRAINT [FK_PSF_HSBCMain_CreatedBy]
GO
ALTER TABLE [dbo].[PSF_HSBCMain]  WITH CHECK ADD  CONSTRAINT [FK_PSF_HSBCMain_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[PSF_HSBCMain] CHECK CONSTRAINT [FK_PSF_HSBCMain_ModifiedBy]
GO
ALTER TABLE [dbo].[PSF_HSBCMain]  WITH CHECK ADD  CONSTRAINT [FK_PSF_HSBCMain_PSFStatusID] FOREIGN KEY([PSFStatus])
REFERENCES [dbo].[PSF_Status] ([PSFStatus])
GO
ALTER TABLE [dbo].[PSF_HSBCMain] CHECK CONSTRAINT [FK_PSF_HSBCMain_PSFStatusID]
GO
ALTER TABLE [dbo].[PSF_HSBCMain]  WITH CHECK ADD  CONSTRAINT [FK_PSF_HSBCMain_SupplierID] FOREIGN KEY([SupplierCode])
REFERENCES [dbo].[PSF_Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[PSF_HSBCMain] CHECK CONSTRAINT [FK_PSF_HSBCMain_SupplierID]
GO
ALTER TABLE [dbo].[PSF_HSBCMain] ADD  CONSTRAINT [DF_PSF_HSBCMain_Approved]  DEFAULT ((1)) FOR [PSFStatus]
GO
