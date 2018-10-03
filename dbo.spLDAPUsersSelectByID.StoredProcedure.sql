USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLDAPUsersSelectByID]
  @UserName NVarChar(256) 
  AS
  SELECT  
		[ASPNETv_UsersForLDAP].[UserName] ,
		[ASPNETv_UsersForLDAP].[UserFullName] ,
		[ASPNETv_UsersForLDAP].[EmployeeName] ,
		[ASPNETv_UsersForLDAP].[Department] ,
		[ASPNETv_UsersForLDAP].[Designation] ,
		[ASPNETv_UsersForLDAP].[EMailID] ,
		[ASPNETv_UsersForLDAP].[MD5Password] ,
		[ASPNETv_UsersForLDAP].[MobileNo] ,
		[ASPNETv_UsersForLDAP].[Location], 
		[ASPNETv_UsersForLDAP].[ActiveState], 
		[ASPNETv_UsersForLDAP].[ProjectSiteID], 
		[ASPNETv_UsersForLDAP].[ProjectSiteEMailID], 
		[ASPNETv_UsersForLDAP].[ProjectSiteEMailPassword], 
		[ASPNETv_UsersForLDAP].[VPNMailExpireOn],
		[ASPNETv_UsersForLDAP].[ContactNumbers],
		[ASPNETv_UsersForLDAP].[Blackberry]    
     
  FROM [ASPNETv_UsersForLDAP] 
  WHERE
  [ASPNETv_UsersForLDAP].[UserName] = @UserName
GO
