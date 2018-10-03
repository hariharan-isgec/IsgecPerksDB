USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spHRM_EmployeesSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (CardNo)
  SELECT [HRM_Employees].[CardNo] FROM [HRM_Employees]
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
     OR LOWER(ISNULL([HRM_Employees].[ActiveStateEventName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_IncrementRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[U_NewBasicSalary], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_PromotionRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_TransferRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[U_NewDesignationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_RatingPoints], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_RatingID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_RatingRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[U_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[U_DivisionID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_ResignedRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[U_NewRatingID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[U_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[U_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_ConfirmationRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[U_ProjectSiteID],'')) LIKE @KeyWord1
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
     OR STR(ISNULL([HRM_Employees].[QualificationID2], 0)) LIKE @KeyWord1
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
     OR LOWER(ISNULL([HRM_Employees].[QualificationYear1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ModifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[QualificationYear2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ModifiedEvent],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies1].[CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies1].[ShortName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies1].[BaaNID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions2].[DivisionID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices3].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices3].[City],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments4].[DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments4].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects5].[ProjectCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects5].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations6].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations6].[ShortName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Designations6].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Status7].[StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Status7].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Status7].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_JoiningStates8].[JoiningStateID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_JoiningStates8].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations9].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations9].[ShortName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Designations9].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Ratings10].[RatingID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Ratings10].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Ratings10].[sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies11].[CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies11].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies11].[ShortName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies11].[BaaNID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions12].[DivisionID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions12].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Ratings14].[RatingID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Ratings14].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Ratings14].[sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices13].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices13].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices13].[City],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments15].[DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments15].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects16].[ProjectCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects16].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies17].[CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies17].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies17].[ShortName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies17].[BaaNID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions18].[DivisionID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions18].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices19].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices19].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices19].[City],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments20].[DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments20].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects21].[ProjectCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects21].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations22].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations22].[ShortName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Designations22].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Status23].[StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Status23].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Status23].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_WorkingAreas24].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_FunctionalStatus125].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_FunctionalStatus226].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_FunctionalStatus327].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_FunctionalStatus428].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies29].[CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies29].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies29].[ShortName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies29].[BaaNID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Qualifications30].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Qualifications31].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_BloodGroups32].[BloodGroupID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_BloodGroups32].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users33].[UserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users33].[UserFullName],'')) LIKE @KeyWord1
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
     CASE @orderBy WHEN 'U_ActiveState' THEN [HRM_Employees].[U_ActiveState] END,
     CASE @orderBy WHEN 'U_ActiveState DESC' THEN [HRM_Employees].[U_ActiveState] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @orderBy WHEN 'ActiveStateEventName' THEN [HRM_Employees].[ActiveStateEventName] END,
     CASE @orderBy WHEN 'ActiveStateEventName DESC' THEN [HRM_Employees].[ActiveStateEventName] END DESC,
     CASE @orderBy WHEN 'C_IncrementOn' THEN [HRM_Employees].[C_IncrementOn] END,
     CASE @orderBy WHEN 'C_IncrementOn DESC' THEN [HRM_Employees].[C_IncrementOn] END DESC,
     CASE @orderBy WHEN 'C_IncrementRemark' THEN [HRM_Employees].[C_IncrementRemark] END,
     CASE @orderBy WHEN 'C_IncrementRemark DESC' THEN [HRM_Employees].[C_IncrementRemark] END DESC,
     CASE @orderBy WHEN 'U_UnderIncrement' THEN [HRM_Employees].[U_UnderIncrement] END,
     CASE @orderBy WHEN 'U_UnderIncrement DESC' THEN [HRM_Employees].[U_UnderIncrement] END DESC,
     CASE @orderBy WHEN 'U_NewBasicSalary' THEN [HRM_Employees].[U_NewBasicSalary] END,
     CASE @orderBy WHEN 'U_NewBasicSalary DESC' THEN [HRM_Employees].[U_NewBasicSalary] END DESC,
     CASE @orderBy WHEN 'C_PromotionOn' THEN [HRM_Employees].[C_PromotionOn] END,
     CASE @orderBy WHEN 'C_PromotionOn DESC' THEN [HRM_Employees].[C_PromotionOn] END DESC,
     CASE @orderBy WHEN 'C_PromotionRemark' THEN [HRM_Employees].[C_PromotionRemark] END,
     CASE @orderBy WHEN 'C_PromotionRemark DESC' THEN [HRM_Employees].[C_PromotionRemark] END DESC,
     CASE @orderBy WHEN 'C_TransferedOn' THEN [HRM_Employees].[C_TransferedOn] END,
     CASE @orderBy WHEN 'C_TransferedOn DESC' THEN [HRM_Employees].[C_TransferedOn] END DESC,
     CASE @orderBy WHEN 'U_UnderPromotion' THEN [HRM_Employees].[U_UnderPromotion] END,
     CASE @orderBy WHEN 'U_UnderPromotion DESC' THEN [HRM_Employees].[U_UnderPromotion] END DESC,
     CASE @orderBy WHEN 'C_TransferRemark' THEN [HRM_Employees].[C_TransferRemark] END,
     CASE @orderBy WHEN 'C_TransferRemark DESC' THEN [HRM_Employees].[C_TransferRemark] END DESC,
     CASE @orderBy WHEN 'C_RatingDoneOn' THEN [HRM_Employees].[C_RatingDoneOn] END,
     CASE @orderBy WHEN 'C_RatingDoneOn DESC' THEN [HRM_Employees].[C_RatingDoneOn] END DESC,
     CASE @orderBy WHEN 'U_NewDesignationID' THEN [HRM_Employees].[U_NewDesignationID] END,
     CASE @orderBy WHEN 'U_NewDesignationID DESC' THEN [HRM_Employees].[U_NewDesignationID] END DESC,
     CASE @orderBy WHEN 'C_RatingPoints' THEN [HRM_Employees].[C_RatingPoints] END,
     CASE @orderBy WHEN 'C_RatingPoints DESC' THEN [HRM_Employees].[C_RatingPoints] END DESC,
     CASE @orderBy WHEN 'C_RatingID' THEN [HRM_Employees].[C_RatingID] END,
     CASE @orderBy WHEN 'C_RatingID DESC' THEN [HRM_Employees].[C_RatingID] END DESC,
     CASE @orderBy WHEN 'C_RatingRemark' THEN [HRM_Employees].[C_RatingRemark] END,
     CASE @orderBy WHEN 'C_RatingRemark DESC' THEN [HRM_Employees].[C_RatingRemark] END DESC,
     CASE @orderBy WHEN 'U_UnderTransfer' THEN [HRM_Employees].[U_UnderTransfer] END,
     CASE @orderBy WHEN 'U_UnderTransfer DESC' THEN [HRM_Employees].[U_UnderTransfer] END DESC,
     CASE @orderBy WHEN 'Resigned' THEN [HRM_Employees].[Resigned] END,
     CASE @orderBy WHEN 'Resigned DESC' THEN [HRM_Employees].[Resigned] END DESC,
     CASE @orderBy WHEN 'U_CompanyID' THEN [HRM_Employees].[U_CompanyID] END,
     CASE @orderBy WHEN 'U_CompanyID DESC' THEN [HRM_Employees].[U_CompanyID] END DESC,
     CASE @orderBy WHEN 'C_ResignedOn' THEN [HRM_Employees].[C_ResignedOn] END,
     CASE @orderBy WHEN 'C_ResignedOn DESC' THEN [HRM_Employees].[C_ResignedOn] END DESC,
     CASE @orderBy WHEN 'C_DateOfReleaving' THEN [HRM_Employees].[C_DateOfReleaving] END,
     CASE @orderBy WHEN 'C_DateOfReleaving DESC' THEN [HRM_Employees].[C_DateOfReleaving] END DESC,
     CASE @orderBy WHEN 'U_DivisionID' THEN [HRM_Employees].[U_DivisionID] END,
     CASE @orderBy WHEN 'U_DivisionID DESC' THEN [HRM_Employees].[U_DivisionID] END DESC,
     CASE @orderBy WHEN 'U_UnderRating' THEN [HRM_Employees].[U_UnderRating] END,
     CASE @orderBy WHEN 'U_UnderRating DESC' THEN [HRM_Employees].[U_UnderRating] END DESC,
     CASE @orderBy WHEN 'C_ResignedRemark' THEN [HRM_Employees].[C_ResignedRemark] END,
     CASE @orderBy WHEN 'C_ResignedRemark DESC' THEN [HRM_Employees].[C_ResignedRemark] END DESC,
     CASE @orderBy WHEN 'U_NewRatingID' THEN [HRM_Employees].[U_NewRatingID] END,
     CASE @orderBy WHEN 'U_NewRatingID DESC' THEN [HRM_Employees].[U_NewRatingID] END DESC,
     CASE @orderBy WHEN 'U_OfficeID' THEN [HRM_Employees].[U_OfficeID] END,
     CASE @orderBy WHEN 'U_OfficeID DESC' THEN [HRM_Employees].[U_OfficeID] END DESC,
     CASE @orderBy WHEN 'U_DepartmentID' THEN [HRM_Employees].[U_DepartmentID] END,
     CASE @orderBy WHEN 'U_DepartmentID DESC' THEN [HRM_Employees].[U_DepartmentID] END DESC,
     CASE @orderBy WHEN 'C_ConfirmedOn' THEN [HRM_Employees].[C_ConfirmedOn] END,
     CASE @orderBy WHEN 'C_ConfirmedOn DESC' THEN [HRM_Employees].[C_ConfirmedOn] END DESC,
     CASE @orderBy WHEN 'Confirmed' THEN [HRM_Employees].[Confirmed] END,
     CASE @orderBy WHEN 'Confirmed DESC' THEN [HRM_Employees].[Confirmed] END DESC,
     CASE @orderBy WHEN 'C_ConfirmationRemark' THEN [HRM_Employees].[C_ConfirmationRemark] END,
     CASE @orderBy WHEN 'C_ConfirmationRemark DESC' THEN [HRM_Employees].[C_ConfirmationRemark] END DESC,
     CASE @orderBy WHEN 'U_ProjectSiteID' THEN [HRM_Employees].[U_ProjectSiteID] END,
     CASE @orderBy WHEN 'U_ProjectSiteID DESC' THEN [HRM_Employees].[U_ProjectSiteID] END DESC,
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
     CASE @orderBy WHEN 'QualificationID2' THEN [HRM_Employees].[QualificationID2] END,
     CASE @orderBy WHEN 'QualificationID2 DESC' THEN [HRM_Employees].[QualificationID2] END DESC,
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
     CASE @orderBy WHEN 'QualificationYear1' THEN [HRM_Employees].[QualificationYear1] END,
     CASE @orderBy WHEN 'QualificationYear1 DESC' THEN [HRM_Employees].[QualificationYear1] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [HRM_Employees].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [HRM_Employees].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [HRM_Employees].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [HRM_Employees].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'QualificationYear2' THEN [HRM_Employees].[QualificationYear2] END,
     CASE @orderBy WHEN 'QualificationYear2 DESC' THEN [HRM_Employees].[QualificationYear2] END DESC,
     CASE @orderBy WHEN 'ModifiedEvent' THEN [HRM_Employees].[ModifiedEvent] END,
     CASE @orderBy WHEN 'ModifiedEvent DESC' THEN [HRM_Employees].[ModifiedEvent] END DESC,
     CASE @orderBy WHEN 'HRM_Companies1_CompanyID' THEN [HRM_Companies1].[CompanyID] END,
     CASE @orderBy WHEN 'HRM_Companies1_CompanyID DESC' THEN [HRM_Companies1].[CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Companies1_Description' THEN [HRM_Companies1].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies1_Description DESC' THEN [HRM_Companies1].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies1_ShortName' THEN [HRM_Companies1].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Companies1_ShortName DESC' THEN [HRM_Companies1].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Companies1_BaaNID' THEN [HRM_Companies1].[BaaNID] END,
     CASE @orderBy WHEN 'HRM_Companies1_BaaNID DESC' THEN [HRM_Companies1].[BaaNID] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions2_DivisionID' THEN [HRM_Divisions2].[DivisionID] END,
     CASE @orderBy WHEN 'HRM_Divisions2_DivisionID DESC' THEN [HRM_Divisions2].[DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions2_Description' THEN [HRM_Divisions2].[Description] END,
     CASE @orderBy WHEN 'HRM_Divisions2_Description DESC' THEN [HRM_Divisions2].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices3_OfficeID' THEN [HRM_Offices3].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices3_OfficeID DESC' THEN [HRM_Offices3].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices3_Description' THEN [HRM_Offices3].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices3_Description DESC' THEN [HRM_Offices3].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices3_Address' THEN [HRM_Offices3].[Address] END,
     CASE @orderBy WHEN 'HRM_Offices3_Address DESC' THEN [HRM_Offices3].[Address] END DESC,
     CASE @orderBy WHEN 'HRM_Offices3_City' THEN [HRM_Offices3].[City] END,
     CASE @orderBy WHEN 'HRM_Offices3_City DESC' THEN [HRM_Offices3].[City] END DESC,
     CASE @orderBy WHEN 'HRM_Departments4_DepartmentID' THEN [HRM_Departments4].[DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Departments4_DepartmentID DESC' THEN [HRM_Departments4].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Departments4_Description' THEN [HRM_Departments4].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments4_Description DESC' THEN [HRM_Departments4].[Description] END DESC,
     CASE @orderBy WHEN 'DCM_Projects5_ProjectCode' THEN [DCM_Projects5].[ProjectCode] END,
     CASE @orderBy WHEN 'DCM_Projects5_ProjectCode DESC' THEN [DCM_Projects5].[ProjectCode] END DESC,
     CASE @orderBy WHEN 'DCM_Projects5_Description' THEN [DCM_Projects5].[Description] END,
     CASE @orderBy WHEN 'DCM_Projects5_Description DESC' THEN [DCM_Projects5].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations6_DesignationID' THEN [HRM_Designations6].[DesignationID] END,
     CASE @orderBy WHEN 'HRM_Designations6_DesignationID DESC' THEN [HRM_Designations6].[DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Designations6_Description' THEN [HRM_Designations6].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations6_Description DESC' THEN [HRM_Designations6].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations6_ShortName' THEN [HRM_Designations6].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Designations6_ShortName DESC' THEN [HRM_Designations6].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Designations6_Sequence' THEN [HRM_Designations6].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Designations6_Sequence DESC' THEN [HRM_Designations6].[Sequence] END DESC,
     CASE @orderBy WHEN 'HRM_Status7_StatusID' THEN [HRM_Status7].[StatusID] END,
     CASE @orderBy WHEN 'HRM_Status7_StatusID DESC' THEN [HRM_Status7].[StatusID] END DESC,
     CASE @orderBy WHEN 'HRM_Status7_Description' THEN [HRM_Status7].[Description] END,
     CASE @orderBy WHEN 'HRM_Status7_Description DESC' THEN [HRM_Status7].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Status7_Sequence' THEN [HRM_Status7].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Status7_Sequence DESC' THEN [HRM_Status7].[Sequence] END DESC,
     CASE @orderBy WHEN 'HRM_JoiningStates8_JoiningStateID' THEN [HRM_JoiningStates8].[JoiningStateID] END,
     CASE @orderBy WHEN 'HRM_JoiningStates8_JoiningStateID DESC' THEN [HRM_JoiningStates8].[JoiningStateID] END DESC,
     CASE @orderBy WHEN 'HRM_JoiningStates8_Description' THEN [HRM_JoiningStates8].[Description] END,
     CASE @orderBy WHEN 'HRM_JoiningStates8_Description DESC' THEN [HRM_JoiningStates8].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations9_DesignationID' THEN [HRM_Designations9].[DesignationID] END,
     CASE @orderBy WHEN 'HRM_Designations9_DesignationID DESC' THEN [HRM_Designations9].[DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Designations9_Description' THEN [HRM_Designations9].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations9_Description DESC' THEN [HRM_Designations9].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations9_ShortName' THEN [HRM_Designations9].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Designations9_ShortName DESC' THEN [HRM_Designations9].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Designations9_Sequence' THEN [HRM_Designations9].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Designations9_Sequence DESC' THEN [HRM_Designations9].[Sequence] END DESC,
     CASE @orderBy WHEN 'HRM_Ratings10_RatingID' THEN [HRM_Ratings10].[RatingID] END,
     CASE @orderBy WHEN 'HRM_Ratings10_RatingID DESC' THEN [HRM_Ratings10].[RatingID] END DESC,
     CASE @orderBy WHEN 'HRM_Ratings10_Description' THEN [HRM_Ratings10].[Description] END,
     CASE @orderBy WHEN 'HRM_Ratings10_Description DESC' THEN [HRM_Ratings10].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Ratings10_sequence' THEN [HRM_Ratings10].[sequence] END,
     CASE @orderBy WHEN 'HRM_Ratings10_sequence DESC' THEN [HRM_Ratings10].[sequence] END DESC,
     CASE @orderBy WHEN 'HRM_Companies11_CompanyID' THEN [HRM_Companies11].[CompanyID] END,
     CASE @orderBy WHEN 'HRM_Companies11_CompanyID DESC' THEN [HRM_Companies11].[CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Companies11_Description' THEN [HRM_Companies11].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies11_Description DESC' THEN [HRM_Companies11].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies11_ShortName' THEN [HRM_Companies11].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Companies11_ShortName DESC' THEN [HRM_Companies11].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Companies11_BaaNID' THEN [HRM_Companies11].[BaaNID] END,
     CASE @orderBy WHEN 'HRM_Companies11_BaaNID DESC' THEN [HRM_Companies11].[BaaNID] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions12_DivisionID' THEN [HRM_Divisions12].[DivisionID] END,
     CASE @orderBy WHEN 'HRM_Divisions12_DivisionID DESC' THEN [HRM_Divisions12].[DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions12_Description' THEN [HRM_Divisions12].[Description] END,
     CASE @orderBy WHEN 'HRM_Divisions12_Description DESC' THEN [HRM_Divisions12].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Ratings14_RatingID' THEN [HRM_Ratings14].[RatingID] END,
     CASE @orderBy WHEN 'HRM_Ratings14_RatingID DESC' THEN [HRM_Ratings14].[RatingID] END DESC,
     CASE @orderBy WHEN 'HRM_Ratings14_Description' THEN [HRM_Ratings14].[Description] END,
     CASE @orderBy WHEN 'HRM_Ratings14_Description DESC' THEN [HRM_Ratings14].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Ratings14_sequence' THEN [HRM_Ratings14].[sequence] END,
     CASE @orderBy WHEN 'HRM_Ratings14_sequence DESC' THEN [HRM_Ratings14].[sequence] END DESC,
     CASE @orderBy WHEN 'HRM_Offices13_OfficeID' THEN [HRM_Offices13].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices13_OfficeID DESC' THEN [HRM_Offices13].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices13_Description' THEN [HRM_Offices13].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices13_Description DESC' THEN [HRM_Offices13].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices13_Address' THEN [HRM_Offices13].[Address] END,
     CASE @orderBy WHEN 'HRM_Offices13_Address DESC' THEN [HRM_Offices13].[Address] END DESC,
     CASE @orderBy WHEN 'HRM_Offices13_City' THEN [HRM_Offices13].[City] END,
     CASE @orderBy WHEN 'HRM_Offices13_City DESC' THEN [HRM_Offices13].[City] END DESC,
     CASE @orderBy WHEN 'HRM_Departments15_DepartmentID' THEN [HRM_Departments15].[DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Departments15_DepartmentID DESC' THEN [HRM_Departments15].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Departments15_Description' THEN [HRM_Departments15].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments15_Description DESC' THEN [HRM_Departments15].[Description] END DESC,
     CASE @orderBy WHEN 'DCM_Projects16_ProjectCode' THEN [DCM_Projects16].[ProjectCode] END,
     CASE @orderBy WHEN 'DCM_Projects16_ProjectCode DESC' THEN [DCM_Projects16].[ProjectCode] END DESC,
     CASE @orderBy WHEN 'DCM_Projects16_Description' THEN [DCM_Projects16].[Description] END,
     CASE @orderBy WHEN 'DCM_Projects16_Description DESC' THEN [DCM_Projects16].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies17_CompanyID' THEN [HRM_Companies17].[CompanyID] END,
     CASE @orderBy WHEN 'HRM_Companies17_CompanyID DESC' THEN [HRM_Companies17].[CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Companies17_Description' THEN [HRM_Companies17].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies17_Description DESC' THEN [HRM_Companies17].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies17_ShortName' THEN [HRM_Companies17].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Companies17_ShortName DESC' THEN [HRM_Companies17].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Companies17_BaaNID' THEN [HRM_Companies17].[BaaNID] END,
     CASE @orderBy WHEN 'HRM_Companies17_BaaNID DESC' THEN [HRM_Companies17].[BaaNID] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions18_DivisionID' THEN [HRM_Divisions18].[DivisionID] END,
     CASE @orderBy WHEN 'HRM_Divisions18_DivisionID DESC' THEN [HRM_Divisions18].[DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Divisions18_Description' THEN [HRM_Divisions18].[Description] END,
     CASE @orderBy WHEN 'HRM_Divisions18_Description DESC' THEN [HRM_Divisions18].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices19_OfficeID' THEN [HRM_Offices19].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices19_OfficeID DESC' THEN [HRM_Offices19].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices19_Description' THEN [HRM_Offices19].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices19_Description DESC' THEN [HRM_Offices19].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices19_Address' THEN [HRM_Offices19].[Address] END,
     CASE @orderBy WHEN 'HRM_Offices19_Address DESC' THEN [HRM_Offices19].[Address] END DESC,
     CASE @orderBy WHEN 'HRM_Offices19_City' THEN [HRM_Offices19].[City] END,
     CASE @orderBy WHEN 'HRM_Offices19_City DESC' THEN [HRM_Offices19].[City] END DESC,
     CASE @orderBy WHEN 'HRM_Departments20_DepartmentID' THEN [HRM_Departments20].[DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Departments20_DepartmentID DESC' THEN [HRM_Departments20].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Departments20_Description' THEN [HRM_Departments20].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments20_Description DESC' THEN [HRM_Departments20].[Description] END DESC,
     CASE @orderBy WHEN 'DCM_Projects21_ProjectCode' THEN [DCM_Projects21].[ProjectCode] END,
     CASE @orderBy WHEN 'DCM_Projects21_ProjectCode DESC' THEN [DCM_Projects21].[ProjectCode] END DESC,
     CASE @orderBy WHEN 'DCM_Projects21_Description' THEN [DCM_Projects21].[Description] END,
     CASE @orderBy WHEN 'DCM_Projects21_Description DESC' THEN [DCM_Projects21].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations22_DesignationID' THEN [HRM_Designations22].[DesignationID] END,
     CASE @orderBy WHEN 'HRM_Designations22_DesignationID DESC' THEN [HRM_Designations22].[DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Designations22_Description' THEN [HRM_Designations22].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations22_Description DESC' THEN [HRM_Designations22].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations22_ShortName' THEN [HRM_Designations22].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Designations22_ShortName DESC' THEN [HRM_Designations22].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Designations22_Sequence' THEN [HRM_Designations22].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Designations22_Sequence DESC' THEN [HRM_Designations22].[Sequence] END DESC,
     CASE @orderBy WHEN 'HRM_Status23_StatusID' THEN [HRM_Status23].[StatusID] END,
     CASE @orderBy WHEN 'HRM_Status23_StatusID DESC' THEN [HRM_Status23].[StatusID] END DESC,
     CASE @orderBy WHEN 'HRM_Status23_Description' THEN [HRM_Status23].[Description] END,
     CASE @orderBy WHEN 'HRM_Status23_Description DESC' THEN [HRM_Status23].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Status23_Sequence' THEN [HRM_Status23].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Status23_Sequence DESC' THEN [HRM_Status23].[Sequence] END DESC,
     CASE @orderBy WHEN 'HRM_WorkingAreas24_WorkingAreaID' THEN [HRM_WorkingAreas24].[WorkingAreaID] END,
     CASE @orderBy WHEN 'HRM_WorkingAreas24_WorkingAreaID DESC' THEN [HRM_WorkingAreas24].[WorkingAreaID] END DESC,
     CASE @orderBy WHEN 'HRM_WorkingAreas24_Description' THEN [HRM_WorkingAreas24].[Description] END,
     CASE @orderBy WHEN 'HRM_WorkingAreas24_Description DESC' THEN [HRM_WorkingAreas24].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus125_FunctionalStatusID1' THEN [HRM_FunctionalStatus125].[FunctionalStatusID1] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus125_FunctionalStatusID1 DESC' THEN [HRM_FunctionalStatus125].[FunctionalStatusID1] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus125_Description' THEN [HRM_FunctionalStatus125].[Description] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus125_Description DESC' THEN [HRM_FunctionalStatus125].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus226_FunctionalStatusID2' THEN [HRM_FunctionalStatus226].[FunctionalStatusID2] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus226_FunctionalStatusID2 DESC' THEN [HRM_FunctionalStatus226].[FunctionalStatusID2] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus226_Description' THEN [HRM_FunctionalStatus226].[Description] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus226_Description DESC' THEN [HRM_FunctionalStatus226].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus327_FunctionalStatusID3' THEN [HRM_FunctionalStatus327].[FunctionalStatusID3] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus327_FunctionalStatusID3 DESC' THEN [HRM_FunctionalStatus327].[FunctionalStatusID3] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus327_Description' THEN [HRM_FunctionalStatus327].[Description] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus327_Description DESC' THEN [HRM_FunctionalStatus327].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus428_FunctionalStatusID4' THEN [HRM_FunctionalStatus428].[FunctionalStatusID4] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus428_FunctionalStatusID4 DESC' THEN [HRM_FunctionalStatus428].[FunctionalStatusID4] END DESC,
     CASE @orderBy WHEN 'HRM_FunctionalStatus428_Description' THEN [HRM_FunctionalStatus428].[Description] END,
     CASE @orderBy WHEN 'HRM_FunctionalStatus428_Description DESC' THEN [HRM_FunctionalStatus428].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies29_CompanyID' THEN [HRM_Companies29].[CompanyID] END,
     CASE @orderBy WHEN 'HRM_Companies29_CompanyID DESC' THEN [HRM_Companies29].[CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Companies29_Description' THEN [HRM_Companies29].[Description] END,
     CASE @orderBy WHEN 'HRM_Companies29_Description DESC' THEN [HRM_Companies29].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Companies29_ShortName' THEN [HRM_Companies29].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Companies29_ShortName DESC' THEN [HRM_Companies29].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Companies29_BaaNID' THEN [HRM_Companies29].[BaaNID] END,
     CASE @orderBy WHEN 'HRM_Companies29_BaaNID DESC' THEN [HRM_Companies29].[BaaNID] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications30_QualificationID' THEN [HRM_Qualifications30].[QualificationID] END,
     CASE @orderBy WHEN 'HRM_Qualifications30_QualificationID DESC' THEN [HRM_Qualifications30].[QualificationID] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications30_Description' THEN [HRM_Qualifications30].[Description] END,
     CASE @orderBy WHEN 'HRM_Qualifications30_Description DESC' THEN [HRM_Qualifications30].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications31_QualificationID' THEN [HRM_Qualifications31].[QualificationID] END,
     CASE @orderBy WHEN 'HRM_Qualifications31_QualificationID DESC' THEN [HRM_Qualifications31].[QualificationID] END DESC,
     CASE @orderBy WHEN 'HRM_Qualifications31_Description' THEN [HRM_Qualifications31].[Description] END,
     CASE @orderBy WHEN 'HRM_Qualifications31_Description DESC' THEN [HRM_Qualifications31].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_BloodGroups32_BloodGroupID' THEN [HRM_BloodGroups32].[BloodGroupID] END,
     CASE @orderBy WHEN 'HRM_BloodGroups32_BloodGroupID DESC' THEN [HRM_BloodGroups32].[BloodGroupID] END DESC,
     CASE @orderBy WHEN 'HRM_BloodGroups32_Description' THEN [HRM_BloodGroups32].[Description] END,
     CASE @orderBy WHEN 'HRM_BloodGroups32_Description DESC' THEN [HRM_BloodGroups32].[Description] END DESC,
     CASE @orderBy WHEN 'aspnet_Users33_UserName' THEN [aspnet_Users33].[UserName] END,
     CASE @orderBy WHEN 'aspnet_Users33_UserName DESC' THEN [aspnet_Users33].[UserName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users33_UserFullName' THEN [aspnet_Users33].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users33_UserFullName DESC' THEN [aspnet_Users33].[UserFullName] END DESC 

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
