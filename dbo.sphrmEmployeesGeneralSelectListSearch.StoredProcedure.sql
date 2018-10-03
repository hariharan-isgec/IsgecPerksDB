USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmEmployeesGeneralSelectListSearch]
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
    ON [HRM_Employees].[C_ProjectSiteID] = [DCM_Projects5].[ProjectID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations6]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations6].[DesignationID]
  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status7]
    ON [HRM_Employees].[C_StatusID] = [HRM_Status7].[StatusID]
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
     OR LOWER(ISNULL([HRM_Employees].[EMailID],'')) LIKE @KeyWord1
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
     CASE @orderBy WHEN 'Confirmed' THEN [HRM_Employees].[Confirmed] END,
     CASE @orderBy WHEN 'Confirmed DESC' THEN [HRM_Employees].[Confirmed] END DESC,
     CASE @orderBy WHEN 'C_ConfirmedOn' THEN [HRM_Employees].[C_ConfirmedOn] END,
     CASE @orderBy WHEN 'C_ConfirmedOn DESC' THEN [HRM_Employees].[C_ConfirmedOn] END DESC,
     CASE @orderBy WHEN 'EMailID' THEN [HRM_Employees].[EMailID] END,
     CASE @orderBy WHEN 'EMailID DESC' THEN [HRM_Employees].[EMailID] END DESC,
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
     CASE @orderBy WHEN 'HRM_Status7_Sequence DESC' THEN [HRM_Status7].[Sequence] END DESC 

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
		[HRM_Employees].[Confirmed],
		[HRM_Employees].[C_ConfirmedOn],
		[HRM_Employees].[EMailID],
		[HRM_Employees].[Contractual],
		[HRM_Employees].[ContactNumbers],
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
		[HRM_Status7].[Sequence] AS HRM_Status7_Sequence 
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
    ON [HRM_Employees].[C_ProjectSiteID] = [DCM_Projects5].[ProjectID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations6]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations6].[DesignationID]
  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status7]
    ON [HRM_Employees].[C_StatusID] = [HRM_Status7].[StatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
