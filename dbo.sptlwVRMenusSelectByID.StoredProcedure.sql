USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRMenusSelectByID]
  @LoginID NVarChar(8),
  @VRMenuID Int 
  AS
  SELECT
    [SYS_VRMenus].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description 
  FROM [SYS_VRMenus] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRMenus].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
  [SYS_VRMenus].[VRMenuID] = @VRMenuID
GO
