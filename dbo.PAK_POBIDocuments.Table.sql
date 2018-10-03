USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_POBIDocuments](
	[SerialNo] [int] NOT NULL,
	[BOMNo] [int] NOT NULL,
	[ItemNo] [int] NOT NULL,
	[DocNo] [int] IDENTITY(1,1) NOT NULL,
	[DocumentID] [nvarchar](50) NOT NULL,
	[DocumentRevision] [nvarchar](10) NOT NULL,
	[DocumentName] [nvarchar](100) NULL,
	[FileName] [nvarchar](250) NULL,
	[DiskFile] [nvarchar](250) NULL,
	[CreatedBySupplier] [bit] NOT NULL,
 CONSTRAINT [PK_PAK_POBIDocuments] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[BOMNo] ASC,
	[ItemNo] ASC,
	[DocNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_POBIDocuments]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBIDocuments_BOMNo] FOREIGN KEY([SerialNo], [BOMNo])
REFERENCES [dbo].[PAK_POBOM] ([SerialNo], [BOMNo])
GO
ALTER TABLE [dbo].[PAK_POBIDocuments] CHECK CONSTRAINT [FK_PAK_POBIDocuments_BOMNo]
GO
ALTER TABLE [dbo].[PAK_POBIDocuments]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBIDocuments_ItemNo] FOREIGN KEY([SerialNo], [BOMNo], [ItemNo])
REFERENCES [dbo].[PAK_POBItems] ([SerialNo], [BOMNo], [ItemNo])
GO
ALTER TABLE [dbo].[PAK_POBIDocuments] CHECK CONSTRAINT [FK_PAK_POBIDocuments_ItemNo]
GO
ALTER TABLE [dbo].[PAK_POBIDocuments]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POBIDocuments_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[PAK_PO] ([SerialNo])
GO
ALTER TABLE [dbo].[PAK_POBIDocuments] CHECK CONSTRAINT [FK_PAK_POBIDocuments_SerialNo]
GO
ALTER TABLE [dbo].[PAK_POBIDocuments] ADD  CONSTRAINT [DF_PAK_POBIDocuments_CreatedBySupplier]  DEFAULT ((0)) FOR [CreatedBySupplier]
GO
