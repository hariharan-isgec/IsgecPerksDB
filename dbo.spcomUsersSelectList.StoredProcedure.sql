USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomUsersSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[aspnet_Users].[LoginID] ,
		[aspnet_Users].[UserFullName] ,
		[aspnet_Users].[UserName] ,
		[aspnet_Users].[EMailID] ,
		[aspnet_Users].[C_DateOfJoining] ,
		[aspnet_Users].[C_CompanyID] ,
		[aspnet_Users].[C_DivisionID] ,
		[aspnet_Users].[C_OfficeID] ,
		[aspnet_Users].[C_DepartmentID] ,
		[aspnet_Users].[C_ProjectSiteID] ,
		[aspnet_Users].[C_DesignationID] ,
		[aspnet_Users].[ActiveState]  
  FROM [aspnet_Users] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'LoginID' THEN [aspnet_Users].[LoginID] END,
     CASE @orderBy WHEN 'LoginID DESC' THEN [aspnet_Users].[LoginID] END DESC,
     CASE @orderBy WHEN 'UserFullName' THEN [aspnet_Users].[UserFullName] END,
     CASE @orderBy WHEN 'UserFullName DESC' THEN [aspnet_Users].[UserFullName] END DESC,
     CASE @orderBy WHEN 'UserName' THEN [aspnet_Users].[UserName] END,
     CASE @orderBy WHEN 'UserName DESC' THEN [aspnet_Users].[UserName] END DESC,
     CASE @orderBy WHEN 'EMailID' THEN [aspnet_Users].[EMailID] END,
     CASE @orderBy WHEN 'EMailID DESC' THEN [aspnet_Users].[EMailID] END DESC,
     CASE @orderBy WHEN 'C_DateOfJoining' THEN [aspnet_Users].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'C_DateOfJoining DESC' THEN [aspnet_Users].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'C_CompanyID' THEN [aspnet_Users].[C_CompanyID] END,
     CASE @orderBy WHEN 'C_CompanyID DESC' THEN [aspnet_Users].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'C_DivisionID' THEN [aspnet_Users].[C_DivisionID] END,
     CASE @orderBy WHEN 'C_DivisionID DESC' THEN [aspnet_Users].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'C_OfficeID' THEN [aspnet_Users].[C_OfficeID] END,
     CASE @orderBy WHEN 'C_OfficeID DESC' THEN [aspnet_Users].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'C_DepartmentID' THEN [aspnet_Users].[C_DepartmentID] END,
     CASE @orderBy WHEN 'C_DepartmentID DESC' THEN [aspnet_Users].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'C_ProjectSiteID' THEN [aspnet_Users].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'C_ProjectSiteID DESC' THEN [aspnet_Users].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'C_DesignationID' THEN [aspnet_Users].[C_DesignationID] END,
     CASE @orderBy WHEN 'C_DesignationID DESC' THEN [aspnet_Users].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [aspnet_Users].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [aspnet_Users].[ActiveState] END DESC 
  SET @RecordCount = @@RowCount
GO
