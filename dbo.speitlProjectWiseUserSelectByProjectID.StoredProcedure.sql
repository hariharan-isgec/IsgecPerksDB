USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlProjectWiseUserSelectByProjectID]
  @ProjectID NVarChar(6),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[EITL_ProjectWiseUser].[SerialNo] ,
		[EITL_ProjectWiseUser].[UserID] ,
		[EITL_ProjectWiseUser].[ProjectID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [EITL_ProjectWiseUser] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [EITL_ProjectWiseUser].[UserID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [EITL_ProjectWiseUser].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
  [EITL_ProjectWiseUser].[ProjectID] = @ProjectID
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [EITL_ProjectWiseUser].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [EITL_ProjectWiseUser].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'UserID' THEN [EITL_ProjectWiseUser].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [EITL_ProjectWiseUser].[UserID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [EITL_ProjectWiseUser].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [EITL_ProjectWiseUser].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
