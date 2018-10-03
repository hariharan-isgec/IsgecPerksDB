USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupUsersSelectByID]
  @GroupID NVarChar(6),
  @LoginID NVarChar(8) 
  AS
  SELECT
    [SYS_GroupLogins].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [SYS_Groups2].[Description] AS SYS_Groups2_Description 
  FROM [SYS_GroupLogins] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SYS_GroupLogins].[LoginID] = [aspnet_Users1].[LoginID]
  INNER JOIN [SYS_Groups] AS [SYS_Groups2]
    ON [SYS_GroupLogins].[GroupID] = [SYS_Groups2].[GroupID]
  WHERE
  [SYS_GroupLogins].[GroupID] = @GroupID
  AND [SYS_GroupLogins].[LoginID] = @LoginID
GO
