USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosAlertsToUsersSelectByUserID]
  @UserID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  [TOS_AlertsToUsers].[UserID] = @UserID
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [TOS_AlertsToUsers].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TOS_AlertsToUsers].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'UserID' THEN [TOS_AlertsToUsers].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [TOS_AlertsToUsers].[UserID] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TOS_AlertsToUsers].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TOS_AlertsToUsers].[Active] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
