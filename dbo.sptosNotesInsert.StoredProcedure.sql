USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosNotesInsert]
  @TaskID Int,
  @wuEntered Int,
  @wuBalance Int,
  @NoteSubject NVarChar(500),
  @NoteDetails NVarChar(1024),
  @NoteText NText,
  @CreatedOn DateTime,
  @CreatedBy NVarChar(8),
  @TaskClosed Bit,
  @TaskStarted Bit,
  @Return_TaskID Int = null OUTPUT, 
  @Return_NoteID Int = null OUTPUT 
  AS
  INSERT [TOS_Notes]
  (
   [TaskID]
  ,[wuEntered]
  ,[wuBalance]
  ,[NoteSubject]
  ,[NoteDetails]
  ,[NoteText]
  ,[CreatedOn]
  ,[CreatedBy]
  ,[TaskClosed]
  ,[TaskStarted]
  )
  VALUES
  (
   @TaskID
  ,@wuEntered
  ,@wuBalance
  ,@NoteSubject
  ,@NoteDetails
  ,@NoteText
  ,@CreatedOn
  ,@CreatedBy
  ,@TaskClosed
  ,@TaskStarted
  )
  SET @Return_TaskID = @TaskID
  SET @Return_NoteID = Scope_Identity()
GO
