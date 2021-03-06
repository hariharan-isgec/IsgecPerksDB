USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionByVRMenuSelectByVRMenuID]
  @ApplicationID Int,
  @VRMenuID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  [SYS_VRSessionByVRMenu].[VRMenuID] = @VRMenuID
  AND [SYS_VRSessionByVRMenu].[ApplicationID] = @ApplicationID
  ORDER BY
     CASE @OrderBy WHEN 'RecordID' THEN [SYS_VRSessionByVRMenu].[RecordID] END,
     CASE @OrderBy WHEN 'RecordID DESC' THEN [SYS_VRSessionByVRMenu].[RecordID] END DESC,
     CASE @OrderBy WHEN 'VRMenuID' THEN [SYS_VRSessionByVRMenu].[VRMenuID] END,
     CASE @OrderBy WHEN 'VRMenuID DESC' THEN [SYS_VRSessionByVRMenu].[VRMenuID] END DESC,
     CASE @OrderBy WHEN 'VRSessionID' THEN [SYS_VRSessionByVRMenu].[VRSessionID] END,
     CASE @OrderBy WHEN 'VRSessionID DESC' THEN [SYS_VRSessionByVRMenu].[VRSessionID] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [SYS_VRSessionByVRMenu].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [SYS_VRSessionByVRMenu].[Sequence] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [SYS_VRSessionByVRMenu].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [SYS_VRSessionByVRMenu].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'MaintainGrid' THEN [SYS_VRSessionByVRMenu].[MaintainGrid] END,
     CASE @OrderBy WHEN 'MaintainGrid DESC' THEN [SYS_VRSessionByVRMenu].[MaintainGrid] END DESC,
     CASE @OrderBy WHEN 'InsertForm' THEN [SYS_VRSessionByVRMenu].[InsertForm] END,
     CASE @OrderBy WHEN 'InsertForm DESC' THEN [SYS_VRSessionByVRMenu].[InsertForm] END DESC,
     CASE @OrderBy WHEN 'UpdateForm' THEN [SYS_VRSessionByVRMenu].[UpdateForm] END,
     CASE @OrderBy WHEN 'UpdateForm DESC' THEN [SYS_VRSessionByVRMenu].[UpdateForm] END DESC,
     CASE @OrderBy WHEN 'DisplayGrid' THEN [SYS_VRSessionByVRMenu].[DisplayGrid] END,
     CASE @OrderBy WHEN 'DisplayGrid DESC' THEN [SYS_VRSessionByVRMenu].[DisplayGrid] END DESC,
     CASE @OrderBy WHEN 'DisplayForm' THEN [SYS_VRSessionByVRMenu].[DisplayForm] END,
     CASE @OrderBy WHEN 'DisplayForm DESC' THEN [SYS_VRSessionByVRMenu].[DisplayForm] END DESC,
     CASE @OrderBy WHEN 'DeleteOption' THEN [SYS_VRSessionByVRMenu].[DeleteOption] END,
     CASE @OrderBy WHEN 'DeleteOption DESC' THEN [SYS_VRSessionByVRMenu].[DeleteOption] END DESC,
     CASE @OrderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @OrderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC,
     CASE @OrderBy WHEN 'SYS_VRMenus2_VRMenuName' THEN [SYS_VRMenus2].[VRMenuName] END,
     CASE @OrderBy WHEN 'SYS_VRMenus2_VRMenuName DESC' THEN [SYS_VRMenus2].[VRMenuName] END DESC,
     CASE @OrderBy WHEN 'SYS_VRSessions3_Description' THEN [SYS_VRSessions3].[Description] END,
     CASE @OrderBy WHEN 'SYS_VRSessions3_Description DESC' THEN [SYS_VRSessions3].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
