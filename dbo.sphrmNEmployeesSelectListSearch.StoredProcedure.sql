USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmNEmployeesSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (CardNo)
  SELECT [HRM_Employees].[CardNo] FROM [HRM_Employees]
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
 WHERE  [HRM_Employees].[ActiveState] = 1 AND
   ( 
         LOWER(ISNULL([HRM_Employees].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[Salute],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[AliasName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[Gender],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_DesignationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_BasicSalary], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_StatusRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_JoinngStateID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_RatingID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ActiveStateEventName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[U_NewBasicSalary], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_IncrementRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[U_NewDesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_PromotionRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[U_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[U_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[U_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[U_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[U_ProjectSiteID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_TransferRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[U_NewRatingID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_RatingPoints], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_RatingRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_ResignedRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_ConfirmationRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[J_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[J_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[J_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[J_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[J_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[J_DesignationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[J_BasicSalary], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[J_StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[J_StatusRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[WorkingAreaID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[FunctionalStatusID1], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[FunctionalStatusID2], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[FunctionalStatusID3], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[FunctionalStatusID4], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EducationDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[IncrementCompany],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[QualificationID1], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[QualificationYear1],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[QualificationID2], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[QualificationYear2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[BloodGroupID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[FatherName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[SpouseName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ContactNumbers],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[PermanentAddress],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[PermanentCity],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[CurrentAddress],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[CurrentCity],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[OfficeFileNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[PFNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ESINumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[PAN],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ModifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ModifiedEvent],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[VerifierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ApproverID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[ResponsibleAgencyID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @orderBy WHEN 'Salute' THEN [HRM_Employees].[Salute] END,
     CASE @orderBy WHEN 'Salute DESC' THEN [HRM_Employees].[Salute] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'AliasName' THEN [HRM_Employees].[AliasName] END,
     CASE @orderBy WHEN 'AliasName DESC' THEN [HRM_Employees].[AliasName] END DESC,
     CASE @orderBy WHEN 'Gender' THEN [HRM_Employees].[Gender] END,
     CASE @orderBy WHEN 'Gender DESC' THEN [HRM_Employees].[Gender] END DESC,
     CASE @orderBy WHEN 'C_DateOfJoining' THEN [HRM_Employees].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'C_DateOfJoining DESC' THEN [HRM_Employees].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'C_CompanyID' THEN [HRM_Employees].[C_CompanyID] END,
     CASE @orderBy WHEN 'C_CompanyID DESC' THEN [HRM_Employees].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'C_DivisionID' THEN [HRM_Employees].[C_DivisionID] END,
     CASE @orderBy WHEN 'C_DivisionID DESC' THEN [HRM_Employees].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'C_OfficeID' THEN [HRM_Employees].[C_OfficeID] END,
     CASE @orderBy WHEN 'C_OfficeID DESC' THEN [HRM_Employees].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'C_DepartmentID' THEN [HRM_Employees].[C_DepartmentID] END,
     CASE @orderBy WHEN 'C_DepartmentID DESC' THEN [HRM_Employees].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'C_ProjectSiteID' THEN [HRM_Employees].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'C_ProjectSiteID DESC' THEN [HRM_Employees].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'C_DesignationID' THEN [HRM_Employees].[C_DesignationID] END,
     CASE @orderBy WHEN 'C_DesignationID DESC' THEN [HRM_Employees].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'C_BasicSalary' THEN [HRM_Employees].[C_BasicSalary] END,
     CASE @orderBy WHEN 'C_BasicSalary DESC' THEN [HRM_Employees].[C_BasicSalary] END DESC,
     CASE @orderBy WHEN 'C_StatusID' THEN [HRM_Employees].[C_StatusID] END,
     CASE @orderBy WHEN 'C_StatusID DESC' THEN [HRM_Employees].[C_StatusID] END DESC,
     CASE @orderBy WHEN 'C_StatusRemark' THEN [HRM_Employees].[C_StatusRemark] END,
     CASE @orderBy WHEN 'C_StatusRemark DESC' THEN [HRM_Employees].[C_StatusRemark] END DESC,
     CASE @orderBy WHEN 'C_JoinngStateID' THEN [HRM_Employees].[C_JoinngStateID] END,
     CASE @orderBy WHEN 'C_JoinngStateID DESC' THEN [HRM_Employees].[C_JoinngStateID] END DESC,
     CASE @orderBy WHEN 'C_RatingID' THEN [HRM_Employees].[C_RatingID] END,
     CASE @orderBy WHEN 'C_RatingID DESC' THEN [HRM_Employees].[C_RatingID] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @orderBy WHEN 'ActiveStateEventName' THEN [HRM_Employees].[ActiveStateEventName] END,
     CASE @orderBy WHEN 'ActiveStateEventName DESC' THEN [HRM_Employees].[ActiveStateEventName] END DESC,
     CASE @orderBy WHEN 'U_UnderIncrement' THEN [HRM_Employees].[U_UnderIncrement] END,
     CASE @orderBy WHEN 'U_UnderIncrement DESC' THEN [HRM_Employees].[U_UnderIncrement] END DESC,
     CASE @orderBy WHEN 'U_NewBasicSalary' THEN [HRM_Employees].[U_NewBasicSalary] END,
     CASE @orderBy WHEN 'U_NewBasicSalary DESC' THEN [HRM_Employees].[U_NewBasicSalary] END DESC,
     CASE @orderBy WHEN 'C_IncrementOn' THEN [HRM_Employees].[C_IncrementOn] END,
     CASE @orderBy WHEN 'C_IncrementOn DESC' THEN [HRM_Employees].[C_IncrementOn] END DESC,
     CASE @orderBy WHEN 'C_IncrementRemark' THEN [HRM_Employees].[C_IncrementRemark] END,
     CASE @orderBy WHEN 'C_IncrementRemark DESC' THEN [HRM_Employees].[C_IncrementRemark] END DESC,
     CASE @orderBy WHEN 'U_UnderPromotion' THEN [HRM_Employees].[U_UnderPromotion] END,
     CASE @orderBy WHEN 'U_UnderPromotion DESC' THEN [HRM_Employees].[U_UnderPromotion] END DESC,
     CASE @orderBy WHEN 'U_NewDesignationID' THEN [HRM_Employees].[U_NewDesignationID] END,
     CASE @orderBy WHEN 'U_NewDesignationID DESC' THEN [HRM_Employees].[U_NewDesignationID] END DESC,
     CASE @orderBy WHEN 'C_PromotionOn' THEN [HRM_Employees].[C_PromotionOn] END,
     CASE @orderBy WHEN 'C_PromotionOn DESC' THEN [HRM_Employees].[C_PromotionOn] END DESC,
     CASE @orderBy WHEN 'C_PromotionRemark' THEN [HRM_Employees].[C_PromotionRemark] END,
     CASE @orderBy WHEN 'C_PromotionRemark DESC' THEN [HRM_Employees].[C_PromotionRemark] END DESC,
     CASE @orderBy WHEN 'U_UnderTransfer' THEN [HRM_Employees].[U_UnderTransfer] END,
     CASE @orderBy WHEN 'U_UnderTransfer DESC' THEN [HRM_Employees].[U_UnderTransfer] END DESC,
     CASE @orderBy WHEN 'U_CompanyID' THEN [HRM_Employees].[U_CompanyID] END,
     CASE @orderBy WHEN 'U_CompanyID DESC' THEN [HRM_Employees].[U_CompanyID] END DESC,
     CASE @orderBy WHEN 'U_DivisionID' THEN [HRM_Employees].[U_DivisionID] END,
     CASE @orderBy WHEN 'U_DivisionID DESC' THEN [HRM_Employees].[U_DivisionID] END DESC,
     CASE @orderBy WHEN 'U_OfficeID' THEN [HRM_Employees].[U_OfficeID] END,
     CASE @orderBy WHEN 'U_OfficeID DESC' THEN [HRM_Employees].[U_OfficeID] END DESC,
     CASE @orderBy WHEN 'U_DepartmentID' THEN [HRM_Employees].[U_DepartmentID] END,
     CASE @orderBy WHEN 'U_DepartmentID DESC' THEN [HRM_Employees].[U_DepartmentID] END DESC,
     CASE @orderBy WHEN 'U_ProjectSiteID' THEN [HRM_Employees].[U_ProjectSiteID] END,
     CASE @orderBy WHEN 'U_ProjectSiteID DESC' THEN [HRM_Employees].[U_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'U_ActiveState' THEN [HRM_Employees].[U_ActiveState] END,
     CASE @orderBy WHEN 'U_ActiveState DESC' THEN [HRM_Employees].[U_ActiveState] END DESC,
     CASE @orderBy WHEN 'C_TransferedOn' THEN [HRM_Employees].[C_TransferedOn] END,
     CASE @orderBy WHEN 'C_TransferedOn DESC' THEN [HRM_Employees].[C_TransferedOn] END DESC,
     CASE @orderBy WHEN 'C_TransferRemark' THEN [HRM_Employees].[C_TransferRemark] END,
     CASE @orderBy WHEN 'C_TransferRemark DESC' THEN [HRM_Employees].[C_TransferRemark] END DESC,
     CASE @orderBy WHEN 'U_UnderRating' THEN [HRM_Employees].[U_UnderRating] END,
     CASE @orderBy WHEN 'U_UnderRating DESC' THEN [HRM_Employees].[U_UnderRating] END DESC,
     CASE @orderBy WHEN 'U_NewRatingID' THEN [HRM_Employees].[U_NewRatingID] END,
     CASE @orderBy WHEN 'U_NewRatingID DESC' THEN [HRM_Employees].[U_NewRatingID] END DESC,
     CASE @orderBy WHEN 'C_RatingDoneOn' THEN [HRM_Employees].[C_RatingDoneOn] END,
     CASE @orderBy WHEN 'C_RatingDoneOn DESC' THEN [HRM_Employees].[C_RatingDoneOn] END DESC,
     CASE @orderBy WHEN 'C_RatingPoints' THEN [HRM_Employees].[C_RatingPoints] END,
     CASE @orderBy WHEN 'C_RatingPoints DESC' THEN [HRM_Employees].[C_RatingPoints] END DESC,
     CASE @orderBy WHEN 'C_RatingRemark' THEN [HRM_Employees].[C_RatingRemark] END,
     CASE @orderBy WHEN 'C_RatingRemark DESC' THEN [HRM_Employees].[C_RatingRemark] END DESC,
     CASE @orderBy WHEN 'Resigned' THEN [HRM_Employees].[Resigned] END,
     CASE @orderBy WHEN 'Resigned DESC' THEN [HRM_Employees].[Resigned] END DESC,
     CASE @orderBy WHEN 'C_ResignedOn' THEN [HRM_Employees].[C_ResignedOn] END,
     CASE @orderBy WHEN 'C_ResignedOn DESC' THEN [HRM_Employees].[C_ResignedOn] END DESC,
     CASE @orderBy WHEN 'C_DateOfReleaving' THEN [HRM_Employees].[C_DateOfReleaving] END,
     CASE @orderBy WHEN 'C_DateOfReleaving DESC' THEN [HRM_Employees].[C_DateOfReleaving] END DESC,
     CASE @orderBy WHEN 'C_ResignedRemark' THEN [HRM_Employees].[C_ResignedRemark] END,
     CASE @orderBy WHEN 'C_ResignedRemark DESC' THEN [HRM_Employees].[C_ResignedRemark] END DESC,
     CASE @orderBy WHEN 'Confirmed' THEN [HRM_Employees].[Confirmed] END,
     CASE @orderBy WHEN 'Confirmed DESC' THEN [HRM_Employees].[Confirmed] END DESC,
     CASE @orderBy WHEN 'C_ConfirmedOn' THEN [HRM_Employees].[C_ConfirmedOn] END,
     CASE @orderBy WHEN 'C_ConfirmedOn DESC' THEN [HRM_Employees].[C_ConfirmedOn] END DESC,
     CASE @orderBy WHEN 'C_ConfirmationRemark' THEN [HRM_Employees].[C_ConfirmationRemark] END,
     CASE @orderBy WHEN 'C_ConfirmationRemark DESC' THEN [HRM_Employees].[C_ConfirmationRemark] END DESC,
     CASE @orderBy WHEN 'J_CompanyID' THEN [HRM_Employees].[J_CompanyID] END,
     CASE @orderBy WHEN 'J_CompanyID DESC' THEN [HRM_Employees].[J_CompanyID] END DESC,
     CASE @orderBy WHEN 'J_DivisionID' THEN [HRM_Employees].[J_DivisionID] END,
     CASE @orderBy WHEN 'J_DivisionID DESC' THEN [HRM_Employees].[J_DivisionID] END DESC,
     CASE @orderBy WHEN 'J_OfficeID' THEN [HRM_Employees].[J_OfficeID] END,
     CASE @orderBy WHEN 'J_OfficeID DESC' THEN [HRM_Employees].[J_OfficeID] END DESC,
     CASE @orderBy WHEN 'J_DepartmentID' THEN [HRM_Employees].[J_DepartmentID] END,
     CASE @orderBy WHEN 'J_DepartmentID DESC' THEN [HRM_Employees].[J_DepartmentID] END DESC,
     CASE @orderBy WHEN 'J_ProjectSiteID' THEN [HRM_Employees].[J_ProjectSiteID] END,
     CASE @orderBy WHEN 'J_ProjectSiteID DESC' THEN [HRM_Employees].[J_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'J_DesignationID' THEN [HRM_Employees].[J_DesignationID] END,
     CASE @orderBy WHEN 'J_DesignationID DESC' THEN [HRM_Employees].[J_DesignationID] END DESC,
     CASE @orderBy WHEN 'J_BasicSalary' THEN [HRM_Employees].[J_BasicSalary] END,
     CASE @orderBy WHEN 'J_BasicSalary DESC' THEN [HRM_Employees].[J_BasicSalary] END DESC,
     CASE @orderBy WHEN 'J_StatusID' THEN [HRM_Employees].[J_StatusID] END,
     CASE @orderBy WHEN 'J_StatusID DESC' THEN [HRM_Employees].[J_StatusID] END DESC,
     CASE @orderBy WHEN 'J_StatusRemark' THEN [HRM_Employees].[J_StatusRemark] END,
     CASE @orderBy WHEN 'J_StatusRemark DESC' THEN [HRM_Employees].[J_StatusRemark] END DESC,
     CASE @orderBy WHEN 'WorkingAreaID' THEN [HRM_Employees].[WorkingAreaID] END,
     CASE @orderBy WHEN 'WorkingAreaID DESC' THEN [HRM_Employees].[WorkingAreaID] END DESC,
     CASE @orderBy WHEN 'FunctionalStatusID1' THEN [HRM_Employees].[FunctionalStatusID1] END,
     CASE @orderBy WHEN 'FunctionalStatusID1 DESC' THEN [HRM_Employees].[FunctionalStatusID1] END DESC,
     CASE @orderBy WHEN 'FunctionalStatusID2' THEN [HRM_Employees].[FunctionalStatusID2] END,
     CASE @orderBy WHEN 'FunctionalStatusID2 DESC' THEN [HRM_Employees].[FunctionalStatusID2] END DESC,
     CASE @orderBy WHEN 'FunctionalStatusID3' THEN [HRM_Employees].[FunctionalStatusID3] END,
     CASE @orderBy WHEN 'FunctionalStatusID3 DESC' THEN [HRM_Employees].[FunctionalStatusID3] END DESC,
     CASE @orderBy WHEN 'FunctionalStatusID4' THEN [HRM_Employees].[FunctionalStatusID4] END,
     CASE @orderBy WHEN 'FunctionalStatusID4 DESC' THEN [HRM_Employees].[FunctionalStatusID4] END DESC,
     CASE @orderBy WHEN 'EducationDetails' THEN [HRM_Employees].[EducationDetails] END,
     CASE @orderBy WHEN 'EducationDetails DESC' THEN [HRM_Employees].[EducationDetails] END DESC,
     CASE @orderBy WHEN 'IncrementCompany' THEN [HRM_Employees].[IncrementCompany] END,
     CASE @orderBy WHEN 'IncrementCompany DESC' THEN [HRM_Employees].[IncrementCompany] END DESC,
     CASE @orderBy WHEN 'CareerStartedOn' THEN [HRM_Employees].[CareerStartedOn] END,
     CASE @orderBy WHEN 'CareerStartedOn DESC' THEN [HRM_Employees].[CareerStartedOn] END DESC,
     CASE @orderBy WHEN 'QualificationID1' THEN [HRM_Employees].[QualificationID1] END,
     CASE @orderBy WHEN 'QualificationID1 DESC' THEN [HRM_Employees].[QualificationID1] END DESC,
     CASE @orderBy WHEN 'QualificationYear1' THEN [HRM_Employees].[QualificationYear1] END,
     CASE @orderBy WHEN 'QualificationYear1 DESC' THEN [HRM_Employees].[QualificationYear1] END DESC,
     CASE @orderBy WHEN 'QualificationID2' THEN [HRM_Employees].[QualificationID2] END,
     CASE @orderBy WHEN 'QualificationID2 DESC' THEN [HRM_Employees].[QualificationID2] END DESC,
     CASE @orderBy WHEN 'QualificationYear2' THEN [HRM_Employees].[QualificationYear2] END,
     CASE @orderBy WHEN 'QualificationYear2 DESC' THEN [HRM_Employees].[QualificationYear2] END DESC,
     CASE @orderBy WHEN 'DateOfBirth' THEN [HRM_Employees].[DateOfBirth] END,
     CASE @orderBy WHEN 'DateOfBirth DESC' THEN [HRM_Employees].[DateOfBirth] END DESC,
     CASE @orderBy WHEN 'BloodGroupID' THEN [HRM_Employees].[BloodGroupID] END,
     CASE @orderBy WHEN 'BloodGroupID DESC' THEN [HRM_Employees].[BloodGroupID] END DESC,
     CASE @orderBy WHEN 'FatherName' THEN [HRM_Employees].[FatherName] END,
     CASE @orderBy WHEN 'FatherName DESC' THEN [HRM_Employees].[FatherName] END DESC,
     CASE @orderBy WHEN 'SpouseName' THEN [HRM_Employees].[SpouseName] END,
     CASE @orderBy WHEN 'SpouseName DESC' THEN [HRM_Employees].[SpouseName] END DESC,
     CASE @orderBy WHEN 'ContactNumbers' THEN [HRM_Employees].[ContactNumbers] END,
     CASE @orderBy WHEN 'ContactNumbers DESC' THEN [HRM_Employees].[ContactNumbers] END DESC,
     CASE @orderBy WHEN 'PermanentAddress' THEN [HRM_Employees].[PermanentAddress] END,
     CASE @orderBy WHEN 'PermanentAddress DESC' THEN [HRM_Employees].[PermanentAddress] END DESC,
     CASE @orderBy WHEN 'PermanentCity' THEN [HRM_Employees].[PermanentCity] END,
     CASE @orderBy WHEN 'PermanentCity DESC' THEN [HRM_Employees].[PermanentCity] END DESC,
     CASE @orderBy WHEN 'CurrentAddress' THEN [HRM_Employees].[CurrentAddress] END,
     CASE @orderBy WHEN 'CurrentAddress DESC' THEN [HRM_Employees].[CurrentAddress] END DESC,
     CASE @orderBy WHEN 'CurrentCity' THEN [HRM_Employees].[CurrentCity] END,
     CASE @orderBy WHEN 'CurrentCity DESC' THEN [HRM_Employees].[CurrentCity] END DESC,
     CASE @orderBy WHEN 'OfficeFileNumber' THEN [HRM_Employees].[OfficeFileNumber] END,
     CASE @orderBy WHEN 'OfficeFileNumber DESC' THEN [HRM_Employees].[OfficeFileNumber] END DESC,
     CASE @orderBy WHEN 'PFNumber' THEN [HRM_Employees].[PFNumber] END,
     CASE @orderBy WHEN 'PFNumber DESC' THEN [HRM_Employees].[PFNumber] END DESC,
     CASE @orderBy WHEN 'ESINumber' THEN [HRM_Employees].[ESINumber] END,
     CASE @orderBy WHEN 'ESINumber DESC' THEN [HRM_Employees].[ESINumber] END DESC,
     CASE @orderBy WHEN 'PAN' THEN [HRM_Employees].[PAN] END,
     CASE @orderBy WHEN 'PAN DESC' THEN [HRM_Employees].[PAN] END DESC,
     CASE @orderBy WHEN 'EMailID' THEN [HRM_Employees].[EMailID] END,
     CASE @orderBy WHEN 'EMailID DESC' THEN [HRM_Employees].[EMailID] END DESC,
     CASE @orderBy WHEN 'Freezed' THEN [HRM_Employees].[Freezed] END,
     CASE @orderBy WHEN 'Freezed DESC' THEN [HRM_Employees].[Freezed] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [HRM_Employees].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [HRM_Employees].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [HRM_Employees].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [HRM_Employees].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'ModifiedEvent' THEN [HRM_Employees].[ModifiedEvent] END,
     CASE @orderBy WHEN 'ModifiedEvent DESC' THEN [HRM_Employees].[ModifiedEvent] END DESC,
     CASE @orderBy WHEN 'VerificationRequired' THEN [HRM_Employees].[VerificationRequired] END,
     CASE @orderBy WHEN 'VerificationRequired DESC' THEN [HRM_Employees].[VerificationRequired] END DESC,
     CASE @orderBy WHEN 'VerifierID' THEN [HRM_Employees].[VerifierID] END,
     CASE @orderBy WHEN 'VerifierID DESC' THEN [HRM_Employees].[VerifierID] END DESC,
     CASE @orderBy WHEN 'ApprovalRequired' THEN [HRM_Employees].[ApprovalRequired] END,
     CASE @orderBy WHEN 'ApprovalRequired DESC' THEN [HRM_Employees].[ApprovalRequired] END DESC,
     CASE @orderBy WHEN 'ApproverID' THEN [HRM_Employees].[ApproverID] END,
     CASE @orderBy WHEN 'ApproverID DESC' THEN [HRM_Employees].[ApproverID] END DESC,
     CASE @orderBy WHEN 'ResponsibleAgencyID' THEN [HRM_Employees].[ResponsibleAgencyID] END,
     CASE @orderBy WHEN 'ResponsibleAgencyID DESC' THEN [HRM_Employees].[ResponsibleAgencyID] END DESC,
     CASE @orderBy WHEN 'Contractual' THEN [HRM_Employees].[Contractual] END,
     CASE @orderBy WHEN 'Contractual DESC' THEN [HRM_Employees].[Contractual] END DESC,
     CASE @orderBy WHEN 'VPNMailExpireOn' THEN [HRM_Employees].[VPNMailExpireOn] END,
     CASE @orderBy WHEN 'VPNMailExpireOn DESC' THEN [HRM_Employees].[VPNMailExpireOn] END DESC,
     CASE @orderBy WHEN 'HRM_BloodGroups4_Description' THEN [HRM_BloodGroups4].[Description] END,
     CASE @orderBy WHEN 'HRM_BloodGroups4_Description DESC' THEN [HRM_BloodGroups4].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies5_Description' THEN [HRM_Companies5].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies5_Description DESC' THEN [HRM_Companies5].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies6_Description' THEN [HRM_Companies6].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies6_Description DESC' THEN [HRM_Companies6].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies7_Description' THEN [HRM_Companies7].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies7_Description DESC' THEN [HRM_Companies7].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies8_Description' THEN [HRM_Companies8].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies8_Description DESC' THEN [HRM_Companies8].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Departments9_Description' THEN [HRM_Departments9].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments9_Description DESC' THEN [HRM_Departments9].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Departments10_Description' THEN [HRM_Departments10].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments10_Description DESC' THEN [HRM_Departments10].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Departments11_Description' THEN [HRM_Departments11].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments11_Description DESC' THEN [HRM_Departments11].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations12_Description' THEN [HRM_Designations12].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations12_Description DESC' THEN [HRM_Designations12].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations13_Description' THEN [HRM_Designations13].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations13_Description DESC' THEN [HRM_Designations13].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations14_Description' THEN [HRM_Designations14].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations14_Description DESC' THEN [HRM_Designations14].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions15_Description' THEN [HRM_Divisions15].[Description] END,
     CASE @orderBy WHEN 'HRM_Divisions15_Description DESC' THEN [HRM_Divisions15].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions16_Description' THEN [HRM_Divisions16].[Description] END,
     CASE @orderBy WHEN 'HRM_Divisions16_Description DESC' THEN [HRM_Divisions16].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions17_Description' THEN [HRM_Divisions17].[Description] END,
     CASE @orderBy WHEN 'HRM_Divisions17_Description DESC' THEN [HRM_Divisions17].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus120_Description' THEN [HRM_FunctionalStatus120].[Description] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus120_Description DESC' THEN [HRM_FunctionalStatus120].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus221_Description' THEN [HRM_FunctionalStatus221].[Description] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus221_Description DESC' THEN [HRM_FunctionalStatus221].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus322_Description' THEN [HRM_FunctionalStatus322].[Description] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus322_Description DESC' THEN [HRM_FunctionalStatus322].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus423_Description' THEN [HRM_FunctionalStatus423].[Description] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus423_Description DESC' THEN [HRM_FunctionalStatus423].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_JoiningStates24_Description' THEN [HRM_JoiningStates24].[Description] END,
     CASE @orderBy WHEN 'HRM_JoiningStates24_Description DESC' THEN [HRM_JoiningStates24].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices25_Description' THEN [HRM_Offices25].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices25_Description DESC' THEN [HRM_Offices25].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices26_Description' THEN [HRM_Offices26].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices26_Description DESC' THEN [HRM_Offices26].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices27_Description' THEN [HRM_Offices27].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices27_Description DESC' THEN [HRM_Offices27].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications28_Description' THEN [HRM_Qualifications28].[Description] END,
     CASE @orderBy WHEN 'HRM_Qualifications28_Description DESC' THEN [HRM_Qualifications28].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications29_Description' THEN [HRM_Qualifications29].[Description] END,
     CASE @orderBy WHEN 'HRM_Qualifications29_Description DESC' THEN [HRM_Qualifications29].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Ratings30_Description' THEN [HRM_Ratings30].[Description] END,
     CASE @orderBy WHEN 'HRM_Ratings30_Description DESC' THEN [HRM_Ratings30].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Ratings31_Description' THEN [HRM_Ratings31].[Description] END,
     CASE @orderBy WHEN 'HRM_Ratings31_Description DESC' THEN [HRM_Ratings31].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Status32_Description' THEN [HRM_Status32].[Description] END,
     CASE @orderBy WHEN 'HRM_Status32_Description DESC' THEN [HRM_Status32].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Status33_Description' THEN [HRM_Status33].[Description] END,
     CASE @orderBy WHEN 'HRM_Status33_Description DESC' THEN [HRM_Status33].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_WorkingAreas34_Description' THEN [HRM_WorkingAreas34].[Description] END,
     CASE @orderBy WHEN 'HRM_WorkingAreas34_Description DESC' THEN [HRM_WorkingAreas34].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_ResponsibleAgency35_Description' THEN [IDM_ResponsibleAgency35].[Description] END,
     CASE @orderBy WHEN 'IDM_ResponsibleAgency35_Description DESC' THEN [IDM_ResponsibleAgency35].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Projects3_Description' THEN [IDM_Projects3].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects3_Description DESC' THEN [IDM_Projects3].[Description] END DESC 

    SET @RecordCount = @@RowCount

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
		[HRM_Employees].[Blackberry] ,  
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
    	INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
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
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
