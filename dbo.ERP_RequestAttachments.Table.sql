USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ERP_RequestAttachments](
	[ApplID] [int] NOT NULL,
	[RequestID] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[FileName] [nvarchar](250) NOT NULL,
	[DiskFile] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ERP_RequestAttachments] PRIMARY KEY CLUSTERED 
(
	[ApplID] ASC,
	[RequestID] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ERP_RequestAttachments]  WITH CHECK ADD  CONSTRAINT [FK_ERP_RequestAttachments_ApplID] FOREIGN KEY([ApplID])
REFERENCES [dbo].[ERP_Applications] ([ApplID])
GO
ALTER TABLE [dbo].[ERP_RequestAttachments] CHECK CONSTRAINT [FK_ERP_RequestAttachments_ApplID]
GO
ALTER TABLE [dbo].[ERP_RequestAttachments]  WITH NOCHECK ADD  CONSTRAINT [FK_ERP_RequestAttachments_ApplID_RequestID] FOREIGN KEY([ApplID], [RequestID])
REFERENCES [dbo].[ERP_ChaneRequest] ([ApplID], [RequestID])
GO
ALTER TABLE [dbo].[ERP_RequestAttachments] CHECK CONSTRAINT [FK_ERP_RequestAttachments_ApplID_RequestID]
GO
