USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosAlertsToUsersSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @Filter_UserID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,UserID NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', UserID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_AlertsToUsers].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [TOS_AlertsToUsers].[UserID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_AlertsToUsers] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [TOS_AlertsToUsers].[UserID] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [TOS_AlertsToUsers].[ProjectID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_AlertsToUsers].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_UserID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_AlertsToUsers].[UserID] = ''' + @Filter_UserID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[TOS_AlertsToUsers].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TOS_AlertsToUsers].[ProjectID] DESC'
                        WHEN 'UserID' THEN '[TOS_AlertsToUsers].[UserID]'
                        WHEN 'UserID DESC' THEN '[TOS_AlertsToUsers].[UserID] DESC'
                        WHEN 'Active' THEN '[TOS_AlertsToUsers].[Active]'
                        WHEN 'Active DESC' THEN '[TOS_AlertsToUsers].[Active] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects2].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        ELSE '[TOS_AlertsToUsers].[ProjectID],[TOS_AlertsToUsers].[UserID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TOS_AlertsToUsers].[ProjectID] ,
		[TOS_AlertsToUsers].[UserID] ,
		[TOS_AlertsToUsers].[Active] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [TOS_AlertsToUsers] 
    	INNER JOIN #PageIndex
          ON [TOS_AlertsToUsers].[ProjectID] = #PageIndex.ProjectID
          AND [TOS_AlertsToUsers].[UserID] = #PageIndex.UserID
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_AlertsToUsers].[UserID] = [aspnet_Users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [TOS_AlertsToUsers].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
