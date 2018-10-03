USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwUsersUpdate]
  @Original_LoginID NVarChar(8), 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [aspnet_Users] SET 
   [LoginID] = @LoginID
  ,[UserFullName] = @UserFullName
  ,[ExtnNo] = @ExtnNo
  ,[MobileNo] = @MobileNo
  ,[EMailID] = @EMailID
  ,[C_DateOfJoining] = @C_DateOfJoining
  ,[C_CompanyID] = @C_CompanyID
  ,[C_DivisionID] = @C_DivisionID
  ,[C_OfficeID] = @C_OfficeID
  ,[C_DepartmentID] = @C_DepartmentID
  ,[C_DesignationID] = @C_DesignationID
  ,[ActiveState] = @ActiveState
  ,[Contractual] = @Contractual
  ,[wp_user] = @wp_user
  ,[pw] = @pw
  WHERE
  [LoginID] = @Original_LoginID
  SET @RowCount = @@RowCount
GO
