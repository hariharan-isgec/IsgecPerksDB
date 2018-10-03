USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spntNotesSelectByID]
  @LoginID NVarChar(8),
  @NotesId VarChar(200) 
  AS
  SELECT
    [Note_Notes].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [Note_Notes] 
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [Note_Notes].[UserId] = [aspnet_users1].[LoginID]
  WHERE
  [Note_Notes].[NotesId] = @NotesId
GO
