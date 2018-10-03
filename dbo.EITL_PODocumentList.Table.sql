USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EITL_PODocumentList](
	[SerialNo] [int] NOT NULL,
	[DocumentLineNo] [int] IDENTITY(1,1) NOT NULL,
	[DocumentID] [nvarchar](50) NULL,
	[RevisionNo] [nvarchar](3) NULL,
	[Description] [nvarchar](200) NULL,
	[ReadyToDespatch] [bit] NULL,
	[Despatched] [bit] NOT NULL,
	[DespatchDate] [datetime] NULL,
 CONSTRAINT [PK_EITL_PODocumentList] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[DocumentLineNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EITL_PODocumentList]  WITH CHECK ADD  CONSTRAINT [FK_EITL_PODocumentList_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[EITL_POList] ([SerialNo])
GO
ALTER TABLE [dbo].[EITL_PODocumentList] CHECK CONSTRAINT [FK_EITL_PODocumentList_SerialNo]
GO
ALTER TABLE [dbo].[EITL_PODocumentList] ADD  CONSTRAINT [DF_EITL_PODocumentList_ReadyToDespatch]  DEFAULT ((0)) FOR [ReadyToDespatch]
GO
ALTER TABLE [dbo].[EITL_PODocumentList] ADD  CONSTRAINT [DF_EITL_PODocumentList_Despatched]  DEFAULT ((0)) FOR [Despatched]
GO
