USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRRolesSelectListFilteres]
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
 ,VRRoleID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'VRRoleID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SYS_VRRoles].[VRRoleID]'
  SET @LGSQL = @LGSQL + ' FROM [SYS_VRRoles] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRRoles].[ApplicationID] = [SYS_Applications1].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [SYS_VRRoles].[ApplicationID] = ''' + STR(@ApplicationID) + '''' 
  IF (@Filter_VRRoleID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SYS_VRRoles].[VRRoleID] = ' + STR(@Filter_VRRoleID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VRRoleID' THEN '[SYS_VRRoles].[VRRoleID]'
                        WHEN 'VRRoleID DESC' THEN '[SYS_VRRoles].[VRRoleID] DESC'
                        WHEN 'Description' THEN '[SYS_VRRoles].[Description]'
                        WHEN 'Description DESC' THEN '[SYS_VRRoles].[Description] DESC'
                        WHEN 'VRRoleType' THEN '[SYS_VRRoles].[VRRoleType]'
                        WHEN 'VRRoleType DESC' THEN '[SYS_VRRoles].[VRRoleType] DESC'
                        WHEN 'ApplicationID' THEN '[SYS_VRRoles].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[SYS_VRRoles].[ApplicationID] DESC'
                        WHEN 'DefaultRole' THEN '[SYS_VRRoles].[DefaultRole]'
                        WHEN 'DefaultRole DESC' THEN '[SYS_VRRoles].[DefaultRole] DESC'
                        WHEN 'SYS_Applications1_Description' THEN '[SYS_Applications1].[Description]'
                        WHEN 'SYS_Applications1_Description DESC' THEN '[SYS_Applications1].[Description] DESC'
                        ELSE '[SYS_VRRoles].[VRRoleID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SYS_VRRoles].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description 
  FROM [SYS_VRRoles] 
      INNER JOIN #PageIndex
          ON [SYS_VRRoles].[VRRoleID] = #PageIndex.VRRoleID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRRoles].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
