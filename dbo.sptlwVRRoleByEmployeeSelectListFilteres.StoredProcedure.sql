USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRRoleByEmployeeSelectListFilteres]
  @Filter_VRRoleID Int,
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
  SET @LGSQL = @LGSQL + '[SYS_VRRoleByEmployee].[RecordID]'
  SET @LGSQL = @LGSQL + ' FROM [SYS_VRRoleByEmployee] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRRoleByEmployee].[ApplicationID] = [SYS_Applications1].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles2]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRRoleByEmployee].[VRRoleID] = [SYS_VRRoles2].[VRRoleID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRRoleByEmployee].[UserName] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [SYS_VRRoleByEmployee].[ApplicationID] = ''' + STR(@ApplicationID) + '''' 
  IF (@Filter_VRRoleID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SYS_VRRoleByEmployee].[VRRoleID] = ' + STR(@Filter_VRRoleID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RecordID' THEN '[SYS_VRRoleByEmployee].[RecordID]'
                        WHEN 'RecordID DESC' THEN '[SYS_VRRoleByEmployee].[RecordID] DESC'
                        WHEN 'VRRoleID' THEN '[SYS_VRRoleByEmployee].[VRRoleID]'
                        WHEN 'VRRoleID DESC' THEN '[SYS_VRRoleByEmployee].[VRRoleID] DESC'
                        WHEN 'ApplicationID' THEN '[SYS_VRRoleByEmployee].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[SYS_VRRoleByEmployee].[ApplicationID] DESC'
                        WHEN 'UserName' THEN '[SYS_VRRoleByEmployee].[UserName]'
                        WHEN 'UserName DESC' THEN '[SYS_VRRoleByEmployee].[UserName] DESC'
                        WHEN 'SYS_Applications1_Description' THEN '[SYS_Applications1].[Description]'
                        WHEN 'SYS_Applications1_Description DESC' THEN '[SYS_Applications1].[Description] DESC'
                        WHEN 'SYS_VRRoles2_Description' THEN '[SYS_VRRoles2].[Description]'
                        WHEN 'SYS_VRRoles2_Description DESC' THEN '[SYS_VRRoles2].[Description] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        ELSE '[SYS_VRRoleByEmployee].[RecordID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SYS_VRRoleByEmployee].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description,
    [SYS_VRRoles2].[Description] AS SYS_VRRoles2_Description,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [SYS_VRRoleByEmployee] 
      INNER JOIN #PageIndex
          ON [SYS_VRRoleByEmployee].[RecordID] = #PageIndex.RecordID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRRoleByEmployee].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles2]
    ON [SYS_VRRoleByEmployee].[VRRoleID] = [SYS_VRRoles2].[VRRoleID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SYS_VRRoleByEmployee].[UserName] = [aspnet_Users1].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
