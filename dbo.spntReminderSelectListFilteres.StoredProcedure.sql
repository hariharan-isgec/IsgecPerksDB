USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spntReminderSelectListFilteres]
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
 ,ReminderID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ReminderID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[Note_Reminder].[ReminderID]'
  SET @LGSQL = @LGSQL + ' FROM [Note_Reminder] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [Note_Reminder].[User] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ReminderID' THEN '[Note_Reminder].[ReminderID]'
                        WHEN 'ReminderID DESC' THEN '[Note_Reminder].[ReminderID] DESC'
                        WHEN 'NotesId' THEN '[Note_Reminder].[NotesId]'
                        WHEN 'NotesId DESC' THEN '[Note_Reminder].[NotesId] DESC'
                        WHEN 'ReminderTo' THEN '[Note_Reminder].[ReminderTo]'
                        WHEN 'ReminderTo DESC' THEN '[Note_Reminder].[ReminderTo] DESC'
                        WHEN 'ReminderDateTime' THEN '[Note_Reminder].[ReminderDateTime]'
                        WHEN 'ReminderDateTime DESC' THEN '[Note_Reminder].[ReminderDateTime] DESC'
                        WHEN 'Status' THEN '[Note_Reminder].[Status]'
                        WHEN 'Status DESC' THEN '[Note_Reminder].[Status] DESC'
                        WHEN 'CreatedDate' THEN '[Note_Reminder].[CreatedDate]'
                        WHEN 'CreatedDate DESC' THEN '[Note_Reminder].[CreatedDate] DESC'
                        WHEN 'User' THEN '[Note_Reminder].[User]'
                        WHEN 'User DESC' THEN '[Note_Reminder].[User] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        ELSE '[Note_Reminder].[ReminderID]'
                    END
  EXEC (@LGSQL)

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
