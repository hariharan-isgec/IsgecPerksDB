USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spatn_LG_newSiteHrmEmployeesSelectListSearch]
  @LoginID NVarChar(8),
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
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (CardNo)
  SELECT [HRM_Employees].[CardNo] FROM [HRM_Employees]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies2].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments6]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments6].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations9]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations9].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions12]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions12].[DivisionID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees15]
    ON [HRM_Employees].[SiteAllowanceApprover] = [HRM_Employees15].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees16]
    ON [HRM_Employees].[VerifierID] = [HRM_Employees16].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees17]
    ON [HRM_Employees].[ApproverID] = [HRM_Employees17].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees18]
    ON [HRM_Employees].[TAVerifier] = [HRM_Employees18].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees19]
    ON [HRM_Employees].[TAApprover] = [HRM_Employees19].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees20]
    ON [HRM_Employees].[TASanctioningAuthority] = [HRM_Employees20].[CardNo]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices26]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices26].[OfficeID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects36]
    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects36].[ProjectID]
  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories40]
    ON [HRM_Employees].[CategoryID] = [TA_Categories40].[CategoryID]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_Employees].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_DesignationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[Salute],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[Gender],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_BasicSalary], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_ResignedRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_ConfirmationRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[FatherName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ContactNumbers],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[OfficeFileNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[PFNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[PAN],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ModifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ESINumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[VerifierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ApproverID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[SiteAllowanceApprover],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[TAVerifier],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[TASanctioningAuthority],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[TAApprover],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @OrderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @OrderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'C_DivisionID' THEN [HRM_Employees].[C_DivisionID] END,
     CASE @OrderBy WHEN 'C_DivisionID DESC' THEN [HRM_Employees].[C_DivisionID] END DESC,
     CASE @OrderBy WHEN 'C_OfficeID' THEN [HRM_Employees].[C_OfficeID] END,
     CASE @OrderBy WHEN 'C_OfficeID DESC' THEN [HRM_Employees].[C_OfficeID] END DESC,
     CASE @OrderBy WHEN 'C_DepartmentID' THEN [HRM_Employees].[C_DepartmentID] END,
     CASE @OrderBy WHEN 'C_DepartmentID DESC' THEN [HRM_Employees].[C_DepartmentID] END DESC,
     CASE @OrderBy WHEN 'C_DesignationID' THEN [HRM_Employees].[C_DesignationID] END,
     CASE @OrderBy WHEN 'C_DesignationID DESC' THEN [HRM_Employees].[C_DesignationID] END DESC,
     CASE @OrderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @OrderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [HRM_Employees].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [HRM_Employees].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'Salute' THEN [HRM_Employees].[Salute] END,
     CASE @OrderBy WHEN 'Salute DESC' THEN [HRM_Employees].[Salute] END DESC,
     CASE @OrderBy WHEN 'Gender' THEN [HRM_Employees].[Gender] END,
     CASE @OrderBy WHEN 'Gender DESC' THEN [HRM_Employees].[Gender] END DESC,
     CASE @OrderBy WHEN 'C_DateOfJoining' THEN [HRM_Employees].[C_DateOfJoining] END,
     CASE @OrderBy WHEN 'C_DateOfJoining DESC' THEN [HRM_Employees].[C_DateOfJoining] END DESC,
     CASE @OrderBy WHEN 'C_ProjectSiteID' THEN [HRM_Employees].[C_ProjectSiteID] END,
     CASE @OrderBy WHEN 'C_ProjectSiteID DESC' THEN [HRM_Employees].[C_ProjectSiteID] END DESC,
     CASE @OrderBy WHEN 'C_BasicSalary' THEN [HRM_Employees].[C_BasicSalary] END,
     CASE @OrderBy WHEN 'C_BasicSalary DESC' THEN [HRM_Employees].[C_BasicSalary] END DESC,
     CASE @OrderBy WHEN 'C_StatusID' THEN [HRM_Employees].[C_StatusID] END,
     CASE @OrderBy WHEN 'C_StatusID DESC' THEN [HRM_Employees].[C_StatusID] END DESC,
     CASE @OrderBy WHEN 'Resigned' THEN [HRM_Employees].[Resigned] END,
     CASE @OrderBy WHEN 'Resigned DESC' THEN [HRM_Employees].[Resigned] END DESC,
     CASE @OrderBy WHEN 'C_ResignedOn' THEN [HRM_Employees].[C_ResignedOn] END,
     CASE @OrderBy WHEN 'C_ResignedOn DESC' THEN [HRM_Employees].[C_ResignedOn] END DESC,
     CASE @OrderBy WHEN 'C_DateOfReleaving' THEN [HRM_Employees].[C_DateOfReleaving] END,
     CASE @OrderBy WHEN 'C_DateOfReleaving DESC' THEN [HRM_Employees].[C_DateOfReleaving] END DESC,
     CASE @OrderBy WHEN 'C_ResignedRemark' THEN [HRM_Employees].[C_ResignedRemark] END,
     CASE @OrderBy WHEN 'C_ResignedRemark DESC' THEN [HRM_Employees].[C_ResignedRemark] END DESC,
     CASE @OrderBy WHEN 'Confirmed' THEN [HRM_Employees].[Confirmed] END,
     CASE @OrderBy WHEN 'Confirmed DESC' THEN [HRM_Employees].[Confirmed] END DESC,
     CASE @OrderBy WHEN 'C_ConfirmedOn' THEN [HRM_Employees].[C_ConfirmedOn] END,
     CASE @OrderBy WHEN 'C_ConfirmedOn DESC' THEN [HRM_Employees].[C_ConfirmedOn] END DESC,
     CASE @OrderBy WHEN 'C_ConfirmationRemark' THEN [HRM_Employees].[C_ConfirmationRemark] END,
     CASE @OrderBy WHEN 'C_ConfirmationRemark DESC' THEN [HRM_Employees].[C_ConfirmationRemark] END DESC,
     CASE @OrderBy WHEN 'DateOfBirth' THEN [HRM_Employees].[DateOfBirth] END,
     CASE @OrderBy WHEN 'DateOfBirth DESC' THEN [HRM_Employees].[DateOfBirth] END DESC,
     CASE @OrderBy WHEN 'FatherName' THEN [HRM_Employees].[FatherName] END,
     CASE @OrderBy WHEN 'FatherName DESC' THEN [HRM_Employees].[FatherName] END DESC,
     CASE @OrderBy WHEN 'ContactNumbers' THEN [HRM_Employees].[ContactNumbers] END,
     CASE @OrderBy WHEN 'ContactNumbers DESC' THEN [HRM_Employees].[ContactNumbers] END DESC,
     CASE @OrderBy WHEN 'OfficeFileNumber' THEN [HRM_Employees].[OfficeFileNumber] END,
     CASE @OrderBy WHEN 'OfficeFileNumber DESC' THEN [HRM_Employees].[OfficeFileNumber] END DESC,
     CASE @OrderBy WHEN 'PFNumber' THEN [HRM_Employees].[PFNumber] END,
     CASE @OrderBy WHEN 'PFNumber DESC' THEN [HRM_Employees].[PFNumber] END DESC,
     CASE @OrderBy WHEN 'PAN' THEN [HRM_Employees].[PAN] END,
     CASE @OrderBy WHEN 'PAN DESC' THEN [HRM_Employees].[PAN] END DESC,
     CASE @OrderBy WHEN 'ModifiedBy' THEN [HRM_Employees].[ModifiedBy] END,
     CASE @OrderBy WHEN 'ModifiedBy DESC' THEN [HRM_Employees].[ModifiedBy] END DESC,
     CASE @OrderBy WHEN 'Freezed' THEN [HRM_Employees].[Freezed] END,
     CASE @OrderBy WHEN 'Freezed DESC' THEN [HRM_Employees].[Freezed] END DESC,
     CASE @OrderBy WHEN 'ESINumber' THEN [HRM_Employees].[ESINumber] END,
     CASE @OrderBy WHEN 'ESINumber DESC' THEN [HRM_Employees].[ESINumber] END DESC,
     CASE @OrderBy WHEN 'VerifierID' THEN [HRM_Employees].[VerifierID] END,
     CASE @OrderBy WHEN 'VerifierID DESC' THEN [HRM_Employees].[VerifierID] END DESC,
     CASE @OrderBy WHEN 'VerificationRequired' THEN [HRM_Employees].[VerificationRequired] END,
     CASE @OrderBy WHEN 'VerificationRequired DESC' THEN [HRM_Employees].[VerificationRequired] END DESC,
     CASE @OrderBy WHEN 'C_CompanyID' THEN [HRM_Employees].[C_CompanyID] END,
     CASE @OrderBy WHEN 'C_CompanyID DESC' THEN [HRM_Employees].[C_CompanyID] END DESC,
     CASE @OrderBy WHEN 'ApprovalRequired' THEN [HRM_Employees].[ApprovalRequired] END,
     CASE @OrderBy WHEN 'ApprovalRequired DESC' THEN [HRM_Employees].[ApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'ModifiedOn' THEN [HRM_Employees].[ModifiedOn] END,
     CASE @OrderBy WHEN 'ModifiedOn DESC' THEN [HRM_Employees].[ModifiedOn] END DESC,
     CASE @OrderBy WHEN 'EMailID' THEN [HRM_Employees].[EMailID] END,
     CASE @OrderBy WHEN 'EMailID DESC' THEN [HRM_Employees].[EMailID] END DESC,
     CASE @OrderBy WHEN 'ApproverID' THEN [HRM_Employees].[ApproverID] END,
     CASE @OrderBy WHEN 'ApproverID DESC' THEN [HRM_Employees].[ApproverID] END DESC,
     CASE @OrderBy WHEN 'Contractual' THEN [HRM_Employees].[Contractual] END,
     CASE @OrderBy WHEN 'Contractual DESC' THEN [HRM_Employees].[Contractual] END DESC,
     CASE @OrderBy WHEN 'SiteAllowanceApprover' THEN [HRM_Employees].[SiteAllowanceApprover] END,
     CASE @OrderBy WHEN 'SiteAllowanceApprover DESC' THEN [HRM_Employees].[SiteAllowanceApprover] END DESC,
     CASE @OrderBy WHEN 'TASelfApproval' THEN [HRM_Employees].[TASelfApproval] END,
     CASE @OrderBy WHEN 'TASelfApproval DESC' THEN [HRM_Employees].[TASelfApproval] END DESC,
     CASE @OrderBy WHEN 'NonTechnical' THEN [HRM_Employees].[NonTechnical] END,
     CASE @OrderBy WHEN 'NonTechnical DESC' THEN [HRM_Employees].[NonTechnical] END DESC,
     CASE @OrderBy WHEN 'TAVerifier' THEN [HRM_Employees].[TAVerifier] END,
     CASE @OrderBy WHEN 'TAVerifier DESC' THEN [HRM_Employees].[TAVerifier] END DESC,
     CASE @OrderBy WHEN 'TASanctioningAuthority' THEN [HRM_Employees].[TASanctioningAuthority] END,
     CASE @OrderBy WHEN 'TASanctioningAuthority DESC' THEN [HRM_Employees].[TASanctioningAuthority] END DESC,
     CASE @OrderBy WHEN 'TAApprover' THEN [HRM_Employees].[TAApprover] END,
     CASE @OrderBy WHEN 'TAApprover DESC' THEN [HRM_Employees].[TAApprover] END DESC,
     CASE @OrderBy WHEN 'HRM_Companies2_Description' THEN [HRM_Companies2].[Description] END,
     CASE @OrderBy WHEN 'HRM_Companies2_Description DESC' THEN [HRM_Companies2].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments6_Description' THEN [HRM_Departments6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments6_Description DESC' THEN [HRM_Departments6].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Designations9_Description' THEN [HRM_Designations9].[Description] END,
     CASE @OrderBy WHEN 'HRM_Designations9_Description DESC' THEN [HRM_Designations9].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions12_Description' THEN [HRM_Divisions12].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions12_Description DESC' THEN [HRM_Divisions12].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees15_EmployeeName' THEN [HRM_Employees15].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees15_EmployeeName DESC' THEN [HRM_Employees15].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees16_EmployeeName' THEN [HRM_Employees16].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees16_EmployeeName DESC' THEN [HRM_Employees16].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees17_EmployeeName' THEN [HRM_Employees17].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees17_EmployeeName DESC' THEN [HRM_Employees17].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees18_EmployeeName' THEN [HRM_Employees18].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees18_EmployeeName DESC' THEN [HRM_Employees18].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees19_EmployeeName' THEN [HRM_Employees19].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees19_EmployeeName DESC' THEN [HRM_Employees19].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees20_EmployeeName' THEN [HRM_Employees20].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees20_EmployeeName DESC' THEN [HRM_Employees20].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Offices26_Description' THEN [HRM_Offices26].[Description] END,
     CASE @OrderBy WHEN 'HRM_Offices26_Description DESC' THEN [HRM_Offices26].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects36_Description' THEN [IDM_Projects36].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects36_Description DESC' THEN [IDM_Projects36].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_Categories40_CategoryDescription' THEN [TA_Categories40].[CategoryDescription] END,
     CASE @OrderBy WHEN 'TA_Categories40_CategoryDescription DESC' THEN [TA_Categories40].[CategoryDescription] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [HRM_Employees].* ,
    [HRM_Companies2].[Description] AS HRM_Companies2_Description,
    [HRM_Departments6].[Description] AS HRM_Departments6_Description,
    [HRM_Designations9].[Description] AS HRM_Designations9_Description,
    [HRM_Divisions12].[Description] AS HRM_Divisions12_Description,
    [HRM_Employees15].[EmployeeName] AS HRM_Employees15_EmployeeName,
    [HRM_Employees16].[EmployeeName] AS HRM_Employees16_EmployeeName,
    [HRM_Employees17].[EmployeeName] AS HRM_Employees17_EmployeeName,
    [HRM_Employees18].[EmployeeName] AS HRM_Employees18_EmployeeName,
    [HRM_Employees19].[EmployeeName] AS HRM_Employees19_EmployeeName,
    [HRM_Employees20].[EmployeeName] AS HRM_Employees20_EmployeeName,
    [HRM_Offices26].[Description] AS HRM_Offices26_Description,
    [IDM_Projects36].[Description] AS IDM_Projects36_Description,
    [TA_Categories40].[CategoryDescription] AS TA_Categories40_CategoryDescription 
  FROM [HRM_Employees] 
      INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies2].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments6]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments6].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations9]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations9].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions12]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions12].[DivisionID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees15]
    ON [HRM_Employees].[SiteAllowanceApprover] = [HRM_Employees15].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees16]
    ON [HRM_Employees].[VerifierID] = [HRM_Employees16].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees17]
    ON [HRM_Employees].[ApproverID] = [HRM_Employees17].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees18]
    ON [HRM_Employees].[TAVerifier] = [HRM_Employees18].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees19]
    ON [HRM_Employees].[TAApprover] = [HRM_Employees19].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees20]
    ON [HRM_Employees].[TASanctioningAuthority] = [HRM_Employees20].[CardNo]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices26]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices26].[OfficeID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects36]
    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects36].[ProjectID]
  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories40]
    ON [HRM_Employees].[CategoryID] = [TA_Categories40].[CategoryID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
