USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_SiteUserProjects](
	[UserID] [nvarchar](8) NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_PAK_SiteUserProjects] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_SiteUserProjects]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteUserProjects_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[PAK_SiteUserProjects] CHECK CONSTRAINT [FK_PAK_SiteUserProjects_ProjectID]
GO
ALTER TABLE [dbo].[PAK_SiteUserProjects]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteUserProjects_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_SiteUserProjects] CHECK CONSTRAINT [FK_PAK_SiteUserProjects_UserID]
GO
