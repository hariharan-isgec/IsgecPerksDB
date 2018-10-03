USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPRightsSelectByUserID]
  @UserID NVarChar(8),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
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
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_UserViews].[UserID] = [aspnet_Users1].[LoginID]
  INNER JOIN [TOS_Projects] AS [TOS_Projects2]
    ON [TOS_UserViews].[ProjectID] = [TOS_Projects2].[ProjectID]
  WHERE
  [TOS_UserViews].[UserID] = @UserID
  ORDER BY
     CASE @OrderBy WHEN 'UserID' THEN [TOS_UserViews].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [TOS_UserViews].[UserID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [TOS_UserViews].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TOS_UserViews].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'CLPView' THEN [TOS_UserViews].[CLPView] END,
     CASE @OrderBy WHEN 'CLPView DESC' THEN [TOS_UserViews].[CLPView] END DESC,
     CASE @OrderBy WHEN 'OTPView' THEN [TOS_UserViews].[OTPView] END,
     CASE @OrderBy WHEN 'OTPView DESC' THEN [TOS_UserViews].[OTPView] END DESC,
     CASE @OrderBy WHEN 'CanEnterCLPNotes' THEN [TOS_UserViews].[CanEnterCLPNotes] END,
     CASE @OrderBy WHEN 'CanEnterCLPNotes DESC' THEN [TOS_UserViews].[CanEnterCLPNotes] END DESC,
     CASE @OrderBy WHEN 'CanSendCLPAlerts' THEN [TOS_UserViews].[CanSendCLPAlerts] END,
     CASE @OrderBy WHEN 'CanSendCLPAlerts DESC' THEN [TOS_UserViews].[CanSendCLPAlerts] END DESC,
     CASE @OrderBy WHEN 'CanCreateCLPRevision' THEN [TOS_UserViews].[CanCreateCLPRevision] END,
     CASE @OrderBy WHEN 'CanCreateCLPRevision DESC' THEN [TOS_UserViews].[CanCreateCLPRevision] END DESC,
     CASE @OrderBy WHEN 'CanEnterOTPProgress' THEN [TOS_UserViews].[CanEnterOTPProgress] END,
     CASE @OrderBy WHEN 'CanEnterOTPProgress DESC' THEN [TOS_UserViews].[CanEnterOTPProgress] END DESC,
     CASE @OrderBy WHEN 'CanChangePlanning' THEN [TOS_UserViews].[CanChangePlanning] END,
     CASE @OrderBy WHEN 'CanChangePlanning DESC' THEN [TOS_UserViews].[CanChangePlanning] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'TOS_Projects2_Description' THEN [TOS_Projects2].[Description] END,
     CASE @OrderBy WHEN 'TOS_Projects2_Description DESC' THEN [TOS_Projects2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
