USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Note_Notes](
	[Notes_RunningNo] [int] NOT NULL,
	[NotesId] [varchar](200) NOT NULL,
	[NotesHandle] [varchar](200) NOT NULL,
	[IndexValue] [varchar](200) NOT NULL,
	[Title] [varchar](max) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[UserId] [varchar](8) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[SendEmailTo] [varchar](max) NULL,
 CONSTRAINT [PK_Note_Notes] PRIMARY KEY CLUSTERED 
(
	[NotesId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Note_Notes] ADD  CONSTRAINT [DF_Note_Notes_Created_Date]  DEFAULT (getdate()) FOR [Created_Date]
GO
