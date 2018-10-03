USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spadmUsersSelectByID_sysDeptt]
  @UserName NVarChar(8) 
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
  WHERE [aspnet_users].[C_DepartmentID] = 'SYS'   
  AND [aspnet_users].[UserName] = @UserName
GO
