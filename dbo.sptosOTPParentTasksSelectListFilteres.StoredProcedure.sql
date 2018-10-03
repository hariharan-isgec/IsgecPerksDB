USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPParentTasksSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[TOSv_Parent].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [TOSv_Parent].[TaskID]'
  SET @LGSQL = @LGSQL + ' FROM [TOSv_Parent] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[TOSv_Parent].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TOSv_Parent].[ProjectID] DESC'
                        WHEN 'TaskID' THEN '[TOSv_Parent].[TaskID]'
                        WHEN 'TaskID DESC' THEN '[TOSv_Parent].[TaskID] DESC'
                        WHEN 'Description' THEN '[TOSv_Parent].[Description]'
                        WHEN 'Description DESC' THEN '[TOSv_Parent].[Description] DESC'
                        WHEN 'Active' THEN '[TOSv_Parent].[Active]'
                        WHEN 'Active DESC' THEN '[TOSv_Parent].[Active] DESC'
                        WHEN 'ParentTaskID' THEN '[TOSv_Parent].[ParentTaskID]'
                        WHEN 'ParentTaskID DESC' THEN '[TOSv_Parent].[ParentTaskID] DESC'
                        WHEN 'IsParent' THEN '[TOSv_Parent].[IsParent]'
                        WHEN 'IsParent DESC' THEN '[TOSv_Parent].[IsParent] DESC'
                        ELSE '[TOSv_Parent].[ProjectID],[TOSv_Parent].[TaskID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TOSv_Parent].[ProjectID] ,
		[TOSv_Parent].[TaskID] ,
		[TOSv_Parent].[Description] ,
		[TOSv_Parent].[Active] ,
		[TOSv_Parent].[ParentTaskID] ,
		[TOSv_Parent].[IsParent]  
  FROM [TOSv_Parent] 
    	INNER JOIN #PageIndex
          ON [TOSv_Parent].[ProjectID] = #PageIndex.ProjectID
          AND [TOSv_Parent].[TaskID] = #PageIndex.TaskID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
