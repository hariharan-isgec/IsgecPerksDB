USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATH_Comments](
	[CommentId] [int] NOT NULL,
	[DocumentId] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](9) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[ParentCommentId] [int] NULL,
 CONSTRAINT [PK_ATH_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATH_Comments]  WITH CHECK ADD  CONSTRAINT [FK_ATH_Comments_ATH_Comments] FOREIGN KEY([CommentId])
REFERENCES [dbo].[ATH_Comments] ([CommentId])
GO
ALTER TABLE [dbo].[ATH_Comments] CHECK CONSTRAINT [FK_ATH_Comments_ATH_Comments]
GO
ALTER TABLE [dbo].[ATH_Comments] ADD  CONSTRAINT [DF_ATH_Comments_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
