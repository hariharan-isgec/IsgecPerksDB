USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptos_LG_OTPTasksSelectByID]
  @TaskID Int 
  AS
  SELECT
		[TOS_Tasks].[ProjectID] ,
		[TOS_Tasks].[TaskID] ,
		[TOS_Tasks].[Description] ,
		[TOS_Tasks].[stdtDefined] ,
		[TOS_Tasks].[endtDefined] ,
		[TOS_Tasks].[wuDefined] ,
		[TOS_Tasks].[ElementID] ,
		[TOS_Tasks].[FunctionalAreaID] ,
		[TOS_Tasks].[TaskTypeID] ,
		[TOS_Tasks].[AssignedTo] ,
		[TOS_Tasks].[ParentTaskID] ,
		[TOS_Tasks].[Active] ,
		[TOS_Tasks].[Sequence] ,
		[TOS_Tasks].[stdtActual] ,
		[TOS_Tasks].[endtActual] ,
		[TOS_Tasks].[wuEntered] ,
		[TOS_Tasks].[wuBalance] ,
		[TOS_Tasks].[Predecessors] ,
		[TOS_Tasks].[Successors] ,
		[TOS_Tasks].[wuNoteID] ,
		[TOS_Tasks].[IsParent] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[IDM_WBS2].[Description] AS IDM_WBS2_Description,
		[TOS_FunctionalArea3].[Description] AS TOS_FunctionalArea3_Description,
		[TOS_Projects4].[Description] AS TOS_Projects4_Description,
		[TOSv_Parent5].[Description] AS TOSv_Parent5_Description,
		[TOS_TaskTypes6].[Description] AS TOS_TaskTypes6_Description 
  FROM [TOS_Tasks] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [TOS_Tasks].[AssignedTo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS2]
    ON [TOS_Tasks].[ElementID] = [IDM_WBS2].[WBSID]
  LEFT OUTER JOIN [TOS_FunctionalArea] AS [TOS_FunctionalArea3]
    ON [TOS_Tasks].[FunctionalAreaID] = [TOS_FunctionalArea3].[FunctionalAreaID]
  INNER JOIN [TOS_Projects] AS [TOS_Projects4]
    ON [TOS_Tasks].[ProjectID] = [TOS_Projects4].[ProjectID]
  LEFT OUTER JOIN [TOSv_Parent] AS [TOSv_Parent5]
    ON [TOS_Tasks].[ProjectID] = [TOSv_Parent5].[ProjectID]
    AND [TOS_Tasks].[ParentTaskID] = [TOSv_Parent5].[TaskID]
  LEFT OUTER JOIN [TOS_TaskTypes] AS [TOS_TaskTypes6]
    ON [TOS_Tasks].[TaskTypeID] = [TOS_TaskTypes6].[TaskTypeID]
  WHERE
   [TOS_Tasks].[TaskID] = @TaskID
GO
