USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnwpEmployeesUpdate]
  @Original_CardNo NVarChar(8), 
  @CardNo NVarChar(8),
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
  @ActiveState Bit,
  @Resigned Bit,
  @C_ResignedOn DateTime,
  @C_DateOfReleaving DateTime,
  @C_ResignedRemark NVarChar(250),
  @DateOfBirth DateTime,
  @FatherName NVarChar(50),
  @ContactNumbers NVarChar(100),
  @PFNumber NVarChar(50),
  @ESINumber NVarChar(50),
  @PAN NVarChar(20),
  @EMailID NVarChar(50),
  @Freezed Bit,
  @ModifiedBy NVarChar(20),
  @ModifiedOn DateTime,
  @ModifiedEvent NVarChar(20),
  @VerificationRequired Bit,
  @VerifierID NVarChar(8),
  @ApprovalRequired Bit,
  @ApproverID NVarChar(8),
  @Contractual Bit,
  @CategoryID Int,
  @NonTechnical Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [CardNo] = @CardNo
  ,[Salute] = @Salute
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
  ,[ActiveState] = @ActiveState
  ,[Resigned] = @Resigned
  ,[C_ResignedOn] = @C_ResignedOn
  ,[C_DateOfReleaving] = @C_DateOfReleaving
  ,[C_ResignedRemark] = @C_ResignedRemark
  ,[DateOfBirth] = @DateOfBirth
  ,[FatherName] = @FatherName
  ,[ContactNumbers] = @ContactNumbers
  ,[PFNumber] = @PFNumber
  ,[ESINumber] = @ESINumber
  ,[PAN] = @PAN
  ,[EMailID] = @EMailID
  ,[Freezed] = @Freezed
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedEvent] = @ModifiedEvent
  ,[VerificationRequired] = @VerificationRequired
  ,[VerifierID] = @VerifierID
  ,[ApprovalRequired] = @ApprovalRequired
  ,[ApproverID] = @ApproverID
  ,[Contractual] = @Contractual
  ,[CategoryID] = @CategoryID
  ,[NonTechnical] = @NonTechnical
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
