USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRRoleByEmployeeSelectByID]
  @LoginID NVarChar(8),
  @RecordID Int 
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
  [SYS_VRRoleByEmployee].[RecordID] = @RecordID
GO
