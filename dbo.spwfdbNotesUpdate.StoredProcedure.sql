USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfdbNotesUpdate]
  @Original_IndexValue VarChar(200), 
  @Original_NotesId VarChar(200), 
  @IndexValue VarChar(200),
  @Title VarChar(4000),
  @UserId VarChar(8),
  @Created_Date DateTime,
  @SendEmailTo VarChar(4000),
  @NotesId VarChar(200),
  @Description VarChar(4000),
  @Notes_RunningNo Int,
  @NotesHandle VarChar(200),
  @RowCount int = null OUTPUT
  AS
  UPDATE [Note_Notes] SET 
   [IndexValue] = @IndexValue
  ,[Title] = @Title
  ,[UserId] = @UserId
  ,[Created_Date] = @Created_Date
  ,[SendEmailTo] = @SendEmailTo
  ,[NotesId] = @NotesId
  ,[Description] = @Description
  ,[Notes_RunningNo] = @Notes_RunningNo
  ,[NotesHandle] = @NotesHandle
  WHERE
  [IndexValue] = @Original_IndexValue
  AND [NotesId] = @Original_NotesId
  SET @RowCount = @@RowCount
GO
