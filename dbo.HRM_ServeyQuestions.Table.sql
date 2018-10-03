USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_ServeyQuestions](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[ServeyID] [int] NOT NULL,
	[Demography] [bit] NOT NULL,
	[UseCaption] [bit] NOT NULL,
	[AnsTag1] [nvarchar](50) NULL,
	[AnsTag2] [nvarchar](50) NULL,
	[AnsTag3] [nvarchar](50) NULL,
	[AnsTag4] [nvarchar](50) NULL,
	[AnsTag5] [nvarchar](50) NULL,
	[AnsTag6] [nvarchar](50) NULL,
	[AnsTag7] [nvarchar](50) NULL,
	[AnsTag8] [nvarchar](50) NULL,
	[AnsTag9] [nvarchar](50) NULL,
	[AnsTag10] [nvarchar](50) NULL,
	[AnsTag11] [nvarchar](50) NULL,
	[AnsTag12] [nvarchar](50) NULL,
	[AnsTag13] [nvarchar](50) NULL,
	[AnsTag14] [nvarchar](50) NULL,
	[AnsTag15] [nvarchar](50) NULL,
	[AnsTag16] [nvarchar](50) NULL,
	[AnsTag17] [nvarchar](50) NULL,
	[AnsTag18] [nvarchar](50) NULL,
	[AnsTag19] [nvarchar](50) NULL,
	[AnsTag20] [nvarchar](50) NULL,
	[AnsTag21] [nvarchar](50) NULL,
	[AnsTag22] [nvarchar](50) NULL,
	[AnsTag23] [nvarchar](50) NULL,
	[AnsTag24] [nvarchar](50) NULL,
	[AnsTag25] [nvarchar](50) NULL,
 CONSTRAINT [PK_HRM_ServeyQuestions] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_HRM_ServeyQuestions] ON [dbo].[HRM_ServeyQuestions] 
(
	[ServeyID] ASC,
	[QuestionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_ServeyQuestions]  WITH CHECK ADD  CONSTRAINT [FK_HRM_ServeyQuestions_HRM_Serveys] FOREIGN KEY([ServeyID])
REFERENCES [dbo].[HRM_Serveys] ([ServeyID])
GO
ALTER TABLE [dbo].[HRM_ServeyQuestions] CHECK CONSTRAINT [FK_HRM_ServeyQuestions_HRM_Serveys]
GO
ALTER TABLE [dbo].[HRM_ServeyQuestions] ADD  CONSTRAINT [DF_HRM_ServeyQuestions_Demography]  DEFAULT ((0)) FOR [Demography]
GO
ALTER TABLE [dbo].[HRM_ServeyQuestions] ADD  CONSTRAINT [DF_HRM_ServeyQuestions_UseCaption]  DEFAULT ((0)) FOR [UseCaption]
GO
