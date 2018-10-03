USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmCurrentProfileUpdate]
  @EmployeeName NVarChar(50),
  @C_DateOfJoining DateTime,
  @C_CompanyID NVarChar(6),
  @C_DivisionID NVarChar(6),
  @C_OfficeID Int,
  @C_DepartmentID NVarChar(6),
  @C_ProjectSiteID NVarChar(6),
  @C_DesignationID Int,
  @C_BasicSalary Decimal(12,2),
  @C_StatusID NVarChar(2),
  @C_StatusRemark NVarChar(250),
  @ActiveState Bit,
  @ActiveStateEventName NVarChar(20),
  @Original_CardNo NVarChar(8), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [EmployeeName] = @EmployeeName
  ,[C_DateOfJoining] = @C_DateOfJoining
  ,[C_CompanyID] = @C_CompanyID
  ,[C_DivisionID] = @C_DivisionID
  ,[C_OfficeID] = @C_OfficeID
  ,[C_DepartmentID] = @C_DepartmentID
  ,[C_ProjectSiteID] = @C_ProjectSiteID
  ,[C_DesignationID] = @C_DesignationID
  ,[C_BasicSalary] = @C_BasicSalary
  ,[C_StatusID] = @C_StatusID
  ,[C_StatusRemark] = @C_StatusRemark
  ,[ActiveState] = @ActiveState
  ,[ActiveStateEventName] = @ActiveStateEventName
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
