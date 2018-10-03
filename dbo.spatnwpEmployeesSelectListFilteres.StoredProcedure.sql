USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnwpEmployeesSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @Filter_C_CompanyID NVarChar(6),
  @Filter_C_DivisionID NVarChar(6),
  @Filter_C_OfficeID Int,
  @Filter_C_DepartmentID NVarChar(6),
  @Filter_C_ProjectSiteID NVarChar(6),
  @Filter_C_DesignationID Int,
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices20]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices20].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects30]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects30].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories34]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[CategoryID] = [TA_Categories34].[CategoryID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[CardNo] = ''' + @Filter_CardNo + ''''
  IF (@Filter_C_CompanyID > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_CompanyID] = ''' + @Filter_C_CompanyID + ''''
  IF (@Filter_C_DivisionID > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_DivisionID] = ''' + @Filter_C_DivisionID + ''''
  IF (@Filter_C_OfficeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_OfficeID] = ' + STR(@Filter_C_OfficeID)
  IF (@Filter_C_DepartmentID > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_DepartmentID] = ''' + @Filter_C_DepartmentID + ''''
  IF (@Filter_C_ProjectSiteID > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_ProjectSiteID] = ''' + @Filter_C_ProjectSiteID + ''''
  IF (@Filter_C_DesignationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_DesignationID] = ' + STR(@Filter_C_DesignationID)
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
                        WHEN 'ActiveState' THEN '[HRM_Employees].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[HRM_Employees].[ActiveState] DESC'
                        WHEN 'Resigned' THEN '[HRM_Employees].[Resigned]'
                        WHEN 'Resigned DESC' THEN '[HRM_Employees].[Resigned] DESC'
                        WHEN 'C_ResignedOn' THEN '[HRM_Employees].[C_ResignedOn]'
                        WHEN 'C_ResignedOn DESC' THEN '[HRM_Employees].[C_ResignedOn] DESC'
                        WHEN 'C_DateOfReleaving' THEN '[HRM_Employees].[C_DateOfReleaving]'
                        WHEN 'C_DateOfReleaving DESC' THEN '[HRM_Employees].[C_DateOfReleaving] DESC'
                        WHEN 'C_ResignedRemark' THEN '[HRM_Employees].[C_ResignedRemark]'
                        WHEN 'C_ResignedRemark DESC' THEN '[HRM_Employees].[C_ResignedRemark] DESC'
                        WHEN 'DateOfBirth' THEN '[HRM_Employees].[DateOfBirth]'
                        WHEN 'DateOfBirth DESC' THEN '[HRM_Employees].[DateOfBirth] DESC'
                        WHEN 'FatherName' THEN '[HRM_Employees].[FatherName]'
                        WHEN 'FatherName DESC' THEN '[HRM_Employees].[FatherName] DESC'
                        WHEN 'ContactNumbers' THEN '[HRM_Employees].[ContactNumbers]'
                        WHEN 'ContactNumbers DESC' THEN '[HRM_Employees].[ContactNumbers] DESC'
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
                        WHEN 'Contractual' THEN '[HRM_Employees].[Contractual]'
                        WHEN 'Contractual DESC' THEN '[HRM_Employees].[Contractual] DESC'
                        WHEN 'CategoryID' THEN '[HRM_Employees].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[HRM_Employees].[CategoryID] DESC'
                        WHEN 'NonTechnical' THEN '[HRM_Employees].[NonTechnical]'
                        WHEN 'NonTechnical DESC' THEN '[HRM_Employees].[NonTechnical] DESC'
                        WHEN 'HRM_Companies2_Description' THEN '[HRM_Companies2].[Description]'
                        WHEN 'HRM_Companies2_Description DESC' THEN '[HRM_Companies2].[Description] DESC'
                        WHEN 'HRM_Departments6_Description' THEN '[HRM_Departments6].[Description]'
                        WHEN 'HRM_Departments6_Description DESC' THEN '[HRM_Departments6].[Description] DESC'
                        WHEN 'HRM_Designations9_Description' THEN '[HRM_Designations9].[Description]'
                        WHEN 'HRM_Designations9_Description DESC' THEN '[HRM_Designations9].[Description] DESC'
                        WHEN 'HRM_Divisions12_Description' THEN '[HRM_Divisions12].[Description]'
                        WHEN 'HRM_Divisions12_Description DESC' THEN '[HRM_Divisions12].[Description] DESC'
                        WHEN 'HRM_Offices20_Description' THEN '[HRM_Offices20].[Description]'
                        WHEN 'HRM_Offices20_Description DESC' THEN '[HRM_Offices20].[Description] DESC'
                        WHEN 'IDM_Projects30_Description' THEN '[IDM_Projects30].[Description]'
                        WHEN 'IDM_Projects30_Description DESC' THEN '[IDM_Projects30].[Description] DESC'
                        WHEN 'TA_Categories34_cmba' THEN '[TA_Categories34].[cmba]'
                        WHEN 'TA_Categories34_cmba DESC' THEN '[TA_Categories34].[cmba] DESC'
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
