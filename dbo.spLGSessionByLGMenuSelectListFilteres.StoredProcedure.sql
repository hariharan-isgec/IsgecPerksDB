USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGSessionByLGMenuSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RecordID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (RecordID) ' + 
               'SELECT [SYS_VRSessionByVRMenu].[RecordID] FROM [SYS_VRSessionByVRMenu] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRSessionByVRMenu].[VRMenuID] = [SYS_VRMenus1].[VRMenuID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions2]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRSessionByVRMenu].[VRSessionID] = [SYS_VRSessions2].[VRSessionID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications3]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRSessionByVRMenu].[ApplicationID] = [SYS_Applications3].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RecordID' THEN '[SYS_VRSessionByVRMenu].[RecordID]'
                        WHEN 'RecordID DESC' THEN '[SYS_VRSessionByVRMenu].[RecordID] DESC'
                        WHEN 'VRMenuID' THEN '[SYS_VRSessionByVRMenu].[VRMenuID]'
                        WHEN 'VRMenuID DESC' THEN '[SYS_VRSessionByVRMenu].[VRMenuID] DESC'
                        WHEN 'VRSessionID' THEN '[SYS_VRSessionByVRMenu].[VRSessionID]'
                        WHEN 'VRSessionID DESC' THEN '[SYS_VRSessionByVRMenu].[VRSessionID] DESC'
                        WHEN 'Sequence' THEN '[SYS_VRSessionByVRMenu].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[SYS_VRSessionByVRMenu].[Sequence] DESC'
                        WHEN 'ApplicationID' THEN '[SYS_VRSessionByVRMenu].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[SYS_VRSessionByVRMenu].[ApplicationID] DESC'
                        WHEN 'MaintainGrid' THEN '[SYS_VRSessionByVRMenu].[MaintainGrid]'
                        WHEN 'MaintainGrid DESC' THEN '[SYS_VRSessionByVRMenu].[MaintainGrid] DESC'
                        WHEN 'InsertForm' THEN '[SYS_VRSessionByVRMenu].[InsertForm]'
                        WHEN 'InsertForm DESC' THEN '[SYS_VRSessionByVRMenu].[InsertForm] DESC'
                        WHEN 'UpdateForm' THEN '[SYS_VRSessionByVRMenu].[UpdateForm]'
                        WHEN 'UpdateForm DESC' THEN '[SYS_VRSessionByVRMenu].[UpdateForm] DESC'
                        WHEN 'DisplayGrid' THEN '[SYS_VRSessionByVRMenu].[DisplayGrid]'
                        WHEN 'DisplayGrid DESC' THEN '[SYS_VRSessionByVRMenu].[DisplayGrid] DESC'
                        WHEN 'DisplayForm' THEN '[SYS_VRSessionByVRMenu].[DisplayForm]'
                        WHEN 'DisplayForm DESC' THEN '[SYS_VRSessionByVRMenu].[DisplayForm] DESC'
                        WHEN 'DeleteOption' THEN '[SYS_VRSessionByVRMenu].[DeleteOption]'
                        WHEN 'DeleteOption DESC' THEN '[SYS_VRSessionByVRMenu].[DeleteOption] DESC'
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
                        WHEN 'SYS_VRSessions2_VRSessionID' THEN '[SYS_VRSessions2].[VRSessionID]'
                        WHEN 'SYS_VRSessions2_VRSessionID DESC' THEN '[SYS_VRSessions2].[VRSessionID] DESC'
                        WHEN 'SYS_VRSessions2_Description' THEN '[SYS_VRSessions2].[Description]'
                        WHEN 'SYS_VRSessions2_Description DESC' THEN '[SYS_VRSessions2].[Description] DESC'
                        WHEN 'SYS_VRSessions2_FileName' THEN '[SYS_VRSessions2].[FileName]'
                        WHEN 'SYS_VRSessions2_FileName DESC' THEN '[SYS_VRSessions2].[FileName] DESC'
                        WHEN 'SYS_VRSessions2_ApplicationID' THEN '[SYS_VRSessions2].[ApplicationID]'
                        WHEN 'SYS_VRSessions2_ApplicationID DESC' THEN '[SYS_VRSessions2].[ApplicationID] DESC'
                        WHEN 'SYS_VRSessions2_FolderLocation' THEN '[SYS_VRSessions2].[FolderLocation]'
                        WHEN 'SYS_VRSessions2_FolderLocation DESC' THEN '[SYS_VRSessions2].[FolderLocation] DESC'
                        WHEN 'SYS_VRSessions2_VRMenuName' THEN '[SYS_VRSessions2].[VRMenuName]'
                        WHEN 'SYS_VRSessions2_VRMenuName DESC' THEN '[SYS_VRSessions2].[VRMenuName] DESC'
                        WHEN 'SYS_VRSessions2_ToolTip' THEN '[SYS_VRSessions2].[ToolTip]'
                        WHEN 'SYS_VRSessions2_ToolTip DESC' THEN '[SYS_VRSessions2].[ToolTip] DESC'
                        WHEN 'SYS_VRSessions2_VRSessionType' THEN '[SYS_VRSessions2].[VRSessionType]'
                        WHEN 'SYS_VRSessions2_VRSessionType DESC' THEN '[SYS_VRSessions2].[VRSessionType] DESC'
                        WHEN 'SYS_VRSessions2_CSSClass' THEN '[SYS_VRSessions2].[CSSClass]'
                        WHEN 'SYS_VRSessions2_CSSClass DESC' THEN '[SYS_VRSessions2].[CSSClass] DESC'
                        WHEN 'SYS_VRSessions2_MaintainGrid' THEN '[SYS_VRSessions2].[MaintainGrid]'
                        WHEN 'SYS_VRSessions2_MaintainGrid DESC' THEN '[SYS_VRSessions2].[MaintainGrid] DESC'
                        WHEN 'SYS_VRSessions2_InsertForm' THEN '[SYS_VRSessions2].[InsertForm]'
                        WHEN 'SYS_VRSessions2_InsertForm DESC' THEN '[SYS_VRSessions2].[InsertForm] DESC'
                        WHEN 'SYS_VRSessions2_UpdateForm' THEN '[SYS_VRSessions2].[UpdateForm]'
                        WHEN 'SYS_VRSessions2_UpdateForm DESC' THEN '[SYS_VRSessions2].[UpdateForm] DESC'
                        WHEN 'SYS_VRSessions2_DisplayGrid' THEN '[SYS_VRSessions2].[DisplayGrid]'
                        WHEN 'SYS_VRSessions2_DisplayGrid DESC' THEN '[SYS_VRSessions2].[DisplayGrid] DESC'
                        WHEN 'SYS_VRSessions2_DisplayForm' THEN '[SYS_VRSessions2].[DisplayForm]'
                        WHEN 'SYS_VRSessions2_DisplayForm DESC' THEN '[SYS_VRSessions2].[DisplayForm] DESC'
                        WHEN 'SYS_VRSessions2_DeleteOption' THEN '[SYS_VRSessions2].[DeleteOption]'
                        WHEN 'SYS_VRSessions2_DeleteOption DESC' THEN '[SYS_VRSessions2].[DeleteOption] DESC'
                        WHEN 'SYS_Applications3_ApplicationID' THEN '[SYS_Applications3].[ApplicationID]'
                        WHEN 'SYS_Applications3_ApplicationID DESC' THEN '[SYS_Applications3].[ApplicationID] DESC'
                        WHEN 'SYS_Applications3_Description' THEN '[SYS_Applications3].[Description]'
                        WHEN 'SYS_Applications3_Description DESC' THEN '[SYS_Applications3].[Description] DESC'
                        WHEN 'SYS_Applications3_WebPath' THEN '[SYS_Applications3].[WebPath]'
                        WHEN 'SYS_Applications3_WebPath DESC' THEN '[SYS_Applications3].[WebPath] DESC'
                        WHEN 'SYS_Applications3_GenerateDefaults' THEN '[SYS_Applications3].[GenerateDefaults]'
                        WHEN 'SYS_Applications3_GenerateDefaults DESC' THEN '[SYS_Applications3].[GenerateDefaults] DESC'
                        ELSE '[SYS_VRSessionByVRMenu].[RecordID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SYS_VRSessionByVRMenu].[RecordID],
		[SYS_VRSessionByVRMenu].[VRMenuID],
		[SYS_VRSessionByVRMenu].[VRSessionID],
		[SYS_VRSessionByVRMenu].[Sequence],
		[SYS_VRSessionByVRMenu].[ApplicationID],
		[SYS_VRSessionByVRMenu].[MaintainGrid],
		[SYS_VRSessionByVRMenu].[InsertForm],
		[SYS_VRSessionByVRMenu].[UpdateForm],
		[SYS_VRSessionByVRMenu].[DisplayGrid],
		[SYS_VRSessionByVRMenu].[DisplayForm],
		[SYS_VRSessionByVRMenu].[DeleteOption],
		[SYS_VRMenus1].[VRMenuID] AS SYS_VRMenus1_VRMenuID,
		[SYS_VRMenus1].[VRMenuName] AS SYS_VRMenus1_VRMenuName,
		[SYS_VRMenus1].[ToolTip] AS SYS_VRMenus1_ToolTip,
		[SYS_VRMenus1].[ParentVRMenuID] AS SYS_VRMenus1_ParentVRMenuID,
		[SYS_VRMenus1].[VRMenuType] AS SYS_VRMenus1_VRMenuType,
		[SYS_VRMenus1].[CSSClass] AS SYS_VRMenus1_CSSClass,
		[SYS_VRMenus1].[Sequence] AS SYS_VRMenus1_Sequence,
		[SYS_VRMenus1].[ApplicationID] AS SYS_VRMenus1_ApplicationID,
		[SYS_VRSessions2].[VRSessionID] AS SYS_VRSessions2_VRSessionID,
		[SYS_VRSessions2].[Description] AS SYS_VRSessions2_Description,
		[SYS_VRSessions2].[FileName] AS SYS_VRSessions2_FileName,
		[SYS_VRSessions2].[ApplicationID] AS SYS_VRSessions2_ApplicationID,
		[SYS_VRSessions2].[FolderLocation] AS SYS_VRSessions2_FolderLocation,
		[SYS_VRSessions2].[VRMenuName] AS SYS_VRSessions2_VRMenuName,
		[SYS_VRSessions2].[ToolTip] AS SYS_VRSessions2_ToolTip,
		[SYS_VRSessions2].[VRSessionType] AS SYS_VRSessions2_VRSessionType,
		[SYS_VRSessions2].[CSSClass] AS SYS_VRSessions2_CSSClass,
		[SYS_VRSessions2].[MaintainGrid] AS SYS_VRSessions2_MaintainGrid,
		[SYS_VRSessions2].[InsertForm] AS SYS_VRSessions2_InsertForm,
		[SYS_VRSessions2].[UpdateForm] AS SYS_VRSessions2_UpdateForm,
		[SYS_VRSessions2].[DisplayGrid] AS SYS_VRSessions2_DisplayGrid,
		[SYS_VRSessions2].[DisplayForm] AS SYS_VRSessions2_DisplayForm,
		[SYS_VRSessions2].[DeleteOption] AS SYS_VRSessions2_DeleteOption,
		[SYS_Applications3].[ApplicationID] AS SYS_Applications3_ApplicationID,
		[SYS_Applications3].[Description] AS SYS_Applications3_Description,
		[SYS_Applications3].[WebPath] AS SYS_Applications3_WebPath,
		[SYS_Applications3].[GenerateDefaults] AS SYS_Applications3_GenerateDefaults 
  FROM [SYS_VRSessionByVRMenu] 
    	INNER JOIN #PageIndex
          ON [SYS_VRSessionByVRMenu].[RecordID] = #PageIndex.RecordID
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus1]
    ON [SYS_VRSessionByVRMenu].[VRMenuID] = [SYS_VRMenus1].[VRMenuID]
  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions2]
    ON [SYS_VRSessionByVRMenu].[VRSessionID] = [SYS_VRSessions2].[VRSessionID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications3]
    ON [SYS_VRSessionByVRMenu].[ApplicationID] = [SYS_Applications3].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
