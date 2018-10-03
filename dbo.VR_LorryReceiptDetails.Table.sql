USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_LorryReceiptDetails](
	[ProjectID] [nvarchar](6) NOT NULL,
	[MRNNo] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[GRorLRNo] [nvarchar](50) NOT NULL,
	[GRorLRDate] [datetime] NOT NULL,
	[SupplierID] [nvarchar](9) NOT NULL,
	[SupplierName] [nvarchar](50) NULL,
	[SupplierInvoiceNo] [nvarchar](50) NULL,
	[SupplierInvoiceDate] [datetime] NULL,
	[WeightAsPerInvoiceInKG] [int] NOT NULL,
	[WeightReceived] [int] NOT NULL,
	[MaterialForm] [nvarchar](10) NULL,
	[NoOfPackagesAsPerInvoice] [int] NOT NULL,
	[NoOfPackagesReceived] [int] NOT NULL,
	[CenvatInvoiceReceived] [nvarchar](10) NOT NULL,
	[Remarks] [nvarchar](150) NULL,
 CONSTRAINT [PK_VR_LorryReceiptDetails] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[MRNNo] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VR_LorryReceiptDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_VR_LorryReceiptDetails_MRNNo] FOREIGN KEY([ProjectID], [MRNNo])
REFERENCES [dbo].[VR_LorryReceipts] ([ProjectID], [MRNNo])
GO
ALTER TABLE [dbo].[VR_LorryReceiptDetails] NOCHECK CONSTRAINT [FK_VR_LorryReceiptDetails_MRNNo]
GO
ALTER TABLE [dbo].[VR_LorryReceiptDetails]  WITH CHECK ADD  CONSTRAINT [FK_VR_LorryReceiptDetails_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[VR_LorryReceiptDetails] CHECK CONSTRAINT [FK_VR_LorryReceiptDetails_ProjectID]
GO
ALTER TABLE [dbo].[VR_LorryReceiptDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_VR_LorryReceiptDetails_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[VR_BusinessPartner] ([BPID])
GO
ALTER TABLE [dbo].[VR_LorryReceiptDetails] NOCHECK CONSTRAINT [FK_VR_LorryReceiptDetails_SupplierID]
GO
ALTER TABLE [dbo].[VR_LorryReceiptDetails] ADD  CONSTRAINT [DF_VR_LorryReceiptDetails_WeightAsPerInvoiceInKG]  DEFAULT ((0)) FOR [WeightAsPerInvoiceInKG]
GO
ALTER TABLE [dbo].[VR_LorryReceiptDetails] ADD  CONSTRAINT [DF_VR_LorryReceiptDetails_WeightReceived]  DEFAULT ((0)) FOR [WeightReceived]
GO
ALTER TABLE [dbo].[VR_LorryReceiptDetails] ADD  CONSTRAINT [DF_VR_LorryReceiptDetails_NoOfPackagesAsPerInvoice]  DEFAULT ((0)) FOR [NoOfPackagesAsPerInvoice]
GO
ALTER TABLE [dbo].[VR_LorryReceiptDetails] ADD  CONSTRAINT [DF_VR_LorryReceiptDetails_NoOfPackagesReceived]  DEFAULT ((0)) FOR [NoOfPackagesReceived]
GO
ALTER TABLE [dbo].[VR_LorryReceiptDetails] ADD  CONSTRAINT [DF_VR_LorryReceiptDetails_CenvatInvoiceReceived]  DEFAULT (N'NA') FOR [CenvatInvoiceReceived]
GO
