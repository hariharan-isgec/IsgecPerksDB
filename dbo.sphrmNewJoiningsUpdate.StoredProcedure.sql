USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmNewJoiningsUpdate]
  @Salute NVarChar(50),
  @EmployeeName NVarChar(50),
  @AliasName NVarChar(50),
  @Gender NVarChar(1),
  @C_DateOfJoining DateTime,
  @J_CompanyID NVarChar(6),
  @J_DivisionID NVarChar(6),
  @J_OfficeID Int,
  @J_DepartmentID NVarChar(6),
  @J_ProjectSiteID NVarChar(6),
  @J_DesignationID Int,
  @J_BasicSalary Decimal(12,2),
  @J_StatusID NVarChar(2),
  @J_StatusRemark NVarChar(250),
  @C_JoinngStateID NVarChar(2),
  @ModifiedBy NVarChar(20),
  @ModifiedOn DateTime,
  @ModifiedEvent NVarChar(20),
  @Contractual Bit,
  @EMailID NVarChar(50),
  @ContactNumbers NVarChar(100),
  @Original_CardNo NVarChar(8), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [Salute] = @Salute
  ,[EmployeeName] = @EmployeeName
  ,[AliasName] = @AliasName
  ,[Gender] = @Gender
  ,[C_DateOfJoining] = @C_DateOfJoining
  ,[J_CompanyID] = @J_CompanyID
  ,[J_DivisionID] = @J_DivisionID
  ,[J_OfficeID] = @J_OfficeID
  ,[J_DepartmentID] = @J_DepartmentID
  ,[J_ProjectSiteID] = @J_ProjectSiteID
  ,[J_DesignationID] = @J_DesignationID
  ,[J_BasicSalary] = @J_BasicSalary
  ,[J_StatusID] = @J_StatusID
  ,[J_StatusRemark] = @J_StatusRemark
  ,[C_JoinngStateID] = @C_JoinngStateID
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedEvent] = @ModifiedEvent
  ,[Contractual] = @Contractual  
	,[EMailID] = @EmailID
	,[ContactNumbers] = @ContactNumbers
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
