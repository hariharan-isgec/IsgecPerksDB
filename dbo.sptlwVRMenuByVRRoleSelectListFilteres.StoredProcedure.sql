USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRMenuByVRRoleSelectListFilteres]
  @Filter_VRRoleID Int,
  @Filter_VRMenuID Int,
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
  SET @LGSQL = @LGSQL + '[SYS_VRMenuByVRRole].[RecordID]'
  SET @LGSQL = @LGSQL + ' FROM [SYS_VRMenuByVRRole] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRMenuByVRRole].[ApplicationID] = [SYS_Applications1].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRMenuByVRRole].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles3]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRMenuByVRRole].[VRRoleID] = [SYS_VRRoles3].[VRRoleID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [SYS_VRMenuByVRRole].[ApplicationID] = ''' + STR(@ApplicationID) + '''' 
  IF (@Filter_VRRoleID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SYS_VRMenuByVRRole].[VRRoleID] = ' + STR(@Filter_VRRoleID)
  IF (@Filter_VRMenuID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SYS_VRMenuByVRRole].[VRMenuID] = ' + STR(@Filter_VRMenuID)
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
                        WHEN 'SYS_Applications1_Description' THEN '[SYS_Applications1].[Description]'
                        WHEN 'SYS_Applications1_Description DESC' THEN '[SYS_Applications1].[Description] DESC'
                        WHEN 'SYS_VRMenus2_VRMenuName' THEN '[SYS_VRMenus2].[VRMenuName]'
                        WHEN 'SYS_VRMenus2_VRMenuName DESC' THEN '[SYS_VRMenus2].[VRMenuName] DESC'
                        WHEN 'SYS_VRRoles3_Description' THEN '[SYS_VRRoles3].[Description]'
                        WHEN 'SYS_VRRoles3_Description DESC' THEN '[SYS_VRRoles3].[Description] DESC'
                        ELSE '[SYS_VRMenuByVRRole].[RecordID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SYS_VRMenuByVRRole].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description,
    [SYS_VRMenus2].[VRMenuName] AS SYS_VRMenus2_VRMenuName,
    [SYS_VRRoles3].[Description] AS SYS_VRRoles3_Description 
  FROM [SYS_VRMenuByVRRole] 
      INNER JOIN #PageIndex
          ON [SYS_VRMenuByVRRole].[RecordID] = #PageIndex.RecordID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRMenuByVRRole].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRMenus] AS [SYS_VRMenus2]
    ON [SYS_VRMenuByVRRole].[VRMenuID] = [SYS_VRMenus2].[VRMenuID]
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles3]
    ON [SYS_VRMenuByVRRole].[VRRoleID] = [SYS_VRRoles3].[VRRoleID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
