USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spntReminderSelectListSearch]
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
 ,ReminderID Int NOT NULL
  )
  INSERT INTO #PageIndex (ReminderID)
  SELECT [Note_Reminder].[ReminderID] FROM [Note_Reminder]
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [Note_Reminder].[User] = [aspnet_users1].[LoginID]
 WHERE  
   ( 
         STR(ISNULL([Note_Reminder].[ReminderID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([Note_Reminder].[NotesId],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([Note_Reminder].[ReminderTo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([Note_Reminder].[Status],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([Note_Reminder].[User],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ReminderID' THEN [Note_Reminder].[ReminderID] END,
     CASE @OrderBy WHEN 'ReminderID DESC' THEN [Note_Reminder].[ReminderID] END DESC,
     CASE @OrderBy WHEN 'NotesId' THEN [Note_Reminder].[NotesId] END,
     CASE @OrderBy WHEN 'NotesId DESC' THEN [Note_Reminder].[NotesId] END DESC,
     CASE @OrderBy WHEN 'ReminderTo' THEN [Note_Reminder].[ReminderTo] END,
     CASE @OrderBy WHEN 'ReminderTo DESC' THEN [Note_Reminder].[ReminderTo] END DESC,
     CASE @OrderBy WHEN 'ReminderDateTime' THEN [Note_Reminder].[ReminderDateTime] END,
     CASE @OrderBy WHEN 'ReminderDateTime DESC' THEN [Note_Reminder].[ReminderDateTime] END DESC,
     CASE @OrderBy WHEN 'Status' THEN [Note_Reminder].[Status] END,
     CASE @OrderBy WHEN 'Status DESC' THEN [Note_Reminder].[Status] END DESC,
     CASE @OrderBy WHEN 'CreatedDate' THEN [Note_Reminder].[CreatedDate] END,
     CASE @OrderBy WHEN 'CreatedDate DESC' THEN [Note_Reminder].[CreatedDate] END DESC,
     CASE @OrderBy WHEN 'User' THEN [Note_Reminder].[User] END,
     CASE @OrderBy WHEN 'User DESC' THEN [Note_Reminder].[User] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [Note_Reminder].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [Note_Reminder] 
      INNER JOIN #PageIndex
          ON [Note_Reminder].[ReminderID] = #PageIndex.ReminderID
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [Note_Reminder].[User] = [aspnet_users1].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
