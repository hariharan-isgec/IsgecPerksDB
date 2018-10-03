USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmNEmployeesSelectByID]
  @CardNo NVarChar(8) 
  AS
  SELECT
		[HRM_Employees].[CardNo] ,
		[HRM_Employees].[Salute] ,
		[HRM_Employees].[EmployeeName] ,
		[HRM_Employees].[AliasName] ,
		[HRM_Employees].[Gender] ,
		[HRM_Employees].[C_DateOfJoining] ,
		[HRM_Employees].[C_CompanyID] ,
		[HRM_Employees].[C_DivisionID] ,
		[HRM_Employees].[C_OfficeID] ,
		[HRM_Employees].[C_DepartmentID] ,
		[HRM_Employees].[C_ProjectSiteID] ,
		[HRM_Employees].[C_DesignationID] ,
		[HRM_Employees].[C_BasicSalary] ,
		[HRM_Employees].[C_StatusID] ,
		[HRM_Employees].[C_StatusRemark] ,
		[HRM_Employees].[C_JoinngStateID] ,
		[HRM_Employees].[C_RatingID] ,
		[HRM_Employees].[ActiveState] ,
		[HRM_Employees].[ActiveStateEventName] ,
		[HRM_Employees].[U_UnderIncrement] ,
		[HRM_Employees].[U_NewBasicSalary] ,
		[HRM_Employees].[C_IncrementOn] ,
		[HRM_Employees].[C_IncrementRemark] ,
		[HRM_Employees].[U_UnderPromotion] ,
		[HRM_Employees].[U_NewDesignationID] ,
		[HRM_Employees].[C_PromotionOn] ,
		[HRM_Employees].[C_PromotionRemark] ,
		[HRM_Employees].[U_UnderTransfer] ,
		[HRM_Employees].[U_CompanyID] ,
		[HRM_Employees].[U_DivisionID] ,
		[HRM_Employees].[U_OfficeID] ,
		[HRM_Employees].[U_DepartmentID] ,
		[HRM_Employees].[U_ProjectSiteID] ,
		[HRM_Employees].[U_ActiveState] ,
		[HRM_Employees].[C_TransferedOn] ,
		[HRM_Employees].[C_TransferRemark] ,
		[HRM_Employees].[U_UnderRating] ,
		[HRM_Employees].[U_NewRatingID] ,
		[HRM_Employees].[C_RatingDoneOn] ,
		[HRM_Employees].[C_RatingPoints] ,
		[HRM_Employees].[C_RatingRemark] ,
		[HRM_Employees].[Resigned] ,
		[HRM_Employees].[C_ResignedOn] ,
		[HRM_Employees].[C_DateOfReleaving] ,
		[HRM_Employees].[C_ResignedRemark] ,
		[HRM_Employees].[Confirmed] ,
		[HRM_Employees].[C_ConfirmedOn] ,
		[HRM_Employees].[C_ConfirmationRemark] ,
		[HRM_Employees].[J_CompanyID] ,
		[HRM_Employees].[J_DivisionID] ,
		[HRM_Employees].[J_OfficeID] ,
		[HRM_Employees].[J_DepartmentID] ,
		[HRM_Employees].[J_ProjectSiteID] ,
		[HRM_Employees].[J_DesignationID] ,
		[HRM_Employees].[J_BasicSalary] ,
		[HRM_Employees].[J_StatusID] ,
		[HRM_Employees].[J_StatusRemark] ,
		[HRM_Employees].[WorkingAreaID] ,
		[HRM_Employees].[FunctionalStatusID1] ,
		[HRM_Employees].[FunctionalStatusID2] ,
		[HRM_Employees].[FunctionalStatusID3] ,
		[HRM_Employees].[FunctionalStatusID4] ,
		[HRM_Employees].[EducationDetails] ,
		[HRM_Employees].[IncrementCompany] ,
		[HRM_Employees].[CareerStartedOn] ,
		[HRM_Employees].[QualificationID1] ,
		[HRM_Employees].[QualificationYear1] ,
		[HRM_Employees].[QualificationID2] ,
		[HRM_Employees].[QualificationYear2] ,
		[HRM_Employees].[DateOfBirth] ,
		[HRM_Employees].[BloodGroupID] ,
		[HRM_Employees].[FatherName] ,
		[HRM_Employees].[SpouseName] ,
		[HRM_Employees].[ContactNumbers] ,
		[HRM_Employees].[PermanentAddress] ,
		[HRM_Employees].[PermanentCity] ,
		[HRM_Employees].[CurrentAddress] ,
		[HRM_Employees].[CurrentCity] ,
		[HRM_Employees].[OfficeFileNumber] ,
		[HRM_Employees].[PFNumber] ,
		[HRM_Employees].[ESINumber] ,
		[HRM_Employees].[PAN] ,
		[HRM_Employees].[EMailID] ,
		[HRM_Employees].[Freezed] ,
		[HRM_Employees].[ModifiedBy] ,
		[HRM_Employees].[ModifiedOn] ,
		[HRM_Employees].[ModifiedEvent] ,
		[HRM_Employees].[VerificationRequired] ,
		[HRM_Employees].[VerifierID] ,
		[HRM_Employees].[ApprovalRequired] ,
		[HRM_Employees].[ApproverID] ,
		[HRM_Employees].[ResponsibleAgencyID] ,
		[HRM_Employees].[Contractual] ,
		[HRM_Employees].[VPNMailExpireOn] ,
		[HRM_Employees].[Blackberry],  
		[HRM_BloodGroups4].[Description] AS HRM_BloodGroups4_Description,
		[HRM_Companies5].[Description] AS HRM_Companies5_Description,
		[HRM_Companies6].[Description] AS HRM_Companies6_Description,
		[HRM_Companies7].[Description] AS HRM_Companies7_Description,
		[HRM_Companies8].[Description] AS HRM_Companies8_Description,
		[HRM_Departments9].[Description] AS HRM_Departments9_Description,
		[HRM_Departments10].[Description] AS HRM_Departments10_Description,
		[HRM_Departments11].[Description] AS HRM_Departments11_Description,
		[HRM_Designations12].[Description] AS HRM_Designations12_Description,
		[HRM_Designations13].[Description] AS HRM_Designations13_Description,
		[HRM_Designations14].[Description] AS HRM_Designations14_Description,
		[HRM_Divisions15].[Description] AS HRM_Divisions15_Description,
		[HRM_Divisions16].[Description] AS HRM_Divisions16_Description,
		[HRM_Divisions17].[Description] AS HRM_Divisions17_Description,
		[HRM_FunctionalStatus120].[Description] AS HRM_FunctionalStatus120_Description,
		[HRM_FunctionalStatus221].[Description] AS HRM_FunctionalStatus221_Description,
		[HRM_FunctionalStatus322].[Description] AS HRM_FunctionalStatus322_Description,
		[HRM_FunctionalStatus423].[Description] AS HRM_FunctionalStatus423_Description,
		[HRM_JoiningStates24].[Description] AS HRM_JoiningStates24_Description,
		[HRM_Offices25].[Description] AS HRM_Offices25_Description,
		[HRM_Offices26].[Description] AS HRM_Offices26_Description,
		[HRM_Offices27].[Description] AS HRM_Offices27_Description,
		[HRM_Qualifications28].[Description] AS HRM_Qualifications28_Description,
		[HRM_Qualifications29].[Description] AS HRM_Qualifications29_Description,
		[HRM_Ratings30].[Description] AS HRM_Ratings30_Description,
		[HRM_Ratings31].[Description] AS HRM_Ratings31_Description,
		[HRM_Status32].[Description] AS HRM_Status32_Description,
		[HRM_Status33].[Description] AS HRM_Status33_Description,
		[HRM_WorkingAreas34].[Description] AS HRM_WorkingAreas34_Description,
		[IDM_ResponsibleAgency35].[Description] AS IDM_ResponsibleAgency35_Description,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description,
		[IDM_Projects3].[Description] AS IDM_Projects3_Description 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_BloodGroups] AS [HRM_BloodGroups4]
    ON [HRM_Employees].[BloodGroupID] = [HRM_BloodGroups4].[BloodGroupID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies5]
    ON [HRM_Employees].[U_CompanyID] = [HRM_Companies5].[CompanyID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies6]
    ON [HRM_Employees].[IncrementCompany] = [HRM_Companies6].[CompanyID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies7]
    ON [HRM_Employees].[J_CompanyID] = [HRM_Companies7].[CompanyID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies8]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies8].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments9]
    ON [HRM_Employees].[U_DepartmentID] = [HRM_Departments9].[DepartmentID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments10]
    ON [HRM_Employees].[J_DepartmentID] = [HRM_Departments10].[DepartmentID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments11]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments11].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations12]
    ON [HRM_Employees].[U_NewDesignationID] = [HRM_Designations12].[DesignationID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations13]
    ON [HRM_Employees].[J_DesignationID] = [HRM_Designations13].[DesignationID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations14]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations14].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions15]
    ON [HRM_Employees].[J_DivisionID] = [HRM_Divisions15].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions16]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions16].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions17]
    ON [HRM_Employees].[U_DivisionID] = [HRM_Divisions17].[DivisionID]
  LEFT OUTER JOIN [HRM_FunctionalStatus1] AS [HRM_FunctionalStatus120]
    ON [HRM_Employees].[FunctionalStatusID1] = [HRM_FunctionalStatus120].[FunctionalStatusID1]
  LEFT OUTER JOIN [HRM_FunctionalStatus2] AS [HRM_FunctionalStatus221]
    ON [HRM_Employees].[FunctionalStatusID2] = [HRM_FunctionalStatus221].[FunctionalStatusID2]
  LEFT OUTER JOIN [HRM_FunctionalStatus3] AS [HRM_FunctionalStatus322]
    ON [HRM_Employees].[FunctionalStatusID3] = [HRM_FunctionalStatus322].[FunctionalStatusID3]
  LEFT OUTER JOIN [HRM_FunctionalStatus4] AS [HRM_FunctionalStatus423]
    ON [HRM_Employees].[FunctionalStatusID4] = [HRM_FunctionalStatus423].[FunctionalStatusID4]
  LEFT OUTER JOIN [HRM_JoiningStates] AS [HRM_JoiningStates24]
    ON [HRM_Employees].[C_JoinngStateID] = [HRM_JoiningStates24].[JoiningStateID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices25]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices25].[OfficeID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices26]
    ON [HRM_Employees].[J_OfficeID] = [HRM_Offices26].[OfficeID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices27]
    ON [HRM_Employees].[U_OfficeID] = [HRM_Offices27].[OfficeID]
  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications28]
    ON [HRM_Employees].[QualificationID1] = [HRM_Qualifications28].[QualificationID]
  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications29]
    ON [HRM_Employees].[QualificationID2] = [HRM_Qualifications29].[QualificationID]
  LEFT OUTER JOIN [HRM_Ratings] AS [HRM_Ratings30]
    ON [HRM_Employees].[C_RatingID] = [HRM_Ratings30].[RatingID]
  LEFT OUTER JOIN [HRM_Ratings] AS [HRM_Ratings31]
    ON [HRM_Employees].[U_NewRatingID] = [HRM_Ratings31].[RatingID]
  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status32]
    ON [HRM_Employees].[J_StatusID] = [HRM_Status32].[StatusID]
  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status33]
    ON [HRM_Employees].[C_StatusID] = [HRM_Status33].[StatusID]
  LEFT OUTER JOIN [HRM_WorkingAreas] AS [HRM_WorkingAreas34]
    ON [HRM_Employees].[WorkingAreaID] = [HRM_WorkingAreas34].[WorkingAreaID]
  LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency35]
    ON [HRM_Employees].[ResponsibleAgencyID] = [IDM_ResponsibleAgency35].[ResponsibleAgencyID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [HRM_Employees].[J_ProjectSiteID] = [IDM_Projects2].[ProjectID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects3]
    ON [HRM_Employees].[U_ProjectSiteID] = [IDM_Projects3].[ProjectID]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
