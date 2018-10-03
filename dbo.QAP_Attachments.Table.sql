USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QAP_Attachments](
	[RequestNo] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[FileName] [nvarchar](250) NULL,
	[DiskFile] [nvarchar](250) NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_QAP_Attachments] PRIMARY KEY CLUSTERED 
(
	[RequestNo] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QAP_Attachments]  WITH CHECK ADD  CONSTRAINT [FK_QAP_Attachments_RequestNo] FOREIGN KEY([RequestNo])
REFERENCES [dbo].[QAP_Requests] ([RequestNo])
GO
ALTER TABLE [dbo].[QAP_Attachments] CHECK CONSTRAINT [FK_QAP_Attachments_RequestNo]
GO
ALTER TABLE [dbo].[QAP_Attachments]  WITH CHECK ADD  CONSTRAINT [FK_QAP_Attachments_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[QAP_AttachmentStates] ([StatusID])
GO
ALTER TABLE [dbo].[QAP_Attachments] CHECK CONSTRAINT [FK_QAP_Attachments_StatusID]
GO
