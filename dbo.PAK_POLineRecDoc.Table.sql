USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_POLineRecDoc](
	[SerialNo] [int] NOT NULL,
	[ItemNo] [int] NOT NULL,
	[UploadNo] [int] NOT NULL,
	[DocSerialNo] [int] IDENTITY(1,1) NOT NULL,
	[DocumentID] [nvarchar](32) NULL,
	[DocumentRev] [nvarchar](20) NULL,
	[DocumentDescription] [nvarchar](100) NULL,
	[ReceiptNo] [nvarchar](9) NOT NULL,
	[RevisionNo] [nvarchar](20) NOT NULL,
	[FileName] [nvarchar](100) NULL,
	[DiskFileName] [nvarchar](250) NULL,
	[ERPDocSerialNo] [int] NULL,
	[AutoGenerated] [bit] NOT NULL,
 CONSTRAINT [PK_PAK_POLineRecDoc] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[ItemNo] ASC,
	[UploadNo] ASC,
	[DocSerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_POLineRecDoc]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POLineRecDoc_ItemNo] FOREIGN KEY([SerialNo], [ItemNo])
REFERENCES [dbo].[PAK_POLine] ([SerialNo], [ItemNo])
GO
ALTER TABLE [dbo].[PAK_POLineRecDoc] CHECK CONSTRAINT [FK_PAK_POLineRecDoc_ItemNo]
GO
ALTER TABLE [dbo].[PAK_POLineRecDoc]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POLineRecDoc_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[PAK_PO] ([SerialNo])
GO
ALTER TABLE [dbo].[PAK_POLineRecDoc] CHECK CONSTRAINT [FK_PAK_POLineRecDoc_SerialNo]
GO
ALTER TABLE [dbo].[PAK_POLineRecDoc]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POLineRecDoc_UploadNo] FOREIGN KEY([SerialNo], [ItemNo], [UploadNo])
REFERENCES [dbo].[PAK_POLineRec] ([SerialNo], [ItemNo], [UploadNo])
GO
ALTER TABLE [dbo].[PAK_POLineRecDoc] CHECK CONSTRAINT [FK_PAK_POLineRecDoc_UploadNo]
GO
ALTER TABLE [dbo].[PAK_POLineRecDoc] ADD  CONSTRAINT [DF_PAK_POLineRecDoc_AutoGenerated]  DEFAULT ((0)) FOR [AutoGenerated]
GO
