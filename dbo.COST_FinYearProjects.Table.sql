USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COST_FinYearProjects](
	[FinYear] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[ProjectID] [nvarchar](6) NOT NULL,
	[Descpription] [nvarchar](50) NULL,
	[IndividualGroup] [bit] NOT NULL,
	[CombinedGroup] [bit] NOT NULL,
	[IndividualGroupID] [int] NULL,
	[CombinedGroupID] [int] NULL,
	[Blocked] [bit] NOT NULL,
	[BlockingRemarks] [nvarchar](50) NULL,
	[EntryConfirmed] [bit] NOT NULL,
 CONSTRAINT [PK_COST_FinYearProjects] PRIMARY KEY CLUSTERED 
(
	[FinYear] ASC,
	[Quarter] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COST_FinYearProjects]  WITH CHECK ADD  CONSTRAINT [FK_COST_FinYearProjects_CombinedGroupID] FOREIGN KEY([CombinedGroupID], [ProjectID])
REFERENCES [dbo].[COST_ProjectGroupProjects] ([ProjectGroupID], [ProjectID])
GO
ALTER TABLE [dbo].[COST_FinYearProjects] CHECK CONSTRAINT [FK_COST_FinYearProjects_CombinedGroupID]
GO
ALTER TABLE [dbo].[COST_FinYearProjects]  WITH CHECK ADD  CONSTRAINT [FK_COST_FinYearProjects_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[COST_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[COST_FinYearProjects] CHECK CONSTRAINT [FK_COST_FinYearProjects_FinYear]
GO
ALTER TABLE [dbo].[COST_FinYearProjects]  WITH CHECK ADD  CONSTRAINT [FK_COST_FinYearProjects_IndividualGroupID] FOREIGN KEY([IndividualGroupID], [ProjectID])
REFERENCES [dbo].[COST_ProjectGroupProjects] ([ProjectGroupID], [ProjectID])
GO
ALTER TABLE [dbo].[COST_FinYearProjects] CHECK CONSTRAINT [FK_COST_FinYearProjects_IndividualGroupID]
GO
ALTER TABLE [dbo].[COST_FinYearProjects]  WITH CHECK ADD  CONSTRAINT [FK_COST_FinYearProjects_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[COST_FinYearProjects] CHECK CONSTRAINT [FK_COST_FinYearProjects_ProjectID]
GO
ALTER TABLE [dbo].[COST_FinYearProjects]  WITH CHECK ADD  CONSTRAINT [FK_COST_FinYearProjects_Quarter] FOREIGN KEY([Quarter])
REFERENCES [dbo].[COST_Quarters] ([Quarter])
GO
ALTER TABLE [dbo].[COST_FinYearProjects] CHECK CONSTRAINT [FK_COST_FinYearProjects_Quarter]
GO
ALTER TABLE [dbo].[COST_FinYearProjects] ADD  CONSTRAINT [DF_COST_FinYearProjects_IndividualGroup]  DEFAULT ((0)) FOR [IndividualGroup]
GO
ALTER TABLE [dbo].[COST_FinYearProjects] ADD  CONSTRAINT [DF_COST_FinYearProjects_CombinedGroup]  DEFAULT ((0)) FOR [CombinedGroup]
GO
ALTER TABLE [dbo].[COST_FinYearProjects] ADD  CONSTRAINT [DF_COST_FinYearProjects_Blocked]  DEFAULT ((0)) FOR [Blocked]
GO
ALTER TABLE [dbo].[COST_FinYearProjects] ADD  CONSTRAINT [DF_COST_FinYearProjects_EntryConfirmed]  DEFAULT ((0)) FOR [EntryConfirmed]
GO
