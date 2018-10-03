USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_Documents](
	[DocumentNo] [int] IDENTITY(1,1) NOT NULL,
	[DocumentID] [nvarchar](50) NULL,
	[DocumentRevision] [nvarchar](10) NULL,
	[Description] [nvarchar](100) NULL,
	[ExternalDocument] [bit] NOT NULL,
	[Filename] [nvarchar](100) NULL,
	[DisskFile] [nvarchar](50) NULL,
	[cmba]  AS (([documentid]+'-')+[DocumentRevision]),
 CONSTRAINT [PK_PAK_Documents] PRIMARY KEY CLUSTERED 
(
	[DocumentNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_Documents] ADD  CONSTRAINT [DF_PAK_Documents_ExternalDocument]  DEFAULT ((0)) FOR [ExternalDocument]
GO
