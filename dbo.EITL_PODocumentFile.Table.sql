USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EITL_PODocumentFile](
	[SerialNo] [int] NOT NULL,
	[DocumentLineNo] [int] NOT NULL,
	[FileNo] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[FileName] [nvarchar](250) NULL,
	[DiskFile] [nvarchar](250) NULL,
 CONSTRAINT [PK_EITL_PODocumentFile] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[DocumentLineNo] ASC,
	[FileNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EITL_PODocumentFile]  WITH CHECK ADD  CONSTRAINT [FK_EITL_PODocumentFile_DocumentLine] FOREIGN KEY([SerialNo], [DocumentLineNo])
REFERENCES [dbo].[EITL_PODocumentList] ([SerialNo], [DocumentLineNo])
GO
ALTER TABLE [dbo].[EITL_PODocumentFile] CHECK CONSTRAINT [FK_EITL_PODocumentFile_DocumentLine]
GO
ALTER TABLE [dbo].[EITL_PODocumentFile]  WITH CHECK ADD  CONSTRAINT [FK_EITL_PODocumentFile_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[EITL_POList] ([SerialNo])
GO
ALTER TABLE [dbo].[EITL_PODocumentFile] CHECK CONSTRAINT [FK_EITL_PODocumentFile_SerialNo]
GO
