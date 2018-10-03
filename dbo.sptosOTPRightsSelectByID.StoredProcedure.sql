USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPRightsSelectByID]
  @LoginID NVarChar(8),
  @UserID NVarChar(8),
  @ProjectID NVarChar(6) 
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
  AND [TOS_UserViews].[ProjectID] = @ProjectID
GO
