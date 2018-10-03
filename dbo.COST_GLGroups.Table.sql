USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COST_GLGroups](
	[GLGroupID] [int] IDENTITY(1,1) NOT NULL,
	[GLNatureID] [int] NULL,
	[GLGroupDescriptions] [nvarchar](50) NULL,
	[CostGLGroupID] [int] NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_COST_GLGroups] PRIMARY KEY CLUSTERED 
(
	[GLGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_COST_GLGroups] ON [dbo].[COST_GLGroups] 
(
	[GLGroupDescriptions] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_COST_GLGroups_1] ON [dbo].[COST_GLGroups] 
(
	[Sequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COST_GLGroups]  WITH CHECK ADD  CONSTRAINT [FK_COST_GLGroups_CostGLGroupID] FOREIGN KEY([CostGLGroupID])
REFERENCES [dbo].[COST_GLGroups] ([GLGroupID])
GO
ALTER TABLE [dbo].[COST_GLGroups] CHECK CONSTRAINT [FK_COST_GLGroups_CostGLGroupID]
GO
ALTER TABLE [dbo].[COST_GLGroups]  WITH CHECK ADD  CONSTRAINT [FK_COST_GLGroups_GLNatureID] FOREIGN KEY([GLNatureID])
REFERENCES [dbo].[COST_GLNatures] ([GLNatureID])
GO
ALTER TABLE [dbo].[COST_GLGroups] CHECK CONSTRAINT [FK_COST_GLGroups_GLNatureID]
GO
ALTER TABLE [dbo].[COST_GLGroups] ADD  CONSTRAINT [DF_COST_GLGroups_Sequence]  DEFAULT ((0)) FOR [Sequence]
GO