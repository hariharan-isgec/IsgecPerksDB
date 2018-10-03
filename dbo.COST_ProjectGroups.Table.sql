USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COST_ProjectGroups](
	[ProjectGroupID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectGroupDescription] [nvarchar](50) NULL,
	[ProjectTypeID] [nvarchar](10) NULL,
 CONSTRAINT [PK_COST_ProjectGroups] PRIMARY KEY CLUSTERED 
(
	[ProjectGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COST_ProjectGroups]  WITH CHECK ADD  CONSTRAINT [FK_COST_ProjectGroups_ProjectTypeID] FOREIGN KEY([ProjectTypeID])
REFERENCES [dbo].[COST_ProjectTypes] ([ProjectTypeID])
GO
ALTER TABLE [dbo].[COST_ProjectGroups] CHECK CONSTRAINT [FK_COST_ProjectGroups_ProjectTypeID]
GO
