USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COST_ProjectGroupProjects](
	[ProjectGroupID] [int] NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_COST_ProjectGroupProjects] PRIMARY KEY CLUSTERED 
(
	[ProjectGroupID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COST_ProjectGroupProjects]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectGroupProjects_ProjectGroupID] FOREIGN KEY([ProjectGroupID])
REFERENCES [dbo].[COST_ProjectGroups] ([ProjectGroupID])
GO
ALTER TABLE [dbo].[COST_ProjectGroupProjects] CHECK CONSTRAINT [FK_COST_ProjectGroupProjects_ProjectGroupID]
GO
ALTER TABLE [dbo].[COST_ProjectGroupProjects]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectGroupProjects_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[COST_ProjectGroupProjects] CHECK CONSTRAINT [FK_COST_ProjectGroupProjects_ProjectID]
GO
