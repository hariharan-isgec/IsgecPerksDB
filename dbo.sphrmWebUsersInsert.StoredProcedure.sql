USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWebUsersInsert]
  @UserName NVarChar(256),
  @LoweredUserName NVarChar(256),
  @MobileAlias NVarChar(16),
  @IsAnonymous Bit,
  @LastActivityDate DateTime,
  @UserFullName NVarChar(50),
  @LocationID Int,
  @ExtnNo NVarChar(50),
  @MobileNo NVarChar(50),
  @EMailID NVarChar(50),
  @C_DateOfJoining DateTime,
  @C_CompanyID NVarChar(6),
  @C_DivisionID NVarChar(6),
  @C_OfficeID Int,
  @C_DepartmentID NVarChar(6),
  @C_ProjectSiteID NVarChar(6),
  @C_DesignationID Int,
  @ActiveState Bit,
  @VPN_IP NVarChar(15),
  @VPN_Password NVarChar(50),
  @VPN_Expires DateTime,
  @LoginID NVarChar(8),
  @Contractual Bit,
  @MD5Password NVarChar(50),
  @Return_UserName NVarChar(256) = null OUTPUT
  AS
  INSERT [aspnet_Users]
  (
   [UserName]
  ,[LoweredUserName]
  ,[MobileAlias]
  ,[IsAnonymous]
  ,[LastActivityDate]
  ,[UserFullName]
  ,[LocationID]
  ,[ExtnNo]
  ,[MobileNo]
  ,[EMailID]
  ,[C_DateOfJoining]
  ,[C_CompanyID]
  ,[C_DivisionID]
  ,[C_OfficeID]
  ,[C_DepartmentID]
  ,[C_ProjectSiteID]
  ,[C_DesignationID]
  ,[ActiveState]
  ,[VPN_IP]
  ,[VPN_Password]
  ,[VPN_Expires]
  ,[LoginID]
  ,[Contractual]
  ,[MD5Password]
  )
  VALUES
  (
   UPPER(@UserName)
  ,@LoweredUserName
  ,@MobileAlias
  ,@IsAnonymous
  ,@LastActivityDate
  ,@UserFullName
  ,@LocationID
  ,@ExtnNo
  ,@MobileNo
  ,@EMailID
  ,@C_DateOfJoining
  ,@C_CompanyID
  ,@C_DivisionID
  ,@C_OfficeID
  ,@C_DepartmentID
  ,@C_ProjectSiteID
  ,@C_DesignationID
  ,@ActiveState
  ,@VPN_IP
  ,@VPN_Password
  ,@VPN_Expires
  ,@LoginID
  ,@Contractual
  ,@MD5Password
  )
  SET @Return_UserName = @UserName
GO
