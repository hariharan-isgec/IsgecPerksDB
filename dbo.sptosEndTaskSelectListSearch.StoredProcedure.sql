USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosEndTaskSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @TaskClosed Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,TaskID Int NOT NULL
 ,NoteID Int NOT NULL
  )
  INSERT INTO #PageIndex (TaskID, NoteID)
  SELECT [TOS_Notes].[TaskID], [TOS_Notes].[NoteID] FROM [TOS_Notes]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_Notes].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_Notes].[TaskID] = [TOS_Tasks2].[TaskID]
 WHERE  
      [TOS_Notes].[TaskClosed] = (@TaskClosed)
   AND ( 
         STR(ISNULL([TOS_Notes].[TaskID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_Notes].[NoteID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_Notes].[wuEntered], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TOS_Notes].[wuBalance], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Notes].[NoteSubject],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Notes].[NoteDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_Notes].[CreatedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'TaskID' THEN [TOS_Notes].[TaskID] END,
     CASE @OrderBy WHEN 'TaskID DESC' THEN [TOS_Notes].[TaskID] END DESC,
     CASE @OrderBy WHEN 'NoteID' THEN [TOS_Notes].[NoteID] END,
     CASE @OrderBy WHEN 'NoteID DESC' THEN [TOS_Notes].[NoteID] END DESC,
     CASE @OrderBy WHEN 'wuEntered' THEN [TOS_Notes].[wuEntered] END,
     CASE @OrderBy WHEN 'wuEntered DESC' THEN [TOS_Notes].[wuEntered] END DESC,
     CASE @OrderBy WHEN 'wuBalance' THEN [TOS_Notes].[wuBalance] END,
     CASE @OrderBy WHEN 'wuBalance DESC' THEN [TOS_Notes].[wuBalance] END DESC,
     CASE @OrderBy WHEN 'NoteSubject' THEN [TOS_Notes].[NoteSubject] END,
     CASE @OrderBy WHEN 'NoteSubject DESC' THEN [TOS_Notes].[NoteSubject] END DESC,
     CASE @OrderBy WHEN 'NoteDetails' THEN [TOS_Notes].[NoteDetails] END,
     CASE @OrderBy WHEN 'NoteDetails DESC' THEN [TOS_Notes].[NoteDetails] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [TOS_Notes].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [TOS_Notes].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [TOS_Notes].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [TOS_Notes].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'TaskClosed' THEN [TOS_Notes].[TaskClosed] END,
     CASE @OrderBy WHEN 'TaskClosed DESC' THEN [TOS_Notes].[TaskClosed] END DESC,
     CASE @OrderBy WHEN 'TaskStarted' THEN [TOS_Notes].[TaskStarted] END,
     CASE @OrderBy WHEN 'TaskStarted DESC' THEN [TOS_Notes].[TaskStarted] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'TOS_Tasks2_Description' THEN [TOS_Tasks2].[Description] END,
     CASE @OrderBy WHEN 'TOS_Tasks2_Description DESC' THEN [TOS_Tasks2].[Description] END DESC 

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
