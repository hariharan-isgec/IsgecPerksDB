USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRSessionsSelectListFilteres]
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
  VRSessionID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (VRSessionID) ' + 
               'SELECT [SYS_VRSessions].[VRSessionID] FROM [SYS_VRSessions] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRSessions].[ApplicationID] = [SYS_Applications1].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [SYS_VRSessions].[ApplicationID] = ' + STR(@ApplicationID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VRSessionID' THEN '[SYS_VRSessions].[VRSessionID]'
                        WHEN 'VRSessionID DESC' THEN '[SYS_VRSessions].[VRSessionID] DESC'
                        WHEN 'Description' THEN '[SYS_VRSessions].[Description]'
                        WHEN 'Description DESC' THEN '[SYS_VRSessions].[Description] DESC'
                        WHEN 'FileName' THEN '[SYS_VRSessions].[FileName]'
                        WHEN 'FileName DESC' THEN '[SYS_VRSessions].[FileName] DESC'
                        WHEN 'ApplicationID' THEN '[SYS_VRSessions].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[SYS_VRSessions].[ApplicationID] DESC'
                        WHEN 'FolderLocation' THEN '[SYS_VRSessions].[FolderLocation]'
                        WHEN 'FolderLocation DESC' THEN '[SYS_VRSessions].[FolderLocation] DESC'
                        WHEN 'VRMenuName' THEN '[SYS_VRSessions].[VRMenuName]'
                        WHEN 'VRMenuName DESC' THEN '[SYS_VRSessions].[VRMenuName] DESC'
                        WHEN 'ToolTip' THEN '[SYS_VRSessions].[ToolTip]'
                        WHEN 'ToolTip DESC' THEN '[SYS_VRSessions].[ToolTip] DESC'
                        WHEN 'VRSessionType' THEN '[SYS_VRSessions].[VRSessionType]'
                        WHEN 'VRSessionType DESC' THEN '[SYS_VRSessions].[VRSessionType] DESC'
                        WHEN 'CSSClass' THEN '[SYS_VRSessions].[CSSClass]'
                        WHEN 'CSSClass DESC' THEN '[SYS_VRSessions].[CSSClass] DESC'
                        WHEN 'MaintainGrid' THEN '[SYS_VRSessions].[MaintainGrid]'
                        WHEN 'MaintainGrid DESC' THEN '[SYS_VRSessions].[MaintainGrid] DESC'
                        WHEN 'InsertForm' THEN '[SYS_VRSessions].[InsertForm]'
                        WHEN 'InsertForm DESC' THEN '[SYS_VRSessions].[InsertForm] DESC'
                        WHEN 'UpdateForm' THEN '[SYS_VRSessions].[UpdateForm]'
                        WHEN 'UpdateForm DESC' THEN '[SYS_VRSessions].[UpdateForm] DESC'
                        WHEN 'DisplayGrid' THEN '[SYS_VRSessions].[DisplayGrid]'
                        WHEN 'DisplayGrid DESC' THEN '[SYS_VRSessions].[DisplayGrid] DESC'
                        WHEN 'DisplayForm' THEN '[SYS_VRSessions].[DisplayForm]'
                        WHEN 'DisplayForm DESC' THEN '[SYS_VRSessions].[DisplayForm] DESC'
                        WHEN 'DeleteOption' THEN '[SYS_VRSessions].[DeleteOption]'
                        WHEN 'DeleteOption DESC' THEN '[SYS_VRSessions].[DeleteOption] DESC'
                        WHEN 'SYS_Applications1_ApplicationID' THEN '[SYS_Applications1].[ApplicationID]'
                        WHEN 'SYS_Applications1_ApplicationID DESC' THEN '[SYS_Applications1].[ApplicationID] DESC'
                        WHEN 'SYS_Applications1_Description' THEN '[SYS_Applications1].[Description]'
                        WHEN 'SYS_Applications1_Description DESC' THEN '[SYS_Applications1].[Description] DESC'
                        WHEN 'SYS_Applications1_WebPath' THEN '[SYS_Applications1].[WebPath]'
                        WHEN 'SYS_Applications1_WebPath DESC' THEN '[SYS_Applications1].[WebPath] DESC'
                        ELSE '[SYS_VRSessions].[VRSessionID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SYS_VRSessions].[VRSessionID],
		[SYS_VRSessions].[Description],
		[SYS_VRSessions].[FileName],
		[SYS_VRSessions].[ApplicationID],
		[SYS_VRSessions].[FolderLocation],
		[SYS_VRSessions].[VRMenuName],
		[SYS_VRSessions].[ToolTip],
		[SYS_VRSessions].[VRSessionType],
		[SYS_VRSessions].[CSSClass],
		[SYS_VRSessions].[MaintainGrid],
		[SYS_VRSessions].[InsertForm],
		[SYS_VRSessions].[UpdateForm],
		[SYS_VRSessions].[DisplayGrid],
		[SYS_VRSessions].[DisplayForm],
		[SYS_VRSessions].[DeleteOption],
		[SYS_Applications1].[ApplicationID] AS SYS_Applications1_ApplicationID,
		[SYS_Applications1].[Description] AS SYS_Applications1_Description,
		[SYS_Applications1].[WebPath] AS SYS_Applications1_WebPath 
  FROM [SYS_VRSessions] 
    	INNER JOIN #PageIndex
          ON [SYS_VRSessions].[VRSessionID] = #PageIndex.VRSessionID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRSessions].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
