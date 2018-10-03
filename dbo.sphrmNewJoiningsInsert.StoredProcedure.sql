USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmNewJoiningsInsert]
  @CardNo NVarChar(8),
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
  @Return_CardNo NVarChar(8) = null OUTPUT
  AS
  INSERT [HRM_Employees]
  (
   [CardNo]
  ,[Salute]
  ,[EmployeeName]
  ,[AliasName]
  ,[Gender]
  ,[C_DateOfJoining]
  ,[J_CompanyID]
  ,[J_DivisionID]
  ,[J_OfficeID]
  ,[J_DepartmentID]
  ,[J_ProjectSiteID]
  ,[J_DesignationID]
  ,[J_BasicSalary]
  ,[J_StatusID]
  ,[J_StatusRemark]
  ,[C_JoinngStateID]
  ,[ModifiedBy]
  ,[ModifiedOn]
  ,[ModifiedEvent]
  ,[Contractual]
	,[EMailID]
	,[ContactNumbers]
  )
  VALUES
  (
   @CardNo
  ,@Salute
  ,@EmployeeName
  ,@AliasName
  ,@Gender
  ,@C_DateOfJoining
  ,@J_CompanyID
  ,@J_DivisionID
  ,@J_OfficeID
  ,@J_DepartmentID
  ,@J_ProjectSiteID
  ,@J_DesignationID
  ,@J_BasicSalary
  ,@J_StatusID
  ,@J_StatusRemark
  ,@C_JoinngStateID
  ,@ModifiedBy
  ,@ModifiedOn
  ,@ModifiedEvent
  ,@Contractual
	,@EMailID
	,@ContactNumbers
  )
  SET @Return_CardNo = @CardNo
GO
