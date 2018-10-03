USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOS_Tasks](
	[ProjectID] [nvarchar](6) NOT NULL,
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
	[wuDefined] [int] NOT NULL,
	[wuEntered] [int] NOT NULL,
	[wuBalance] [int] NOT NULL,
	[stdtDefined] [datetime] NULL,
	[endtDefined] [datetime] NULL,
	[stdtActual] [datetime] NULL,
	[endtActual] [datetime] NULL,
	[Sequence] [int] NULL,
	[ElementID] [nvarchar](8) NULL,
	[FunctionalAreaID] [nvarchar](6) NULL,
	[TaskTypeID] [nvarchar](2) NULL,
	[Active] [bit] NOT NULL,
	[wuNoteID] [int] NULL,
	[AssignedTo] [nvarchar](8) NULL,
	[Predecessors] [nvarchar](500) NULL,
	[Successors] [nvarchar](500) NULL,
	[ParentTaskID] [int] NULL,
	[IsParent] [bit] NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TOS_Tasks] ON [dbo].[TOS_Tasks] 
(
	[ProjectID] ASC,
	[TaskID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TOS_Tasks_1] ON [dbo].[TOS_Tasks] 
(
	[AssignedTo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TOS_Tasks_2] ON [dbo].[TOS_Tasks] 
(
	[ParentTaskID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TOS_Tasks_3] ON [dbo].[TOS_Tasks] 
(
	[ProjectID] ASC,
	[Sequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TOS_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_TOS_ElementID] FOREIGN KEY([ElementID])
REFERENCES [dbo].[IDM_WBS] ([WBSID])
GO
ALTER TABLE [dbo].[TOS_Tasks] CHECK CONSTRAINT [FK_TOS_ElementID]
GO
ALTER TABLE [dbo].[TOS_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_TOS_FunctionalAreaID] FOREIGN KEY([FunctionalAreaID])
REFERENCES [dbo].[TOS_FunctionalArea] ([FunctionalAreaID])
GO
ALTER TABLE [dbo].[TOS_Tasks] CHECK CONSTRAINT [FK_TOS_FunctionalAreaID]
GO
ALTER TABLE [dbo].[TOS_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_TOS_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[TOS_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[TOS_Tasks] CHECK CONSTRAINT [FK_TOS_ProjectID]
GO
ALTER TABLE [dbo].[TOS_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_TOS_Tasks_AssignedTo] FOREIGN KEY([AssignedTo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TOS_Tasks] CHECK CONSTRAINT [FK_TOS_Tasks_AssignedTo]
GO
ALTER TABLE [dbo].[TOS_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_TOS_TaskTypeID] FOREIGN KEY([TaskTypeID])
REFERENCES [dbo].[TOS_TaskTypes] ([TaskTypeID])
GO
ALTER TABLE [dbo].[TOS_Tasks] CHECK CONSTRAINT [FK_TOS_TaskTypeID]
GO
ALTER TABLE [dbo].[TOS_Tasks] ADD  CONSTRAINT [DF_TOS_Tasks_wuDefined]  DEFAULT ((0)) FOR [wuDefined]
GO
ALTER TABLE [dbo].[TOS_Tasks] ADD  CONSTRAINT [DF_TOS_Tasks_wuEntered]  DEFAULT ((0)) FOR [wuEntered]
GO
ALTER TABLE [dbo].[TOS_Tasks] ADD  CONSTRAINT [DF_TOS_Tasks_wuBalance]  DEFAULT ((0)) FOR [wuBalance]
GO
ALTER TABLE [dbo].[TOS_Tasks] ADD  CONSTRAINT [DF_TOS_Tasks_Sequence]  DEFAULT ((0)) FOR [Sequence]
GO
ALTER TABLE [dbo].[TOS_Tasks] ADD  CONSTRAINT [DF_TOS_Tasks_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[TOS_Tasks] ADD  CONSTRAINT [DF_TOS_Tasks_IsParent]  DEFAULT ((0)) FOR [IsParent]
GO
