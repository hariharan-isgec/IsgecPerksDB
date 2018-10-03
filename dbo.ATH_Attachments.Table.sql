USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ATH_Attachments](
	[Document_RunningId] [varchar](200) NOT NULL,
	[DocumentId] [varchar](200) NOT NULL,
	[AttachmentHandle] [varchar](200) NOT NULL,
	[IndexValue] [varchar](50) NOT NULL,
	[PurposeCode] [varchar](200) NOT NULL,
	[FileName] [varchar](max) NOT NULL,
	[LibraryCode] [varchar](50) NOT NULL,
	[AttachedBy] [varchar](50) NOT NULL,
	[AttachedOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Document_RunningId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ATH_Attachments]  WITH CHECK ADD FOREIGN KEY([LibraryCode])
REFERENCES [dbo].[ATH_Library] ([LibraryCode])
GO
ALTER TABLE [dbo].[ATH_Attachments]  WITH CHECK ADD FOREIGN KEY([LibraryCode])
REFERENCES [dbo].[ATH_Library] ([LibraryCode])
GO
ALTER TABLE [dbo].[ATH_Attachments]  WITH CHECK ADD FOREIGN KEY([PurposeCode])
REFERENCES [dbo].[ATH_Purpose] ([PurposeCode])
GO
ALTER TABLE [dbo].[ATH_Attachments]  WITH CHECK ADD FOREIGN KEY([PurposeCode])
REFERENCES [dbo].[ATH_Purpose] ([PurposeCode])
GO
