USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosNotesDelete]
  @Original_TaskID Int,
  @Original_NoteID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TOS_Notes]
  WHERE
  [TOS_Notes].[TaskID] = @Original_TaskID
  AND [TOS_Notes].[NoteID] = @Original_NoteID
  SET @RowCount = @@RowCount
GO
