USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstUsersInsert]
  @UserName NVarChar(8),
  @UserFullName NVarChar(50),
  @C_CompanyID NVarChar(6),
  @C_DivisionID NVarChar(6),
  @C_OfficeID Int,
  @C_DepartmentID NVarChar(6),
  @C_DesignationID Int,
  @C_ProjectSiteID NVarChar(6),
  @Contractual Bit,
  @ActiveState Bit,
  @MobileNo NVarChar(50),
  @EMailID NVarChar(50),
  @LocationID Int,
  @ExtnNo NVarChar(50),
  @C_DateOfJoining DateTime,
  @NetworkIP NVarChar(15),
  @VPN_IP NVarChar(15),
  @VPN_Password NVarChar(50),
  @VPN_Expires DateTime,
  @LoginID NVarChar(8),
  @MD5Password NVarChar(50),
  @Return_UserName NVarChar(8) = null OUTPUT
  AS
  INSERT [aspnet_Users]
  (
   [UserName]
  ,[UserFullName]
  ,[C_CompanyID]
  ,[C_DivisionID]
  ,[C_OfficeID]
  ,[C_DepartmentID]
  ,[C_DesignationID]
  ,[C_ProjectSiteID]
  ,[Contractual]
  ,[ActiveState]
  ,[MobileNo]
  ,[EMailID]
  ,[LocationID]
  ,[ExtnNo]
  ,[C_DateOfJoining]
  ,[NetworkIP]
  ,[VPN_IP]
  ,[VPN_Password]
  ,[VPN_Expires]
  ,[LoginID]
  ,[MD5Password]
  )
  VALUES
  (
   UPPER(@UserName)
  ,@UserFullName
  ,@C_CompanyID
  ,@C_DivisionID
  ,@C_OfficeID
  ,@C_DepartmentID
  ,@C_DesignationID
  ,@C_ProjectSiteID
  ,@Contractual
  ,@ActiveState
  ,@MobileNo
  ,@EMailID
  ,@LocationID
  ,@ExtnNo
  ,@C_DateOfJoining
  ,@NetworkIP
  ,@VPN_IP
  ,@VPN_Password
  ,@VPN_Expires
  ,@LoginID
  ,@MD5Password
  )
  SET @Return_UserName = @UserName
GO
