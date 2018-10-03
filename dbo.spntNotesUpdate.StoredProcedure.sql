USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spntNotesUpdate]
  @Original_NotesId VarChar(200), 
  @Notes_RunningNo Int,
  @NotesId VarChar(200),
  @NotesHandle VarChar(200),
  @IndexValue VarChar(200),
  @Title VarChar(500),
  @Description VarChar(MAX),
  @UserId NVarChar(8),
  @Created_Date DateTime,
  @SendEmailTo VarChar(500),
  @RowCount int = null OUTPUT
  AS
  UPDATE [Note_Notes] SET 
   [Notes_RunningNo] = @Notes_RunningNo
  ,[NotesId] = @NotesId
  ,[NotesHandle] = @NotesHandle
  ,[IndexValue] = @IndexValue
  ,[Title] = @Title
  ,[Description] = @Description
  ,[UserId] = @UserId
  ,[Created_Date] = @Created_Date
  ,[SendEmailTo] = @SendEmailTo
  WHERE
  [NotesId] = @Original_NotesId
  SET @RowCount = @@RowCount
GO
