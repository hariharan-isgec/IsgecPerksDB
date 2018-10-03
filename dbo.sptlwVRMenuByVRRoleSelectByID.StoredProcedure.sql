USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRMenuByVRRoleSelectByID]
  @LoginID NVarChar(8),
  @RecordID Int 
  AS
  SELECT
    [SYS_VRMenuByVRRole].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description,
    [SYS_VRMenus2].[VRMenuName] AS SYS_VRMenus2_VRMenuName,
    [SYS_VRRoles3].[Description] AS SYS_VRRoles3_Description 
  FROM [SYS_VRMenuByVRRole] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRMenuByVRRole].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]
    ON [SYS_VRMenuByVRRole].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles3]
    ON [SYS_VRMenuByVRRole].[VRRoleID] = [SYS_VRRoles3].[VRRoleID]
  WHERE
  [SYS_VRMenuByVRRole].[RecordID] = @RecordID
GO
