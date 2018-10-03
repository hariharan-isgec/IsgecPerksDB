USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRMenuByVRRoleSelectListFilteres]
  @Filter_VRRoleID Int,
  @Filter_VRMenuID Int,
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
  RecordID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (RecordID) ' + 
               'SELECT [SYS_VRMenuByVRRole].[RecordID] FROM [SYS_VRMenuByVRRole] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRMenuByVRRole].[VRRoleID] = [SYS_VRRoles1].[VRRoleID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRMenuByVRRole].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications3]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRMenuByVRRole].[ApplicationID] = [SYS_Applications3].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_VRRoleID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SYS_VRMenuByVRRole].[VRRoleID] = ' + STR(@Filter_VRRoleID)
  IF (@Filter_VRMenuID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SYS_VRMenuByVRRole].[VRMenuID] = ' + STR(@Filter_VRMenuID)
  SET @LGSQL = @LGSQL + ' AND [SYS_VRMenuByVRRole].[ApplicationID] = ' + STR(@ApplicationID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RecordID' THEN '[SYS_VRMenuByVRRole].[RecordID]'
                        WHEN 'RecordID DESC' THEN '[SYS_VRMenuByVRRole].[RecordID] DESC'
                        WHEN 'VRRoleID' THEN '[SYS_VRMenuByVRRole].[VRRoleID]'
                        WHEN 'VRRoleID DESC' THEN '[SYS_VRMenuByVRRole].[VRRoleID] DESC'
                        WHEN 'VRMenuID' THEN '[SYS_VRMenuByVRRole].[VRMenuID]'
                        WHEN 'VRMenuID DESC' THEN '[SYS_VRMenuByVRRole].[VRMenuID] DESC'
                        WHEN 'Sequence' THEN '[SYS_VRMenuByVRRole].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[SYS_VRMenuByVRRole].[Sequence] DESC'
                        WHEN 'ApplicationID' THEN '[SYS_VRMenuByVRRole].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[SYS_VRMenuByVRRole].[ApplicationID] DESC'
                        WHEN 'SYS_VRRoles1_VRRoleID' THEN '[SYS_VRRoles1].[VRRoleID]'
                        WHEN 'SYS_VRRoles1_VRRoleID DESC' THEN '[SYS_VRRoles1].[VRRoleID] DESC'
                        WHEN 'SYS_VRRoles1_Description' THEN '[SYS_VRRoles1].[Description]'
                        WHEN 'SYS_VRRoles1_Description DESC' THEN '[SYS_VRRoles1].[Description] DESC'
                        WHEN 'SYS_VRRoles1_VRRoleType' THEN '[SYS_VRRoles1].[VRRoleType]'
                        WHEN 'SYS_VRRoles1_VRRoleType DESC' THEN '[SYS_VRRoles1].[VRRoleType] DESC'
                        WHEN 'SYS_VRRoles1_ApplicationID' THEN '[SYS_VRRoles1].[ApplicationID]'
                        WHEN 'SYS_VRRoles1_ApplicationID DESC' THEN '[SYS_VRRoles1].[ApplicationID] DESC'
                        WHEN 'SYS_VRMenus2_VRMenuID' THEN '[SYS_VRMenus2].[VRMenuID]'
                        WHEN 'SYS_VRMenus2_VRMenuID DESC' THEN '[SYS_VRMenus2].[VRMenuID] DESC'
                        WHEN 'SYS_VRMenus2_VRMenuName' THEN '[SYS_VRMenus2].[VRMenuName]'
                        WHEN 'SYS_VRMenus2_VRMenuName DESC' THEN '[SYS_VRMenus2].[VRMenuName] DESC'
                        WHEN 'SYS_VRMenus2_ToolTip' THEN '[SYS_VRMenus2].[ToolTip]'
                        WHEN 'SYS_VRMenus2_ToolTip DESC' THEN '[SYS_VRMenus2].[ToolTip] DESC'
                        WHEN 'SYS_VRMenus2_ParentVRMenuID' THEN '[SYS_VRMenus2].[ParentVRMenuID]'
                        WHEN 'SYS_VRMenus2_ParentVRMenuID DESC' THEN '[SYS_VRMenus2].[ParentVRMenuID] DESC'
                        WHEN 'SYS_VRMenus2_VRMenuType' THEN '[SYS_VRMenus2].[VRMenuType]'
                        WHEN 'SYS_VRMenus2_VRMenuType DESC' THEN '[SYS_VRMenus2].[VRMenuType] DESC'
                        WHEN 'SYS_VRMenus2_CSSClass' THEN '[SYS_VRMenus2].[CSSClass]'
                        WHEN 'SYS_VRMenus2_CSSClass DESC' THEN '[SYS_VRMenus2].[CSSClass] DESC'
                        WHEN 'SYS_VRMenus2_Sequence' THEN '[SYS_VRMenus2].[Sequence]'
                        WHEN 'SYS_VRMenus2_Sequence DESC' THEN '[SYS_VRMenus2].[Sequence] DESC'
                        WHEN 'SYS_VRMenus2_ApplicationID' THEN '[SYS_VRMenus2].[ApplicationID]'
                        WHEN 'SYS_VRMenus2_ApplicationID DESC' THEN '[SYS_VRMenus2].[ApplicationID] DESC'
                        WHEN 'SYS_Applications3_ApplicationID' THEN '[SYS_Applications3].[ApplicationID]'
                        WHEN 'SYS_Applications3_ApplicationID DESC' THEN '[SYS_Applications3].[ApplicationID] DESC'
                        WHEN 'SYS_Applications3_Description' THEN '[SYS_Applications3].[Description]'
                        WHEN 'SYS_Applications3_Description DESC' THEN '[SYS_Applications3].[Description] DESC'
                        WHEN 'SYS_Applications3_WebPath' THEN '[SYS_Applications3].[WebPath]'
                        WHEN 'SYS_Applications3_WebPath DESC' THEN '[SYS_Applications3].[WebPath] DESC'
                        ELSE '[SYS_VRMenuByVRRole].[RecordID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SYS_VRMenuByVRRole].[RecordID],
		[SYS_VRMenuByVRRole].[VRRoleID],
		[SYS_VRMenuByVRRole].[VRMenuID],
		[SYS_VRMenuByVRRole].[Sequence],
		[SYS_VRMenuByVRRole].[ApplicationID],
		[SYS_VRRoles1].[VRRoleID] AS SYS_VRRoles1_VRRoleID,
		[SYS_VRRoles1].[Description] AS SYS_VRRoles1_Description,
		[SYS_VRRoles1].[VRRoleType] AS SYS_VRRoles1_VRRoleType,
		[SYS_VRRoles1].[ApplicationID] AS SYS_VRRoles1_ApplicationID,
		[SYS_VRMenus2].[VRMenuID] AS SYS_VRMenus2_VRMenuID,
		[SYS_VRMenus2].[VRMenuName] AS SYS_VRMenus2_VRMenuName,
		[SYS_VRMenus2].[ToolTip] AS SYS_VRMenus2_ToolTip,
		[SYS_VRMenus2].[ParentVRMenuID] AS SYS_VRMenus2_ParentVRMenuID,
		[SYS_VRMenus2].[VRMenuType] AS SYS_VRMenus2_VRMenuType,
		[SYS_VRMenus2].[CSSClass] AS SYS_VRMenus2_CSSClass,
		[SYS_VRMenus2].[Sequence] AS SYS_VRMenus2_Sequence,
		[SYS_VRMenus2].[ApplicationID] AS SYS_VRMenus2_ApplicationID,
		[SYS_Applications3].[ApplicationID] AS SYS_Applications3_ApplicationID,
		[SYS_Applications3].[Description] AS SYS_Applications3_Description,
		[SYS_Applications3].[WebPath] AS SYS_Applications3_WebPath 
  FROM [SYS_VRMenuByVRRole] 
    	INNER JOIN #PageIndex
          ON [SYS_VRMenuByVRRole].[RecordID] = #PageIndex.RecordID
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles1]
    ON [SYS_VRMenuByVRRole].[VRRoleID] = [SYS_VRRoles1].[VRRoleID]
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]
    ON [SYS_VRMenuByVRRole].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications3]
    ON [SYS_VRMenuByVRRole].[ApplicationID] = [SYS_Applications3].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
