USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOS_Notes](
	[TaskID] [int] NOT NULL,
	[NoteID] [int] IDENTITY(1,1) NOT NULL,
	[wuEntered] [int] NULL,
	[NoteSubject] [nvarchar](500) NULL,
	[NoteDetails] [nvarchar](1024) NULL,
	[NoteText] [ntext] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[TaskStarted] [bit] NOT NULL,
	[TaskClosed] [bit] NOT NULL,
	[wuBalance] [int] NOT NULL,
 CONSTRAINT [PK_TOS_Notes] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC,
	[NoteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TOS_Notes]  WITH CHECK ADD  CONSTRAINT [FK_TOSNot_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[TOS_Notes] CHECK CONSTRAINT [FK_TOSNot_CreatedBy]
GO
ALTER TABLE [dbo].[TOS_Notes] ADD  CONSTRAINT [DF_TOS_Notes_wuEntered]  DEFAULT ((0)) FOR [wuEntered]
GO
ALTER TABLE [dbo].[TOS_Notes] ADD  CONSTRAINT [DF_TOS_Notes_TaskStarted]  DEFAULT ((0)) FOR [TaskStarted]
GO
ALTER TABLE [dbo].[TOS_Notes] ADD  CONSTRAINT [DF_TOS_Notes_TaskClosed]  DEFAULT ((0)) FOR [TaskClosed]
GO
ALTER TABLE [dbo].[TOS_Notes] ADD  CONSTRAINT [DF_TOS_Notes_wuBalance]  DEFAULT ((0)) FOR [wuBalance]
GO
