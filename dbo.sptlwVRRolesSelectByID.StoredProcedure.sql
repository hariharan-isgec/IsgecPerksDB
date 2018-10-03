USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRRolesSelectByID]
  @LoginID NVarChar(8),
  @VRRoleID Int 
  AS
  SELECT
    [SYS_VRRoles].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description 
  FROM [SYS_VRRoles] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRRoles].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
  [SYS_VRRoles].[VRRoleID] = @VRRoleID
GO
