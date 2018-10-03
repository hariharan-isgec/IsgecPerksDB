USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRRoleByEmployeeSelectByUserName]
  @ApplicationID Int,
  @UserName NVarChar(20),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SYS_VRRoleByEmployee].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description,
    [SYS_VRRoles2].[Description] AS SYS_VRRoles2_Description,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [SYS_VRRoleByEmployee] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRRoleByEmployee].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles2]
    ON [SYS_VRRoleByEmployee].[VRRoleID] = [SYS_VRRoles2].[VRRoleID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SYS_VRRoleByEmployee].[UserName] = [aspnet_Users1].[LoginID]
  WHERE
  [SYS_VRRoleByEmployee].[UserName] = @UserName
  AND [SYS_VRRoleByEmployee].[ApplicationID] = @ApplicationID
  ORDER BY
     CASE @OrderBy WHEN 'RecordID' THEN [SYS_VRRoleByEmployee].[RecordID] END,
     CASE @OrderBy WHEN 'RecordID DESC' THEN [SYS_VRRoleByEmployee].[RecordID] END DESC,
     CASE @OrderBy WHEN 'VRRoleID' THEN [SYS_VRRoleByEmployee].[VRRoleID] END,
     CASE @OrderBy WHEN 'VRRoleID DESC' THEN [SYS_VRRoleByEmployee].[VRRoleID] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [SYS_VRRoleByEmployee].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [SYS_VRRoleByEmployee].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'UserName' THEN [SYS_VRRoleByEmployee].[UserName] END,
     CASE @OrderBy WHEN 'UserName DESC' THEN [SYS_VRRoleByEmployee].[UserName] END DESC,
     CASE @OrderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @OrderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC,
     CASE @OrderBy WHEN 'SYS_VRRoles2_Description' THEN [SYS_VRRoles2].[Description] END,
     CASE @OrderBy WHEN 'SYS_VRRoles2_Description DESC' THEN [SYS_VRRoles2].[Description] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC 
  SET @RecordCount = @@RowCount
GO
