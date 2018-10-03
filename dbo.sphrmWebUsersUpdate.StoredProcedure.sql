USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWebUsersUpdate]
  @Original_UserName NVarChar(256), 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [aspnet_Users] SET 
   [UserName] = @UserName
  ,[LoweredUserName] = @LoweredUserName
  ,[MobileAlias] = @MobileAlias
  ,[IsAnonymous] = @IsAnonymous
  ,[LastActivityDate] = @LastActivityDate
  ,[UserFullName] = @UserFullName
  ,[LocationID] = @LocationID
  ,[ExtnNo] = @ExtnNo
  ,[MobileNo] = @MobileNo
  ,[EMailID] = @EMailID
  ,[C_DateOfJoining] = @C_DateOfJoining
  ,[C_CompanyID] = @C_CompanyID
  ,[C_DivisionID] = @C_DivisionID
  ,[C_OfficeID] = @C_OfficeID
  ,[C_DepartmentID] = @C_DepartmentID
  ,[C_ProjectSiteID] = @C_ProjectSiteID
  ,[C_DesignationID] = @C_DesignationID
  ,[ActiveState] = @ActiveState
  ,[VPN_IP] = @VPN_IP
  ,[VPN_Password] = @VPN_Password
  ,[VPN_Expires] = @VPN_Expires
  ,[LoginID] = @LoginID
  ,[Contractual] = @Contractual
  ,[MD5Password] = @MD5Password
  WHERE
  [UserName] = @Original_UserName
  SET @RowCount = @@RowCount
GO
