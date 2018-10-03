USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupUsersSelectByLoginID]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[SYS_GroupLogins].[GroupID] ,
		[SYS_GroupLogins].[LoginID] ,
		[SYS_GroupLogins].[Active] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[SYS_Groups2].[Description] AS SYS_Groups2_Description 
  FROM [SYS_GroupLogins] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SYS_GroupLogins].[LoginID] = [aspnet_Users1].[LoginID]
  INNER JOIN [SYS_Groups] AS [SYS_Groups2]
    ON [SYS_GroupLogins].[GroupID] = [SYS_Groups2].[GroupID]
  WHERE
  [SYS_GroupLogins].[LoginID] = @LoginID
  ORDER BY
     CASE @orderBy WHEN 'GroupID' THEN [SYS_GroupLogins].[GroupID] END,
     CASE @orderBy WHEN 'GroupID DESC' THEN [SYS_GroupLogins].[GroupID] END DESC,
     CASE @orderBy WHEN 'LoginID' THEN [SYS_GroupLogins].[LoginID] END,
     CASE @orderBy WHEN 'LoginID DESC' THEN [SYS_GroupLogins].[LoginID] END DESC,
     CASE @orderBy WHEN 'Active' THEN [SYS_GroupLogins].[Active] END,
     CASE @orderBy WHEN 'Active DESC' THEN [SYS_GroupLogins].[Active] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'SYS_Groups2_Description' THEN [SYS_Groups2].[Description] END,
     CASE @orderBy WHEN 'SYS_Groups2_Description DESC' THEN [SYS_Groups2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
