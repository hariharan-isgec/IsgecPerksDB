USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwVRSessionByEmployeeSelectListFilteres]
  @Filter_VRSessionID Int,
  @Filter_UserName NVarChar(20),
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
  SET @LGSQL = @LGSQL + '[SYS_VRSessionByEmployee].[RecordID]'
  SET @LGSQL = @LGSQL + ' FROM [SYS_VRSessionByEmployee] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_Applications] AS [SYS_Applications1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRSessionByEmployee].[ApplicationID] = [SYS_Applications1].[ApplicationID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions2]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRSessionByEmployee].[VRSessionID] = [SYS_VRSessions2].[VRSessionID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [SYS_VRSessionByEmployee].[UserName] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [SYS_VRSessionByEmployee].[ApplicationID] = ''' + STR(@ApplicationID) + '''' 
  IF (@Filter_VRSessionID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SYS_VRSessionByEmployee].[VRSessionID] = ' + STR(@Filter_VRSessionID)
  IF (@Filter_UserName > '') 
    SET @LGSQL = @LGSQL + ' AND [SYS_VRSessionByEmployee].[UserName] = ''' + @Filter_UserName + ''''
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
                        WHEN 'SYS_Applications1_Description' THEN '[SYS_Applications1].[Description]'
                        WHEN 'SYS_Applications1_Description DESC' THEN '[SYS_Applications1].[Description] DESC'
                        WHEN 'SYS_VRSessions2_Description' THEN '[SYS_VRSessions2].[Description]'
                        WHEN 'SYS_VRSessions2_Description DESC' THEN '[SYS_VRSessions2].[Description] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        ELSE '[SYS_VRSessionByEmployee].[RecordID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SYS_VRSessionByEmployee].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description,
    [SYS_VRSessions2].[Description] AS SYS_VRSessions2_Description,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [SYS_VRSessionByEmployee] 
      INNER JOIN #PageIndex
          ON [SYS_VRSessionByEmployee].[RecordID] = #PageIndex.RecordID
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_VRSessionByEmployee].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  INNER JOIN [SYS_VRSessions] AS [SYS_VRSessions2]
    ON [SYS_VRSessionByEmployee].[VRSessionID] = [SYS_VRSessions2].[VRSessionID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SYS_VRSessionByEmployee].[UserName] = [aspnet_Users1].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
