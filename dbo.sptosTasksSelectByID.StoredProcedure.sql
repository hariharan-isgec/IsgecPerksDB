USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTasksSelectByID]
  @TaskID Int 
  AS
  SELECT
		[TOS_Tasks].[TaskID] ,
		[TOS_Tasks].[Description] ,
		[TOS_Tasks].[wuDefined] ,
		[TOS_Tasks].[stdtDefined] ,
		[TOS_Tasks].[endtDefined] ,
		[TOS_Tasks].[stdtActual] ,
		[TOS_Tasks].[Sequence] ,
		[TOS_Tasks].[endtActual] ,
		[TOS_Tasks].[ProjectID] ,
		[TOS_Tasks].[ElementID] ,
		[TOS_Tasks].[FunctionalAreaID] ,
		[TOS_Tasks].[TaskTypeID] ,
		[TOS_Tasks].[Active] ,
		[TOS_Tasks].[wuEntered] ,
		[TOS_Tasks].[wuBalance] ,
		[TOS_Tasks].[wuNoteID] ,
		[TOS_Tasks].[AssignedTo] ,
		[TOS_Tasks].[Predecessors] ,
		[TOS_Tasks].[Successors] ,
		[TOS_Tasks].[ParentTaskID] ,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description,
		[IDM_WBS2].[Description] AS IDM_WBS2_Description,
		[TOS_FunctionalArea3].[Description] AS TOS_FunctionalArea3_Description,
		[TOS_TaskTypes4].[Description] AS TOS_TaskTypes4_Description,
		[HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName,
		[TOSv_Parent6].[Description] AS TOSv_Parent6_Description 
  FROM [TOS_Tasks] 
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [TOS_Tasks].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS2]
    ON [TOS_Tasks].[ElementID] = [IDM_WBS2].[WBSID]
  LEFT OUTER JOIN [TOS_FunctionalArea] AS [TOS_FunctionalArea3]
    ON [TOS_Tasks].[FunctionalAreaID] = [TOS_FunctionalArea3].[FunctionalAreaID]
  LEFT OUTER JOIN [TOS_TaskTypes] AS [TOS_TaskTypes4]
    ON [TOS_Tasks].[TaskTypeID] = [TOS_TaskTypes4].[TaskTypeID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [TOS_Tasks].[AssignedTo] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [TOSv_Parent] AS [TOSv_Parent6]
    ON [TOS_Tasks].[ParentTaskID] = [TOSv_Parent6].[TaskID]
  WHERE
  [TOS_Tasks].[TaskID] = @TaskID
GO
