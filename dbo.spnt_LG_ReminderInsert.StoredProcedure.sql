USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spnt_LG_ReminderInsert]
  @ReminderID Int,
  @NotesId VarChar(200),
  @ReminderTo VarChar(500),
  @ReminderDateTime DateTime,
  @Status VarChar(10),
  @CreatedDate DateTime,
  @User NVarChar(8),
  @Return_ReminderID Int = null OUTPUT 
  AS
  BEGIN

  select @ReminderID = MAX(isnull(ReminderID,0))+1 from Note_Reminder

  INSERT [Note_Reminder]
  (
   [ReminderID]
  ,[NotesId]
  ,[ReminderTo]
  ,[ReminderDateTime]
  ,[Status]
  ,[CreatedDate]
  ,[User]
  )
  VALUES
  (
   @ReminderID
  ,@NotesId
  ,@ReminderTo
  ,@ReminderDateTime
  ,@Status
  ,@CreatedDate
  ,@User
  )
  SET @Return_ReminderID = @ReminderID
  END
GO
