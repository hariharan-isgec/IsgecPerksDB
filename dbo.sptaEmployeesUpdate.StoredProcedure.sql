USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaEmployeesUpdate]
  @Original_CardNo NVarChar(8), 
  @CardNo NVarChar(8),
  @EmployeeName NVarChar(50),
  @C_OfficeID Int,
  @C_DepartmentID NVarChar(6),
  @C_DesignationID Int,
  @C_CompanyID NVarChar(6),
  @C_DivisionID NVarChar(6),
  @ActiveState Bit,
  @Contractual Bit,
  @EMailID NVarChar(50),
  @CategoryID Int,
  @NonTechnical Bit,
  @TAVerifier NVarChar(8),
  @TAApprover NVarChar(8),
  @TASanctioningAuthority NVarChar(8),
  @TASelfApproval Bit,
  @SiteAllowanceApprover NvarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [CardNo] = @CardNo
  ,[EmployeeName] = @EmployeeName
  ,[C_OfficeID] = @C_OfficeID
  ,[C_DepartmentID] = @C_DepartmentID
  ,[C_DesignationID] = @C_DesignationID
  ,[C_CompanyID] = @C_CompanyID
  ,[C_DivisionID] = @C_DivisionID
  ,[ActiveState] = @ActiveState
  ,[Contractual] = @Contractual
  ,[EMailID] = @EMailID
  ,[CategoryID] = @CategoryID
  ,[NonTechnical] = @NonTechnical
  ,[TAVerifier] = @TAVerifier
  ,[TAApprover] = @TAApprover
  ,[TASanctioningAuthority] = @TASanctioningAuthority
  ,[TASelfApproval] = @TASelfApproval 
  ,[SiteAllowanceApprover] = @SiteAllowanceApprover  
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
