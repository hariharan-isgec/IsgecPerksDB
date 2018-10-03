USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwUsersInsert]
  @LoginID NVarChar(8),
  @UserFullName NVarChar(50),
  @ExtnNo NVarChar(50),
  @MobileNo NVarChar(50),
  @EMailID NVarChar(50),
  @C_DateOfJoining DateTime,
  @C_CompanyID NVarChar(6),
  @C_DivisionID NVarChar(6),
  @C_OfficeID Int,
  @C_DepartmentID NVarChar(6),
  @C_DesignationID Int,
  @ActiveState Bit,
  @Contractual Bit,
  @wp_user NVarChar(50),
  @pw NVarChar(50),
  @Return_LoginID NVarChar(8) = null OUTPUT 
  AS
  INSERT [aspnet_Users]
  (
   [LoginID]
  ,[UserFullName]
  ,[ExtnNo]
  ,[MobileNo]
  ,[EMailID]
  ,[C_DateOfJoining]
  ,[C_CompanyID]
  ,[C_DivisionID]
  ,[C_OfficeID]
  ,[C_DepartmentID]
  ,[C_DesignationID]
  ,[ActiveState]
  ,[Contractual]
  ,[wp_user]
  ,[pw]
  )
  VALUES
  (
   UPPER(@LoginID)
  ,@UserFullName
  ,@ExtnNo
  ,@MobileNo
  ,@EMailID
  ,@C_DateOfJoining
  ,@C_CompanyID
  ,@C_DivisionID
  ,@C_OfficeID
  ,@C_DepartmentID
  ,@C_DesignationID
  ,@ActiveState
  ,@Contractual
  ,@wp_user
  ,@pw
  )
  SET @Return_LoginID = @LoginID
GO
