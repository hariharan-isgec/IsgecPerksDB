USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAPP_Applications](
	[AppID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [nvarchar](50) NULL,
	[ApplicationDescription] [nvarchar](250) NULL,
	[IsActive] [bit] NOT NULL,
	[MainPageURL] [nvarchar](500) NOT NULL,
	[AppIconID] [int] NULL,
	[AppIconStyle] [nvarchar](500) NULL,
 CONSTRAINT [PK_MAPP_Applications] PRIMARY KEY CLUSTERED 
(
	[AppID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MAPP_Applications]  WITH CHECK ADD  CONSTRAINT [FK_MAPP_Applications_ApplIconID] FOREIGN KEY([AppIconID])
REFERENCES [dbo].[WF_DBIcons] ([DBIconID])
GO
ALTER TABLE [dbo].[MAPP_Applications] CHECK CONSTRAINT [FK_MAPP_Applications_ApplIconID]
GO
ALTER TABLE [dbo].[MAPP_Applications] ADD  CONSTRAINT [DF_MAPP_Applications_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
