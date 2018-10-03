USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRMenusSelectListFilteres]
  @Filter_ParentVRMenuID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @ApplicationID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  VRMenuID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (VRMenuID) ' + 
               'SELECT [SYS_VRMenus].[VRMenuID] FROM [SYS_VRMenus] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SYS_VRMenus] AS [SYS_VRMenus1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRMenus].[ParentVRMenuID] = [SYS_VRMenus1].[VRMenuID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications2]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRMenus].[ApplicationID] = [SYS_Applications2].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ParentVRMenuID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SYS_VRMenus].[ParentVRMenuID] = ' + STR(@Filter_ParentVRMenuID)
  SET @LGSQL = @LGSQL + ' AND [SYS_VRMenus].[ApplicationID] = ' + STR(@ApplicationID)
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
                        WHEN 'SYS_VRMenus1_VRMenuID' THEN '[SYS_VRMenus1].[VRMenuID]'
                        WHEN 'SYS_VRMenus1_VRMenuID DESC' THEN '[SYS_VRMenus1].[VRMenuID] DESC'
                        WHEN 'SYS_VRMenus1_VRMenuName' THEN '[SYS_VRMenus1].[VRMenuName]'
                        WHEN 'SYS_VRMenus1_VRMenuName DESC' THEN '[SYS_VRMenus1].[VRMenuName] DESC'
                        WHEN 'SYS_VRMenus1_ToolTip' THEN '[SYS_VRMenus1].[ToolTip]'
                        WHEN 'SYS_VRMenus1_ToolTip DESC' THEN '[SYS_VRMenus1].[ToolTip] DESC'
                        WHEN 'SYS_VRMenus1_ParentVRMenuID' THEN '[SYS_VRMenus1].[ParentVRMenuID]'
                        WHEN 'SYS_VRMenus1_ParentVRMenuID DESC' THEN '[SYS_VRMenus1].[ParentVRMenuID] DESC'
                        WHEN 'SYS_VRMenus1_VRMenuType' THEN '[SYS_VRMenus1].[VRMenuType]'
                        WHEN 'SYS_VRMenus1_VRMenuType DESC' THEN '[SYS_VRMenus1].[VRMenuType] DESC'
                        WHEN 'SYS_VRMenus1_CSSClass' THEN '[SYS_VRMenus1].[CSSClass]'
                        WHEN 'SYS_VRMenus1_CSSClass DESC' THEN '[SYS_VRMenus1].[CSSClass] DESC'
                        WHEN 'SYS_VRMenus1_Sequence' THEN '[SYS_VRMenus1].[Sequence]'
                        WHEN 'SYS_VRMenus1_Sequence DESC' THEN '[SYS_VRMenus1].[Sequence] DESC'
                        WHEN 'SYS_VRMenus1_ApplicationID' THEN '[SYS_VRMenus1].[ApplicationID]'
                        WHEN 'SYS_VRMenus1_ApplicationID DESC' THEN '[SYS_VRMenus1].[ApplicationID] DESC'
                        WHEN 'SYS_Applications2_ApplicationID' THEN '[SYS_Applications2].[ApplicationID]'
                        WHEN 'SYS_Applications2_ApplicationID DESC' THEN '[SYS_Applications2].[ApplicationID] DESC'
                        WHEN 'SYS_Applications2_Description' THEN '[SYS_Applications2].[Description]'
                        WHEN 'SYS_Applications2_Description DESC' THEN '[SYS_Applications2].[Description] DESC'
                        WHEN 'SYS_Applications2_WebPath' THEN '[SYS_Applications2].[WebPath]'
                        WHEN 'SYS_Applications2_WebPath DESC' THEN '[SYS_Applications2].[WebPath] DESC'
                        ELSE '[SYS_VRMenus].[VRMenuID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SYS_VRMenus].[VRMenuID],
		[SYS_VRMenus].[VRMenuName],
		[SYS_VRMenus].[ToolTip],
		[SYS_VRMenus].[ParentVRMenuID],
		[SYS_VRMenus].[VRMenuType],
		[SYS_VRMenus].[CSSClass],
		[SYS_VRMenus].[Sequence],
		[SYS_VRMenus].[ApplicationID],
		[SYS_VRMenus1].[VRMenuID] AS SYS_VRMenus1_VRMenuID,
		[SYS_VRMenus1].[VRMenuName] AS SYS_VRMenus1_VRMenuName,
		[SYS_VRMenus1].[ToolTip] AS SYS_VRMenus1_ToolTip,
		[SYS_VRMenus1].[ParentVRMenuID] AS SYS_VRMenus1_ParentVRMenuID,
		[SYS_VRMenus1].[VRMenuType] AS SYS_VRMenus1_VRMenuType,
		[SYS_VRMenus1].[CSSClass] AS SYS_VRMenus1_CSSClass,
		[SYS_VRMenus1].[Sequence] AS SYS_VRMenus1_Sequence,
		[SYS_VRMenus1].[ApplicationID] AS SYS_VRMenus1_ApplicationID,
		[SYS_Applications2].[ApplicationID] AS SYS_Applications2_ApplicationID,
		[SYS_Applications2].[Description] AS SYS_Applications2_Description,
		[SYS_Applications2].[WebPath] AS SYS_Applications2_WebPath 
  FROM [SYS_VRMenus] 
    	INNER JOIN #PageIndex
          ON [SYS_VRMenus].[VRMenuID] = #PageIndex.VRMenuID
  LEFT OUTER JOIN [SYS_VRMenus] AS [SYS_VRMenus1]
    ON [SYS_VRMenus].[ParentVRMenuID] = [SYS_VRMenus1].[VRMenuID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications2]
    ON [SYS_VRMenus].[ApplicationID] = [SYS_Applications2].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
