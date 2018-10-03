USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosNotesSelectByID]
  @TaskID Int,
  @NoteID Int 
  AS
  SELECT
		[TOS_Notes].[TaskID] ,
		[TOS_Notes].[NoteID] ,
		[TOS_Notes].[wuEntered] ,
		[TOS_Notes].[wuBalance] ,
		[TOS_Notes].[NoteSubject] ,
		[TOS_Notes].[NoteDetails] ,
		[TOS_Notes].[NoteText] ,
		[TOS_Notes].[CreatedOn] ,
		[TOS_Notes].[CreatedBy] ,
		[TOS_Notes].[TaskClosed] ,
		[TOS_Notes].[TaskStarted] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description 
  FROM [TOS_Notes] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_Notes].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_Notes].[TaskID] = [TOS_Tasks2].[TaskID]
  WHERE
  [TOS_Notes].[TaskID] = @TaskID
  AND [TOS_Notes].[NoteID] = @NoteID
GO
