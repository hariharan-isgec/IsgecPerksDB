USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spntNotesInsert]
  @Notes_RunningNo Int,
  @NotesId VarChar(200),
  @NotesHandle VarChar(200),
  @IndexValue VarChar(200),
  @Title VarChar(500),
  @Description VarChar(MAX),
  @UserId NVarChar(8),
  @Created_Date DateTime,
  @SendEmailTo VarChar(500),
  @Return_NotesId VarChar(200) = null OUTPUT 
  AS
  INSERT [Note_Notes]
  (
   [Notes_RunningNo]
  ,[NotesId]
  ,[NotesHandle]
  ,[IndexValue]
  ,[Title]
  ,[Description]
  ,[UserId]
  ,[Created_Date]
  ,[SendEmailTo]
  )
  VALUES
  (
   @Notes_RunningNo
  ,@NotesId
  ,@NotesHandle
  ,@IndexValue
  ,@Title
  ,@Description
  ,@UserId
  ,@Created_Date
  ,@SendEmailTo
  )
  SET @Return_NotesId = @NotesId
GO
