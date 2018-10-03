USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfdbNotesSelectListFilteres]
  @Filter_IndexValue VarChar(200),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,IndexValue VarChar(200) NOT NULL
 ,NotesId VarChar(200) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'IndexValue'
  SET @LGSQL = @LGSQL + ', NotesId'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[Note_Notes].[IndexValue]'
  SET @LGSQL = @LGSQL + ', [Note_Notes].[NotesId]'
  SET @LGSQL = @LGSQL + ' FROM [Note_Notes] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [Note_Notes].[UserId] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_IndexValue > '') 
    SET @LGSQL = @LGSQL + ' AND [Note_Notes].[IndexValue] = ''' + @Filter_IndexValue + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IndexValue' THEN '[Note_Notes].[IndexValue]'
                        WHEN 'IndexValue DESC' THEN '[Note_Notes].[IndexValue] DESC'
                        WHEN 'SendEmailTo' THEN '[Note_Notes].[SendEmailTo]'
                        WHEN 'SendEmailTo DESC' THEN '[Note_Notes].[SendEmailTo] DESC'
                        WHEN 'Title' THEN '[Note_Notes].[Title]'
                        WHEN 'Title DESC' THEN '[Note_Notes].[Title] DESC'
                        WHEN 'Description' THEN '[Note_Notes].[Description]'
                        WHEN 'Description DESC' THEN '[Note_Notes].[Description] DESC'
                        WHEN 'Notes_RunningNo' THEN '[Note_Notes].[Notes_RunningNo]'
                        WHEN 'Notes_RunningNo DESC' THEN '[Note_Notes].[Notes_RunningNo] DESC'
                        WHEN 'NotesHandle' THEN '[Note_Notes].[NotesHandle]'
                        WHEN 'NotesHandle DESC' THEN '[Note_Notes].[NotesHandle] DESC'
                        WHEN 'UserId' THEN '[Note_Notes].[UserId]'
                        WHEN 'UserId DESC' THEN '[Note_Notes].[UserId] DESC'
                        WHEN 'Created_Date' THEN '[Note_Notes].[Created_Date]'
                        WHEN 'Created_Date DESC' THEN '[Note_Notes].[Created_Date] DESC'
                        WHEN 'NotesId' THEN '[Note_Notes].[NotesId]'
                        WHEN 'NotesId DESC' THEN '[Note_Notes].[NotesId] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        ELSE '[Note_Notes].[IndexValue],[Note_Notes].[NotesId]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [Note_Notes].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [Note_Notes] 
      INNER JOIN #PageIndex
          ON [Note_Notes].[IndexValue] = #PageIndex.IndexValue
          AND [Note_Notes].[NotesId] = #PageIndex.NotesId
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [Note_Notes].[UserId] = [aspnet_Users1].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
