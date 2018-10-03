USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmUsersSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[aspnet_users].[UserName],
		[aspnet_users].[UserFullName],
		[aspnet_users].[LocationID],
		[aspnet_users].[ExtnNo],
		[aspnet_users].[MobileNo],
		[aspnet_users].[EMailID],
		[aspnet_users].[C_DateOfJoining],
		[aspnet_users].[C_CompanyID],
		[aspnet_users].[C_DivisionID],
		[aspnet_users].[C_OfficeID],
		[aspnet_users].[C_DepartmentID],
		[aspnet_users].[C_ProjectSiteID],
		[aspnet_users].[C_DesignationID],
		[aspnet_users].[ActiveState] 
  FROM [aspnet_users] 
  ORDER BY
     CASE @orderBy WHEN 'UserName' THEN [aspnet_users].[UserName] END,
     CASE @orderBy WHEN 'UserName DESC' THEN [aspnet_users].[UserName] END DESC,
     CASE @orderBy WHEN 'UserFullName' THEN [aspnet_users].[UserFullName] END,
     CASE @orderBy WHEN 'UserFullName DESC' THEN [aspnet_users].[UserFullName] END DESC,
     CASE @orderBy WHEN 'LocationID' THEN [aspnet_users].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [aspnet_users].[LocationID] END DESC,
     CASE @orderBy WHEN 'ExtnNo' THEN [aspnet_users].[ExtnNo] END,
     CASE @orderBy WHEN 'ExtnNo DESC' THEN [aspnet_users].[ExtnNo] END DESC,
     CASE @orderBy WHEN 'MobileNo' THEN [aspnet_users].[MobileNo] END,
     CASE @orderBy WHEN 'MobileNo DESC' THEN [aspnet_users].[MobileNo] END DESC,
     CASE @orderBy WHEN 'EMailID' THEN [aspnet_users].[EMailID] END,
     CASE @orderBy WHEN 'EMailID DESC' THEN [aspnet_users].[EMailID] END DESC,
     CASE @orderBy WHEN 'C_DateOfJoining' THEN [aspnet_users].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'C_DateOfJoining DESC' THEN [aspnet_users].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'C_CompanyID' THEN [aspnet_users].[C_CompanyID] END,
     CASE @orderBy WHEN 'C_CompanyID DESC' THEN [aspnet_users].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'C_DivisionID' THEN [aspnet_users].[C_DivisionID] END,
     CASE @orderBy WHEN 'C_DivisionID DESC' THEN [aspnet_users].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'C_OfficeID' THEN [aspnet_users].[C_OfficeID] END,
     CASE @orderBy WHEN 'C_OfficeID DESC' THEN [aspnet_users].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'C_DepartmentID' THEN [aspnet_users].[C_DepartmentID] END,
     CASE @orderBy WHEN 'C_DepartmentID DESC' THEN [aspnet_users].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'C_ProjectSiteID' THEN [aspnet_users].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'C_ProjectSiteID DESC' THEN [aspnet_users].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'C_DesignationID' THEN [aspnet_users].[C_DesignationID] END,
     CASE @orderBy WHEN 'C_DesignationID DESC' THEN [aspnet_users].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [aspnet_users].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [aspnet_users].[ActiveState] END DESC 
  SET @RecordCount = @@RowCount
GO
