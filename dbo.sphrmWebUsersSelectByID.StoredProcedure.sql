USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWebUsersSelectByID]
  @UserName NVarChar(256) 
  AS
  SELECT
		CONVERT(NVarChar(36),[aspnet_Users].[ApplicationId]) AS ApplicationId,
		CONVERT(NVarChar(36),[aspnet_Users].[UserId]) AS UserId,
		[aspnet_Users].[UserName] ,
		[aspnet_Users].[LoweredUserName] ,
		[aspnet_Users].[MobileAlias] ,
		[aspnet_Users].[IsAnonymous] ,
		[aspnet_Users].[LastActivityDate] ,
		[aspnet_Users].[UserFullName] ,
		[aspnet_Users].[LocationID] ,
		[aspnet_Users].[ExtnNo] ,
		[aspnet_Users].[MobileNo] ,
		[aspnet_Users].[EMailID] ,
		[aspnet_Users].[C_DateOfJoining] ,
		[aspnet_Users].[C_CompanyID] ,
		[aspnet_Users].[C_DivisionID] ,
		[aspnet_Users].[C_OfficeID] ,
		[aspnet_Users].[C_DepartmentID] ,
		[aspnet_Users].[C_ProjectSiteID] ,
		[aspnet_Users].[C_DesignationID] ,
		[aspnet_Users].[ActiveState] ,
		[aspnet_Users].[VPN_IP] ,
		[aspnet_Users].[VPN_Password] ,
		[aspnet_Users].[VPN_Expires] ,
		[aspnet_Users].[LoginID] ,
		[aspnet_Users].[Contractual] ,
		[aspnet_Users].[MD5Password]  
  FROM [aspnet_Users] 
  WHERE
  [aspnet_Users].[UserName] = @UserName
GO
