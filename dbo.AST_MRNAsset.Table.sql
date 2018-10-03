USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AST_MRNAsset](
	[MrnID] [int] IDENTITY(1,1) NOT NULL,
	[MrnDescription] [nvarchar](50) NOT NULL,
	[MrnDate] [datetime] NOT NULL,
	[AssetTypeID] [int] NULL,
	[DateOfPurchase] [datetime] NULL,
	[WarrantyTill] [datetime] NULL,
	[InsuranceTill] [datetime] NULL,
	[SupplierID] [int] NULL,
	[BrandID] [int] NULL,
	[Model] [nvarchar](50) NOT NULL,
	[PurchasedQuantity] [int] NOT NULL,
	[IssuedQuantity] [int] NOT NULL,
	[WriteoffQuantity] [int] NOT NULL,
	[Remarks] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AST_MRNAsset] PRIMARY KEY CLUSTERED 
(
	[MrnID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AST_MRNAsset]  WITH CHECK ADD  CONSTRAINT [FK_AST_MRNAsset_AST_AssetTypes] FOREIGN KEY([AssetTypeID])
REFERENCES [dbo].[AST_AssetTypes] ([AssetTypeID])
GO
ALTER TABLE [dbo].[AST_MRNAsset] CHECK CONSTRAINT [FK_AST_MRNAsset_AST_AssetTypes]
GO
ALTER TABLE [dbo].[AST_MRNAsset]  WITH CHECK ADD  CONSTRAINT [FK_AST_MRNAsset_AST_Brands] FOREIGN KEY([BrandID])
REFERENCES [dbo].[AST_Brands] ([BrandID])
GO
ALTER TABLE [dbo].[AST_MRNAsset] CHECK CONSTRAINT [FK_AST_MRNAsset_AST_Brands]
GO
ALTER TABLE [dbo].[AST_MRNAsset]  WITH CHECK ADD  CONSTRAINT [FK_AST_MRNAsset_AST_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[AST_Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[AST_MRNAsset] CHECK CONSTRAINT [FK_AST_MRNAsset_AST_Suppliers]
GO
ALTER TABLE [dbo].[AST_MRNAsset] ADD  CONSTRAINT [DF_AST_MRNAsset_MrnDescription]  DEFAULT ('') FOR [MrnDescription]
GO
ALTER TABLE [dbo].[AST_MRNAsset] ADD  CONSTRAINT [DF_AST_MRNAsset_MrnDate]  DEFAULT (getdate()) FOR [MrnDate]
GO
ALTER TABLE [dbo].[AST_MRNAsset] ADD  CONSTRAINT [DF_AST_MRNAsset_SupplierID]  DEFAULT ((1)) FOR [SupplierID]
GO
ALTER TABLE [dbo].[AST_MRNAsset] ADD  CONSTRAINT [DF_AST_MRNAsset_Model]  DEFAULT ('') FOR [Model]
GO
ALTER TABLE [dbo].[AST_MRNAsset] ADD  CONSTRAINT [DF_Table_1_SerialNo]  DEFAULT ((0)) FOR [PurchasedQuantity]
GO
ALTER TABLE [dbo].[AST_MRNAsset] ADD  CONSTRAINT [DF_AST_MRNAsset_IssuedQuantity]  DEFAULT ((0)) FOR [IssuedQuantity]
GO
ALTER TABLE [dbo].[AST_MRNAsset] ADD  CONSTRAINT [DF_AST_MRNAsset_WriteoffQuantity]  DEFAULT ((0)) FOR [WriteoffQuantity]
GO
ALTER TABLE [dbo].[AST_MRNAsset] ADD  CONSTRAINT [DF_AST_MRNAsset_Remarks]  DEFAULT ('') FOR [Remarks]
GO
