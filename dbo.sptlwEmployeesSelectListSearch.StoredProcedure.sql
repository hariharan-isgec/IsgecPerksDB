USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwEmployeesSelectListSearch]
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
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies4]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies4].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments7]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments7].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations11]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations11].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions14]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions14].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices22]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices22].[OfficeID]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_Employees].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[FatherName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EMailID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @OrderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @OrderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
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
     CASE @OrderBy WHEN 'C_DesignationID' THEN [HRM_Employees].[C_DesignationID] END,
     CASE @OrderBy WHEN 'C_DesignationID DESC' THEN [HRM_Employees].[C_DesignationID] END DESC,
     CASE @OrderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @OrderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @OrderBy WHEN 'C_DateOfReleaving' THEN [HRM_Employees].[C_DateOfReleaving] END,
     CASE @OrderBy WHEN 'C_DateOfReleaving DESC' THEN [HRM_Employees].[C_DateOfReleaving] END DESC,
     CASE @OrderBy WHEN 'DateOfBirth' THEN [HRM_Employees].[DateOfBirth] END,
     CASE @OrderBy WHEN 'DateOfBirth DESC' THEN [HRM_Employees].[DateOfBirth] END DESC,
     CASE @OrderBy WHEN 'FatherName' THEN [HRM_Employees].[FatherName] END,
     CASE @OrderBy WHEN 'FatherName DESC' THEN [HRM_Employees].[FatherName] END DESC,
     CASE @OrderBy WHEN 'EMailID' THEN [HRM_Employees].[EMailID] END,
     CASE @OrderBy WHEN 'EMailID DESC' THEN [HRM_Employees].[EMailID] END DESC,
     CASE @OrderBy WHEN 'HRM_Companies4_Description' THEN [HRM_Companies4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Companies4_Description DESC' THEN [HRM_Companies4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments7_Description' THEN [HRM_Departments7].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments7_Description DESC' THEN [HRM_Departments7].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Designations11_Description' THEN [HRM_Designations11].[Description] END,
     CASE @OrderBy WHEN 'HRM_Designations11_Description DESC' THEN [HRM_Designations11].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions14_Description' THEN [HRM_Divisions14].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions14_Description DESC' THEN [HRM_Divisions14].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Offices22_Description' THEN [HRM_Offices22].[Description] END,
     CASE @OrderBy WHEN 'HRM_Offices22_Description DESC' THEN [HRM_Offices22].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [HRM_Employees].* ,
    [HRM_Companies4].[Description] AS HRM_Companies4_Description,
    [HRM_Departments7].[Description] AS HRM_Departments7_Description,
    [HRM_Designations11].[Description] AS HRM_Designations11_Description,
    [HRM_Divisions14].[Description] AS HRM_Divisions14_Description,
    [HRM_Offices22].[Description] AS HRM_Offices22_Description 
  FROM [HRM_Employees] 
      INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies4]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies4].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments7]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments7].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations11]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations11].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions14]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions14].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices22]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices22].[OfficeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
