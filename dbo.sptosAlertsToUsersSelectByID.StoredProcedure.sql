USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosAlertsToUsersSelectByID]
  @ProjectID NVarChar(6),
  @UserID NVarChar(8) 
  AS
  SELECT
		[TOS_AlertsToUsers].[ProjectID] ,
		[TOS_AlertsToUsers].[UserID] ,
		[TOS_AlertsToUsers].[Active] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [TOS_AlertsToUsers] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_AlertsToUsers].[UserID] = [aspnet_Users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [TOS_AlertsToUsers].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
  [TOS_AlertsToUsers].[ProjectID] = @ProjectID
  AND [TOS_AlertsToUsers].[UserID] = @UserID
GO
