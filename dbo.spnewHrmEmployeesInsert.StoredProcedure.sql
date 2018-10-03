USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnewHrmEmployeesInsert]
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
  @Return_CardNo NVarChar(8) = null OUTPUT 
  AS
  INSERT [HRM_Employees]
  (
   [CardNo]
  ,[EmployeeName]
  ,[C_DivisionID]
  ,[C_OfficeID]
  ,[C_DepartmentID]
  ,[C_DesignationID]
  ,[ActiveState]
  ,[CategoryID]
  ,[Salute]
  ,[Gender]
  ,[C_DateOfJoining]
  ,[C_ProjectSiteID]
  ,[C_BasicSalary]
  ,[C_StatusID]
  ,[Resigned]
  ,[C_ResignedOn]
  ,[C_DateOfReleaving]
  ,[C_ResignedRemark]
  ,[Confirmed]
  ,[C_ConfirmedOn]
  ,[C_ConfirmationRemark]
  ,[DateOfBirth]
  ,[FatherName]
  ,[ContactNumbers]
  ,[OfficeFileNumber]
  ,[PFNumber]
  ,[PAN]
  ,[ModifiedBy]
  ,[Freezed]
  ,[ESINumber]
  ,[VerifierID]
  ,[VerificationRequired]
  ,[C_CompanyID]
  ,[ApprovalRequired]
  ,[ModifiedOn]
  ,[EMailID]
  ,[ApproverID]
  ,[Contractual]
  ,[SiteAllowanceApprover]
  ,[TASelfApproval]
  ,[NonTechnical]
  ,[TAVerifier]
  ,[TASanctioningAuthority]
  ,[TAApprover]
  )
  VALUES
  (
   UPPER(@CardNo)
  ,@EmployeeName
  ,@C_DivisionID
  ,@C_OfficeID
  ,@C_DepartmentID
  ,@C_DesignationID
  ,@ActiveState
  ,@CategoryID
  ,@Salute
  ,@Gender
  ,@C_DateOfJoining
  ,@C_ProjectSiteID
  ,@C_BasicSalary
  ,@C_StatusID
  ,@Resigned
  ,@C_ResignedOn
  ,@C_DateOfReleaving
  ,@C_ResignedRemark
  ,@Confirmed
  ,@C_ConfirmedOn
  ,@C_ConfirmationRemark
  ,@DateOfBirth
  ,@FatherName
  ,@ContactNumbers
  ,@OfficeFileNumber
  ,@PFNumber
  ,@PAN
  ,@ModifiedBy
  ,@Freezed
  ,@ESINumber
  ,@VerifierID
  ,@VerificationRequired
  ,@C_CompanyID
  ,@ApprovalRequired
  ,@ModifiedOn
  ,@EMailID
  ,@ApproverID
  ,@Contractual
  ,@SiteAllowanceApprover
  ,@TASelfApproval
  ,@NonTechnical
  ,@TAVerifier
  ,@TASanctioningAuthority
  ,@TAApprover
  )
  SET @Return_CardNo = @CardNo
GO
