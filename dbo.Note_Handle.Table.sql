USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Note_Handle](
	[NotesHandle] [nvarchar](200) NOT NULL,
	[DBID] [nvarchar](50) NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[TableDescription] [nvarchar](200) NULL,
	[AccessIndex] [nvarchar](200) NOT NULL,
	[Remarks] [nvarchar](200) NULL,
 CONSTRAINT [PK_Note_Handle] PRIMARY KEY CLUSTERED 
(
	[NotesHandle] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
