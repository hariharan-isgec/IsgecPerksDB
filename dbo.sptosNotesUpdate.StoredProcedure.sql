USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosNotesUpdate]
  @Original_TaskID Int, 
  @Original_NoteID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_Notes] SET 
   [TaskID] = @TaskID
  ,[wuEntered] = @wuEntered
  ,[wuBalance] = @wuBalance
  ,[NoteSubject] = @NoteSubject
  ,[NoteDetails] = @NoteDetails
  ,[NoteText] = @NoteText
  ,[CreatedOn] = @CreatedOn
  ,[CreatedBy] = @CreatedBy
  ,[TaskClosed] = @TaskClosed
  ,[TaskStarted] = @TaskStarted
  WHERE
  [TaskID] = @Original_TaskID
  AND [NoteID] = @Original_NoteID
  SET @RowCount = @@RowCount
GO
