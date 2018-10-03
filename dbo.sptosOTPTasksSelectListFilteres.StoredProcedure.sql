USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPTasksSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @Filter_AssignedTo NVarChar(8),
  @Filter_ParentTaskID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,TaskID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', TaskID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_Tasks].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [TOS_Tasks].[TaskID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_Tasks] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [TOS_Tasks].[AssignedTo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS2]'
  SET @LGSQL = @LGSQL + '    ON [TOS_Tasks].[ElementID] = [IDM_WBS2].[WBSID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_FunctionalArea] AS [TOS_FunctionalArea3]'
  SET @LGSQL = @LGSQL + '    ON [TOS_Tasks].[FunctionalAreaID] = [TOS_FunctionalArea3].[FunctionalAreaID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TOS_Projects] AS [TOS_Projects4]'
  SET @LGSQL = @LGSQL + '    ON [TOS_Tasks].[ProjectID] = [TOS_Projects4].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOSv_Parent] AS [TOSv_Parent5]'
  SET @LGSQL = @LGSQL + '    ON [TOS_Tasks].[ProjectID] = [TOSv_Parent5].[ProjectID]'
  SET @LGSQL = @LGSQL + '    AND [TOS_Tasks].[ParentTaskID] = [TOSv_Parent5].[TaskID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_TaskTypes] AS [TOS_TaskTypes6]'
  SET @LGSQL = @LGSQL + '    ON [TOS_Tasks].[TaskTypeID] = [TOS_TaskTypes6].[TaskTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_Tasks].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_AssignedTo > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_Tasks].[AssignedTo] = ''' + @Filter_AssignedTo + ''''
  IF (@Filter_ParentTaskID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TOS_Tasks].[ParentTaskID] = ' + STR(@Filter_ParentTaskID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[TOS_Tasks].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TOS_Tasks].[ProjectID] DESC'
                        WHEN 'TaskID' THEN '[TOS_Tasks].[TaskID]'
                        WHEN 'TaskID DESC' THEN '[TOS_Tasks].[TaskID] DESC'
                        WHEN 'Description' THEN '[TOS_Tasks].[Description]'
                        WHEN 'Description DESC' THEN '[TOS_Tasks].[Description] DESC'
                        WHEN 'stdtDefined' THEN '[TOS_Tasks].[stdtDefined]'
                        WHEN 'stdtDefined DESC' THEN '[TOS_Tasks].[stdtDefined] DESC'
                        WHEN 'endtDefined' THEN '[TOS_Tasks].[endtDefined]'
                        WHEN 'endtDefined DESC' THEN '[TOS_Tasks].[endtDefined] DESC'
                        WHEN 'wuDefined' THEN '[TOS_Tasks].[wuDefined]'
                        WHEN 'wuDefined DESC' THEN '[TOS_Tasks].[wuDefined] DESC'
                        WHEN 'ElementID' THEN '[TOS_Tasks].[ElementID]'
                        WHEN 'ElementID DESC' THEN '[TOS_Tasks].[ElementID] DESC'
                        WHEN 'FunctionalAreaID' THEN '[TOS_Tasks].[FunctionalAreaID]'
                        WHEN 'FunctionalAreaID DESC' THEN '[TOS_Tasks].[FunctionalAreaID] DESC'
                        WHEN 'TaskTypeID' THEN '[TOS_Tasks].[TaskTypeID]'
                        WHEN 'TaskTypeID DESC' THEN '[TOS_Tasks].[TaskTypeID] DESC'
                        WHEN 'AssignedTo' THEN '[TOS_Tasks].[AssignedTo]'
                        WHEN 'AssignedTo DESC' THEN '[TOS_Tasks].[AssignedTo] DESC'
                        WHEN 'ParentTaskID' THEN '[TOS_Tasks].[ParentTaskID]'
                        WHEN 'ParentTaskID DESC' THEN '[TOS_Tasks].[ParentTaskID] DESC'
                        WHEN 'Active' THEN '[TOS_Tasks].[Active]'
                        WHEN 'Active DESC' THEN '[TOS_Tasks].[Active] DESC'
                        WHEN 'Sequence' THEN '[TOS_Tasks].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[TOS_Tasks].[Sequence] DESC'
                        WHEN 'stdtActual' THEN '[TOS_Tasks].[stdtActual]'
                        WHEN 'stdtActual DESC' THEN '[TOS_Tasks].[stdtActual] DESC'
                        WHEN 'endtActual' THEN '[TOS_Tasks].[endtActual]'
                        WHEN 'endtActual DESC' THEN '[TOS_Tasks].[endtActual] DESC'
                        WHEN 'wuEntered' THEN '[TOS_Tasks].[wuEntered]'
                        WHEN 'wuEntered DESC' THEN '[TOS_Tasks].[wuEntered] DESC'
                        WHEN 'wuBalance' THEN '[TOS_Tasks].[wuBalance]'
                        WHEN 'wuBalance DESC' THEN '[TOS_Tasks].[wuBalance] DESC'
                        WHEN 'Predecessors' THEN '[TOS_Tasks].[Predecessors]'
                        WHEN 'Predecessors DESC' THEN '[TOS_Tasks].[Predecessors] DESC'
                        WHEN 'Successors' THEN '[TOS_Tasks].[Successors]'
                        WHEN 'Successors DESC' THEN '[TOS_Tasks].[Successors] DESC'
                        WHEN 'wuNoteID' THEN '[TOS_Tasks].[wuNoteID]'
                        WHEN 'wuNoteID DESC' THEN '[TOS_Tasks].[wuNoteID] DESC'
                        WHEN 'IsParent' THEN '[TOS_Tasks].[IsParent]'
                        WHEN 'IsParent DESC' THEN '[TOS_Tasks].[IsParent] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'IDM_WBS2_Description' THEN '[IDM_WBS2].[Description]'
                        WHEN 'IDM_WBS2_Description DESC' THEN '[IDM_WBS2].[Description] DESC'
                        WHEN 'TOS_FunctionalArea3_Description' THEN '[TOS_FunctionalArea3].[Description]'
                        WHEN 'TOS_FunctionalArea3_Description DESC' THEN '[TOS_FunctionalArea3].[Description] DESC'
                        WHEN 'TOS_Projects4_Description' THEN '[TOS_Projects4].[Description]'
                        WHEN 'TOS_Projects4_Description DESC' THEN '[TOS_Projects4].[Description] DESC'
                        WHEN 'TOSv_Parent5_Description' THEN '[TOSv_Parent5].[Description]'
                        WHEN 'TOSv_Parent5_Description DESC' THEN '[TOSv_Parent5].[Description] DESC'
                        WHEN 'TOS_TaskTypes6_Description' THEN '[TOS_TaskTypes6].[Description]'
                        WHEN 'TOS_TaskTypes6_Description DESC' THEN '[TOS_TaskTypes6].[Description] DESC'
                        ELSE '[TOS_Tasks].[ProjectID],[TOS_Tasks].[TaskID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [TOS_Tasks].[ProjectID] = #PageIndex.ProjectID
          AND [TOS_Tasks].[TaskID] = #PageIndex.TaskID
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
