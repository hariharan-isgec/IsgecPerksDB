USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnwpEmployeesSelectListSearch]
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
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices20]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices20].[OfficeID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects30]
    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects30].[ProjectID]
  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories34]
    ON [HRM_Employees].[CategoryID] = [TA_Categories34].[CategoryID]
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
     OR LOWER(ISNULL([HRM_Employees].[C_ResignedRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[FatherName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ContactNumbers],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[PFNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ESINumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[PAN],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ModifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ModifiedEvent],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[VerifierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ApproverID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[CategoryID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @OrderBy WHEN 'Salute' THEN [HRM_Employees].[Salute] END,
     CASE @OrderBy WHEN 'Salute DESC' THEN [HRM_Employees].[Salute] END DESC,
     CASE @OrderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @OrderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'AliasName' THEN [HRM_Employees].[AliasName] END,
     CASE @OrderBy WHEN 'AliasName DESC' THEN [HRM_Employees].[AliasName] END DESC,
     CASE @OrderBy WHEN 'Gender' THEN [HRM_Employees].[Gender] END,
     CASE @OrderBy WHEN 'Gender DESC' THEN [HRM_Employees].[Gender] END DESC,
     CASE @OrderBy WHEN 'C_DateOfJoining' THEN [HRM_Employees].[C_DateOfJoining] END,
     CASE @OrderBy WHEN 'C_DateOfJoining DESC' THEN [HRM_Employees].[C_DateOfJoining] END DESC,
     CASE @OrderBy WHEN 'C_CompanyID' THEN [HRM_Employees].[C_CompanyID] END,
     CASE @OrderBy WHEN 'C_CompanyID DESC' THEN [HRM_Employees].[C_CompanyID] END DESC,
     CASE @OrderBy WHEN 'C_DivisionID' THEN [HRM_Employees].[C_DivisionID] END,
     CASE @OrderBy WHEN 'C_DivisionID DESC' THEN [HRM_Employees].[C_DivisionID] END DESC,
     CASE @OrderBy WHEN 'C_OfficeID' THEN [HRM_Employees].[C_OfficeID] END,
     CASE @OrderBy WHEN 'C_OfficeID DESC' THEN [HRM_Employees].[C_OfficeID] END DESC,
     CASE @OrderBy WHEN 'C_DepartmentID' THEN [HRM_Employees].[C_DepartmentID] END,
     CASE @OrderBy WHEN 'C_DepartmentID DESC' THEN [HRM_Employees].[C_DepartmentID] END DESC,
     CASE @OrderBy WHEN 'C_ProjectSiteID' THEN [HRM_Employees].[C_ProjectSiteID] END,
     CASE @OrderBy WHEN 'C_ProjectSiteID DESC' THEN [HRM_Employees].[C_ProjectSiteID] END DESC,
     CASE @OrderBy WHEN 'C_DesignationID' THEN [HRM_Employees].[C_DesignationID] END,
     CASE @OrderBy WHEN 'C_DesignationID DESC' THEN [HRM_Employees].[C_DesignationID] END DESC,
     CASE @OrderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @OrderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @OrderBy WHEN 'Resigned' THEN [HRM_Employees].[Resigned] END,
     CASE @OrderBy WHEN 'Resigned DESC' THEN [HRM_Employees].[Resigned] END DESC,
     CASE @OrderBy WHEN 'C_ResignedOn' THEN [HRM_Employees].[C_ResignedOn] END,
     CASE @OrderBy WHEN 'C_ResignedOn DESC' THEN [HRM_Employees].[C_ResignedOn] END DESC,
     CASE @OrderBy WHEN 'C_DateOfReleaving' THEN [HRM_Employees].[C_DateOfReleaving] END,
     CASE @OrderBy WHEN 'C_DateOfReleaving DESC' THEN [HRM_Employees].[C_DateOfReleaving] END DESC,
     CASE @OrderBy WHEN 'C_ResignedRemark' THEN [HRM_Employees].[C_ResignedRemark] END,
     CASE @OrderBy WHEN 'C_ResignedRemark DESC' THEN [HRM_Employees].[C_ResignedRemark] END DESC,
     CASE @OrderBy WHEN 'DateOfBirth' THEN [HRM_Employees].[DateOfBirth] END,
     CASE @OrderBy WHEN 'DateOfBirth DESC' THEN [HRM_Employees].[DateOfBirth] END DESC,
     CASE @OrderBy WHEN 'FatherName' THEN [HRM_Employees].[FatherName] END,
     CASE @OrderBy WHEN 'FatherName DESC' THEN [HRM_Employees].[FatherName] END DESC,
     CASE @OrderBy WHEN 'ContactNumbers' THEN [HRM_Employees].[ContactNumbers] END,
     CASE @OrderBy WHEN 'ContactNumbers DESC' THEN [HRM_Employees].[ContactNumbers] END DESC,
     CASE @OrderBy WHEN 'PFNumber' THEN [HRM_Employees].[PFNumber] END,
     CASE @OrderBy WHEN 'PFNumber DESC' THEN [HRM_Employees].[PFNumber] END DESC,
     CASE @OrderBy WHEN 'ESINumber' THEN [HRM_Employees].[ESINumber] END,
     CASE @OrderBy WHEN 'ESINumber DESC' THEN [HRM_Employees].[ESINumber] END DESC,
     CASE @OrderBy WHEN 'PAN' THEN [HRM_Employees].[PAN] END,
     CASE @OrderBy WHEN 'PAN DESC' THEN [HRM_Employees].[PAN] END DESC,
     CASE @OrderBy WHEN 'EMailID' THEN [HRM_Employees].[EMailID] END,
     CASE @OrderBy WHEN 'EMailID DESC' THEN [HRM_Employees].[EMailID] END DESC,
     CASE @OrderBy WHEN 'Freezed' THEN [HRM_Employees].[Freezed] END,
     CASE @OrderBy WHEN 'Freezed DESC' THEN [HRM_Employees].[Freezed] END DESC,
     CASE @OrderBy WHEN 'ModifiedBy' THEN [HRM_Employees].[ModifiedBy] END,
     CASE @OrderBy WHEN 'ModifiedBy DESC' THEN [HRM_Employees].[ModifiedBy] END DESC,
     CASE @OrderBy WHEN 'ModifiedOn' THEN [HRM_Employees].[ModifiedOn] END,
     CASE @OrderBy WHEN 'ModifiedOn DESC' THEN [HRM_Employees].[ModifiedOn] END DESC,
     CASE @OrderBy WHEN 'ModifiedEvent' THEN [HRM_Employees].[ModifiedEvent] END,
     CASE @OrderBy WHEN 'ModifiedEvent DESC' THEN [HRM_Employees].[ModifiedEvent] END DESC,
     CASE @OrderBy WHEN 'VerificationRequired' THEN [HRM_Employees].[VerificationRequired] END,
     CASE @OrderBy WHEN 'VerificationRequired DESC' THEN [HRM_Employees].[VerificationRequired] END DESC,
     CASE @OrderBy WHEN 'VerifierID' THEN [HRM_Employees].[VerifierID] END,
     CASE @OrderBy WHEN 'VerifierID DESC' THEN [HRM_Employees].[VerifierID] END DESC,
     CASE @OrderBy WHEN 'ApprovalRequired' THEN [HRM_Employees].[ApprovalRequired] END,
     CASE @OrderBy WHEN 'ApprovalRequired DESC' THEN [HRM_Employees].[ApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'ApproverID' THEN [HRM_Employees].[ApproverID] END,
     CASE @OrderBy WHEN 'ApproverID DESC' THEN [HRM_Employees].[ApproverID] END DESC,
     CASE @OrderBy WHEN 'Contractual' THEN [HRM_Employees].[Contractual] END,
     CASE @OrderBy WHEN 'Contractual DESC' THEN [HRM_Employees].[Contractual] END DESC,
     CASE @OrderBy WHEN 'CategoryID' THEN [HRM_Employees].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [HRM_Employees].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'NonTechnical' THEN [HRM_Employees].[NonTechnical] END,
     CASE @OrderBy WHEN 'NonTechnical DESC' THEN [HRM_Employees].[NonTechnical] END DESC,
     CASE @OrderBy WHEN 'HRM_Companies2_Description' THEN [HRM_Companies2].[Description] END,
     CASE @OrderBy WHEN 'HRM_Companies2_Description DESC' THEN [HRM_Companies2].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments6_Description' THEN [HRM_Departments6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments6_Description DESC' THEN [HRM_Departments6].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Designations9_Description' THEN [HRM_Designations9].[Description] END,
     CASE @OrderBy WHEN 'HRM_Designations9_Description DESC' THEN [HRM_Designations9].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions12_Description' THEN [HRM_Divisions12].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions12_Description DESC' THEN [HRM_Divisions12].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Offices20_Description' THEN [HRM_Offices20].[Description] END,
     CASE @OrderBy WHEN 'HRM_Offices20_Description DESC' THEN [HRM_Offices20].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects30_Description' THEN [IDM_Projects30].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects30_Description DESC' THEN [IDM_Projects30].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_Categories34_cmba' THEN [TA_Categories34].[cmba] END,
     CASE @OrderBy WHEN 'TA_Categories34_cmba DESC' THEN [TA_Categories34].[cmba] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [HRM_Employees].* ,
    [HRM_Companies2].[Description] AS HRM_Companies2_Description,
    [HRM_Departments6].[Description] AS HRM_Departments6_Description,
    [HRM_Designations9].[Description] AS HRM_Designations9_Description,
    [HRM_Divisions12].[Description] AS HRM_Divisions12_Description,
    [HRM_Offices20].[Description] AS HRM_Offices20_Description,
    [IDM_Projects30].[Description] AS IDM_Projects30_Description,
    [TA_Categories34].[cmba] AS TA_Categories34_cmba 
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
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices20]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices20].[OfficeID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects30]
    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects30].[ProjectID]
  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories34]
    ON [HRM_Employees].[CategoryID] = [TA_Categories34].[CategoryID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
