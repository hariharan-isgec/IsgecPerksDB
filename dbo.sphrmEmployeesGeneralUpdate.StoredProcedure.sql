USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmEmployeesGeneralUpdate]
  @Salute NVarChar(50),
  @EmployeeName NVarChar(50),
  @AliasName NVarChar(50),
  @Gender NVarChar(1),
  @C_DateOfJoining DateTime,
  @C_CompanyID NVarChar(6),
  @C_DivisionID NVarChar(6),
  @C_OfficeID Int,
  @C_DepartmentID NVarChar(6),
  @C_ProjectSiteID NVarChar(6),
  @C_DesignationID Int,
  @C_BasicSalary Decimal(12,2),
  @C_StatusID NVarChar(2),
  @Confirmed Bit,
  @C_ConfirmedOn DateTime,
  @EMailID NVarChar(50),
  @Original_CardNo NVarChar(8), 
  @Contractual Bit,
  @ContactNumbers NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [Salute] = @Salute
  ,[EmployeeName] = @EmployeeName
  ,[AliasName] = @AliasName
  ,[Gender] = @Gender
  ,[C_DateOfJoining] = @C_DateOfJoining
  ,[C_CompanyID] = @C_CompanyID
  ,[C_DivisionID] = @C_DivisionID
  ,[C_OfficeID] = @C_OfficeID
  ,[C_DepartmentID] = @C_DepartmentID
  ,[C_ProjectSiteID] = @C_ProjectSiteID
  ,[C_DesignationID] = @C_DesignationID
  ,[C_BasicSalary] = @C_BasicSalary
  ,[C_StatusID] = @C_StatusID
  ,[Confirmed] = @Confirmed
  ,[C_ConfirmedOn] = @C_ConfirmedOn
  ,[EMailID] = @EMailID
  ,[Contractual] = @Contractual   
	,[ContactNumbers] = @ContactNumbers 
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
