USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_Log](
	[UserID] [nvarchar](8) NOT NULL,
	[RequestID] [int] NOT NULL,
	[LoggedOn] [datetime] NOT NULL,
	[Action] [nvarchar](10) NOT NULL,
	[RequestProp] [nvarchar](4000) NULL,
	[RequestHeader] [nvarchar](4000) NULL,
	[MailSrNo] [int] NULL,
	[LinkSrNo] [int] NULL,
 CONSTRAINT [PK_ATN_Log_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RequestID] ASC,
	[LoggedOn] ASC,
	[Action] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
