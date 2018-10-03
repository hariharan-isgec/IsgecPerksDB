USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spntNotesSelectListSearch]
  @LoginID NVarChar(8),
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
 ,NotesId VarChar(200) NOT NULL
  )
  INSERT INTO #PageIndex (NotesId)
  SELECT [Note_Notes].[NotesId] FROM [Note_Notes]
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [Note_Notes].[UserId] = [aspnet_users1].[LoginID]
 WHERE  
   ( 
         STR(ISNULL([Note_Notes].[Notes_RunningNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([Note_Notes].[NotesId],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([Note_Notes].[NotesHandle],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([Note_Notes].[IndexValue],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([Note_Notes].[Title],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([Note_Notes].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([Note_Notes].[UserId],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([Note_Notes].[SendEmailTo],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'Notes_RunningNo' THEN [Note_Notes].[Notes_RunningNo] END,
     CASE @OrderBy WHEN 'Notes_RunningNo DESC' THEN [Note_Notes].[Notes_RunningNo] END DESC,
     CASE @OrderBy WHEN 'NotesId' THEN [Note_Notes].[NotesId] END,
     CASE @OrderBy WHEN 'NotesId DESC' THEN [Note_Notes].[NotesId] END DESC,
     CASE @OrderBy WHEN 'NotesHandle' THEN [Note_Notes].[NotesHandle] END,
     CASE @OrderBy WHEN 'NotesHandle DESC' THEN [Note_Notes].[NotesHandle] END DESC,
     CASE @OrderBy WHEN 'IndexValue' THEN [Note_Notes].[IndexValue] END,
     CASE @OrderBy WHEN 'IndexValue DESC' THEN [Note_Notes].[IndexValue] END DESC,
     CASE @OrderBy WHEN 'Title' THEN [Note_Notes].[Title] END,
     CASE @OrderBy WHEN 'Title DESC' THEN [Note_Notes].[Title] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [Note_Notes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [Note_Notes].[Description] END DESC,
     CASE @OrderBy WHEN 'UserId' THEN [Note_Notes].[UserId] END,
     CASE @OrderBy WHEN 'UserId DESC' THEN [Note_Notes].[UserId] END DESC,
     CASE @OrderBy WHEN 'Created_Date' THEN [Note_Notes].[Created_Date] END,
     CASE @OrderBy WHEN 'Created_Date DESC' THEN [Note_Notes].[Created_Date] END DESC,
     CASE @OrderBy WHEN 'SendEmailTo' THEN [Note_Notes].[SendEmailTo] END,
     CASE @OrderBy WHEN 'SendEmailTo DESC' THEN [Note_Notes].[SendEmailTo] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC 

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
