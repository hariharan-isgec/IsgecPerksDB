USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRUsersSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[aspnet_Users].[UserName],
		[aspnet_Users].[UserFullName], 
		[aspnet_Users].[C_DateOfJoining],
		[aspnet_Users].[C_CompanyID],    
		[aspnet_Users].[C_DivisionID],   
		[aspnet_Users].[C_OfficeID],     
		[aspnet_Users].[C_DepartmentID], 
		[aspnet_Users].[C_ProjectSiteID],
		[aspnet_Users].[C_DesignationID],
		[aspnet_Users].[ActiveState]    
  FROM [aspnet_Users] 
  ORDER BY
     CASE @orderBy WHEN 'UserName' THEN [aspnet_Users].[UserName] END,
     CASE @orderBy WHEN 'UserName DESC' THEN [aspnet_Users].[UserName] END DESC,
     CASE @orderBy WHEN 'UserFullName' THEN [aspnet_Users].[UserFullName] END,
     CASE @orderBy WHEN 'UserFullName DESC' THEN [aspnet_Users].[UserFullName] END DESC 
  SET @RecordCount = @@RowCount
GO
