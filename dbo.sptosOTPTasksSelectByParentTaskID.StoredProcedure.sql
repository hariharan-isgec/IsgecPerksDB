USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPTasksSelectByParentTaskID]
  @ParentTaskID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  [TOS_Tasks].[ParentTaskID] = @ParentTaskID
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [TOS_Tasks].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TOS_Tasks].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'TaskID' THEN [TOS_Tasks].[TaskID] END,
     CASE @OrderBy WHEN 'TaskID DESC' THEN [TOS_Tasks].[TaskID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOS_Tasks].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOS_Tasks].[Description] END DESC,
     CASE @OrderBy WHEN 'stdtDefined' THEN [TOS_Tasks].[stdtDefined] END,
     CASE @OrderBy WHEN 'stdtDefined DESC' THEN [TOS_Tasks].[stdtDefined] END DESC,
     CASE @OrderBy WHEN 'endtDefined' THEN [TOS_Tasks].[endtDefined] END,
     CASE @OrderBy WHEN 'endtDefined DESC' THEN [TOS_Tasks].[endtDefined] END DESC,
     CASE @OrderBy WHEN 'wuDefined' THEN [TOS_Tasks].[wuDefined] END,
     CASE @OrderBy WHEN 'wuDefined DESC' THEN [TOS_Tasks].[wuDefined] END DESC,
     CASE @OrderBy WHEN 'ElementID' THEN [TOS_Tasks].[ElementID] END,
     CASE @OrderBy WHEN 'ElementID DESC' THEN [TOS_Tasks].[ElementID] END DESC,
     CASE @OrderBy WHEN 'FunctionalAreaID' THEN [TOS_Tasks].[FunctionalAreaID] END,
     CASE @OrderBy WHEN 'FunctionalAreaID DESC' THEN [TOS_Tasks].[FunctionalAreaID] END DESC,
     CASE @OrderBy WHEN 'TaskTypeID' THEN [TOS_Tasks].[TaskTypeID] END,
     CASE @OrderBy WHEN 'TaskTypeID DESC' THEN [TOS_Tasks].[TaskTypeID] END DESC,
     CASE @OrderBy WHEN 'AssignedTo' THEN [TOS_Tasks].[AssignedTo] END,
     CASE @OrderBy WHEN 'AssignedTo DESC' THEN [TOS_Tasks].[AssignedTo] END DESC,
     CASE @OrderBy WHEN 'ParentTaskID' THEN [TOS_Tasks].[ParentTaskID] END,
     CASE @OrderBy WHEN 'ParentTaskID DESC' THEN [TOS_Tasks].[ParentTaskID] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TOS_Tasks].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TOS_Tasks].[Active] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [TOS_Tasks].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [TOS_Tasks].[Sequence] END DESC,
     CASE @OrderBy WHEN 'stdtActual' THEN [TOS_Tasks].[stdtActual] END,
     CASE @OrderBy WHEN 'stdtActual DESC' THEN [TOS_Tasks].[stdtActual] END DESC,
     CASE @OrderBy WHEN 'endtActual' THEN [TOS_Tasks].[endtActual] END,
     CASE @OrderBy WHEN 'endtActual DESC' THEN [TOS_Tasks].[endtActual] END DESC,
     CASE @OrderBy WHEN 'wuEntered' THEN [TOS_Tasks].[wuEntered] END,
     CASE @OrderBy WHEN 'wuEntered DESC' THEN [TOS_Tasks].[wuEntered] END DESC,
     CASE @OrderBy WHEN 'wuBalance' THEN [TOS_Tasks].[wuBalance] END,
     CASE @OrderBy WHEN 'wuBalance DESC' THEN [TOS_Tasks].[wuBalance] END DESC,
     CASE @OrderBy WHEN 'Predecessors' THEN [TOS_Tasks].[Predecessors] END,
     CASE @OrderBy WHEN 'Predecessors DESC' THEN [TOS_Tasks].[Predecessors] END DESC,
     CASE @OrderBy WHEN 'Successors' THEN [TOS_Tasks].[Successors] END,
     CASE @OrderBy WHEN 'Successors DESC' THEN [TOS_Tasks].[Successors] END DESC,
     CASE @OrderBy WHEN 'wuNoteID' THEN [TOS_Tasks].[wuNoteID] END,
     CASE @OrderBy WHEN 'wuNoteID DESC' THEN [TOS_Tasks].[wuNoteID] END DESC,
     CASE @OrderBy WHEN 'IsParent' THEN [TOS_Tasks].[IsParent] END,
     CASE @OrderBy WHEN 'IsParent DESC' THEN [TOS_Tasks].[IsParent] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'IDM_WBS2_Description' THEN [IDM_WBS2].[Description] END,
     CASE @OrderBy WHEN 'IDM_WBS2_Description DESC' THEN [IDM_WBS2].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_FunctionalArea3_Description' THEN [TOS_FunctionalArea3].[Description] END,
     CASE @OrderBy WHEN 'TOS_FunctionalArea3_Description DESC' THEN [TOS_FunctionalArea3].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_Projects4_Description' THEN [TOS_Projects4].[Description] END,
     CASE @OrderBy WHEN 'TOS_Projects4_Description DESC' THEN [TOS_Projects4].[Description] END DESC,
     CASE @OrderBy WHEN 'TOSv_Parent5_Description' THEN [TOSv_Parent5].[Description] END,
     CASE @OrderBy WHEN 'TOSv_Parent5_Description DESC' THEN [TOSv_Parent5].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_TaskTypes6_Description' THEN [TOS_TaskTypes6].[Description] END,
     CASE @OrderBy WHEN 'TOS_TaskTypes6_Description DESC' THEN [TOS_TaskTypes6].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
