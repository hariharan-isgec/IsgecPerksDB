USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spntNotesDelete]
  @Original_NotesId VarChar(200),
  @RowCount int = null OUTPUT
  AS
  DELETE [Note_Notes]
  WHERE
  [Note_Notes].[NotesId] = @Original_NotesId
  SET @RowCount = @@RowCount
GO
