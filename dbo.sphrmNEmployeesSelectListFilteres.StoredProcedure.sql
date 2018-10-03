USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmNEmployeesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CardNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[HRM_Employees].[CardNo]'
  SET @LGSQL = @LGSQL + ' FROM [HRM_Employees] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_BloodGroups] AS [HRM_BloodGroups4]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[BloodGroupID] = [HRM_BloodGroups4].[BloodGroupID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies5]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_CompanyID] = [HRM_Companies5].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies6]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[IncrementCompany] = [HRM_Companies6].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies7]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_CompanyID] = [HRM_Companies7].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies8]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies8].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments9]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_DepartmentID] = [HRM_Departments9].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments10]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_DepartmentID] = [HRM_Departments10].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments11]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments11].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations12]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_NewDesignationID] = [HRM_Designations12].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations13]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_DesignationID] = [HRM_Designations13].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations14]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations14].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions15]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_DivisionID] = [HRM_Divisions15].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions16]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions16].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions17]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_DivisionID] = [HRM_Divisions17].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_FunctionalStatus1] AS [HRM_FunctionalStatus120]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[FunctionalStatusID1] = [HRM_FunctionalStatus120].[FunctionalStatusID1]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_FunctionalStatus2] AS [HRM_FunctionalStatus221]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[FunctionalStatusID2] = [HRM_FunctionalStatus221].[FunctionalStatusID2]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_FunctionalStatus3] AS [HRM_FunctionalStatus322]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[FunctionalStatusID3] = [HRM_FunctionalStatus322].[FunctionalStatusID3]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_FunctionalStatus4] AS [HRM_FunctionalStatus423]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[FunctionalStatusID4] = [HRM_FunctionalStatus423].[FunctionalStatusID4]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_JoiningStates] AS [HRM_JoiningStates24]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_JoinngStateID] = [HRM_JoiningStates24].[JoiningStateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices25]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices25].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices26]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_OfficeID] = [HRM_Offices26].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices27]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_OfficeID] = [HRM_Offices27].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications28]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[QualificationID1] = [HRM_Qualifications28].[QualificationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications29]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[QualificationID2] = [HRM_Qualifications29].[QualificationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Ratings] AS [HRM_Ratings30]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_RatingID] = [HRM_Ratings30].[RatingID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Ratings] AS [HRM_Ratings31]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_NewRatingID] = [HRM_Ratings31].[RatingID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status32]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_StatusID] = [HRM_Status32].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status33]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_StatusID] = [HRM_Status33].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_WorkingAreas] AS [HRM_WorkingAreas34]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[WorkingAreaID] = [HRM_WorkingAreas34].[WorkingAreaID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency35]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[ResponsibleAgencyID] = [IDM_ResponsibleAgency35].[ResponsibleAgencyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_ProjectSiteID] = [IDM_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_ProjectSiteID] = [IDM_Projects3].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE [HRM_Employees].[ActiveState] = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[HRM_Employees].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Employees].[CardNo] DESC'
                        WHEN 'Salute' THEN '[HRM_Employees].[Salute]'
                        WHEN 'Salute DESC' THEN '[HRM_Employees].[Salute] DESC'
                        WHEN 'EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[HRM_Employees].[EmployeeName] DESC'
                        WHEN 'AliasName' THEN '[HRM_Employees].[AliasName]'
                        WHEN 'AliasName DESC' THEN '[HRM_Employees].[AliasName] DESC'
                        WHEN 'Gender' THEN '[HRM_Employees].[Gender]'
                        WHEN 'Gender DESC' THEN '[HRM_Employees].[Gender] DESC'
                        WHEN 'C_DateOfJoining' THEN '[HRM_Employees].[C_DateOfJoining]'
                        WHEN 'C_DateOfJoining DESC' THEN '[HRM_Employees].[C_DateOfJoining] DESC'
                        WHEN 'C_CompanyID' THEN '[HRM_Employees].[C_CompanyID]'
                        WHEN 'C_CompanyID DESC' THEN '[HRM_Employees].[C_CompanyID] DESC'
                        WHEN 'C_DivisionID' THEN '[HRM_Employees].[C_DivisionID]'
                        WHEN 'C_DivisionID DESC' THEN '[HRM_Employees].[C_DivisionID] DESC'
                        WHEN 'C_OfficeID' THEN '[HRM_Employees].[C_OfficeID]'
                        WHEN 'C_OfficeID DESC' THEN '[HRM_Employees].[C_OfficeID] DESC'
                        WHEN 'C_DepartmentID' THEN '[HRM_Employees].[C_DepartmentID]'
                        WHEN 'C_DepartmentID DESC' THEN '[HRM_Employees].[C_DepartmentID] DESC'
                        WHEN 'C_ProjectSiteID' THEN '[HRM_Employees].[C_ProjectSiteID]'
                        WHEN 'C_ProjectSiteID DESC' THEN '[HRM_Employees].[C_ProjectSiteID] DESC'
                        WHEN 'C_DesignationID' THEN '[HRM_Employees].[C_DesignationID]'
                        WHEN 'C_DesignationID DESC' THEN '[HRM_Employees].[C_DesignationID] DESC'
                        WHEN 'C_BasicSalary' THEN '[HRM_Employees].[C_BasicSalary]'
                        WHEN 'C_BasicSalary DESC' THEN '[HRM_Employees].[C_BasicSalary] DESC'
                        WHEN 'C_StatusID' THEN '[HRM_Employees].[C_StatusID]'
                        WHEN 'C_StatusID DESC' THEN '[HRM_Employees].[C_StatusID] DESC'
                        WHEN 'C_StatusRemark' THEN '[HRM_Employees].[C_StatusRemark]'
                        WHEN 'C_StatusRemark DESC' THEN '[HRM_Employees].[C_StatusRemark] DESC'
                        WHEN 'C_JoinngStateID' THEN '[HRM_Employees].[C_JoinngStateID]'
                        WHEN 'C_JoinngStateID DESC' THEN '[HRM_Employees].[C_JoinngStateID] DESC'
                        WHEN 'C_RatingID' THEN '[HRM_Employees].[C_RatingID]'
                        WHEN 'C_RatingID DESC' THEN '[HRM_Employees].[C_RatingID] DESC'
                        WHEN 'ActiveState' THEN '[HRM_Employees].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[HRM_Employees].[ActiveState] DESC'
                        WHEN 'ActiveStateEventName' THEN '[HRM_Employees].[ActiveStateEventName]'
                        WHEN 'ActiveStateEventName DESC' THEN '[HRM_Employees].[ActiveStateEventName] DESC'
                        WHEN 'U_UnderIncrement' THEN '[HRM_Employees].[U_UnderIncrement]'
                        WHEN 'U_UnderIncrement DESC' THEN '[HRM_Employees].[U_UnderIncrement] DESC'
                        WHEN 'U_NewBasicSalary' THEN '[HRM_Employees].[U_NewBasicSalary]'
                        WHEN 'U_NewBasicSalary DESC' THEN '[HRM_Employees].[U_NewBasicSalary] DESC'
                        WHEN 'C_IncrementOn' THEN '[HRM_Employees].[C_IncrementOn]'
                        WHEN 'C_IncrementOn DESC' THEN '[HRM_Employees].[C_IncrementOn] DESC'
                        WHEN 'C_IncrementRemark' THEN '[HRM_Employees].[C_IncrementRemark]'
                        WHEN 'C_IncrementRemark DESC' THEN '[HRM_Employees].[C_IncrementRemark] DESC'
                        WHEN 'U_UnderPromotion' THEN '[HRM_Employees].[U_UnderPromotion]'
                        WHEN 'U_UnderPromotion DESC' THEN '[HRM_Employees].[U_UnderPromotion] DESC'
                        WHEN 'U_NewDesignationID' THEN '[HRM_Employees].[U_NewDesignationID]'
                        WHEN 'U_NewDesignationID DESC' THEN '[HRM_Employees].[U_NewDesignationID] DESC'
                        WHEN 'C_PromotionOn' THEN '[HRM_Employees].[C_PromotionOn]'
                        WHEN 'C_PromotionOn DESC' THEN '[HRM_Employees].[C_PromotionOn] DESC'
                        WHEN 'C_PromotionRemark' THEN '[HRM_Employees].[C_PromotionRemark]'
                        WHEN 'C_PromotionRemark DESC' THEN '[HRM_Employees].[C_PromotionRemark] DESC'
                        WHEN 'U_UnderTransfer' THEN '[HRM_Employees].[U_UnderTransfer]'
                        WHEN 'U_UnderTransfer DESC' THEN '[HRM_Employees].[U_UnderTransfer] DESC'
                        WHEN 'U_CompanyID' THEN '[HRM_Employees].[U_CompanyID]'
                        WHEN 'U_CompanyID DESC' THEN '[HRM_Employees].[U_CompanyID] DESC'
                        WHEN 'U_DivisionID' THEN '[HRM_Employees].[U_DivisionID]'
                        WHEN 'U_DivisionID DESC' THEN '[HRM_Employees].[U_DivisionID] DESC'
                        WHEN 'U_OfficeID' THEN '[HRM_Employees].[U_OfficeID]'
                        WHEN 'U_OfficeID DESC' THEN '[HRM_Employees].[U_OfficeID] DESC'
                        WHEN 'U_DepartmentID' THEN '[HRM_Employees].[U_DepartmentID]'
                        WHEN 'U_DepartmentID DESC' THEN '[HRM_Employees].[U_DepartmentID] DESC'
                        WHEN 'U_ProjectSiteID' THEN '[HRM_Employees].[U_ProjectSiteID]'
                        WHEN 'U_ProjectSiteID DESC' THEN '[HRM_Employees].[U_ProjectSiteID] DESC'
                        WHEN 'U_ActiveState' THEN '[HRM_Employees].[U_ActiveState]'
                        WHEN 'U_ActiveState DESC' THEN '[HRM_Employees].[U_ActiveState] DESC'
                        WHEN 'C_TransferedOn' THEN '[HRM_Employees].[C_TransferedOn]'
                        WHEN 'C_TransferedOn DESC' THEN '[HRM_Employees].[C_TransferedOn] DESC'
                        WHEN 'C_TransferRemark' THEN '[HRM_Employees].[C_TransferRemark]'
                        WHEN 'C_TransferRemark DESC' THEN '[HRM_Employees].[C_TransferRemark] DESC'
                        WHEN 'U_UnderRating' THEN '[HRM_Employees].[U_UnderRating]'
                        WHEN 'U_UnderRating DESC' THEN '[HRM_Employees].[U_UnderRating] DESC'
                        WHEN 'U_NewRatingID' THEN '[HRM_Employees].[U_NewRatingID]'
                        WHEN 'U_NewRatingID DESC' THEN '[HRM_Employees].[U_NewRatingID] DESC'
                        WHEN 'C_RatingDoneOn' THEN '[HRM_Employees].[C_RatingDoneOn]'
                        WHEN 'C_RatingDoneOn DESC' THEN '[HRM_Employees].[C_RatingDoneOn] DESC'
                        WHEN 'C_RatingPoints' THEN '[HRM_Employees].[C_RatingPoints]'
                        WHEN 'C_RatingPoints DESC' THEN '[HRM_Employees].[C_RatingPoints] DESC'
                        WHEN 'C_RatingRemark' THEN '[HRM_Employees].[C_RatingRemark]'
                        WHEN 'C_RatingRemark DESC' THEN '[HRM_Employees].[C_RatingRemark] DESC'
                        WHEN 'Resigned' THEN '[HRM_Employees].[Resigned]'
                        WHEN 'Resigned DESC' THEN '[HRM_Employees].[Resigned] DESC'
                        WHEN 'C_ResignedOn' THEN '[HRM_Employees].[C_ResignedOn]'
                        WHEN 'C_ResignedOn DESC' THEN '[HRM_Employees].[C_ResignedOn] DESC'
                        WHEN 'C_DateOfReleaving' THEN '[HRM_Employees].[C_DateOfReleaving]'
                        WHEN 'C_DateOfReleaving DESC' THEN '[HRM_Employees].[C_DateOfReleaving] DESC'
                        WHEN 'C_ResignedRemark' THEN '[HRM_Employees].[C_ResignedRemark]'
                        WHEN 'C_ResignedRemark DESC' THEN '[HRM_Employees].[C_ResignedRemark] DESC'
                        WHEN 'Confirmed' THEN '[HRM_Employees].[Confirmed]'
                        WHEN 'Confirmed DESC' THEN '[HRM_Employees].[Confirmed] DESC'
                        WHEN 'C_ConfirmedOn' THEN '[HRM_Employees].[C_ConfirmedOn]'
                        WHEN 'C_ConfirmedOn DESC' THEN '[HRM_Employees].[C_ConfirmedOn] DESC'
                        WHEN 'C_ConfirmationRemark' THEN '[HRM_Employees].[C_ConfirmationRemark]'
                        WHEN 'C_ConfirmationRemark DESC' THEN '[HRM_Employees].[C_ConfirmationRemark] DESC'
                        WHEN 'J_CompanyID' THEN '[HRM_Employees].[J_CompanyID]'
                        WHEN 'J_CompanyID DESC' THEN '[HRM_Employees].[J_CompanyID] DESC'
                        WHEN 'J_DivisionID' THEN '[HRM_Employees].[J_DivisionID]'
                        WHEN 'J_DivisionID DESC' THEN '[HRM_Employees].[J_DivisionID] DESC'
                        WHEN 'J_OfficeID' THEN '[HRM_Employees].[J_OfficeID]'
                        WHEN 'J_OfficeID DESC' THEN '[HRM_Employees].[J_OfficeID] DESC'
                        WHEN 'J_DepartmentID' THEN '[HRM_Employees].[J_DepartmentID]'
                        WHEN 'J_DepartmentID DESC' THEN '[HRM_Employees].[J_DepartmentID] DESC'
                        WHEN 'J_ProjectSiteID' THEN '[HRM_Employees].[J_ProjectSiteID]'
                        WHEN 'J_ProjectSiteID DESC' THEN '[HRM_Employees].[J_ProjectSiteID] DESC'
                        WHEN 'J_DesignationID' THEN '[HRM_Employees].[J_DesignationID]'
                        WHEN 'J_DesignationID DESC' THEN '[HRM_Employees].[J_DesignationID] DESC'
                        WHEN 'J_BasicSalary' THEN '[HRM_Employees].[J_BasicSalary]'
                        WHEN 'J_BasicSalary DESC' THEN '[HRM_Employees].[J_BasicSalary] DESC'
                        WHEN 'J_StatusID' THEN '[HRM_Employees].[J_StatusID]'
                        WHEN 'J_StatusID DESC' THEN '[HRM_Employees].[J_StatusID] DESC'
                        WHEN 'J_StatusRemark' THEN '[HRM_Employees].[J_StatusRemark]'
                        WHEN 'J_StatusRemark DESC' THEN '[HRM_Employees].[J_StatusRemark] DESC'
                        WHEN 'WorkingAreaID' THEN '[HRM_Employees].[WorkingAreaID]'
                        WHEN 'WorkingAreaID DESC' THEN '[HRM_Employees].[WorkingAreaID] DESC'
                        WHEN 'FunctionalStatusID1' THEN '[HRM_Employees].[FunctionalStatusID1]'
                        WHEN 'FunctionalStatusID1 DESC' THEN '[HRM_Employees].[FunctionalStatusID1] DESC'
                        WHEN 'FunctionalStatusID2' THEN '[HRM_Employees].[FunctionalStatusID2]'
                        WHEN 'FunctionalStatusID2 DESC' THEN '[HRM_Employees].[FunctionalStatusID2] DESC'
                        WHEN 'FunctionalStatusID3' THEN '[HRM_Employees].[FunctionalStatusID3]'
                        WHEN 'FunctionalStatusID3 DESC' THEN '[HRM_Employees].[FunctionalStatusID3] DESC'
                        WHEN 'FunctionalStatusID4' THEN '[HRM_Employees].[FunctionalStatusID4]'
                        WHEN 'FunctionalStatusID4 DESC' THEN '[HRM_Employees].[FunctionalStatusID4] DESC'
                        WHEN 'EducationDetails' THEN '[HRM_Employees].[EducationDetails]'
                        WHEN 'EducationDetails DESC' THEN '[HRM_Employees].[EducationDetails] DESC'
                        WHEN 'IncrementCompany' THEN '[HRM_Employees].[IncrementCompany]'
                        WHEN 'IncrementCompany DESC' THEN '[HRM_Employees].[IncrementCompany] DESC'
                        WHEN 'CareerStartedOn' THEN '[HRM_Employees].[CareerStartedOn]'
                        WHEN 'CareerStartedOn DESC' THEN '[HRM_Employees].[CareerStartedOn] DESC'
                        WHEN 'QualificationID1' THEN '[HRM_Employees].[QualificationID1]'
                        WHEN 'QualificationID1 DESC' THEN '[HRM_Employees].[QualificationID1] DESC'
                        WHEN 'QualificationYear1' THEN '[HRM_Employees].[QualificationYear1]'
                        WHEN 'QualificationYear1 DESC' THEN '[HRM_Employees].[QualificationYear1] DESC'
                        WHEN 'QualificationID2' THEN '[HRM_Employees].[QualificationID2]'
                        WHEN 'QualificationID2 DESC' THEN '[HRM_Employees].[QualificationID2] DESC'
                        WHEN 'QualificationYear2' THEN '[HRM_Employees].[QualificationYear2]'
                        WHEN 'QualificationYear2 DESC' THEN '[HRM_Employees].[QualificationYear2] DESC'
                        WHEN 'DateOfBirth' THEN '[HRM_Employees].[DateOfBirth]'
                        WHEN 'DateOfBirth DESC' THEN '[HRM_Employees].[DateOfBirth] DESC'
                        WHEN 'BloodGroupID' THEN '[HRM_Employees].[BloodGroupID]'
                        WHEN 'BloodGroupID DESC' THEN '[HRM_Employees].[BloodGroupID] DESC'
                        WHEN 'FatherName' THEN '[HRM_Employees].[FatherName]'
                        WHEN 'FatherName DESC' THEN '[HRM_Employees].[FatherName] DESC'
                        WHEN 'SpouseName' THEN '[HRM_Employees].[SpouseName]'
                        WHEN 'SpouseName DESC' THEN '[HRM_Employees].[SpouseName] DESC'
                        WHEN 'ContactNumbers' THEN '[HRM_Employees].[ContactNumbers]'
                        WHEN 'ContactNumbers DESC' THEN '[HRM_Employees].[ContactNumbers] DESC'
                        WHEN 'PermanentAddress' THEN '[HRM_Employees].[PermanentAddress]'
                        WHEN 'PermanentAddress DESC' THEN '[HRM_Employees].[PermanentAddress] DESC'
                        WHEN 'PermanentCity' THEN '[HRM_Employees].[PermanentCity]'
                        WHEN 'PermanentCity DESC' THEN '[HRM_Employees].[PermanentCity] DESC'
                        WHEN 'CurrentAddress' THEN '[HRM_Employees].[CurrentAddress]'
                        WHEN 'CurrentAddress DESC' THEN '[HRM_Employees].[CurrentAddress] DESC'
                        WHEN 'CurrentCity' THEN '[HRM_Employees].[CurrentCity]'
                        WHEN 'CurrentCity DESC' THEN '[HRM_Employees].[CurrentCity] DESC'
                        WHEN 'OfficeFileNumber' THEN '[HRM_Employees].[OfficeFileNumber]'
                        WHEN 'OfficeFileNumber DESC' THEN '[HRM_Employees].[OfficeFileNumber] DESC'
                        WHEN 'PFNumber' THEN '[HRM_Employees].[PFNumber]'
                        WHEN 'PFNumber DESC' THEN '[HRM_Employees].[PFNumber] DESC'
                        WHEN 'ESINumber' THEN '[HRM_Employees].[ESINumber]'
                        WHEN 'ESINumber DESC' THEN '[HRM_Employees].[ESINumber] DESC'
                        WHEN 'PAN' THEN '[HRM_Employees].[PAN]'
                        WHEN 'PAN DESC' THEN '[HRM_Employees].[PAN] DESC'
                        WHEN 'EMailID' THEN '[HRM_Employees].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[HRM_Employees].[EMailID] DESC'
                        WHEN 'Freezed' THEN '[HRM_Employees].[Freezed]'
                        WHEN 'Freezed DESC' THEN '[HRM_Employees].[Freezed] DESC'
                        WHEN 'ModifiedBy' THEN '[HRM_Employees].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[HRM_Employees].[ModifiedBy] DESC'
                        WHEN 'ModifiedOn' THEN '[HRM_Employees].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[HRM_Employees].[ModifiedOn] DESC'
                        WHEN 'ModifiedEvent' THEN '[HRM_Employees].[ModifiedEvent]'
                        WHEN 'ModifiedEvent DESC' THEN '[HRM_Employees].[ModifiedEvent] DESC'
                        WHEN 'VerificationRequired' THEN '[HRM_Employees].[VerificationRequired]'
                        WHEN 'VerificationRequired DESC' THEN '[HRM_Employees].[VerificationRequired] DESC'
                        WHEN 'VerifierID' THEN '[HRM_Employees].[VerifierID]'
                        WHEN 'VerifierID DESC' THEN '[HRM_Employees].[VerifierID] DESC'
                        WHEN 'ApprovalRequired' THEN '[HRM_Employees].[ApprovalRequired]'
                        WHEN 'ApprovalRequired DESC' THEN '[HRM_Employees].[ApprovalRequired] DESC'
                        WHEN 'ApproverID' THEN '[HRM_Employees].[ApproverID]'
                        WHEN 'ApproverID DESC' THEN '[HRM_Employees].[ApproverID] DESC'
                        WHEN 'ResponsibleAgencyID' THEN '[HRM_Employees].[ResponsibleAgencyID]'
                        WHEN 'ResponsibleAgencyID DESC' THEN '[HRM_Employees].[ResponsibleAgencyID] DESC'
                        WHEN 'Contractual' THEN '[HRM_Employees].[Contractual]'
                        WHEN 'Contractual DESC' THEN '[HRM_Employees].[Contractual] DESC'
                        WHEN 'VPNMailExpireOn' THEN '[HRM_Employees].[VPNMailExpireOn]'
                        WHEN 'VPNMailExpireOn DESC' THEN '[HRM_Employees].[VPNMailExpireOn] DESC'
                        WHEN 'HRM_BloodGroups4_Description' THEN '[HRM_BloodGroups].[Description]'
                        WHEN 'HRM_BloodGroups4_Description DESC' THEN '[HRM_BloodGroups4].[Description] DESC'
                        WHEN 'HRM_Companies5_Description' THEN '[HRM_Companies].[Description]'
                        WHEN 'HRM_Companies5_Description DESC' THEN '[HRM_Companies5].[Description] DESC'
                        WHEN 'HRM_Companies6_Description' THEN '[HRM_Companies].[Description]'
                        WHEN 'HRM_Companies6_Description DESC' THEN '[HRM_Companies6].[Description] DESC'
                        WHEN 'HRM_Companies7_Description' THEN '[HRM_Companies].[Description]'
                        WHEN 'HRM_Companies7_Description DESC' THEN '[HRM_Companies7].[Description] DESC'
                        WHEN 'HRM_Companies8_Description' THEN '[HRM_Companies].[Description]'
                        WHEN 'HRM_Companies8_Description DESC' THEN '[HRM_Companies8].[Description] DESC'
                        WHEN 'HRM_Departments9_Description' THEN '[HRM_Departments].[Description]'
                        WHEN 'HRM_Departments9_Description DESC' THEN '[HRM_Departments9].[Description] DESC'
                        WHEN 'HRM_Departments10_Description' THEN '[HRM_Departments].[Description]'
                        WHEN 'HRM_Departments10_Description DESC' THEN '[HRM_Departments10].[Description] DESC'
                        WHEN 'HRM_Departments11_Description' THEN '[HRM_Departments].[Description]'
                        WHEN 'HRM_Departments11_Description DESC' THEN '[HRM_Departments11].[Description] DESC'
                        WHEN 'HRM_Designations12_Description' THEN '[HRM_Designations].[Description]'
                        WHEN 'HRM_Designations12_Description DESC' THEN '[HRM_Designations12].[Description] DESC'
                        WHEN 'HRM_Designations13_Description' THEN '[HRM_Designations].[Description]'
                        WHEN 'HRM_Designations13_Description DESC' THEN '[HRM_Designations13].[Description] DESC'
                        WHEN 'HRM_Designations14_Description' THEN '[HRM_Designations].[Description]'
                        WHEN 'HRM_Designations14_Description DESC' THEN '[HRM_Designations14].[Description] DESC'
                        WHEN 'HRM_Divisions15_Description' THEN '[HRM_Divisions].[Description]'
                        WHEN 'HRM_Divisions15_Description DESC' THEN '[HRM_Divisions15].[Description] DESC'
                        WHEN 'HRM_Divisions16_Description' THEN '[HRM_Divisions].[Description]'
                        WHEN 'HRM_Divisions16_Description DESC' THEN '[HRM_Divisions16].[Description] DESC'
                        WHEN 'HRM_Divisions17_Description' THEN '[HRM_Divisions].[Description]'
                        WHEN 'HRM_Divisions17_Description DESC' THEN '[HRM_Divisions17].[Description] DESC'
                        WHEN 'HRM_FunctionalStatus120_Description' THEN '[HRM_FunctionalStatus1].[Description]'
                        WHEN 'HRM_FunctionalStatus120_Description DESC' THEN '[HRM_FunctionalStatus120].[Description] DESC'
                        WHEN 'HRM_FunctionalStatus221_Description' THEN '[HRM_FunctionalStatus2].[Description]'
                        WHEN 'HRM_FunctionalStatus221_Description DESC' THEN '[HRM_FunctionalStatus221].[Description] DESC'
                        WHEN 'HRM_FunctionalStatus322_Description' THEN '[HRM_FunctionalStatus3].[Description]'
                        WHEN 'HRM_FunctionalStatus322_Description DESC' THEN '[HRM_FunctionalStatus322].[Description] DESC'
                        WHEN 'HRM_FunctionalStatus423_Description' THEN '[HRM_FunctionalStatus4].[Description]'
                        WHEN 'HRM_FunctionalStatus423_Description DESC' THEN '[HRM_FunctionalStatus423].[Description] DESC'
                        WHEN 'HRM_JoiningStates24_Description' THEN '[HRM_JoiningStates].[Description]'
                        WHEN 'HRM_JoiningStates24_Description DESC' THEN '[HRM_JoiningStates24].[Description] DESC'
                        WHEN 'HRM_Offices25_Description' THEN '[HRM_Offices].[Description]'
                        WHEN 'HRM_Offices25_Description DESC' THEN '[HRM_Offices25].[Description] DESC'
                        WHEN 'HRM_Offices26_Description' THEN '[HRM_Offices].[Description]'
                        WHEN 'HRM_Offices26_Description DESC' THEN '[HRM_Offices26].[Description] DESC'
                        WHEN 'HRM_Offices27_Description' THEN '[HRM_Offices].[Description]'
                        WHEN 'HRM_Offices27_Description DESC' THEN '[HRM_Offices27].[Description] DESC'
                        WHEN 'HRM_Qualifications28_Description' THEN '[HRM_Qualifications].[Description]'
                        WHEN 'HRM_Qualifications28_Description DESC' THEN '[HRM_Qualifications28].[Description] DESC'
                        WHEN 'HRM_Qualifications29_Description' THEN '[HRM_Qualifications].[Description]'
                        WHEN 'HRM_Qualifications29_Description DESC' THEN '[HRM_Qualifications29].[Description] DESC'
                        WHEN 'HRM_Ratings30_Description' THEN '[HRM_Ratings].[Description]'
                        WHEN 'HRM_Ratings30_Description DESC' THEN '[HRM_Ratings30].[Description] DESC'
                        WHEN 'HRM_Ratings31_Description' THEN '[HRM_Ratings].[Description]'
                        WHEN 'HRM_Ratings31_Description DESC' THEN '[HRM_Ratings31].[Description] DESC'
                        WHEN 'HRM_Status32_Description' THEN '[HRM_Status].[Description]'
                        WHEN 'HRM_Status32_Description DESC' THEN '[HRM_Status32].[Description] DESC'
                        WHEN 'HRM_Status33_Description' THEN '[HRM_Status].[Description]'
                        WHEN 'HRM_Status33_Description DESC' THEN '[HRM_Status33].[Description] DESC'
                        WHEN 'HRM_WorkingAreas34_Description' THEN '[HRM_WorkingAreas].[Description]'
                        WHEN 'HRM_WorkingAreas34_Description DESC' THEN '[HRM_WorkingAreas34].[Description] DESC'
                        WHEN 'IDM_ResponsibleAgency35_Description' THEN '[IDM_ResponsibleAgency].[Description]'
                        WHEN 'IDM_ResponsibleAgency35_Description DESC' THEN '[IDM_ResponsibleAgency35].[Description] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        WHEN 'IDM_Projects2_Description' THEN '[IDM_Projects].[Description]'
                        WHEN 'IDM_Projects2_Description DESC' THEN '[IDM_Projects2].[Description] DESC'
                        WHEN 'IDM_Projects3_Description' THEN '[IDM_Projects].[Description]'
                        WHEN 'IDM_Projects3_Description DESC' THEN '[IDM_Projects3].[Description] DESC'
                        ELSE '[HRM_Employees].[CardNo]'
                    END
  EXEC (@LGSQL)

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
