USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVR_LG_UsersUpdate_EMail]
  @UserFullName NVarChar(50),
  @PW NVarChar(20),
  @Original_UserName NVarChar(20), 
  @C_DateOfJoining DateTime,
  @C_CompanyID NVarChar(6),
  @C_DivisionID NVarChar(6),
  @C_OfficeID Int,
  @C_DepartmentID NVarChar(6),
  @C_ProjectSiteID NVarChar(6),
  @C_DesignationID Int,
  @ActiveState Bit,
  @EMailID NVarChar(50), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [aspnet_Users] SET 
   [UserFullName] = @UserFullName 
	,[C_DateOfJoining] = @C_DateOfJoining
	,[C_CompanyID]     = @C_CompanyID    
	,[C_DivisionID]    = @C_DivisionID   
	,[C_OfficeID]      = @C_OfficeID     
	,[C_DepartmentID]  = @C_DepartmentID 
	,[C_ProjectSiteID] = @C_ProjectSiteID
	,[C_DesignationID] = @C_DesignationID
	,[ActiveState]     = @ActiveState    
	,[PW]     = @PW    
	,[EMailID]         = @EMailID 
	,[LoginID] = @Original_UserName
  WHERE
  [UserName] = @Original_UserName
  SET @RowCount = @@RowCount
GO
