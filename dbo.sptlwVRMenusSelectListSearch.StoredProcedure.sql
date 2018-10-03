USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRMenusSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @ApplicationID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,VRMenuID Int NOT NULL
  )
  INSERT INTO #PageIndex (VRMenuID)
  SELECT [SYS_VRMenus].[VRMenuID] FROM [SYS_VRMenus]
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRMenus].[ApplicationID] = [SYS_Applications1].[ApplicationID]
 WHERE  
      [SYS_VRMenus].[ApplicationID] = (@ApplicationID)
   AND ( 
         STR(ISNULL([SYS_VRMenus].[VRMenuID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRMenus].[VRMenuName],'')) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenus].[ParentVRMenuID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRMenus].[ToolTip],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRMenus].[VRMenuType],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_VRMenus].[CSSClass],'')) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenus].[Sequence], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SYS_VRMenus].[ApplicationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'VRMenuID' THEN [SYS_VRMenus].[VRMenuID] END,
     CASE @OrderBy WHEN 'VRMenuID DESC' THEN [SYS_VRMenus].[VRMenuID] END DESC,
     CASE @OrderBy WHEN 'VRMenuName' THEN [SYS_VRMenus].[VRMenuName] END,
     CASE @OrderBy WHEN 'VRMenuName DESC' THEN [SYS_VRMenus].[VRMenuName] END DESC,
     CASE @OrderBy WHEN 'ToolTip' THEN [SYS_VRMenus].[ToolTip] END,
     CASE @OrderBy WHEN 'ToolTip DESC' THEN [SYS_VRMenus].[ToolTip] END DESC,
     CASE @OrderBy WHEN 'ParentVRMenuID' THEN [SYS_VRMenus].[ParentVRMenuID] END,
     CASE @OrderBy WHEN 'ParentVRMenuID DESC' THEN [SYS_VRMenus].[ParentVRMenuID] END DESC,
     CASE @OrderBy WHEN 'VRMenuType' THEN [SYS_VRMenus].[VRMenuType] END,
     CASE @OrderBy WHEN 'VRMenuType DESC' THEN [SYS_VRMenus].[VRMenuType] END DESC,
     CASE @OrderBy WHEN 'CSSClass' THEN [SYS_VRMenus].[CSSClass] END,
     CASE @OrderBy WHEN 'CSSClass DESC' THEN [SYS_VRMenus].[CSSClass] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [SYS_VRMenus].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [SYS_VRMenus].[Sequence] END DESC,
     CASE @OrderBy WHEN 'ApplicationID' THEN [SYS_VRMenus].[ApplicationID] END,
     CASE @OrderBy WHEN 'ApplicationID DESC' THEN [SYS_VRMenus].[ApplicationID] END DESC,
     CASE @OrderBy WHEN 'SYS_Applications1_Description' THEN [SYS_Applications1].[Description] END,
     CASE @OrderBy WHEN 'SYS_Applications1_Description DESC' THEN [SYS_Applications1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SYS_VRMenus].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description 
  FROM [SYS_VRMenus] 
      INNER JOIN #PageIndex
          ON [SYS_VRMenus].[VRMenuID] = #PageIndex.VRMenuID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRMenus].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
