USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfdbNotesSelectByID]
  @LoginID NVarChar(8),
  @IndexValue VarChar(200),
  @NotesId VarChar(200) 
  AS
  SELECT
    [Note_Notes].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [Note_Notes] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [Note_Notes].[UserId] = [aspnet_Users1].[LoginID]
  WHERE
  [Note_Notes].[IndexValue] = @IndexValue
  AND [Note_Notes].[NotesId] = @NotesId
GO
