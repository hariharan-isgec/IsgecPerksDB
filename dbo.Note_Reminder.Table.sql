USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Note_Reminder](
	[ReminderID] [int] NOT NULL,
	[NotesId] [varchar](200) NOT NULL,
	[ReminderTo] [varchar](max) NOT NULL,
	[ReminderDateTime] [datetime] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[User] [varchar](8) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Note_Reminder] PRIMARY KEY CLUSTERED 
(
	[ReminderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Note_Reminder] ADD  CONSTRAINT [DF_Note_Reminder_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
