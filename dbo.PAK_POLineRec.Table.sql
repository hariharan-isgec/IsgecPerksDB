USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_POLineRec](
	[SerialNo] [int] NOT NULL,
	[ItemNo] [int] NOT NULL,
	[UploadNo] [int] IDENTITY(1,1) NOT NULL,
	[DocumentCategoryID] [int] NULL,
	[UploadRemarks] [nvarchar](500) NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[CreatedOn] [datetime] NULL,
	[UploadStatusID] [int] NULL,
	[ReceiptNo] [nvarchar](9) NOT NULL,
	[RevisionNo] [nvarchar](20) NOT NULL,
	[SDocSerialNo] [int] NOT NULL,
	[ERPTransmittalNo] [nvarchar](9) NULL,
 CONSTRAINT [PK_PAK_POLineRec] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[ItemNo] ASC,
	[UploadNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_POLineRec]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POLineRec_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_POLineRec] CHECK CONSTRAINT [FK_PAK_POLineRec_CreatedBy]
GO
ALTER TABLE [dbo].[PAK_POLineRec]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POLineRec_DocumentCategoryID] FOREIGN KEY([DocumentCategoryID])
REFERENCES [dbo].[PAK_POLineRecCategory] ([DocumentCategoryID])
GO
ALTER TABLE [dbo].[PAK_POLineRec] CHECK CONSTRAINT [FK_PAK_POLineRec_DocumentCategoryID]
GO
ALTER TABLE [dbo].[PAK_POLineRec]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POLineRec_ItemNo] FOREIGN KEY([SerialNo], [ItemNo])
REFERENCES [dbo].[PAK_POLine] ([SerialNo], [ItemNo])
GO
ALTER TABLE [dbo].[PAK_POLineRec] CHECK CONSTRAINT [FK_PAK_POLineRec_ItemNo]
GO
ALTER TABLE [dbo].[PAK_POLineRec]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POLineRec_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[PAK_PO] ([SerialNo])
GO
ALTER TABLE [dbo].[PAK_POLineRec] CHECK CONSTRAINT [FK_PAK_POLineRec_SerialNo]
GO
ALTER TABLE [dbo].[PAK_POLineRec]  WITH CHECK ADD  CONSTRAINT [FK_PAK_POLineRec_UploadStatusID] FOREIGN KEY([UploadStatusID])
REFERENCES [dbo].[PAK_POLineRecStatus] ([StatusID])
GO
ALTER TABLE [dbo].[PAK_POLineRec] CHECK CONSTRAINT [FK_PAK_POLineRec_UploadStatusID]
GO
ALTER TABLE [dbo].[PAK_POLineRec] ADD  CONSTRAINT [DF_PAK_POLineRec_SDocSerialNo]  DEFAULT ((0)) FOR [SDocSerialNo]
GO
