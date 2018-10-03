USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_Applications](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[WebPath] [nvarchar](250) NOT NULL,
	[GenerateDefaults] [bit] NOT NULL,
	[LinkedApplications] [nvarchar](50) NULL,
	[MainApplicationID] [int] NULL,
 CONSTRAINT [PK_SYS_Applications_1] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SYS_Applications] ADD  CONSTRAINT [DF_SYS_Applications_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[SYS_Applications] ADD  CONSTRAINT [DF_SYS_Applications_WebPath]  DEFAULT ('') FOR [WebPath]
GO
ALTER TABLE [dbo].[SYS_Applications] ADD  CONSTRAINT [DF_SYS_Applications_GenerateDefaults]  DEFAULT ((0)) FOR [GenerateDefaults]
GO
