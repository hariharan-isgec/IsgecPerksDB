USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPRightsSelectListFilteres]
  @Filter_UserID NVarChar(8),
  @Filter_ProjectID NVarChar(6),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(8) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserID'
  SET @LGSQL = @LGSQL + ', ProjectID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_UserViews].[UserID]'
  SET @LGSQL = @LGSQL + ', [TOS_UserViews].[ProjectID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_UserViews] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [TOS_UserViews].[UserID] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TOS_Projects] AS [TOS_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [TOS_UserViews].[ProjectID] = [TOS_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_UserID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_UserViews].[UserID] = ''' + @Filter_UserID + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_UserViews].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserID' THEN '[TOS_UserViews].[UserID]'
                        WHEN 'UserID DESC' THEN '[TOS_UserViews].[UserID] DESC'
                        WHEN 'ProjectID' THEN '[TOS_UserViews].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TOS_UserViews].[ProjectID] DESC'
                        WHEN 'CLPView' THEN '[TOS_UserViews].[CLPView]'
                        WHEN 'CLPView DESC' THEN '[TOS_UserViews].[CLPView] DESC'
                        WHEN 'OTPView' THEN '[TOS_UserViews].[OTPView]'
                        WHEN 'OTPView DESC' THEN '[TOS_UserViews].[OTPView] DESC'
                        WHEN 'CanEnterCLPNotes' THEN '[TOS_UserViews].[CanEnterCLPNotes]'
                        WHEN 'CanEnterCLPNotes DESC' THEN '[TOS_UserViews].[CanEnterCLPNotes] DESC'
                        WHEN 'CanSendCLPAlerts' THEN '[TOS_UserViews].[CanSendCLPAlerts]'
                        WHEN 'CanSendCLPAlerts DESC' THEN '[TOS_UserViews].[CanSendCLPAlerts] DESC'
                        WHEN 'CanCreateCLPRevision' THEN '[TOS_UserViews].[CanCreateCLPRevision]'
                        WHEN 'CanCreateCLPRevision DESC' THEN '[TOS_UserViews].[CanCreateCLPRevision] DESC'
                        WHEN 'CanEnterOTPProgress' THEN '[TOS_UserViews].[CanEnterOTPProgress]'
                        WHEN 'CanEnterOTPProgress DESC' THEN '[TOS_UserViews].[CanEnterOTPProgress] DESC'
                        WHEN 'CanChangePlanning' THEN '[TOS_UserViews].[CanChangePlanning]'
                        WHEN 'CanChangePlanning DESC' THEN '[TOS_UserViews].[CanChangePlanning] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'TOS_Projects2_Description' THEN '[TOS_Projects2].[Description]'
                        WHEN 'TOS_Projects2_Description DESC' THEN '[TOS_Projects2].[Description] DESC'
                        ELSE '[TOS_UserViews].[UserID],[TOS_UserViews].[ProjectID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TOS_UserViews].[UserID] ,
		[TOS_UserViews].[ProjectID] ,
		[TOS_UserViews].[CLPView] ,
		[TOS_UserViews].[OTPView] ,
		[TOS_UserViews].[CanEnterCLPNotes] ,
		[TOS_UserViews].[CanSendCLPAlerts] ,
		[TOS_UserViews].[CanCreateCLPRevision] ,
		[TOS_UserViews].[CanEnterOTPProgress] ,
		[TOS_UserViews].[CanChangePlanning] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[TOS_Projects2].[Description] AS TOS_Projects2_Description 
  FROM [TOS_UserViews] 
    	INNER JOIN #PageIndex
          ON [TOS_UserViews].[UserID] = #PageIndex.UserID
          AND [TOS_UserViews].[ProjectID] = #PageIndex.ProjectID
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_UserViews].[UserID] = [aspnet_Users1].[LoginID]
  INNER JOIN [TOS_Projects] AS [TOS_Projects2]
    ON [TOS_UserViews].[ProjectID] = [TOS_Projects2].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
