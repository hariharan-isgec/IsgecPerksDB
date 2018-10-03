USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spntReminderSelectByID]
  @LoginID NVarChar(8),
  @ReminderID Int 
  AS
  SELECT
    [Note_Reminder].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [Note_Reminder] 
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [Note_Reminder].[User] = [aspnet_users1].[LoginID]
  WHERE
  [Note_Reminder].[ReminderID] = @ReminderID
GO
