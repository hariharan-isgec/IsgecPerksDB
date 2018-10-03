USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGSessionByUserSelectListFilteres]
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
               'SELECT [SYS_VRSessionByEmployee].[RecordID] FROM [SYS_VRSessionByEmployee] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRSessionByEmployee].[VRSessionID] = [SYS_VRSessions1].[VRSessionID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications2]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRSessionByEmployee].[ApplicationID] = [SYS_Applications2].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RecordID' THEN '[SYS_VRSessionByEmployee].[RecordID]'
                        WHEN 'RecordID DESC' THEN '[SYS_VRSessionByEmployee].[RecordID] DESC'
                        WHEN 'VRSessionID' THEN '[SYS_VRSessionByEmployee].[VRSessionID]'
                        WHEN 'VRSessionID DESC' THEN '[SYS_VRSessionByEmployee].[VRSessionID] DESC'
                        WHEN 'ApplicationID' THEN '[SYS_VRSessionByEmployee].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[SYS_VRSessionByEmployee].[ApplicationID] DESC'
                        WHEN 'UserName' THEN '[SYS_VRSessionByEmployee].[UserName]'
                        WHEN 'UserName DESC' THEN '[SYS_VRSessionByEmployee].[UserName] DESC'
                        WHEN 'MaintainGrid' THEN '[SYS_VRSessionByEmployee].[MaintainGrid]'
                        WHEN 'MaintainGrid DESC' THEN '[SYS_VRSessionByEmployee].[MaintainGrid] DESC'
                        WHEN 'InsertForm' THEN '[SYS_VRSessionByEmployee].[InsertForm]'
                        WHEN 'InsertForm DESC' THEN '[SYS_VRSessionByEmployee].[InsertForm] DESC'
                        WHEN 'UpdateForm' THEN '[SYS_VRSessionByEmployee].[UpdateForm]'
                        WHEN 'UpdateForm DESC' THEN '[SYS_VRSessionByEmployee].[UpdateForm] DESC'
                        WHEN 'DisplayGrid' THEN '[SYS_VRSessionByEmployee].[DisplayGrid]'
                        WHEN 'DisplayGrid DESC' THEN '[SYS_VRSessionByEmployee].[DisplayGrid] DESC'
                        WHEN 'DisplayForm' THEN '[SYS_VRSessionByEmployee].[DisplayForm]'
                        WHEN 'DisplayForm DESC' THEN '[SYS_VRSessionByEmployee].[DisplayForm] DESC'
                        WHEN 'DeleteOption' THEN '[SYS_VRSessionByEmployee].[DeleteOption]'
                        WHEN 'DeleteOption DESC' THEN '[SYS_VRSessionByEmployee].[DeleteOption] DESC'
                        WHEN 'SYS_VRSessions1_VRSessionID' THEN '[SYS_VRSessions1].[VRSessionID]'
                        WHEN 'SYS_VRSessions1_VRSessionID DESC' THEN '[SYS_VRSessions1].[VRSessionID] DESC'
                        WHEN 'SYS_VRSessions1_Description' THEN '[SYS_VRSessions1].[Description]'
                        WHEN 'SYS_VRSessions1_Description DESC' THEN '[SYS_VRSessions1].[Description] DESC'
                        WHEN 'SYS_VRSessions1_FileName' THEN '[SYS_VRSessions1].[FileName]'
                        WHEN 'SYS_VRSessions1_FileName DESC' THEN '[SYS_VRSessions1].[FileName] DESC'
                        WHEN 'SYS_VRSessions1_ApplicationID' THEN '[SYS_VRSessions1].[ApplicationID]'
                        WHEN 'SYS_VRSessions1_ApplicationID DESC' THEN '[SYS_VRSessions1].[ApplicationID] DESC'
                        WHEN 'SYS_VRSessions1_FolderLocation' THEN '[SYS_VRSessions1].[FolderLocation]'
                        WHEN 'SYS_VRSessions1_FolderLocation DESC' THEN '[SYS_VRSessions1].[FolderLocation] DESC'
                        WHEN 'SYS_VRSessions1_VRMenuName' THEN '[SYS_VRSessions1].[VRMenuName]'
                        WHEN 'SYS_VRSessions1_VRMenuName DESC' THEN '[SYS_VRSessions1].[VRMenuName] DESC'
                        WHEN 'SYS_VRSessions1_ToolTip' THEN '[SYS_VRSessions1].[ToolTip]'
                        WHEN 'SYS_VRSessions1_ToolTip DESC' THEN '[SYS_VRSessions1].[ToolTip] DESC'
                        WHEN 'SYS_VRSessions1_VRSessionType' THEN '[SYS_VRSessions1].[VRSessionType]'
                        WHEN 'SYS_VRSessions1_VRSessionType DESC' THEN '[SYS_VRSessions1].[VRSessionType] DESC'
                        WHEN 'SYS_VRSessions1_CSSClass' THEN '[SYS_VRSessions1].[CSSClass]'
                        WHEN 'SYS_VRSessions1_CSSClass DESC' THEN '[SYS_VRSessions1].[CSSClass] DESC'
                        WHEN 'SYS_VRSessions1_MaintainGrid' THEN '[SYS_VRSessions1].[MaintainGrid]'
                        WHEN 'SYS_VRSessions1_MaintainGrid DESC' THEN '[SYS_VRSessions1].[MaintainGrid] DESC'
                        WHEN 'SYS_VRSessions1_InsertForm' THEN '[SYS_VRSessions1].[InsertForm]'
                        WHEN 'SYS_VRSessions1_InsertForm DESC' THEN '[SYS_VRSessions1].[InsertForm] DESC'
                        WHEN 'SYS_VRSessions1_UpdateForm' THEN '[SYS_VRSessions1].[UpdateForm]'
                        WHEN 'SYS_VRSessions1_UpdateForm DESC' THEN '[SYS_VRSessions1].[UpdateForm] DESC'
                        WHEN 'SYS_VRSessions1_DisplayGrid' THEN '[SYS_VRSessions1].[DisplayGrid]'
                        WHEN 'SYS_VRSessions1_DisplayGrid DESC' THEN '[SYS_VRSessions1].[DisplayGrid] DESC'
                        WHEN 'SYS_VRSessions1_DisplayForm' THEN '[SYS_VRSessions1].[DisplayForm]'
                        WHEN 'SYS_VRSessions1_DisplayForm DESC' THEN '[SYS_VRSessions1].[DisplayForm] DESC'
                        WHEN 'SYS_VRSessions1_DeleteOption' THEN '[SYS_VRSessions1].[DeleteOption]'
                        WHEN 'SYS_VRSessions1_DeleteOption DESC' THEN '[SYS_VRSessions1].[DeleteOption] DESC'
                        WHEN 'SYS_Applications2_ApplicationID' THEN '[SYS_Applications2].[ApplicationID]'
                        WHEN 'SYS_Applications2_ApplicationID DESC' THEN '[SYS_Applications2].[ApplicationID] DESC'
                        WHEN 'SYS_Applications2_Description' THEN '[SYS_Applications2].[Description]'
                        WHEN 'SYS_Applications2_Description DESC' THEN '[SYS_Applications2].[Description] DESC'
                        WHEN 'SYS_Applications2_WebPath' THEN '[SYS_Applications2].[WebPath]'
                        WHEN 'SYS_Applications2_WebPath DESC' THEN '[SYS_Applications2].[WebPath] DESC'
                        WHEN 'SYS_Applications2_GenerateDefaults' THEN '[SYS_Applications2].[GenerateDefaults]'
                        WHEN 'SYS_Applications2_GenerateDefaults DESC' THEN '[SYS_Applications2].[GenerateDefaults] DESC'
                        ELSE '[SYS_VRSessionByEmployee].[RecordID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SYS_VRSessionByEmployee].[RecordID],
		[SYS_VRSessionByEmployee].[VRSessionID],
		[SYS_VRSessionByEmployee].[ApplicationID],
		[SYS_VRSessionByEmployee].[UserName],
		[SYS_VRSessionByEmployee].[MaintainGrid],
		[SYS_VRSessionByEmployee].[InsertForm],
		[SYS_VRSessionByEmployee].[UpdateForm],
		[SYS_VRSessionByEmployee].[DisplayGrid],
		[SYS_VRSessionByEmployee].[DisplayForm],
		[SYS_VRSessionByEmployee].[DeleteOption],
		[SYS_VRSessions1].[VRSessionID] AS SYS_VRSessions1_VRSessionID,
		[SYS_VRSessions1].[Description] AS SYS_VRSessions1_Description,
		[SYS_VRSessions1].[FileName] AS SYS_VRSessions1_FileName,
		[SYS_VRSessions1].[ApplicationID] AS SYS_VRSessions1_ApplicationID,
		[SYS_VRSessions1].[FolderLocation] AS SYS_VRSessions1_FolderLocation,
		[SYS_VRSessions1].[VRMenuName] AS SYS_VRSessions1_VRMenuName,
		[SYS_VRSessions1].[ToolTip] AS SYS_VRSessions1_ToolTip,
		[SYS_VRSessions1].[VRSessionType] AS SYS_VRSessions1_VRSessionType,
		[SYS_VRSessions1].[CSSClass] AS SYS_VRSessions1_CSSClass,
		[SYS_VRSessions1].[MaintainGrid] AS SYS_VRSessions1_MaintainGrid,
		[SYS_VRSessions1].[InsertForm] AS SYS_VRSessions1_InsertForm,
		[SYS_VRSessions1].[UpdateForm] AS SYS_VRSessions1_UpdateForm,
		[SYS_VRSessions1].[DisplayGrid] AS SYS_VRSessions1_DisplayGrid,
		[SYS_VRSessions1].[DisplayForm] AS SYS_VRSessions1_DisplayForm,
		[SYS_VRSessions1].[DeleteOption] AS SYS_VRSessions1_DeleteOption,
		[SYS_Applications2].[ApplicationID] AS SYS_Applications2_ApplicationID,
		[SYS_Applications2].[Description] AS SYS_Applications2_Description,
		[SYS_Applications2].[WebPath] AS SYS_Applications2_WebPath,
		[SYS_Applications2].[GenerateDefaults] AS SYS_Applications2_GenerateDefaults 
  FROM [SYS_VRSessionByEmployee] 
    	INNER JOIN #PageIndex
          ON [SYS_VRSessionByEmployee].[RecordID] = #PageIndex.RecordID
  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions1]
    ON [SYS_VRSessionByEmployee].[VRSessionID] = [SYS_VRSessions1].[VRSessionID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications2]
    ON [SYS_VRSessionByEmployee].[ApplicationID] = [SYS_Applications2].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
