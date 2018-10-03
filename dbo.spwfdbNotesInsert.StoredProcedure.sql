USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfdbNotesInsert]
  @IndexValue VarChar(200),
  @Title VarChar(4000),
  @UserId VarChar(8),
  @Created_Date DateTime,
  @SendEmailTo VarChar(4000),
  @NotesId VarChar(200),
  @Description VarChar(4000),
  @Notes_RunningNo Int,
  @NotesHandle VarChar(200),
  @Return_IndexValue VarChar(200) = null OUTPUT, 
  @Return_NotesId VarChar(200) = null OUTPUT 
  AS
  INSERT [Note_Notes]
  (
   [IndexValue]
  ,[Title]
  ,[UserId]
  ,[Created_Date]
  ,[SendEmailTo]
  ,[NotesId]
  ,[Description]
  ,[Notes_RunningNo]
  ,[NotesHandle]
  )
  VALUES
  (
   UPPER(@IndexValue)
  ,@Title
  ,@UserId
  ,@Created_Date
  ,@SendEmailTo
  ,UPPER(@NotesId)
  ,@Description
  ,@Notes_RunningNo
  ,@NotesHandle
  )
  SET @Return_IndexValue = @IndexValue
  SET @Return_NotesId = @NotesId
GO
