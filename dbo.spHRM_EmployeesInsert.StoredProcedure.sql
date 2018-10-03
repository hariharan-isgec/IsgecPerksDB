USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spHRM_EmployeesInsert]
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
  @C_BasicSalary Decimal(12,2),
  @C_StatusID NVarChar(2),
  @C_StatusRemark NVarChar(250),
  @C_JoinngStateID NVarChar(2),
  @U_ActiveState Bit,
  @ActiveState Bit,
  @ActiveStateEventName NVarChar(20),
  @C_IncrementOn DateTime,
  @C_IncrementRemark NVarChar(250),
  @U_UnderIncrement Bit,
  @U_NewBasicSalary Decimal(12,2),
  @C_PromotionOn DateTime,
  @C_PromotionRemark NVarChar(250),
  @C_TransferedOn DateTime,
  @U_UnderPromotion Bit,
  @C_TransferRemark NVarChar(250),
  @C_RatingDoneOn DateTime,
  @U_NewDesignationID Int,
  @C_RatingPoints Decimal(8,2),
  @C_RatingID NVarChar(3),
  @C_RatingRemark NVarChar(250),
  @U_UnderTransfer Bit,
  @Resigned Bit,
  @U_CompanyID NVarChar(6),
  @C_ResignedOn DateTime,
  @C_DateOfReleaving DateTime,
  @U_DivisionID NVarChar(6),
  @U_UnderRating Bit,
  @C_ResignedRemark NVarChar(250),
  @U_NewRatingID NVarChar(3),
  @U_OfficeID Int,
  @U_DepartmentID NVarChar(6),
  @C_ConfirmedOn DateTime,
  @Confirmed Bit,
  @C_ConfirmationRemark NVarChar(250),
  @U_ProjectSiteID NVarChar(6),
  @J_CompanyID NVarChar(6),
  @J_DivisionID NVarChar(6),
  @J_OfficeID Int,
  @J_DepartmentID NVarChar(6),
  @J_ProjectSiteID NVarChar(6),
  @J_DesignationID Int,
  @J_BasicSalary Decimal(12,2),
  @J_StatusID NVarChar(2),
  @J_StatusRemark NVarChar(250),
  @WorkingAreaID Int,
  @FunctionalStatusID1 Int,
  @FunctionalStatusID2 Int,
  @FunctionalStatusID3 Int,
  @FunctionalStatusID4 Int,
  @EducationDetails NVarChar(250),
  @IncrementCompany NVarChar(6),
  @CareerStartedOn DateTime,
  @QualificationID1 Int,
  @QualificationID2 Int,
  @DateOfBirth DateTime,
  @BloodGroupID NVarChar(5),
  @FatherName NVarChar(50),
  @SpouseName NVarChar(50),
  @ContactNumbers NVarChar(100),
  @PermanentAddress NVarChar(250),
  @PermanentCity NVarChar(50),
  @CurrentAddress NVarChar(250),
  @CurrentCity NVarChar(50),
  @OfficeFileNumber NVarChar(50),
  @PFNumber NVarChar(50),
  @ESINumber NVarChar(50),
  @PAN NVarChar(20),
  @EMailID NVarChar(50),
  @Freezed Bit,
  @QualificationYear1 NVarChar(4),
  @ModifiedBy NVarChar(20),
  @ModifiedOn DateTime,
  @QualificationYear2 NVarChar(4),
  @ModifiedEvent NVarChar(20),
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
  ,[C_BasicSalary]
  ,[C_StatusID]
  ,[C_StatusRemark]
  ,[C_JoinngStateID]
  ,[U_ActiveState]
  ,[ActiveState]
  ,[ActiveStateEventName]
  ,[C_IncrementOn]
  ,[C_IncrementRemark]
  ,[U_UnderIncrement]
  ,[U_NewBasicSalary]
  ,[C_PromotionOn]
  ,[C_PromotionRemark]
  ,[C_TransferedOn]
  ,[U_UnderPromotion]
  ,[C_TransferRemark]
  ,[C_RatingDoneOn]
  ,[U_NewDesignationID]
  ,[C_RatingPoints]
  ,[C_RatingID]
  ,[C_RatingRemark]
  ,[U_UnderTransfer]
  ,[Resigned]
  ,[U_CompanyID]
  ,[C_ResignedOn]
  ,[C_DateOfReleaving]
  ,[U_DivisionID]
  ,[U_UnderRating]
  ,[C_ResignedRemark]
  ,[U_NewRatingID]
  ,[U_OfficeID]
  ,[U_DepartmentID]
  ,[C_ConfirmedOn]
  ,[Confirmed]
  ,[C_ConfirmationRemark]
  ,[U_ProjectSiteID]
  ,[J_CompanyID]
  ,[J_DivisionID]
  ,[J_OfficeID]
  ,[J_DepartmentID]
  ,[J_ProjectSiteID]
  ,[J_DesignationID]
  ,[J_BasicSalary]
  ,[J_StatusID]
  ,[J_StatusRemark]
  ,[WorkingAreaID]
  ,[FunctionalStatusID1]
  ,[FunctionalStatusID2]
  ,[FunctionalStatusID3]
  ,[FunctionalStatusID4]
  ,[EducationDetails]
  ,[IncrementCompany]
  ,[CareerStartedOn]
  ,[QualificationID1]
  ,[QualificationID2]
  ,[DateOfBirth]
  ,[BloodGroupID]
  ,[FatherName]
  ,[SpouseName]
  ,[ContactNumbers]
  ,[PermanentAddress]
  ,[PermanentCity]
  ,[CurrentAddress]
  ,[CurrentCity]
  ,[OfficeFileNumber]
  ,[PFNumber]
  ,[ESINumber]
  ,[PAN]
  ,[EMailID]
  ,[Freezed]
  ,[QualificationYear1]
  ,[ModifiedBy]
  ,[ModifiedOn]
  ,[QualificationYear2]
  ,[ModifiedEvent]
  )
  VALUES
  (
   @CardNo
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
  ,@C_BasicSalary
  ,@C_StatusID
  ,@C_StatusRemark
  ,@C_JoinngStateID
  ,@U_ActiveState
  ,@ActiveState
  ,@ActiveStateEventName
  ,@C_IncrementOn
  ,@C_IncrementRemark
  ,@U_UnderIncrement
  ,@U_NewBasicSalary
  ,@C_PromotionOn
  ,@C_PromotionRemark
  ,@C_TransferedOn
  ,@U_UnderPromotion
  ,@C_TransferRemark
  ,@C_RatingDoneOn
  ,@U_NewDesignationID
  ,@C_RatingPoints
  ,@C_RatingID
  ,@C_RatingRemark
  ,@U_UnderTransfer
  ,@Resigned
  ,@U_CompanyID
  ,@C_ResignedOn
  ,@C_DateOfReleaving
  ,@U_DivisionID
  ,@U_UnderRating
  ,@C_ResignedRemark
  ,@U_NewRatingID
  ,@U_OfficeID
  ,@U_DepartmentID
  ,@C_ConfirmedOn
  ,@Confirmed
  ,@C_ConfirmationRemark
  ,@U_ProjectSiteID
  ,@J_CompanyID
  ,@J_DivisionID
  ,@J_OfficeID
  ,@J_DepartmentID
  ,@J_ProjectSiteID
  ,@J_DesignationID
  ,@J_BasicSalary
  ,@J_StatusID
  ,@J_StatusRemark
  ,@WorkingAreaID
  ,@FunctionalStatusID1
  ,@FunctionalStatusID2
  ,@FunctionalStatusID3
  ,@FunctionalStatusID4
  ,@EducationDetails
  ,@IncrementCompany
  ,@CareerStartedOn
  ,@QualificationID1
  ,@QualificationID2
  ,@DateOfBirth
  ,@BloodGroupID
  ,@FatherName
  ,@SpouseName
  ,@ContactNumbers
  ,@PermanentAddress
  ,@PermanentCity
  ,@CurrentAddress
  ,@CurrentCity
  ,@OfficeFileNumber
  ,@PFNumber
  ,@ESINumber
  ,@PAN
  ,@EMailID
  ,@Freezed
  ,@QualificationYear1
  ,@ModifiedBy
  ,@ModifiedOn
  ,@QualificationYear2
  ,@ModifiedEvent
  )
  SET @Return_CardNo = @CardNo
GO
