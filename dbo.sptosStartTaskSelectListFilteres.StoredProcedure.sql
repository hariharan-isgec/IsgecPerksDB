USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosStartTaskSelectListFilteres]
  @Filter_TaskID Int,
  @Filter_CreatedBy NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @TaskStarted Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,TaskID Int NOT NULL
 ,NoteID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TaskID'
  SET @LGSQL = @LGSQL + ', NoteID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_Notes].[TaskID]'
  SET @LGSQL = @LGSQL + ', [TOS_Notes].[NoteID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_Notes] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [TOS_Notes].[CreatedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]'
  SET @LGSQL = @LGSQL + '    ON [TOS_Notes].[TaskID] = [TOS_Tasks2].[TaskID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [TOS_Notes].[TaskStarted] = ''' + CONVERT(NVarChar(10), @TaskStarted) + ''''
  IF (@Filter_TaskID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TOS_Notes].[TaskID] = ' + STR(@Filter_TaskID)
  IF (@Filter_CreatedBy > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_Notes].[CreatedBy] = ''' + @Filter_CreatedBy + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TaskID' THEN '[TOS_Notes].[TaskID]'
                        WHEN 'TaskID DESC' THEN '[TOS_Notes].[TaskID] DESC'
                        WHEN 'NoteID' THEN '[TOS_Notes].[NoteID]'
                        WHEN 'NoteID DESC' THEN '[TOS_Notes].[NoteID] DESC'
                        WHEN 'wuEntered' THEN '[TOS_Notes].[wuEntered]'
                        WHEN 'wuEntered DESC' THEN '[TOS_Notes].[wuEntered] DESC'
                        WHEN 'wuBalance' THEN '[TOS_Notes].[wuBalance]'
                        WHEN 'wuBalance DESC' THEN '[TOS_Notes].[wuBalance] DESC'
                        WHEN 'NoteSubject' THEN '[TOS_Notes].[NoteSubject]'
                        WHEN 'NoteSubject DESC' THEN '[TOS_Notes].[NoteSubject] DESC'
                        WHEN 'NoteDetails' THEN '[TOS_Notes].[NoteDetails]'
                        WHEN 'NoteDetails DESC' THEN '[TOS_Notes].[NoteDetails] DESC'
                        WHEN 'CreatedOn' THEN '[TOS_Notes].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[TOS_Notes].[CreatedOn] DESC'
                        WHEN 'CreatedBy' THEN '[TOS_Notes].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[TOS_Notes].[CreatedBy] DESC'
                        WHEN 'TaskClosed' THEN '[TOS_Notes].[TaskClosed]'
                        WHEN 'TaskClosed DESC' THEN '[TOS_Notes].[TaskClosed] DESC'
                        WHEN 'TaskStarted' THEN '[TOS_Notes].[TaskStarted]'
                        WHEN 'TaskStarted DESC' THEN '[TOS_Notes].[TaskStarted] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'TOS_Tasks2_Description' THEN '[TOS_Tasks].[Description]'
                        WHEN 'TOS_Tasks2_Description DESC' THEN '[TOS_Tasks2].[Description] DESC'
                        ELSE '[TOS_Notes].[TaskID],[TOS_Notes].[NoteID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TOS_Notes].[TaskID] ,
		[TOS_Notes].[NoteID] ,
		[TOS_Notes].[wuEntered] ,
		[TOS_Notes].[wuBalance] ,
		[TOS_Notes].[NoteSubject] ,
		[TOS_Notes].[NoteDetails] ,
		[TOS_Notes].[NoteText] ,
		[TOS_Notes].[CreatedOn] ,
		[TOS_Notes].[CreatedBy] ,
		[TOS_Notes].[TaskClosed] ,
		[TOS_Notes].[TaskStarted] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description 
  FROM [TOS_Notes] 
    	INNER JOIN #PageIndex
          ON [TOS_Notes].[TaskID] = #PageIndex.TaskID
          AND [TOS_Notes].[NoteID] = #PageIndex.NoteID
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_Notes].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_Notes].[TaskID] = [TOS_Tasks2].[TaskID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
