USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spVRUsersInsert]
  @UserName NVarChar(20),
  @UserFullName NVarChar(50),
  @C_DateOfJoining DateTime,
  @C_CompanyID NVarChar(6),
  @C_DivisionID NVarChar(6),
  @C_OfficeID Int,
  @C_DepartmentID NVarChar(6),
  @C_ProjectSiteID NVarChar(6),
  @C_DesignationID Int,
  @ActiveState Bit,
  @Return_UserName NVarChar(20) = null OUTPUT
  AS
  INSERT [aspnet_Users]
  (
   [UserName]
  ,[UserFullName]
	,[C_DateOfJoining]
	,[C_CompanyID]
	,[C_DivisionID]
	,[C_OfficeID]
	,[C_DepartmentID]
	,[C_ProjectSiteID]
	,[C_DesignationID]
	,[ActiveState]
  )
  VALUES
  (
   @UserName
  ,@UserFullName
	,@C_DateOfJoining
	,@C_CompanyID
	,@C_DivisionID
	,@C_OfficeID
	,@C_DepartmentID
	,@C_ProjectSiteID
	,@C_DesignationID
	,@ActiveState
  )
  SET @Return_UserName = @UserName
GO
