USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmEmployeesUpdate]
  @Original_CardNo NVarChar(8), 
  @CardNo NVarChar(8),
  @EmployeeName NVarChar(50),
  @C_DateOfJoining DateTime,
  @C_OfficeID Int,
  @C_DepartmentID NVarChar(6),
  @C_DesignationID Int,
  @C_CompanyID NVarChar(6),
  @C_DivisionID NVarChar(6),
  @C_ProjectSiteID NVarChar(6),
  @ResponsibleAgencyID Int,
  @ActiveState Bit,
  @Contractual Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [CardNo] = @CardNo
  ,[EmployeeName] = @EmployeeName
  ,[C_DateOfJoining] = @C_DateOfJoining
  ,[C_OfficeID] = @C_OfficeID
  ,[C_DepartmentID] = @C_DepartmentID
  ,[C_DesignationID] = @C_DesignationID
  ,[C_CompanyID] = @C_CompanyID
  ,[C_DivisionID] = @C_DivisionID
  ,[C_ProjectSiteID] = @C_ProjectSiteID
  ,[ResponsibleAgencyID] = @ResponsibleAgencyID
  ,[ActiveState] = @ActiveState
  ,[Contractual] = @Contractual
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
