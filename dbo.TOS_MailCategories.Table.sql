USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOS_MailCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_TOS_MailCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TOS_MailCategories] ADD  CONSTRAINT [DF_TOS_MailCategories_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[TOS_MailCategories] ADD  CONSTRAINT [DF_TOS_MailCategories_Sequence]  DEFAULT ((0)) FOR [Sequence]
GO
