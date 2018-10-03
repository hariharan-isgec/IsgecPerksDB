USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfdbNotesDelete]
  @Original_IndexValue VarChar(200),
  @Original_NotesId VarChar(200),
  @RowCount int = null OUTPUT
  AS
  DELETE [Note_Notes]
  WHERE
  [Note_Notes].[IndexValue] = @Original_IndexValue
  AND [Note_Notes].[NotesId] = @Original_NotesId
  SET @RowCount = @@RowCount
GO
