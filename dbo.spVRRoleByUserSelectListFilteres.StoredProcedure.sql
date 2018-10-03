USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRRoleByUserSelectListFilteres]
  @Filter_VRRoleID Int,
  @Filter_UserName NVarChar(20),
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
               'SELECT [SYS_VRRoleByEmployee].[RecordID] FROM [SYS_VRRoleByEmployee] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRRoleByEmployee].[VRRoleID] = [SYS_VRRoles1].[VRRoleID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications2]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRRoleByEmployee].[ApplicationID] = [SYS_Applications2].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users3]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRRoleByEmployee].[UserName] = [aspnet_users3].[UserName]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_VRRoleID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SYS_VRRoleByEmployee].[VRRoleID] = ' + STR(@Filter_VRRoleID)
  IF (@Filter_UserName > '') 
    SET @LGSQL = @LGSQL + ' AND [SYS_VRRoleByEmployee].[UserName] = ''' + @Filter_UserName + ''''
  SET @LGSQL = @LGSQL + ' AND [SYS_VRRoleByEmployee].[ApplicationID] = ' + STR(@ApplicationID)
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
                        WHEN 'SYS_VRRoles1_VRRoleID' THEN '[SYS_VRRoles1].[VRRoleID]'
                        WHEN 'SYS_VRRoles1_VRRoleID DESC' THEN '[SYS_VRRoles1].[VRRoleID] DESC'
                        WHEN 'SYS_VRRoles1_Description' THEN '[SYS_VRRoles1].[Description]'
                        WHEN 'SYS_VRRoles1_Description DESC' THEN '[SYS_VRRoles1].[Description] DESC'
                        WHEN 'SYS_VRRoles1_VRRoleType' THEN '[SYS_VRRoles1].[VRRoleType]'
                        WHEN 'SYS_VRRoles1_VRRoleType DESC' THEN '[SYS_VRRoles1].[VRRoleType] DESC'
                        WHEN 'SYS_VRRoles1_ApplicationID' THEN '[SYS_VRRoles1].[ApplicationID]'
                        WHEN 'SYS_VRRoles1_ApplicationID DESC' THEN '[SYS_VRRoles1].[ApplicationID] DESC'
                        WHEN 'SYS_Applications2_ApplicationID' THEN '[SYS_Applications2].[ApplicationID]'
                        WHEN 'SYS_Applications2_ApplicationID DESC' THEN '[SYS_Applications2].[ApplicationID] DESC'
                        WHEN 'SYS_Applications2_Description' THEN '[SYS_Applications2].[Description]'
                        WHEN 'SYS_Applications2_Description DESC' THEN '[SYS_Applications2].[Description] DESC'
                        WHEN 'SYS_Applications2_WebPath' THEN '[SYS_Applications2].[WebPath]'
                        WHEN 'SYS_Applications2_WebPath DESC' THEN '[SYS_Applications2].[WebPath] DESC'
                        WHEN 'aspnet_users3_UserName' THEN '[aspnet_users3].[UserName]'
                        WHEN 'aspnet_users3_UserName DESC' THEN '[aspnet_users3].[UserName] DESC'
                        WHEN 'aspnet_users3_UserFullName' THEN '[aspnet_users3].[UserFullName]'
                        WHEN 'aspnet_users3_UserFullName DESC' THEN '[aspnet_users3].[UserFullName] DESC'
                        ELSE '[SYS_VRRoleByEmployee].[RecordID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SYS_VRRoleByEmployee].[RecordID],
		[SYS_VRRoleByEmployee].[VRRoleID],
		[SYS_VRRoleByEmployee].[ApplicationID],
		[SYS_VRRoleByEmployee].[UserName],
		[SYS_VRRoles1].[VRRoleID] AS SYS_VRRoles1_VRRoleID,
		[SYS_VRRoles1].[Description] AS SYS_VRRoles1_Description,
		[SYS_VRRoles1].[VRRoleType] AS SYS_VRRoles1_VRRoleType,
		[SYS_VRRoles1].[ApplicationID] AS SYS_VRRoles1_ApplicationID,
		[SYS_Applications2].[ApplicationID] AS SYS_Applications2_ApplicationID,
		[SYS_Applications2].[Description] AS SYS_Applications2_Description,
		[SYS_Applications2].[WebPath] AS SYS_Applications2_WebPath,
		[aspnet_users3].[UserName] AS aspnet_users3_UserName,
		[aspnet_users3].[UserFullName] AS aspnet_users3_UserFullName 
  FROM [SYS_VRRoleByEmployee] 
    	INNER JOIN #PageIndex
          ON [SYS_VRRoleByEmployee].[RecordID] = #PageIndex.RecordID
  INNER JOIN [SYS_VRRoles] AS [SYS_VRRoles1]
    ON [SYS_VRRoleByEmployee].[VRRoleID] = [SYS_VRRoles1].[VRRoleID]
  INNER JOIN [SYS_Applications] AS [SYS_Applications2]
    ON [SYS_VRRoleByEmployee].[ApplicationID] = [SYS_Applications2].[ApplicationID]
  INNER JOIN [aspnet_users] AS [aspnet_users3]
    ON [SYS_VRRoleByEmployee].[UserName] = [aspnet_users3].[UserName]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
