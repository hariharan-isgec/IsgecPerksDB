USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRMenusSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @ApplicationID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,VRMenuID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'VRMenuID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SYS_VRMenus].[VRMenuID]'
  SET @LGSQL = @LGSQL + ' FROM [SYS_VRMenus] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRMenus].[ApplicationID] = [SYS_Applications1].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [SYS_VRMenus].[ApplicationID] = ''' + STR(@ApplicationID) + '''' 
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VRMenuID' THEN '[SYS_VRMenus].[VRMenuID]'
                        WHEN 'VRMenuID DESC' THEN '[SYS_VRMenus].[VRMenuID] DESC'
                        WHEN 'VRMenuName' THEN '[SYS_VRMenus].[VRMenuName]'
                        WHEN 'VRMenuName DESC' THEN '[SYS_VRMenus].[VRMenuName] DESC'
                        WHEN 'ToolTip' THEN '[SYS_VRMenus].[ToolTip]'
                        WHEN 'ToolTip DESC' THEN '[SYS_VRMenus].[ToolTip] DESC'
                        WHEN 'ParentVRMenuID' THEN '[SYS_VRMenus].[ParentVRMenuID]'
                        WHEN 'ParentVRMenuID DESC' THEN '[SYS_VRMenus].[ParentVRMenuID] DESC'
                        WHEN 'VRMenuType' THEN '[SYS_VRMenus].[VRMenuType]'
                        WHEN 'VRMenuType DESC' THEN '[SYS_VRMenus].[VRMenuType] DESC'
                        WHEN 'CSSClass' THEN '[SYS_VRMenus].[CSSClass]'
                        WHEN 'CSSClass DESC' THEN '[SYS_VRMenus].[CSSClass] DESC'
                        WHEN 'Sequence' THEN '[SYS_VRMenus].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[SYS_VRMenus].[Sequence] DESC'
                        WHEN 'ApplicationID' THEN '[SYS_VRMenus].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[SYS_VRMenus].[ApplicationID] DESC'
                        WHEN 'SYS_Applications1_Description' THEN '[SYS_Applications1].[Description]'
                        WHEN 'SYS_Applications1_Description DESC' THEN '[SYS_Applications1].[Description] DESC'
                        ELSE '[SYS_VRMenus].[VRMenuID]'
                    END
  EXEC (@LGSQL)

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
