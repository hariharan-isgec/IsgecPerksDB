USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_ServeyThemeQuestions](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[ThemeID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[ServeyID] [int] NOT NULL,
 CONSTRAINT [PK_HRM_ServeyThemeQuestions] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_ServeyThemeQuestions]  WITH CHECK ADD  CONSTRAINT [FK_HRM_ServeyThemeQuestions_HRM_ServeyQuestions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[HRM_ServeyQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[HRM_ServeyThemeQuestions] CHECK CONSTRAINT [FK_HRM_ServeyThemeQuestions_HRM_ServeyQuestions]
GO
ALTER TABLE [dbo].[HRM_ServeyThemeQuestions]  WITH CHECK ADD  CONSTRAINT [FK_HRM_ServeyThemeQuestions_HRM_Serveys] FOREIGN KEY([ServeyID])
REFERENCES [dbo].[HRM_Serveys] ([ServeyID])
GO
ALTER TABLE [dbo].[HRM_ServeyThemeQuestions] CHECK CONSTRAINT [FK_HRM_ServeyThemeQuestions_HRM_Serveys]
GO
ALTER TABLE [dbo].[HRM_ServeyThemeQuestions]  WITH CHECK ADD  CONSTRAINT [FK_HRM_ServeyThemeQuestions_HRM_ServeyThemes] FOREIGN KEY([ThemeID])
REFERENCES [dbo].[HRM_ServeyThemes] ([ThemeID])
GO
ALTER TABLE [dbo].[HRM_ServeyThemeQuestions] CHECK CONSTRAINT [FK_HRM_ServeyThemeQuestions_HRM_ServeyThemes]
GO
