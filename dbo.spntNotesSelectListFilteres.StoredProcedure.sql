USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spntNotesSelectListFilteres]
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
 ,NotesId VarChar(200) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'NotesId'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[Note_Notes].[NotesId]'
  SET @LGSQL = @LGSQL + ' FROM [Note_Notes] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [Note_Notes].[UserId] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'Notes_RunningNo' THEN '[Note_Notes].[Notes_RunningNo]'
                        WHEN 'Notes_RunningNo DESC' THEN '[Note_Notes].[Notes_RunningNo] DESC'
                        WHEN 'NotesId' THEN '[Note_Notes].[NotesId]'
                        WHEN 'NotesId DESC' THEN '[Note_Notes].[NotesId] DESC'
                        WHEN 'NotesHandle' THEN '[Note_Notes].[NotesHandle]'
                        WHEN 'NotesHandle DESC' THEN '[Note_Notes].[NotesHandle] DESC'
                        WHEN 'IndexValue' THEN '[Note_Notes].[IndexValue]'
                        WHEN 'IndexValue DESC' THEN '[Note_Notes].[IndexValue] DESC'
                        WHEN 'Title' THEN '[Note_Notes].[Title]'
                        WHEN 'Title DESC' THEN '[Note_Notes].[Title] DESC'
                        WHEN 'Description' THEN '[Note_Notes].[Description]'
                        WHEN 'Description DESC' THEN '[Note_Notes].[Description] DESC'
                        WHEN 'UserId' THEN '[Note_Notes].[UserId]'
                        WHEN 'UserId DESC' THEN '[Note_Notes].[UserId] DESC'
                        WHEN 'Created_Date' THEN '[Note_Notes].[Created_Date]'
                        WHEN 'Created_Date DESC' THEN '[Note_Notes].[Created_Date] DESC'
                        WHEN 'SendEmailTo' THEN '[Note_Notes].[SendEmailTo]'
                        WHEN 'SendEmailTo DESC' THEN '[Note_Notes].[SendEmailTo] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        ELSE '[Note_Notes].[NotesId]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [Note_Notes].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [Note_Notes] 
      INNER JOIN #PageIndex
          ON [Note_Notes].[NotesId] = #PageIndex.NotesId
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [Note_Notes].[UserId] = [aspnet_users1].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
