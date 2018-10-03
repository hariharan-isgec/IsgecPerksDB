USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionByVRMenuSelectListFilteres]
  @Filter_VRMenuID Int,
  @Filter_VRSessionID Int,
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
 ,RecordID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RecordID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SYS_VRSessionByVRMenu].[RecordID]'
  SET @LGSQL = @LGSQL + ' FROM [SYS_VRSessionByVRMenu] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRSessionByVRMenu].[ApplicationID] = [SYS_Applications1].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRSessionByVRMenu].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions3]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRSessionByVRMenu].[VRSessionID] = [SYS_VRSessions3].[VRSessionID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [SYS_VRSessionByVRMenu].[ApplicationID] = ''' + STR(@ApplicationID) + '''' 
  IF (@Filter_VRMenuID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SYS_VRSessionByVRMenu].[VRMenuID] = ' + STR(@Filter_VRMenuID)
  IF (@Filter_VRSessionID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SYS_VRSessionByVRMenu].[VRSessionID] = ' + STR(@Filter_VRSessionID)
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
                        WHEN 'SYS_Applications1_Description' THEN '[SYS_Applications1].[Description]'
                        WHEN 'SYS_Applications1_Description DESC' THEN '[SYS_Applications1].[Description] DESC'
                        WHEN 'SYS_VRMenus2_VRMenuName' THEN '[SYS_VRMenus2].[VRMenuName]'
                        WHEN 'SYS_VRMenus2_VRMenuName DESC' THEN '[SYS_VRMenus2].[VRMenuName] DESC'
                        WHEN 'SYS_VRSessions3_Description' THEN '[SYS_VRSessions3].[Description]'
                        WHEN 'SYS_VRSessions3_Description DESC' THEN '[SYS_VRSessions3].[Description] DESC'
                        ELSE '[SYS_VRSessionByVRMenu].[RecordID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SYS_VRSessionByVRMenu].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description,
    [SYS_VRMenus2].[VRMenuName] AS SYS_VRMenus2_VRMenuName,
    [SYS_VRSessions3].[Description] AS SYS_VRSessions3_Description 
  FROM [SYS_VRSessionByVRMenu] 
      INNER JOIN #PageIndex
          ON [SYS_VRSessionByVRMenu].[RecordID] = #PageIndex.RecordID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRSessionByVRMenu].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]
    ON [SYS_VRSessionByVRMenu].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]
  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions3]
    ON [SYS_VRSessionByVRMenu].[VRSessionID] = [SYS_VRSessions3].[VRSessionID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
