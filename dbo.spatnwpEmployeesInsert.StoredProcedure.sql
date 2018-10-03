USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnwpEmployeesInsert]
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
  ,[C_CompanyID]
  ,[C_DivisionID]
  ,[C_OfficeID]
  ,[C_DepartmentID]
  ,[C_ProjectSiteID]
  ,[C_DesignationID]
  ,[ActiveState]
  ,[Resigned]
  ,[C_ResignedOn]
  ,[C_DateOfReleaving]
  ,[C_ResignedRemark]
  ,[DateOfBirth]
  ,[FatherName]
  ,[ContactNumbers]
  ,[PFNumber]
  ,[ESINumber]
  ,[PAN]
  ,[EMailID]
  ,[Freezed]
  ,[ModifiedBy]
  ,[ModifiedOn]
  ,[ModifiedEvent]
  ,[VerificationRequired]
  ,[VerifierID]
  ,[ApprovalRequired]
  ,[ApproverID]
  ,[Contractual]
  ,[CategoryID]
  ,[NonTechnical]
  )
  VALUES
  (
   UPPER(@CardNo)
  ,@Salute
  ,@EmployeeName
  ,@AliasName
  ,@Gender
  ,@C_DateOfJoining
  ,@C_CompanyID
  ,@C_DivisionID
  ,@C_OfficeID
  ,@C_DepartmentID
  ,@C_ProjectSiteID
  ,@C_DesignationID
  ,@ActiveState
  ,@Resigned
  ,@C_ResignedOn
  ,@C_DateOfReleaving
  ,@C_ResignedRemark
  ,@DateOfBirth
  ,@FatherName
  ,@ContactNumbers
  ,@PFNumber
  ,@ESINumber
  ,@PAN
  ,@EMailID
  ,@Freezed
  ,@ModifiedBy
  ,@ModifiedOn
  ,@ModifiedEvent
  ,@VerificationRequired
  ,@VerifierID
  ,@ApprovalRequired
  ,@ApproverID
  ,@Contractual
  ,@CategoryID
  ,@NonTechnical
  )
  SET @Return_CardNo = @CardNo
GO
