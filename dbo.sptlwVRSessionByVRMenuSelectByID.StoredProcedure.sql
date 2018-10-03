USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionByVRMenuSelectByID]
  @LoginID NVarChar(8),
  @RecordID Int 
  AS
  SELECT
    [SYS_VRSessionByVRMenu].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description,
    [SYS_VRMenus2].[VRMenuName] AS SYS_VRMenus2_VRMenuName,
    [SYS_VRSessions3].[Description] AS SYS_VRSessions3_Description 
  FROM [SYS_VRSessionByVRMenu] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRSessionByVRMenu].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]
    ON [SYS_VRSessionByVRMenu].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]
  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions3]
    ON [SYS_VRSessionByVRMenu].[VRSessionID] = [SYS_VRSessions3].[VRSessionID]
  WHERE
  [SYS_VRSessionByVRMenu].[RecordID] = @RecordID
GO
