USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosUsersSelectByID]
  @LoginID NVarChar(8) 
  AS
  SELECT
		[aspnet_Users].[LoginID] ,
		[aspnet_Users].[UserFullName] ,
		[aspnet_Users].[UserName] ,
		[aspnet_Users].[Contractual] ,
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
  WHERE
  [aspnet_Users].[LoginID] = @LoginID
GO
