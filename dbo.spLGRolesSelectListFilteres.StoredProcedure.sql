USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGRolesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  VRRoleID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (VRRoleID) ' + 
               'SELECT [SYS_VRRoles].[VRRoleID] FROM [SYS_VRRoles] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRRoles].[ApplicationID] = [SYS_Applications1].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
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
                        WHEN 'SYS_Applications1_ApplicationID' THEN '[SYS_Applications1].[ApplicationID]'
                        WHEN 'SYS_Applications1_ApplicationID DESC' THEN '[SYS_Applications1].[ApplicationID] DESC'
                        WHEN 'SYS_Applications1_Description' THEN '[SYS_Applications1].[Description]'
                        WHEN 'SYS_Applications1_Description DESC' THEN '[SYS_Applications1].[Description] DESC'
                        WHEN 'SYS_Applications1_WebPath' THEN '[SYS_Applications1].[WebPath]'
                        WHEN 'SYS_Applications1_WebPath DESC' THEN '[SYS_Applications1].[WebPath] DESC'
                        WHEN 'SYS_Applications1_GenerateDefaults' THEN '[SYS_Applications1].[GenerateDefaults]'
                        WHEN 'SYS_Applications1_GenerateDefaults DESC' THEN '[SYS_Applications1].[GenerateDefaults] DESC'
                        ELSE '[SYS_VRRoles].[VRRoleID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SYS_VRRoles].[VRRoleID],
		[SYS_VRRoles].[Description],
		[SYS_VRRoles].[VRRoleType],
		[SYS_VRRoles].[ApplicationID],
		[SYS_VRRoles].[DefaultRole],
		[SYS_Applications1].[ApplicationID] AS SYS_Applications1_ApplicationID,
		[SYS_Applications1].[Description] AS SYS_Applications1_Description,
		[SYS_Applications1].[WebPath] AS SYS_Applications1_WebPath,
		[SYS_Applications1].[GenerateDefaults] AS SYS_Applications1_GenerateDefaults 
  FROM [SYS_VRRoles] 
    	INNER JOIN #PageIndex
          ON [SYS_VRRoles].[VRRoleID] = #PageIndex.VRRoleID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRRoles].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
