USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spntReminderUpdate]
  @Original_ReminderID Int, 
  @ReminderID Int,
  @NotesId VarChar(200),
  @ReminderTo VarChar(500),
  @ReminderDateTime DateTime,
  @Status VarChar(10),
  @CreatedDate DateTime,
  @User NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [Note_Reminder] SET 
   [ReminderID] = @ReminderID
  ,[NotesId] = @NotesId
  ,[ReminderTo] = @ReminderTo
  ,[ReminderDateTime] = @ReminderDateTime
  ,[Status] = @Status
  ,[CreatedDate] = @CreatedDate
  ,[User] = @User
  WHERE
  [ReminderID] = @Original_ReminderID
  SET @RowCount = @@RowCount
GO
