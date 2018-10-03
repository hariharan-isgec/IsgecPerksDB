USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstUsersUpdate]
  @Original_UserName NVarChar(8), 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [aspnet_Users] SET 
   [UserName] = @UserName
  ,[UserFullName] = @UserFullName
  ,[C_CompanyID] = @C_CompanyID
  ,[C_DivisionID] = @C_DivisionID
  ,[C_OfficeID] = @C_OfficeID
  ,[C_DepartmentID] = @C_DepartmentID
  ,[C_DesignationID] = @C_DesignationID
  ,[C_ProjectSiteID] = @C_ProjectSiteID
  ,[Contractual] = @Contractual
  ,[ActiveState] = @ActiveState
  ,[MobileNo] = @MobileNo
  ,[EMailID] = @EMailID
  ,[LocationID] = @LocationID
  ,[ExtnNo] = @ExtnNo
  ,[C_DateOfJoining] = @C_DateOfJoining
  ,[NetworkIP] = @NetworkIP
  ,[VPN_IP] = @VPN_IP
  ,[VPN_Password] = @VPN_Password
  ,[VPN_Expires] = @VPN_Expires
  ,[LoginID] = @LoginID
  ,[MD5Password] = @MD5Password
  WHERE
  [UserName] = @Original_UserName
  SET @RowCount = @@RowCount
GO
