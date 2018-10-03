USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCM_Documents](
	[ProjectID] [nvarchar](6) NOT NULL,
	[DocumentID] [nvarchar](30) NOT NULL,
	[RevisionNo] [nvarchar](2) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Locked] [bit] NOT NULL,
	[TmtlID] [int] NULL,
 CONSTRAINT [PK_DCM_Documents_1] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[DocumentID] ASC,
	[RevisionNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DCM_Documents]  WITH CHECK ADD  CONSTRAINT [FK_DCM_Documents_DCM_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[DCM_Projectss] ([ProjectID])
GO
ALTER TABLE [dbo].[DCM_Documents] CHECK CONSTRAINT [FK_DCM_Documents_DCM_Projects]
GO
ALTER TABLE [dbo].[DCM_Documents] ADD  CONSTRAINT [DF_DCM_Documents_DocumentCode]  DEFAULT ('') FOR [DocumentID]
GO
ALTER TABLE [dbo].[DCM_Documents] ADD  CONSTRAINT [DF_DCM_Documents_RevisionNo]  DEFAULT ('00') FOR [RevisionNo]
GO
ALTER TABLE [dbo].[DCM_Documents] ADD  CONSTRAINT [DF_DCM_Documents_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[DCM_Documents] ADD  CONSTRAINT [DF_DCM_Documents_Locked]  DEFAULT ((0)) FOR [Locked]
GO
