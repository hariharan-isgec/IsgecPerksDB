USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnewHrmEmployeesSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @Filter_C_OfficeID Int,
  @Filter_C_DepartmentID NVarChar(6),
  @Filter_C_DesignationID Int,
  @Filter_CategoryID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CardNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[HRM_Employees].[CardNo]'
  SET @LGSQL = @LGSQL + ' FROM [HRM_Employees] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies2].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments6]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments6].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations9]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations9].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions12]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions12].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees15]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[SiteAllowanceApprover] = [HRM_Employees15].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees16]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[VerifierID] = [HRM_Employees16].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees17]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[ApproverID] = [HRM_Employees17].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees18]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[TAVerifier] = [HRM_Employees18].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees19]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[TAApprover] = [HRM_Employees19].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees20]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[TASanctioningAuthority] = [HRM_Employees20].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices26]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices26].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects36]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects36].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories40]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[CategoryID] = [TA_Categories40].[CategoryID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[CardNo] = ''' + @Filter_CardNo + ''''
  IF (@Filter_C_OfficeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_OfficeID] = ' + STR(@Filter_C_OfficeID)
  IF (@Filter_C_DepartmentID > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_DepartmentID] = ''' + @Filter_C_DepartmentID + ''''
  IF (@Filter_C_DesignationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_DesignationID] = ' + STR(@Filter_C_DesignationID)
  IF (@Filter_CategoryID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[CategoryID] = ' + STR(@Filter_CategoryID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[HRM_Employees].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Employees].[CardNo] DESC'
                        WHEN 'EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[HRM_Employees].[EmployeeName] DESC'
                        WHEN 'C_DivisionID' THEN '[HRM_Employees].[C_DivisionID]'
                        WHEN 'C_DivisionID DESC' THEN '[HRM_Employees].[C_DivisionID] DESC'
                        WHEN 'C_OfficeID' THEN '[HRM_Employees].[C_OfficeID]'
                        WHEN 'C_OfficeID DESC' THEN '[HRM_Employees].[C_OfficeID] DESC'
                        WHEN 'C_DepartmentID' THEN '[HRM_Employees].[C_DepartmentID]'
                        WHEN 'C_DepartmentID DESC' THEN '[HRM_Employees].[C_DepartmentID] DESC'
                        WHEN 'C_DesignationID' THEN '[HRM_Employees].[C_DesignationID]'
                        WHEN 'C_DesignationID DESC' THEN '[HRM_Employees].[C_DesignationID] DESC'
                        WHEN 'ActiveState' THEN '[HRM_Employees].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[HRM_Employees].[ActiveState] DESC'
                        WHEN 'CategoryID' THEN '[HRM_Employees].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[HRM_Employees].[CategoryID] DESC'
                        WHEN 'Salute' THEN '[HRM_Employees].[Salute]'
                        WHEN 'Salute DESC' THEN '[HRM_Employees].[Salute] DESC'
                        WHEN 'Gender' THEN '[HRM_Employees].[Gender]'
                        WHEN 'Gender DESC' THEN '[HRM_Employees].[Gender] DESC'
                        WHEN 'C_DateOfJoining' THEN '[HRM_Employees].[C_DateOfJoining]'
                        WHEN 'C_DateOfJoining DESC' THEN '[HRM_Employees].[C_DateOfJoining] DESC'
                        WHEN 'C_ProjectSiteID' THEN '[HRM_Employees].[C_ProjectSiteID]'
                        WHEN 'C_ProjectSiteID DESC' THEN '[HRM_Employees].[C_ProjectSiteID] DESC'
                        WHEN 'C_BasicSalary' THEN '[HRM_Employees].[C_BasicSalary]'
                        WHEN 'C_BasicSalary DESC' THEN '[HRM_Employees].[C_BasicSalary] DESC'
                        WHEN 'C_StatusID' THEN '[HRM_Employees].[C_StatusID]'
                        WHEN 'C_StatusID DESC' THEN '[HRM_Employees].[C_StatusID] DESC'
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
                        WHEN 'DateOfBirth' THEN '[HRM_Employees].[DateOfBirth]'
                        WHEN 'DateOfBirth DESC' THEN '[HRM_Employees].[DateOfBirth] DESC'
                        WHEN 'FatherName' THEN '[HRM_Employees].[FatherName]'
                        WHEN 'FatherName DESC' THEN '[HRM_Employees].[FatherName] DESC'
                        WHEN 'ContactNumbers' THEN '[HRM_Employees].[ContactNumbers]'
                        WHEN 'ContactNumbers DESC' THEN '[HRM_Employees].[ContactNumbers] DESC'
                        WHEN 'OfficeFileNumber' THEN '[HRM_Employees].[OfficeFileNumber]'
                        WHEN 'OfficeFileNumber DESC' THEN '[HRM_Employees].[OfficeFileNumber] DESC'
                        WHEN 'PFNumber' THEN '[HRM_Employees].[PFNumber]'
                        WHEN 'PFNumber DESC' THEN '[HRM_Employees].[PFNumber] DESC'
                        WHEN 'PAN' THEN '[HRM_Employees].[PAN]'
                        WHEN 'PAN DESC' THEN '[HRM_Employees].[PAN] DESC'
                        WHEN 'ModifiedBy' THEN '[HRM_Employees].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[HRM_Employees].[ModifiedBy] DESC'
                        WHEN 'Freezed' THEN '[HRM_Employees].[Freezed]'
                        WHEN 'Freezed DESC' THEN '[HRM_Employees].[Freezed] DESC'
                        WHEN 'ESINumber' THEN '[HRM_Employees].[ESINumber]'
                        WHEN 'ESINumber DESC' THEN '[HRM_Employees].[ESINumber] DESC'
                        WHEN 'VerifierID' THEN '[HRM_Employees].[VerifierID]'
                        WHEN 'VerifierID DESC' THEN '[HRM_Employees].[VerifierID] DESC'
                        WHEN 'VerificationRequired' THEN '[HRM_Employees].[VerificationRequired]'
                        WHEN 'VerificationRequired DESC' THEN '[HRM_Employees].[VerificationRequired] DESC'
                        WHEN 'C_CompanyID' THEN '[HRM_Employees].[C_CompanyID]'
                        WHEN 'C_CompanyID DESC' THEN '[HRM_Employees].[C_CompanyID] DESC'
                        WHEN 'ApprovalRequired' THEN '[HRM_Employees].[ApprovalRequired]'
                        WHEN 'ApprovalRequired DESC' THEN '[HRM_Employees].[ApprovalRequired] DESC'
                        WHEN 'ModifiedOn' THEN '[HRM_Employees].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[HRM_Employees].[ModifiedOn] DESC'
                        WHEN 'EMailID' THEN '[HRM_Employees].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[HRM_Employees].[EMailID] DESC'
                        WHEN 'ApproverID' THEN '[HRM_Employees].[ApproverID]'
                        WHEN 'ApproverID DESC' THEN '[HRM_Employees].[ApproverID] DESC'
                        WHEN 'Contractual' THEN '[HRM_Employees].[Contractual]'
                        WHEN 'Contractual DESC' THEN '[HRM_Employees].[Contractual] DESC'
                        WHEN 'SiteAllowanceApprover' THEN '[HRM_Employees].[SiteAllowanceApprover]'
                        WHEN 'SiteAllowanceApprover DESC' THEN '[HRM_Employees].[SiteAllowanceApprover] DESC'
                        WHEN 'TASelfApproval' THEN '[HRM_Employees].[TASelfApproval]'
                        WHEN 'TASelfApproval DESC' THEN '[HRM_Employees].[TASelfApproval] DESC'
                        WHEN 'NonTechnical' THEN '[HRM_Employees].[NonTechnical]'
                        WHEN 'NonTechnical DESC' THEN '[HRM_Employees].[NonTechnical] DESC'
                        WHEN 'TAVerifier' THEN '[HRM_Employees].[TAVerifier]'
                        WHEN 'TAVerifier DESC' THEN '[HRM_Employees].[TAVerifier] DESC'
                        WHEN 'TASanctioningAuthority' THEN '[HRM_Employees].[TASanctioningAuthority]'
                        WHEN 'TASanctioningAuthority DESC' THEN '[HRM_Employees].[TASanctioningAuthority] DESC'
                        WHEN 'TAApprover' THEN '[HRM_Employees].[TAApprover]'
                        WHEN 'TAApprover DESC' THEN '[HRM_Employees].[TAApprover] DESC'
                        WHEN 'HRM_Companies2_Description' THEN '[HRM_Companies2].[Description]'
                        WHEN 'HRM_Companies2_Description DESC' THEN '[HRM_Companies2].[Description] DESC'
                        WHEN 'HRM_Departments6_Description' THEN '[HRM_Departments6].[Description]'
                        WHEN 'HRM_Departments6_Description DESC' THEN '[HRM_Departments6].[Description] DESC'
                        WHEN 'HRM_Designations9_Description' THEN '[HRM_Designations9].[Description]'
                        WHEN 'HRM_Designations9_Description DESC' THEN '[HRM_Designations9].[Description] DESC'
                        WHEN 'HRM_Divisions12_Description' THEN '[HRM_Divisions12].[Description]'
                        WHEN 'HRM_Divisions12_Description DESC' THEN '[HRM_Divisions12].[Description] DESC'
                        WHEN 'HRM_Employees15_EmployeeName' THEN '[HRM_Employees15].[EmployeeName]'
                        WHEN 'HRM_Employees15_EmployeeName DESC' THEN '[HRM_Employees15].[EmployeeName] DESC'
                        WHEN 'HRM_Employees16_EmployeeName' THEN '[HRM_Employees16].[EmployeeName]'
                        WHEN 'HRM_Employees16_EmployeeName DESC' THEN '[HRM_Employees16].[EmployeeName] DESC'
                        WHEN 'HRM_Employees17_EmployeeName' THEN '[HRM_Employees17].[EmployeeName]'
                        WHEN 'HRM_Employees17_EmployeeName DESC' THEN '[HRM_Employees17].[EmployeeName] DESC'
                        WHEN 'HRM_Employees18_EmployeeName' THEN '[HRM_Employees18].[EmployeeName]'
                        WHEN 'HRM_Employees18_EmployeeName DESC' THEN '[HRM_Employees18].[EmployeeName] DESC'
                        WHEN 'HRM_Employees19_EmployeeName' THEN '[HRM_Employees19].[EmployeeName]'
                        WHEN 'HRM_Employees19_EmployeeName DESC' THEN '[HRM_Employees19].[EmployeeName] DESC'
                        WHEN 'HRM_Employees20_EmployeeName' THEN '[HRM_Employees20].[EmployeeName]'
                        WHEN 'HRM_Employees20_EmployeeName DESC' THEN '[HRM_Employees20].[EmployeeName] DESC'
                        WHEN 'HRM_Offices26_Description' THEN '[HRM_Offices26].[Description]'
                        WHEN 'HRM_Offices26_Description DESC' THEN '[HRM_Offices26].[Description] DESC'
                        WHEN 'IDM_Projects36_Description' THEN '[IDM_Projects36].[Description]'
                        WHEN 'IDM_Projects36_Description DESC' THEN '[IDM_Projects36].[Description] DESC'
                        WHEN 'TA_Categories40_CategoryDescription' THEN '[TA_Categories40].[CategoryDescription]'
                        WHEN 'TA_Categories40_CategoryDescription DESC' THEN '[TA_Categories40].[CategoryDescription] DESC'
                        ELSE '[HRM_Employees].[CardNo]'
                    END
  EXEC (@LGSQL)

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
