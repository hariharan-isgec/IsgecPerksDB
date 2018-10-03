USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnewHrmEmployeesUpdate]
  @Original_CardNo NVarChar(8), 
  @CardNo NVarChar(8),
  @EmployeeName NVarChar(50),
  @C_DivisionID NVarChar(6),
  @C_OfficeID Int,
  @C_DepartmentID NVarChar(6),
  @C_DesignationID Int,
  @ActiveState Bit,
  @CategoryID Int,
  @Salute NVarChar(50),
  @Gender NVarChar(1),
  @C_DateOfJoining DateTime,
  @C_ProjectSiteID NVarChar(6),
  @C_BasicSalary Decimal(12,2),
  @C_StatusID NVarChar(2),
  @Resigned Bit,
  @C_ResignedOn DateTime,
  @C_DateOfReleaving DateTime,
  @C_ResignedRemark NVarChar(250),
  @Confirmed Bit,
  @C_ConfirmedOn DateTime,
  @C_ConfirmationRemark NVarChar(250),
  @DateOfBirth DateTime,
  @FatherName NVarChar(50),
  @ContactNumbers NVarChar(100),
  @OfficeFileNumber NVarChar(50),
  @PFNumber NVarChar(50),
  @PAN NVarChar(20),
  @ModifiedBy NVarChar(20),
  @Freezed Bit,
  @ESINumber NVarChar(50),
  @VerifierID NVarChar(8),
  @VerificationRequired Bit,
  @C_CompanyID NVarChar(6),
  @ApprovalRequired Bit,
  @ModifiedOn DateTime,
  @EMailID NVarChar(50),
  @ApproverID NVarChar(8),
  @Contractual Bit,
  @SiteAllowanceApprover NVarChar(8),
  @TASelfApproval Bit,
  @NonTechnical Bit,
  @TAVerifier NVarChar(8),
  @TASanctioningAuthority NVarChar(8),
  @TAApprover NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [CardNo] = @CardNo
  ,[EmployeeName] = @EmployeeName
  ,[C_DivisionID] = @C_DivisionID
  ,[C_OfficeID] = @C_OfficeID
  ,[C_DepartmentID] = @C_DepartmentID
  ,[C_DesignationID] = @C_DesignationID
  ,[ActiveState] = @ActiveState
  ,[CategoryID] = @CategoryID
  ,[Salute] = @Salute
  ,[Gender] = @Gender
  ,[C_DateOfJoining] = @C_DateOfJoining
  ,[C_ProjectSiteID] = @C_ProjectSiteID
  ,[C_BasicSalary] = @C_BasicSalary
  ,[C_StatusID] = @C_StatusID
  ,[Resigned] = @Resigned
  ,[C_ResignedOn] = @C_ResignedOn
  ,[C_DateOfReleaving] = @C_DateOfReleaving
  ,[C_ResignedRemark] = @C_ResignedRemark
  ,[Confirmed] = @Confirmed
  ,[C_ConfirmedOn] = @C_ConfirmedOn
  ,[C_ConfirmationRemark] = @C_ConfirmationRemark
  ,[DateOfBirth] = @DateOfBirth
  ,[FatherName] = @FatherName
  ,[ContactNumbers] = @ContactNumbers
  ,[OfficeFileNumber] = @OfficeFileNumber
  ,[PFNumber] = @PFNumber
  ,[PAN] = @PAN
  ,[ModifiedBy] = @ModifiedBy
  ,[Freezed] = @Freezed
  ,[ESINumber] = @ESINumber
  ,[VerifierID] = @VerifierID
  ,[VerificationRequired] = @VerificationRequired
  ,[C_CompanyID] = @C_CompanyID
  ,[ApprovalRequired] = @ApprovalRequired
  ,[ModifiedOn] = @ModifiedOn
  ,[EMailID] = @EMailID
  ,[ApproverID] = @ApproverID
  ,[Contractual] = @Contractual
  ,[SiteAllowanceApprover] = @SiteAllowanceApprover
  ,[TASelfApproval] = @TASelfApproval
  ,[NonTechnical] = @NonTechnical
  ,[TAVerifier] = @TAVerifier
  ,[TASanctioningAuthority] = @TASanctioningAuthority
  ,[TAApprover] = @TAApprover
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
