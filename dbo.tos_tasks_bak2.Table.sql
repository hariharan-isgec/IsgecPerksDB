USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tos_tasks_bak2](
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
