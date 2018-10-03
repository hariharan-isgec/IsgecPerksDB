USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosUserTasksSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(8) NOT NULL
 ,TaskID Int NOT NULL
  )
  INSERT INTO #PageIndex (UserID, TaskID)
  SELECT [TOS_UserTasks].[UserID], [TOS_UserTasks].[TaskID] FROM [TOS_UserTasks]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_UserTasks].[UserID] = [aspnet_Users1].[LoginID]
  INNER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_UserTasks].[TaskID] = [TOS_Tasks2].[TaskID]
  LEFT OUTER JOIN [TOS_TaskTypes] AS [TOS_TaskTypes3]
    ON [TOS_UserTasks].[TaskTypeID] = [TOS_TaskTypes3].[TaskTypeID]
 WHERE  
   ( 
         LOWER(ISNULL([TOS_UserTasks].[UserID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_UserTasks].[TaskID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_UserTasks].[TaskTypeID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'UserID' THEN [TOS_UserTasks].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [TOS_UserTasks].[UserID] END DESC,
     CASE @OrderBy WHEN 'TaskID' THEN [TOS_UserTasks].[TaskID] END,
     CASE @OrderBy WHEN 'TaskID DESC' THEN [TOS_UserTasks].[TaskID] END DESC,
     CASE @OrderBy WHEN 'TaskTypeID' THEN [TOS_UserTasks].[TaskTypeID] END,
     CASE @OrderBy WHEN 'TaskTypeID DESC' THEN [TOS_UserTasks].[TaskTypeID] END DESC,
     CASE @OrderBy WHEN 'EntryEnabled' THEN [TOS_UserTasks].[EntryEnabled] END,
     CASE @OrderBy WHEN 'EntryEnabled DESC' THEN [TOS_UserTasks].[EntryEnabled] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks2_Description' THEN [TOS_Tasks2].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks2_Description DESC' THEN [TOS_Tasks2].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_TaskTypes3_Description' THEN [TOS_TaskTypes3].[Description] END,
     CASE @OrderBy WHEN 'TOS_TaskTypes3_Description DESC' THEN [TOS_TaskTypes3].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TOS_UserTasks].[UserID] ,
		[TOS_UserTasks].[TaskID] ,
		[TOS_UserTasks].[TaskTypeID] ,
		[TOS_UserTasks].[EntryEnabled] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description,
		[TOS_TaskTypes3].[Description] AS TOS_TaskTypes3_Description 
  FROM [TOS_UserTasks] 
    	INNER JOIN #PageIndex
          ON [TOS_UserTasks].[UserID] = #PageIndex.UserID
          AND [TOS_UserTasks].[TaskID] = #PageIndex.TaskID
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_UserTasks].[UserID] = [aspnet_Users1].[LoginID]
  INNER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_UserTasks].[TaskID] = [TOS_Tasks2].[TaskID]
  LEFT OUTER JOIN [TOS_TaskTypes] AS [TOS_TaskTypes3]
    ON [TOS_UserTasks].[TaskTypeID] = [TOS_TaskTypes3].[TaskTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
