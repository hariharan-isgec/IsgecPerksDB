USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ERP_DCRDetail](
	[DCRNo] [nvarchar](10) NOT NULL,
	[DocumentID] [nvarchar](30) NOT NULL,
	[RevisionNo] [nvarchar](5) NOT NULL,
	[IndentNo] [nvarchar](10) NULL,
	[IndentLine] [nvarchar](5) NULL,
	[LotItem] [nvarchar](50) NULL,
	[ItemDescription] [nvarchar](100) NULL,
	[IndenterID] [nvarchar](8) NULL,
	[BuyerID] [nvarchar](8) NULL,
	[OrderNo] [nvarchar](10) NULL,
	[OrderLine] [nvarchar](5) NULL,
	[SupplierID] [nvarchar](10) NULL,
	[BuyerIDinPO] [nvarchar](8) NULL,
	[IndenterName] [nvarchar](50) NULL,
	[IndenterEMail] [nvarchar](50) NULL,
	[BuyerName] [nvarchar](50) NULL,
	[BuyerEMail] [nvarchar](50) NULL,
	[BuyerIDinPOName] [nvarchar](50) NULL,
	[BuyerIDinPOEMail] [nvarchar](50) NULL,
	[SupplierName] [nvarchar](100) NULL,
	[DocumentTitle] [nvarchar](100) NULL,
 CONSTRAINT [PK_ERP_DCRDetail] PRIMARY KEY CLUSTERED 
(
	[DCRNo] ASC,
	[DocumentID] ASC,
	[RevisionNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ERP_DCRDetail]  WITH CHECK ADD  CONSTRAINT [FK_ERP_DCRDetail_DCRNo] FOREIGN KEY([DCRNo])
REFERENCES [dbo].[ERP_DCRHeader] ([DCRNo])
GO
ALTER TABLE [dbo].[ERP_DCRDetail] CHECK CONSTRAINT [FK_ERP_DCRDetail_DCRNo]
GO
