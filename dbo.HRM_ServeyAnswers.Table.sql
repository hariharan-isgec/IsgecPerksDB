USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_ServeyAnswers](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[ServeyID] [int] NOT NULL,
	[ServeySheetID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[Answer1] [bit] NOT NULL,
	[Answer2] [bit] NOT NULL,
	[Answer3] [bit] NOT NULL,
	[Answer4] [bit] NOT NULL,
	[Answer5] [bit] NOT NULL,
	[Answer6] [bit] NOT NULL,
	[Answer7] [bit] NOT NULL,
	[Answer8] [bit] NOT NULL,
	[Answer9] [bit] NOT NULL,
	[Answer10] [bit] NOT NULL,
	[Answer11] [bit] NOT NULL,
	[Answer12] [bit] NOT NULL,
	[Answer13] [bit] NOT NULL,
	[Answer14] [bit] NOT NULL,
	[Answer15] [bit] NOT NULL,
	[Answer16] [bit] NOT NULL,
	[Answer17] [bit] NOT NULL,
	[Answer18] [bit] NOT NULL,
	[Answer19] [bit] NOT NULL,
	[Answer20] [bit] NOT NULL,
	[Answer21] [bit] NOT NULL,
	[Answer22] [bit] NOT NULL,
	[Answer23] [bit] NOT NULL,
	[Answer24] [bit] NOT NULL,
	[Answer25] [bit] NOT NULL,
	[UserComments1] [nvarchar](500) NULL,
	[UserComments2] [nvarchar](500) NULL,
	[UserComments3] [nvarchar](500) NULL,
 CONSTRAINT [PK_HRM_ServeyAnswers] PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HRM_ServeyAnswers] ON [dbo].[HRM_ServeyAnswers] 
(
	[ServeySheetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HRM_ServeyAnswers_1] ON [dbo].[HRM_ServeyAnswers] 
(
	[ServeyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HRM_ServeyAnswers_2] ON [dbo].[HRM_ServeyAnswers] 
(
	[QuestionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HRM_ServeyAnswers_3] ON [dbo].[HRM_ServeyAnswers] 
(
	[ServeySheetID] ASC,
	[QuestionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers]  WITH CHECK ADD  CONSTRAINT [FK_HRM_ServeyAnswers_HRM_ServeyQuestions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[HRM_ServeyQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] CHECK CONSTRAINT [FK_HRM_ServeyAnswers_HRM_ServeyQuestions]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers]  WITH CHECK ADD  CONSTRAINT [FK_HRM_ServeyAnswers_HRM_Serveys] FOREIGN KEY([ServeyID])
REFERENCES [dbo].[HRM_Serveys] ([ServeyID])
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] CHECK CONSTRAINT [FK_HRM_ServeyAnswers_HRM_Serveys]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers]  WITH CHECK ADD  CONSTRAINT [FK_HRM_ServeyAnswers_HRM_ServeySheets] FOREIGN KEY([ServeySheetID])
REFERENCES [dbo].[HRM_ServeySheets] ([ServeySheetID])
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] CHECK CONSTRAINT [FK_HRM_ServeyAnswers_HRM_ServeySheets]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer1]  DEFAULT ((0)) FOR [Answer1]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer2]  DEFAULT ((0)) FOR [Answer2]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer3]  DEFAULT ((0)) FOR [Answer3]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer4]  DEFAULT ((0)) FOR [Answer4]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer5]  DEFAULT ((0)) FOR [Answer5]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer6]  DEFAULT ((0)) FOR [Answer6]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer7]  DEFAULT ((0)) FOR [Answer7]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer8]  DEFAULT ((0)) FOR [Answer8]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer9]  DEFAULT ((0)) FOR [Answer9]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer10]  DEFAULT ((0)) FOR [Answer10]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer11]  DEFAULT ((0)) FOR [Answer11]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer12]  DEFAULT ((0)) FOR [Answer12]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer13]  DEFAULT ((0)) FOR [Answer13]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer14]  DEFAULT ((0)) FOR [Answer14]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer15]  DEFAULT ((0)) FOR [Answer15]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer16]  DEFAULT ((0)) FOR [Answer16]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer17]  DEFAULT ((0)) FOR [Answer17]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer18]  DEFAULT ((0)) FOR [Answer18]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer19]  DEFAULT ((0)) FOR [Answer19]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer20]  DEFAULT ((0)) FOR [Answer20]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer21]  DEFAULT ((0)) FOR [Answer21]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer22]  DEFAULT ((0)) FOR [Answer22]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer23]  DEFAULT ((0)) FOR [Answer23]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer24]  DEFAULT ((0)) FOR [Answer24]
GO
ALTER TABLE [dbo].[HRM_ServeyAnswers] ADD  CONSTRAINT [DF_HRM_ServeyAnswers_Answer25]  DEFAULT ((0)) FOR [Answer25]
GO
