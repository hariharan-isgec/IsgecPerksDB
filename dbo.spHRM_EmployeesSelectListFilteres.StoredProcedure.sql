USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spHRM_EmployeesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (CardNo) ' + 
               'SELECT [HRM_Employees].[CardNo] FROM [HRM_Employees] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies1].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions2].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices3].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments4]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments4].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects5]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_ProjectSiteID] = [DCM_Projects5].[ProjectCode]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Designations] AS [HRM_Designations6]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations6].[DesignationID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Status] AS [HRM_Status7]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_StatusID] = [HRM_Status7].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_JoiningStates] AS [HRM_JoiningStates8]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_JoinngStateID] = [HRM_JoiningStates8].[JoiningStateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations9]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_NewDesignationID] = [HRM_Designations9].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Ratings] AS [HRM_Ratings10]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_RatingID] = [HRM_Ratings10].[RatingID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies11]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_CompanyID] = [HRM_Companies11].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions12]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_DivisionID] = [HRM_Divisions12].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Ratings] AS [HRM_Ratings14]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_NewRatingID] = [HRM_Ratings14].[RatingID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices13]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_OfficeID] = [HRM_Offices13].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments15]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_DepartmentID] = [HRM_Departments15].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects16]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_ProjectSiteID] = [DCM_Projects16].[ProjectCode]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies17]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_CompanyID] = [HRM_Companies17].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions18]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_DivisionID] = [HRM_Divisions18].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices19]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_OfficeID] = [HRM_Offices19].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments20]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_DepartmentID] = [HRM_Departments20].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects21]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_ProjectSiteID] = [DCM_Projects21].[ProjectCode]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations22]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_DesignationID] = [HRM_Designations22].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status23]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[J_StatusID] = [HRM_Status23].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_WorkingAreas] AS [HRM_WorkingAreas24]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[WorkingAreaID] = [HRM_WorkingAreas24].[WorkingAreaID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_FunctionalStatus1] AS [HRM_FunctionalStatus125]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[FunctionalStatusID1] = [HRM_FunctionalStatus125].[FunctionalStatusID1]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_FunctionalStatus2] AS [HRM_FunctionalStatus226]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[FunctionalStatusID2] = [HRM_FunctionalStatus226].[FunctionalStatusID2]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_FunctionalStatus3] AS [HRM_FunctionalStatus327]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[FunctionalStatusID3] = [HRM_FunctionalStatus327].[FunctionalStatusID3]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_FunctionalStatus4] AS [HRM_FunctionalStatus428]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[FunctionalStatusID4] = [HRM_FunctionalStatus428].[FunctionalStatusID4]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies29]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[IncrementCompany] = [HRM_Companies29].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications30]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[QualificationID1] = [HRM_Qualifications30].[QualificationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications31]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[QualificationID2] = [HRM_Qualifications31].[QualificationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_BloodGroups] AS [HRM_BloodGroups32]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[BloodGroupID] = [HRM_BloodGroups32].[BloodGroupID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users33]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users33].[UserName]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
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
                        WHEN 'U_ActiveState' THEN '[HRM_Employees].[U_ActiveState]'
                        WHEN 'U_ActiveState DESC' THEN '[HRM_Employees].[U_ActiveState] DESC'
                        WHEN 'ActiveState' THEN '[HRM_Employees].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[HRM_Employees].[ActiveState] DESC'
                        WHEN 'ActiveStateEventName' THEN '[HRM_Employees].[ActiveStateEventName]'
                        WHEN 'ActiveStateEventName DESC' THEN '[HRM_Employees].[ActiveStateEventName] DESC'
                        WHEN 'C_IncrementOn' THEN '[HRM_Employees].[C_IncrementOn]'
                        WHEN 'C_IncrementOn DESC' THEN '[HRM_Employees].[C_IncrementOn] DESC'
                        WHEN 'C_IncrementRemark' THEN '[HRM_Employees].[C_IncrementRemark]'
                        WHEN 'C_IncrementRemark DESC' THEN '[HRM_Employees].[C_IncrementRemark] DESC'
                        WHEN 'U_UnderIncrement' THEN '[HRM_Employees].[U_UnderIncrement]'
                        WHEN 'U_UnderIncrement DESC' THEN '[HRM_Employees].[U_UnderIncrement] DESC'
                        WHEN 'U_NewBasicSalary' THEN '[HRM_Employees].[U_NewBasicSalary]'
                        WHEN 'U_NewBasicSalary DESC' THEN '[HRM_Employees].[U_NewBasicSalary] DESC'
                        WHEN 'C_PromotionOn' THEN '[HRM_Employees].[C_PromotionOn]'
                        WHEN 'C_PromotionOn DESC' THEN '[HRM_Employees].[C_PromotionOn] DESC'
                        WHEN 'C_PromotionRemark' THEN '[HRM_Employees].[C_PromotionRemark]'
                        WHEN 'C_PromotionRemark DESC' THEN '[HRM_Employees].[C_PromotionRemark] DESC'
                        WHEN 'C_TransferedOn' THEN '[HRM_Employees].[C_TransferedOn]'
                        WHEN 'C_TransferedOn DESC' THEN '[HRM_Employees].[C_TransferedOn] DESC'
                        WHEN 'U_UnderPromotion' THEN '[HRM_Employees].[U_UnderPromotion]'
                        WHEN 'U_UnderPromotion DESC' THEN '[HRM_Employees].[U_UnderPromotion] DESC'
                        WHEN 'C_TransferRemark' THEN '[HRM_Employees].[C_TransferRemark]'
                        WHEN 'C_TransferRemark DESC' THEN '[HRM_Employees].[C_TransferRemark] DESC'
                        WHEN 'C_RatingDoneOn' THEN '[HRM_Employees].[C_RatingDoneOn]'
                        WHEN 'C_RatingDoneOn DESC' THEN '[HRM_Employees].[C_RatingDoneOn] DESC'
                        WHEN 'U_NewDesignationID' THEN '[HRM_Employees].[U_NewDesignationID]'
                        WHEN 'U_NewDesignationID DESC' THEN '[HRM_Employees].[U_NewDesignationID] DESC'
                        WHEN 'C_RatingPoints' THEN '[HRM_Employees].[C_RatingPoints]'
                        WHEN 'C_RatingPoints DESC' THEN '[HRM_Employees].[C_RatingPoints] DESC'
                        WHEN 'C_RatingID' THEN '[HRM_Employees].[C_RatingID]'
                        WHEN 'C_RatingID DESC' THEN '[HRM_Employees].[C_RatingID] DESC'
                        WHEN 'C_RatingRemark' THEN '[HRM_Employees].[C_RatingRemark]'
                        WHEN 'C_RatingRemark DESC' THEN '[HRM_Employees].[C_RatingRemark] DESC'
                        WHEN 'U_UnderTransfer' THEN '[HRM_Employees].[U_UnderTransfer]'
                        WHEN 'U_UnderTransfer DESC' THEN '[HRM_Employees].[U_UnderTransfer] DESC'
                        WHEN 'Resigned' THEN '[HRM_Employees].[Resigned]'
                        WHEN 'Resigned DESC' THEN '[HRM_Employees].[Resigned] DESC'
                        WHEN 'U_CompanyID' THEN '[HRM_Employees].[U_CompanyID]'
                        WHEN 'U_CompanyID DESC' THEN '[HRM_Employees].[U_CompanyID] DESC'
                        WHEN 'C_ResignedOn' THEN '[HRM_Employees].[C_ResignedOn]'
                        WHEN 'C_ResignedOn DESC' THEN '[HRM_Employees].[C_ResignedOn] DESC'
                        WHEN 'C_DateOfReleaving' THEN '[HRM_Employees].[C_DateOfReleaving]'
                        WHEN 'C_DateOfReleaving DESC' THEN '[HRM_Employees].[C_DateOfReleaving] DESC'
                        WHEN 'U_DivisionID' THEN '[HRM_Employees].[U_DivisionID]'
                        WHEN 'U_DivisionID DESC' THEN '[HRM_Employees].[U_DivisionID] DESC'
                        WHEN 'U_UnderRating' THEN '[HRM_Employees].[U_UnderRating]'
                        WHEN 'U_UnderRating DESC' THEN '[HRM_Employees].[U_UnderRating] DESC'
                        WHEN 'C_ResignedRemark' THEN '[HRM_Employees].[C_ResignedRemark]'
                        WHEN 'C_ResignedRemark DESC' THEN '[HRM_Employees].[C_ResignedRemark] DESC'
                        WHEN 'U_NewRatingID' THEN '[HRM_Employees].[U_NewRatingID]'
                        WHEN 'U_NewRatingID DESC' THEN '[HRM_Employees].[U_NewRatingID] DESC'
                        WHEN 'U_OfficeID' THEN '[HRM_Employees].[U_OfficeID]'
                        WHEN 'U_OfficeID DESC' THEN '[HRM_Employees].[U_OfficeID] DESC'
                        WHEN 'U_DepartmentID' THEN '[HRM_Employees].[U_DepartmentID]'
                        WHEN 'U_DepartmentID DESC' THEN '[HRM_Employees].[U_DepartmentID] DESC'
                        WHEN 'C_ConfirmedOn' THEN '[HRM_Employees].[C_ConfirmedOn]'
                        WHEN 'C_ConfirmedOn DESC' THEN '[HRM_Employees].[C_ConfirmedOn] DESC'
                        WHEN 'Confirmed' THEN '[HRM_Employees].[Confirmed]'
                        WHEN 'Confirmed DESC' THEN '[HRM_Employees].[Confirmed] DESC'
                        WHEN 'C_ConfirmationRemark' THEN '[HRM_Employees].[C_ConfirmationRemark]'
                        WHEN 'C_ConfirmationRemark DESC' THEN '[HRM_Employees].[C_ConfirmationRemark] DESC'
                        WHEN 'U_ProjectSiteID' THEN '[HRM_Employees].[U_ProjectSiteID]'
                        WHEN 'U_ProjectSiteID DESC' THEN '[HRM_Employees].[U_ProjectSiteID] DESC'
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
                        WHEN 'QualificationID2' THEN '[HRM_Employees].[QualificationID2]'
                        WHEN 'QualificationID2 DESC' THEN '[HRM_Employees].[QualificationID2] DESC'
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
                        WHEN 'QualificationYear1' THEN '[HRM_Employees].[QualificationYear1]'
                        WHEN 'QualificationYear1 DESC' THEN '[HRM_Employees].[QualificationYear1] DESC'
                        WHEN 'ModifiedBy' THEN '[HRM_Employees].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[HRM_Employees].[ModifiedBy] DESC'
                        WHEN 'ModifiedOn' THEN '[HRM_Employees].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[HRM_Employees].[ModifiedOn] DESC'
                        WHEN 'QualificationYear2' THEN '[HRM_Employees].[QualificationYear2]'
                        WHEN 'QualificationYear2 DESC' THEN '[HRM_Employees].[QualificationYear2] DESC'
                        WHEN 'ModifiedEvent' THEN '[HRM_Employees].[ModifiedEvent]'
                        WHEN 'ModifiedEvent DESC' THEN '[HRM_Employees].[ModifiedEvent] DESC'
                        WHEN 'HRM_Companies1_CompanyID' THEN '[HRM_Companies1].[CompanyID]'
                        WHEN 'HRM_Companies1_CompanyID DESC' THEN '[HRM_Companies1].[CompanyID] DESC'
                        WHEN 'HRM_Companies1_Description' THEN '[HRM_Companies1].[Description]'
                        WHEN 'HRM_Companies1_Description DESC' THEN '[HRM_Companies1].[Description] DESC'
                        WHEN 'HRM_Companies1_ShortName' THEN '[HRM_Companies1].[ShortName]'
                        WHEN 'HRM_Companies1_ShortName DESC' THEN '[HRM_Companies1].[ShortName] DESC'
                        WHEN 'HRM_Companies1_BaaNID' THEN '[HRM_Companies1].[BaaNID]'
                        WHEN 'HRM_Companies1_BaaNID DESC' THEN '[HRM_Companies1].[BaaNID] DESC'
                        WHEN 'HRM_Divisions2_DivisionID' THEN '[HRM_Divisions2].[DivisionID]'
                        WHEN 'HRM_Divisions2_DivisionID DESC' THEN '[HRM_Divisions2].[DivisionID] DESC'
                        WHEN 'HRM_Divisions2_Description' THEN '[HRM_Divisions2].[Description]'
                        WHEN 'HRM_Divisions2_Description DESC' THEN '[HRM_Divisions2].[Description] DESC'
                        WHEN 'HRM_Offices3_OfficeID' THEN '[HRM_Offices3].[OfficeID]'
                        WHEN 'HRM_Offices3_OfficeID DESC' THEN '[HRM_Offices3].[OfficeID] DESC'
                        WHEN 'HRM_Offices3_Description' THEN '[HRM_Offices3].[Description]'
                        WHEN 'HRM_Offices3_Description DESC' THEN '[HRM_Offices3].[Description] DESC'
                        WHEN 'HRM_Offices3_Address' THEN '[HRM_Offices3].[Address]'
                        WHEN 'HRM_Offices3_Address DESC' THEN '[HRM_Offices3].[Address] DESC'
                        WHEN 'HRM_Offices3_City' THEN '[HRM_Offices3].[City]'
                        WHEN 'HRM_Offices3_City DESC' THEN '[HRM_Offices3].[City] DESC'
                        WHEN 'HRM_Departments4_DepartmentID' THEN '[HRM_Departments4].[DepartmentID]'
                        WHEN 'HRM_Departments4_DepartmentID DESC' THEN '[HRM_Departments4].[DepartmentID] DESC'
                        WHEN 'HRM_Departments4_Description' THEN '[HRM_Departments4].[Description]'
                        WHEN 'HRM_Departments4_Description DESC' THEN '[HRM_Departments4].[Description] DESC'
                        WHEN 'DCM_Projects5_ProjectCode' THEN '[DCM_Projects5].[ProjectCode]'
                        WHEN 'DCM_Projects5_ProjectCode DESC' THEN '[DCM_Projects5].[ProjectCode] DESC'
                        WHEN 'DCM_Projects5_Description' THEN '[DCM_Projects5].[Description]'
                        WHEN 'DCM_Projects5_Description DESC' THEN '[DCM_Projects5].[Description] DESC'
                        WHEN 'HRM_Designations6_DesignationID' THEN '[HRM_Designations6].[DesignationID]'
                        WHEN 'HRM_Designations6_DesignationID DESC' THEN '[HRM_Designations6].[DesignationID] DESC'
                        WHEN 'HRM_Designations6_Description' THEN '[HRM_Designations6].[Description]'
                        WHEN 'HRM_Designations6_Description DESC' THEN '[HRM_Designations6].[Description] DESC'
                        WHEN 'HRM_Designations6_ShortName' THEN '[HRM_Designations6].[ShortName]'
                        WHEN 'HRM_Designations6_ShortName DESC' THEN '[HRM_Designations6].[ShortName] DESC'
                        WHEN 'HRM_Designations6_Sequence' THEN '[HRM_Designations6].[Sequence]'
                        WHEN 'HRM_Designations6_Sequence DESC' THEN '[HRM_Designations6].[Sequence] DESC'
                        WHEN 'HRM_Status7_StatusID' THEN '[HRM_Status7].[StatusID]'
                        WHEN 'HRM_Status7_StatusID DESC' THEN '[HRM_Status7].[StatusID] DESC'
                        WHEN 'HRM_Status7_Description' THEN '[HRM_Status7].[Description]'
                        WHEN 'HRM_Status7_Description DESC' THEN '[HRM_Status7].[Description] DESC'
                        WHEN 'HRM_Status7_Sequence' THEN '[HRM_Status7].[Sequence]'
                        WHEN 'HRM_Status7_Sequence DESC' THEN '[HRM_Status7].[Sequence] DESC'
                        WHEN 'HRM_JoiningStates8_JoiningStateID' THEN '[HRM_JoiningStates8].[JoiningStateID]'
                        WHEN 'HRM_JoiningStates8_JoiningStateID DESC' THEN '[HRM_JoiningStates8].[JoiningStateID] DESC'
                        WHEN 'HRM_JoiningStates8_Description' THEN '[HRM_JoiningStates8].[Description]'
                        WHEN 'HRM_JoiningStates8_Description DESC' THEN '[HRM_JoiningStates8].[Description] DESC'
                        WHEN 'HRM_Designations9_DesignationID' THEN '[HRM_Designations9].[DesignationID]'
                        WHEN 'HRM_Designations9_DesignationID DESC' THEN '[HRM_Designations9].[DesignationID] DESC'
                        WHEN 'HRM_Designations9_Description' THEN '[HRM_Designations9].[Description]'
                        WHEN 'HRM_Designations9_Description DESC' THEN '[HRM_Designations9].[Description] DESC'
                        WHEN 'HRM_Designations9_ShortName' THEN '[HRM_Designations9].[ShortName]'
                        WHEN 'HRM_Designations9_ShortName DESC' THEN '[HRM_Designations9].[ShortName] DESC'
                        WHEN 'HRM_Designations9_Sequence' THEN '[HRM_Designations9].[Sequence]'
                        WHEN 'HRM_Designations9_Sequence DESC' THEN '[HRM_Designations9].[Sequence] DESC'
                        WHEN 'HRM_Ratings10_RatingID' THEN '[HRM_Ratings10].[RatingID]'
                        WHEN 'HRM_Ratings10_RatingID DESC' THEN '[HRM_Ratings10].[RatingID] DESC'
                        WHEN 'HRM_Ratings10_Description' THEN '[HRM_Ratings10].[Description]'
                        WHEN 'HRM_Ratings10_Description DESC' THEN '[HRM_Ratings10].[Description] DESC'
                        WHEN 'HRM_Ratings10_sequence' THEN '[HRM_Ratings10].[sequence]'
                        WHEN 'HRM_Ratings10_sequence DESC' THEN '[HRM_Ratings10].[sequence] DESC'
                        WHEN 'HRM_Companies11_CompanyID' THEN '[HRM_Companies11].[CompanyID]'
                        WHEN 'HRM_Companies11_CompanyID DESC' THEN '[HRM_Companies11].[CompanyID] DESC'
                        WHEN 'HRM_Companies11_Description' THEN '[HRM_Companies11].[Description]'
                        WHEN 'HRM_Companies11_Description DESC' THEN '[HRM_Companies11].[Description] DESC'
                        WHEN 'HRM_Companies11_ShortName' THEN '[HRM_Companies11].[ShortName]'
                        WHEN 'HRM_Companies11_ShortName DESC' THEN '[HRM_Companies11].[ShortName] DESC'
                        WHEN 'HRM_Companies11_BaaNID' THEN '[HRM_Companies11].[BaaNID]'
                        WHEN 'HRM_Companies11_BaaNID DESC' THEN '[HRM_Companies11].[BaaNID] DESC'
                        WHEN 'HRM_Divisions12_DivisionID' THEN '[HRM_Divisions12].[DivisionID]'
                        WHEN 'HRM_Divisions12_DivisionID DESC' THEN '[HRM_Divisions12].[DivisionID] DESC'
                        WHEN 'HRM_Divisions12_Description' THEN '[HRM_Divisions12].[Description]'
                        WHEN 'HRM_Divisions12_Description DESC' THEN '[HRM_Divisions12].[Description] DESC'
                        WHEN 'HRM_Ratings14_RatingID' THEN '[HRM_Ratings14].[RatingID]'
                        WHEN 'HRM_Ratings14_RatingID DESC' THEN '[HRM_Ratings14].[RatingID] DESC'
                        WHEN 'HRM_Ratings14_Description' THEN '[HRM_Ratings14].[Description]'
                        WHEN 'HRM_Ratings14_Description DESC' THEN '[HRM_Ratings14].[Description] DESC'
                        WHEN 'HRM_Ratings14_sequence' THEN '[HRM_Ratings14].[sequence]'
                        WHEN 'HRM_Ratings14_sequence DESC' THEN '[HRM_Ratings14].[sequence] DESC'
                        WHEN 'HRM_Offices13_OfficeID' THEN '[HRM_Offices13].[OfficeID]'
                        WHEN 'HRM_Offices13_OfficeID DESC' THEN '[HRM_Offices13].[OfficeID] DESC'
                        WHEN 'HRM_Offices13_Description' THEN '[HRM_Offices13].[Description]'
                        WHEN 'HRM_Offices13_Description DESC' THEN '[HRM_Offices13].[Description] DESC'
                        WHEN 'HRM_Offices13_Address' THEN '[HRM_Offices13].[Address]'
                        WHEN 'HRM_Offices13_Address DESC' THEN '[HRM_Offices13].[Address] DESC'
                        WHEN 'HRM_Offices13_City' THEN '[HRM_Offices13].[City]'
                        WHEN 'HRM_Offices13_City DESC' THEN '[HRM_Offices13].[City] DESC'
                        WHEN 'HRM_Departments15_DepartmentID' THEN '[HRM_Departments15].[DepartmentID]'
                        WHEN 'HRM_Departments15_DepartmentID DESC' THEN '[HRM_Departments15].[DepartmentID] DESC'
                        WHEN 'HRM_Departments15_Description' THEN '[HRM_Departments15].[Description]'
                        WHEN 'HRM_Departments15_Description DESC' THEN '[HRM_Departments15].[Description] DESC'
                        WHEN 'DCM_Projects16_ProjectCode' THEN '[DCM_Projects16].[ProjectCode]'
                        WHEN 'DCM_Projects16_ProjectCode DESC' THEN '[DCM_Projects16].[ProjectCode] DESC'
                        WHEN 'DCM_Projects16_Description' THEN '[DCM_Projects16].[Description]'
                        WHEN 'DCM_Projects16_Description DESC' THEN '[DCM_Projects16].[Description] DESC'
                        WHEN 'HRM_Companies17_CompanyID' THEN '[HRM_Companies17].[CompanyID]'
                        WHEN 'HRM_Companies17_CompanyID DESC' THEN '[HRM_Companies17].[CompanyID] DESC'
                        WHEN 'HRM_Companies17_Description' THEN '[HRM_Companies17].[Description]'
                        WHEN 'HRM_Companies17_Description DESC' THEN '[HRM_Companies17].[Description] DESC'
                        WHEN 'HRM_Companies17_ShortName' THEN '[HRM_Companies17].[ShortName]'
                        WHEN 'HRM_Companies17_ShortName DESC' THEN '[HRM_Companies17].[ShortName] DESC'
                        WHEN 'HRM_Companies17_BaaNID' THEN '[HRM_Companies17].[BaaNID]'
                        WHEN 'HRM_Companies17_BaaNID DESC' THEN '[HRM_Companies17].[BaaNID] DESC'
                        WHEN 'HRM_Divisions18_DivisionID' THEN '[HRM_Divisions18].[DivisionID]'
                        WHEN 'HRM_Divisions18_DivisionID DESC' THEN '[HRM_Divisions18].[DivisionID] DESC'
                        WHEN 'HRM_Divisions18_Description' THEN '[HRM_Divisions18].[Description]'
                        WHEN 'HRM_Divisions18_Description DESC' THEN '[HRM_Divisions18].[Description] DESC'
                        WHEN 'HRM_Offices19_OfficeID' THEN '[HRM_Offices19].[OfficeID]'
                        WHEN 'HRM_Offices19_OfficeID DESC' THEN '[HRM_Offices19].[OfficeID] DESC'
                        WHEN 'HRM_Offices19_Description' THEN '[HRM_Offices19].[Description]'
                        WHEN 'HRM_Offices19_Description DESC' THEN '[HRM_Offices19].[Description] DESC'
                        WHEN 'HRM_Offices19_Address' THEN '[HRM_Offices19].[Address]'
                        WHEN 'HRM_Offices19_Address DESC' THEN '[HRM_Offices19].[Address] DESC'
                        WHEN 'HRM_Offices19_City' THEN '[HRM_Offices19].[City]'
                        WHEN 'HRM_Offices19_City DESC' THEN '[HRM_Offices19].[City] DESC'
                        WHEN 'HRM_Departments20_DepartmentID' THEN '[HRM_Departments20].[DepartmentID]'
                        WHEN 'HRM_Departments20_DepartmentID DESC' THEN '[HRM_Departments20].[DepartmentID] DESC'
                        WHEN 'HRM_Departments20_Description' THEN '[HRM_Departments20].[Description]'
                        WHEN 'HRM_Departments20_Description DESC' THEN '[HRM_Departments20].[Description] DESC'
                        WHEN 'DCM_Projects21_ProjectCode' THEN '[DCM_Projects21].[ProjectCode]'
                        WHEN 'DCM_Projects21_ProjectCode DESC' THEN '[DCM_Projects21].[ProjectCode] DESC'
                        WHEN 'DCM_Projects21_Description' THEN '[DCM_Projects21].[Description]'
                        WHEN 'DCM_Projects21_Description DESC' THEN '[DCM_Projects21].[Description] DESC'
                        WHEN 'HRM_Designations22_DesignationID' THEN '[HRM_Designations22].[DesignationID]'
                        WHEN 'HRM_Designations22_DesignationID DESC' THEN '[HRM_Designations22].[DesignationID] DESC'
                        WHEN 'HRM_Designations22_Description' THEN '[HRM_Designations22].[Description]'
                        WHEN 'HRM_Designations22_Description DESC' THEN '[HRM_Designations22].[Description] DESC'
                        WHEN 'HRM_Designations22_ShortName' THEN '[HRM_Designations22].[ShortName]'
                        WHEN 'HRM_Designations22_ShortName DESC' THEN '[HRM_Designations22].[ShortName] DESC'
                        WHEN 'HRM_Designations22_Sequence' THEN '[HRM_Designations22].[Sequence]'
                        WHEN 'HRM_Designations22_Sequence DESC' THEN '[HRM_Designations22].[Sequence] DESC'
                        WHEN 'HRM_Status23_StatusID' THEN '[HRM_Status23].[StatusID]'
                        WHEN 'HRM_Status23_StatusID DESC' THEN '[HRM_Status23].[StatusID] DESC'
                        WHEN 'HRM_Status23_Description' THEN '[HRM_Status23].[Description]'
                        WHEN 'HRM_Status23_Description DESC' THEN '[HRM_Status23].[Description] DESC'
                        WHEN 'HRM_Status23_Sequence' THEN '[HRM_Status23].[Sequence]'
                        WHEN 'HRM_Status23_Sequence DESC' THEN '[HRM_Status23].[Sequence] DESC'
                        WHEN 'HRM_WorkingAreas24_WorkingAreaID' THEN '[HRM_WorkingAreas24].[WorkingAreaID]'
                        WHEN 'HRM_WorkingAreas24_WorkingAreaID DESC' THEN '[HRM_WorkingAreas24].[WorkingAreaID] DESC'
                        WHEN 'HRM_WorkingAreas24_Description' THEN '[HRM_WorkingAreas24].[Description]'
                        WHEN 'HRM_WorkingAreas24_Description DESC' THEN '[HRM_WorkingAreas24].[Description] DESC'
                        WHEN 'HRM_FunctionalStatus125_FunctionalStatusID1' THEN '[HRM_FunctionalStatus125].[FunctionalStatusID1]'
                        WHEN 'HRM_FunctionalStatus125_FunctionalStatusID1 DESC' THEN '[HRM_FunctionalStatus125].[FunctionalStatusID1] DESC'
                        WHEN 'HRM_FunctionalStatus125_Description' THEN '[HRM_FunctionalStatus125].[Description]'
                        WHEN 'HRM_FunctionalStatus125_Description DESC' THEN '[HRM_FunctionalStatus125].[Description] DESC'
                        WHEN 'HRM_FunctionalStatus226_FunctionalStatusID2' THEN '[HRM_FunctionalStatus226].[FunctionalStatusID2]'
                        WHEN 'HRM_FunctionalStatus226_FunctionalStatusID2 DESC' THEN '[HRM_FunctionalStatus226].[FunctionalStatusID2] DESC'
                        WHEN 'HRM_FunctionalStatus226_Description' THEN '[HRM_FunctionalStatus226].[Description]'
                        WHEN 'HRM_FunctionalStatus226_Description DESC' THEN '[HRM_FunctionalStatus226].[Description] DESC'
                        WHEN 'HRM_FunctionalStatus327_FunctionalStatusID3' THEN '[HRM_FunctionalStatus327].[FunctionalStatusID3]'
                        WHEN 'HRM_FunctionalStatus327_FunctionalStatusID3 DESC' THEN '[HRM_FunctionalStatus327].[FunctionalStatusID3] DESC'
                        WHEN 'HRM_FunctionalStatus327_Description' THEN '[HRM_FunctionalStatus327].[Description]'
                        WHEN 'HRM_FunctionalStatus327_Description DESC' THEN '[HRM_FunctionalStatus327].[Description] DESC'
                        WHEN 'HRM_FunctionalStatus428_FunctionalStatusID4' THEN '[HRM_FunctionalStatus428].[FunctionalStatusID4]'
                        WHEN 'HRM_FunctionalStatus428_FunctionalStatusID4 DESC' THEN '[HRM_FunctionalStatus428].[FunctionalStatusID4] DESC'
                        WHEN 'HRM_FunctionalStatus428_Description' THEN '[HRM_FunctionalStatus428].[Description]'
                        WHEN 'HRM_FunctionalStatus428_Description DESC' THEN '[HRM_FunctionalStatus428].[Description] DESC'
                        WHEN 'HRM_Companies29_CompanyID' THEN '[HRM_Companies29].[CompanyID]'
                        WHEN 'HRM_Companies29_CompanyID DESC' THEN '[HRM_Companies29].[CompanyID] DESC'
                        WHEN 'HRM_Companies29_Description' THEN '[HRM_Companies29].[Description]'
                        WHEN 'HRM_Companies29_Description DESC' THEN '[HRM_Companies29].[Description] DESC'
                        WHEN 'HRM_Companies29_ShortName' THEN '[HRM_Companies29].[ShortName]'
                        WHEN 'HRM_Companies29_ShortName DESC' THEN '[HRM_Companies29].[ShortName] DESC'
                        WHEN 'HRM_Companies29_BaaNID' THEN '[HRM_Companies29].[BaaNID]'
                        WHEN 'HRM_Companies29_BaaNID DESC' THEN '[HRM_Companies29].[BaaNID] DESC'
                        WHEN 'HRM_Qualifications30_QualificationID' THEN '[HRM_Qualifications30].[QualificationID]'
                        WHEN 'HRM_Qualifications30_QualificationID DESC' THEN '[HRM_Qualifications30].[QualificationID] DESC'
                        WHEN 'HRM_Qualifications30_Description' THEN '[HRM_Qualifications30].[Description]'
                        WHEN 'HRM_Qualifications30_Description DESC' THEN '[HRM_Qualifications30].[Description] DESC'
                        WHEN 'HRM_Qualifications31_QualificationID' THEN '[HRM_Qualifications31].[QualificationID]'
                        WHEN 'HRM_Qualifications31_QualificationID DESC' THEN '[HRM_Qualifications31].[QualificationID] DESC'
                        WHEN 'HRM_Qualifications31_Description' THEN '[HRM_Qualifications31].[Description]'
                        WHEN 'HRM_Qualifications31_Description DESC' THEN '[HRM_Qualifications31].[Description] DESC'
                        WHEN 'HRM_BloodGroups32_BloodGroupID' THEN '[HRM_BloodGroups32].[BloodGroupID]'
                        WHEN 'HRM_BloodGroups32_BloodGroupID DESC' THEN '[HRM_BloodGroups32].[BloodGroupID] DESC'
                        WHEN 'HRM_BloodGroups32_Description' THEN '[HRM_BloodGroups32].[Description]'
                        WHEN 'HRM_BloodGroups32_Description DESC' THEN '[HRM_BloodGroups32].[Description] DESC'
                        WHEN 'aspnet_Users33_UserName' THEN '[aspnet_Users33].[UserName]'
                        WHEN 'aspnet_Users33_UserName DESC' THEN '[aspnet_Users33].[UserName] DESC'
                        WHEN 'aspnet_Users33_UserFullName' THEN '[aspnet_Users33].[UserFullName]'
                        WHEN 'aspnet_Users33_UserFullName DESC' THEN '[aspnet_Users33].[UserFullName] DESC'
                        ELSE '[HRM_Employees].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[Salute],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[AliasName],
		[HRM_Employees].[Gender],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[C_CompanyID],
		[HRM_Employees].[C_DivisionID],
		[HRM_Employees].[C_OfficeID],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[C_ProjectSiteID],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[C_BasicSalary],
		[HRM_Employees].[C_StatusID],
		[HRM_Employees].[C_StatusRemark],
		[HRM_Employees].[C_JoinngStateID],
		[HRM_Employees].[U_ActiveState],
		[HRM_Employees].[ActiveState],
		[HRM_Employees].[ActiveStateEventName],
		[HRM_Employees].[C_IncrementOn],
		[HRM_Employees].[C_IncrementRemark],
		[HRM_Employees].[U_UnderIncrement],
		[HRM_Employees].[U_NewBasicSalary],
		[HRM_Employees].[C_PromotionOn],
		[HRM_Employees].[C_PromotionRemark],
		[HRM_Employees].[C_TransferedOn],
		[HRM_Employees].[U_UnderPromotion],
		[HRM_Employees].[C_TransferRemark],
		[HRM_Employees].[C_RatingDoneOn],
		[HRM_Employees].[U_NewDesignationID],
		[HRM_Employees].[C_RatingPoints],
		[HRM_Employees].[C_RatingID],
		[HRM_Employees].[C_RatingRemark],
		[HRM_Employees].[U_UnderTransfer],
		[HRM_Employees].[Resigned],
		[HRM_Employees].[U_CompanyID],
		[HRM_Employees].[C_ResignedOn],
		[HRM_Employees].[C_DateOfReleaving],
		[HRM_Employees].[U_DivisionID],
		[HRM_Employees].[U_UnderRating],
		[HRM_Employees].[C_ResignedRemark],
		[HRM_Employees].[U_NewRatingID],
		[HRM_Employees].[U_OfficeID],
		[HRM_Employees].[U_DepartmentID],
		[HRM_Employees].[C_ConfirmedOn],
		[HRM_Employees].[Confirmed],
		[HRM_Employees].[C_ConfirmationRemark],
		[HRM_Employees].[U_ProjectSiteID],
		[HRM_Employees].[J_CompanyID],
		[HRM_Employees].[J_DivisionID],
		[HRM_Employees].[J_OfficeID],
		[HRM_Employees].[J_DepartmentID],
		[HRM_Employees].[J_ProjectSiteID],
		[HRM_Employees].[J_DesignationID],
		[HRM_Employees].[J_BasicSalary],
		[HRM_Employees].[J_StatusID],
		[HRM_Employees].[J_StatusRemark],
		[HRM_Employees].[WorkingAreaID],
		[HRM_Employees].[FunctionalStatusID1],
		[HRM_Employees].[FunctionalStatusID2],
		[HRM_Employees].[FunctionalStatusID3],
		[HRM_Employees].[FunctionalStatusID4],
		[HRM_Employees].[EducationDetails],
		[HRM_Employees].[IncrementCompany],
		[HRM_Employees].[CareerStartedOn],
		[HRM_Employees].[QualificationID1],
		[HRM_Employees].[QualificationID2],
		[HRM_Employees].[DateOfBirth],
		[HRM_Employees].[BloodGroupID],
		[HRM_Employees].[FatherName],
		[HRM_Employees].[SpouseName],
		[HRM_Employees].[ContactNumbers],
		[HRM_Employees].[PermanentAddress],
		[HRM_Employees].[PermanentCity],
		[HRM_Employees].[CurrentAddress],
		[HRM_Employees].[CurrentCity],
		[HRM_Employees].[OfficeFileNumber],
		[HRM_Employees].[PFNumber],
		[HRM_Employees].[ESINumber],
		[HRM_Employees].[PAN],
		[HRM_Employees].[EMailID],
		[HRM_Employees].[Freezed],
		[HRM_Employees].[QualificationYear1],
		[HRM_Employees].[ModifiedBy],
		[HRM_Employees].[ModifiedOn],
		[HRM_Employees].[QualificationYear2],
		[HRM_Employees].[ModifiedEvent],
		[HRM_Companies1].[CompanyID] AS HRM_Companies1_CompanyID,
		[HRM_Companies1].[Description] AS HRM_Companies1_Description,
		[HRM_Companies1].[ShortName] AS HRM_Companies1_ShortName,
		[HRM_Companies1].[BaaNID] AS HRM_Companies1_BaaNID,
		[HRM_Divisions2].[DivisionID] AS HRM_Divisions2_DivisionID,
		[HRM_Divisions2].[Description] AS HRM_Divisions2_Description,
		[HRM_Offices3].[OfficeID] AS HRM_Offices3_OfficeID,
		[HRM_Offices3].[Description] AS HRM_Offices3_Description,
		[HRM_Offices3].[Address] AS HRM_Offices3_Address,
		[HRM_Offices3].[City] AS HRM_Offices3_City,
		[HRM_Departments4].[DepartmentID] AS HRM_Departments4_DepartmentID,
		[HRM_Departments4].[Description] AS HRM_Departments4_Description,
		[DCM_Projects5].[ProjectCode] AS DCM_Projects5_ProjectCode,
		[DCM_Projects5].[Description] AS DCM_Projects5_Description,
		[HRM_Designations6].[DesignationID] AS HRM_Designations6_DesignationID,
		[HRM_Designations6].[Description] AS HRM_Designations6_Description,
		[HRM_Designations6].[ShortName] AS HRM_Designations6_ShortName,
		[HRM_Designations6].[Sequence] AS HRM_Designations6_Sequence,
		[HRM_Status7].[StatusID] AS HRM_Status7_StatusID,
		[HRM_Status7].[Description] AS HRM_Status7_Description,
		[HRM_Status7].[Sequence] AS HRM_Status7_Sequence,
		[HRM_JoiningStates8].[JoiningStateID] AS HRM_JoiningStates8_JoiningStateID,
		[HRM_JoiningStates8].[Description] AS HRM_JoiningStates8_Description,
		[HRM_Designations9].[DesignationID] AS HRM_Designations9_DesignationID,
		[HRM_Designations9].[Description] AS HRM_Designations9_Description,
		[HRM_Designations9].[ShortName] AS HRM_Designations9_ShortName,
		[HRM_Designations9].[Sequence] AS HRM_Designations9_Sequence,
		[HRM_Ratings10].[RatingID] AS HRM_Ratings10_RatingID,
		[HRM_Ratings10].[Description] AS HRM_Ratings10_Description,
		[HRM_Ratings10].[sequence] AS HRM_Ratings10_sequence,
		[HRM_Companies11].[CompanyID] AS HRM_Companies11_CompanyID,
		[HRM_Companies11].[Description] AS HRM_Companies11_Description,
		[HRM_Companies11].[ShortName] AS HRM_Companies11_ShortName,
		[HRM_Companies11].[BaaNID] AS HRM_Companies11_BaaNID,
		[HRM_Divisions12].[DivisionID] AS HRM_Divisions12_DivisionID,
		[HRM_Divisions12].[Description] AS HRM_Divisions12_Description,
		[HRM_Ratings14].[RatingID] AS HRM_Ratings14_RatingID,
		[HRM_Ratings14].[Description] AS HRM_Ratings14_Description,
		[HRM_Ratings14].[sequence] AS HRM_Ratings14_sequence,
		[HRM_Offices13].[OfficeID] AS HRM_Offices13_OfficeID,
		[HRM_Offices13].[Description] AS HRM_Offices13_Description,
		[HRM_Offices13].[Address] AS HRM_Offices13_Address,
		[HRM_Offices13].[City] AS HRM_Offices13_City,
		[HRM_Departments15].[DepartmentID] AS HRM_Departments15_DepartmentID,
		[HRM_Departments15].[Description] AS HRM_Departments15_Description,
		[DCM_Projects16].[ProjectCode] AS DCM_Projects16_ProjectCode,
		[DCM_Projects16].[Description] AS DCM_Projects16_Description,
		[HRM_Companies17].[CompanyID] AS HRM_Companies17_CompanyID,
		[HRM_Companies17].[Description] AS HRM_Companies17_Description,
		[HRM_Companies17].[ShortName] AS HRM_Companies17_ShortName,
		[HRM_Companies17].[BaaNID] AS HRM_Companies17_BaaNID,
		[HRM_Divisions18].[DivisionID] AS HRM_Divisions18_DivisionID,
		[HRM_Divisions18].[Description] AS HRM_Divisions18_Description,
		[HRM_Offices19].[OfficeID] AS HRM_Offices19_OfficeID,
		[HRM_Offices19].[Description] AS HRM_Offices19_Description,
		[HRM_Offices19].[Address] AS HRM_Offices19_Address,
		[HRM_Offices19].[City] AS HRM_Offices19_City,
		[HRM_Departments20].[DepartmentID] AS HRM_Departments20_DepartmentID,
		[HRM_Departments20].[Description] AS HRM_Departments20_Description,
		[DCM_Projects21].[ProjectCode] AS DCM_Projects21_ProjectCode,
		[DCM_Projects21].[Description] AS DCM_Projects21_Description,
		[HRM_Designations22].[DesignationID] AS HRM_Designations22_DesignationID,
		[HRM_Designations22].[Description] AS HRM_Designations22_Description,
		[HRM_Designations22].[ShortName] AS HRM_Designations22_ShortName,
		[HRM_Designations22].[Sequence] AS HRM_Designations22_Sequence,
		[HRM_Status23].[StatusID] AS HRM_Status23_StatusID,
		[HRM_Status23].[Description] AS HRM_Status23_Description,
		[HRM_Status23].[Sequence] AS HRM_Status23_Sequence,
		[HRM_WorkingAreas24].[WorkingAreaID] AS HRM_WorkingAreas24_WorkingAreaID,
		[HRM_WorkingAreas24].[Description] AS HRM_WorkingAreas24_Description,
		[HRM_FunctionalStatus125].[FunctionalStatusID1] AS HRM_FunctionalStatus125_FunctionalStatusID1,
		[HRM_FunctionalStatus125].[Description] AS HRM_FunctionalStatus125_Description,
		[HRM_FunctionalStatus226].[FunctionalStatusID2] AS HRM_FunctionalStatus226_FunctionalStatusID2,
		[HRM_FunctionalStatus226].[Description] AS HRM_FunctionalStatus226_Description,
		[HRM_FunctionalStatus327].[FunctionalStatusID3] AS HRM_FunctionalStatus327_FunctionalStatusID3,
		[HRM_FunctionalStatus327].[Description] AS HRM_FunctionalStatus327_Description,
		[HRM_FunctionalStatus428].[FunctionalStatusID4] AS HRM_FunctionalStatus428_FunctionalStatusID4,
		[HRM_FunctionalStatus428].[Description] AS HRM_FunctionalStatus428_Description,
		[HRM_Companies29].[CompanyID] AS HRM_Companies29_CompanyID,
		[HRM_Companies29].[Description] AS HRM_Companies29_Description,
		[HRM_Companies29].[ShortName] AS HRM_Companies29_ShortName,
		[HRM_Companies29].[BaaNID] AS HRM_Companies29_BaaNID,
		[HRM_Qualifications30].[QualificationID] AS HRM_Qualifications30_QualificationID,
		[HRM_Qualifications30].[Description] AS HRM_Qualifications30_Description,
		[HRM_Qualifications31].[QualificationID] AS HRM_Qualifications31_QualificationID,
		[HRM_Qualifications31].[Description] AS HRM_Qualifications31_Description,
		[HRM_BloodGroups32].[BloodGroupID] AS HRM_BloodGroups32_BloodGroupID,
		[HRM_BloodGroups32].[Description] AS HRM_BloodGroups32_Description,
		[aspnet_Users33].[UserName] AS aspnet_Users33_UserName,
		[aspnet_Users33].[UserFullName] AS aspnet_Users33_UserFullName 
  FROM [HRM_Employees] 
    	INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies1]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies1].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions2]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions2].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices3]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices3].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments4]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments4].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects5]
    ON [HRM_Employees].[C_ProjectSiteID] = [DCM_Projects5].[ProjectCode]
  INNER JOIN [HRM_Designations] AS [HRM_Designations6]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations6].[DesignationID]
  INNER JOIN [HRM_Status] AS [HRM_Status7]
    ON [HRM_Employees].[C_StatusID] = [HRM_Status7].[StatusID]
  LEFT OUTER JOIN [HRM_JoiningStates] AS [HRM_JoiningStates8]
    ON [HRM_Employees].[C_JoinngStateID] = [HRM_JoiningStates8].[JoiningStateID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations9]
    ON [HRM_Employees].[U_NewDesignationID] = [HRM_Designations9].[DesignationID]
  LEFT OUTER JOIN [HRM_Ratings] AS [HRM_Ratings10]
    ON [HRM_Employees].[C_RatingID] = [HRM_Ratings10].[RatingID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies11]
    ON [HRM_Employees].[U_CompanyID] = [HRM_Companies11].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions12]
    ON [HRM_Employees].[U_DivisionID] = [HRM_Divisions12].[DivisionID]
  LEFT OUTER JOIN [HRM_Ratings] AS [HRM_Ratings14]
    ON [HRM_Employees].[U_NewRatingID] = [HRM_Ratings14].[RatingID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices13]
    ON [HRM_Employees].[U_OfficeID] = [HRM_Offices13].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments15]
    ON [HRM_Employees].[U_DepartmentID] = [HRM_Departments15].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects16]
    ON [HRM_Employees].[U_ProjectSiteID] = [DCM_Projects16].[ProjectCode]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies17]
    ON [HRM_Employees].[J_CompanyID] = [HRM_Companies17].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions18]
    ON [HRM_Employees].[J_DivisionID] = [HRM_Divisions18].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices19]
    ON [HRM_Employees].[J_OfficeID] = [HRM_Offices19].[OfficeID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments20]
    ON [HRM_Employees].[J_DepartmentID] = [HRM_Departments20].[DepartmentID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects21]
    ON [HRM_Employees].[J_ProjectSiteID] = [DCM_Projects21].[ProjectCode]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations22]
    ON [HRM_Employees].[J_DesignationID] = [HRM_Designations22].[DesignationID]
  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status23]
    ON [HRM_Employees].[J_StatusID] = [HRM_Status23].[StatusID]
  LEFT OUTER JOIN [HRM_WorkingAreas] AS [HRM_WorkingAreas24]
    ON [HRM_Employees].[WorkingAreaID] = [HRM_WorkingAreas24].[WorkingAreaID]
  LEFT OUTER JOIN [HRM_FunctionalStatus1] AS [HRM_FunctionalStatus125]
    ON [HRM_Employees].[FunctionalStatusID1] = [HRM_FunctionalStatus125].[FunctionalStatusID1]
  LEFT OUTER JOIN [HRM_FunctionalStatus2] AS [HRM_FunctionalStatus226]
    ON [HRM_Employees].[FunctionalStatusID2] = [HRM_FunctionalStatus226].[FunctionalStatusID2]
  LEFT OUTER JOIN [HRM_FunctionalStatus3] AS [HRM_FunctionalStatus327]
    ON [HRM_Employees].[FunctionalStatusID3] = [HRM_FunctionalStatus327].[FunctionalStatusID3]
  LEFT OUTER JOIN [HRM_FunctionalStatus4] AS [HRM_FunctionalStatus428]
    ON [HRM_Employees].[FunctionalStatusID4] = [HRM_FunctionalStatus428].[FunctionalStatusID4]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies29]
    ON [HRM_Employees].[IncrementCompany] = [HRM_Companies29].[CompanyID]
  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications30]
    ON [HRM_Employees].[QualificationID1] = [HRM_Qualifications30].[QualificationID]
  LEFT OUTER JOIN [HRM_Qualifications] AS [HRM_Qualifications31]
    ON [HRM_Employees].[QualificationID2] = [HRM_Qualifications31].[QualificationID]
  LEFT OUTER JOIN [HRM_BloodGroups] AS [HRM_BloodGroups32]
    ON [HRM_Employees].[BloodGroupID] = [HRM_BloodGroups32].[BloodGroupID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users33]
    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users33].[UserName]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
