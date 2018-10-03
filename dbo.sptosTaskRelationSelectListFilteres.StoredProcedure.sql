USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTaskRelationSelectListFilteres]
  @Filter_TaskID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,TaskID Int NOT NULL
 ,ChildID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TaskID'
  SET @LGSQL = @LGSQL + ', ChildID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_TaskRelation].[TaskID]'
  SET @LGSQL = @LGSQL + ', [TOS_TaskRelation].[ChildID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_TaskRelation] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [TOS_Tasks] AS [TOS_Tasks1]'
  SET @LGSQL = @LGSQL + '    ON [TOS_TaskRelation].[TaskID] = [TOS_Tasks1].[TaskID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TOS_Tasks] AS [TOS_Tasks2]'
  SET @LGSQL = @LGSQL + '    ON [TOS_TaskRelation].[ChildID] = [TOS_Tasks2].[TaskID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_TaskID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TOS_TaskRelation].[TaskID] = ' + STR(@Filter_TaskID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TaskID' THEN '[TOS_TaskRelation].[TaskID]'
                        WHEN 'TaskID DESC' THEN '[TOS_TaskRelation].[TaskID] DESC'
                        WHEN 'ChildID' THEN '[TOS_TaskRelation].[ChildID]'
                        WHEN 'ChildID DESC' THEN '[TOS_TaskRelation].[ChildID] DESC'
                        WHEN 'Sequence' THEN '[TOS_TaskRelation].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[TOS_TaskRelation].[Sequence] DESC'
                        WHEN 'Active' THEN '[TOS_TaskRelation].[Active]'
                        WHEN 'Active DESC' THEN '[TOS_TaskRelation].[Active] DESC'
                        WHEN 'TOS_Tasks1_Description' THEN '[TOS_Tasks].[Description]'
                        WHEN 'TOS_Tasks1_Description DESC' THEN '[TOS_Tasks1].[Description] DESC'
                        WHEN 'TOS_Tasks2_Description' THEN '[TOS_Tasks].[Description]'
                        WHEN 'TOS_Tasks2_Description DESC' THEN '[TOS_Tasks2].[Description] DESC'
                        ELSE '[TOS_TaskRelation].[TaskID],[TOS_TaskRelation].[ChildID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TOS_TaskRelation].[TaskID] ,
		[TOS_TaskRelation].[ChildID] ,
		[TOS_TaskRelation].[Sequence] ,
		[TOS_TaskRelation].[Active] ,
		[TOS_Tasks1].[Description] AS TOS_Tasks1_Description,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description 
  FROM [TOS_TaskRelation] 
    	INNER JOIN #PageIndex
          ON [TOS_TaskRelation].[TaskID] = #PageIndex.TaskID
          AND [TOS_TaskRelation].[ChildID] = #PageIndex.ChildID
  INNER JOIN [TOS_Tasks] AS [TOS_Tasks1]
    ON [TOS_TaskRelation].[TaskID] = [TOS_Tasks1].[TaskID]
  INNER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_TaskRelation].[ChildID] = [TOS_Tasks2].[TaskID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
