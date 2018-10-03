USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwEmployeesSelectListFilteres]
  @Filter_CardNo NVarChar(8),
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies4]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies4].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments7]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments7].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations11]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations11].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions14]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions14].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices22]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices22].[OfficeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[HRM_Employees].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Employees].[CardNo] DESC'
                        WHEN 'EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[HRM_Employees].[EmployeeName] DESC'
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
                        WHEN 'C_DesignationID' THEN '[HRM_Employees].[C_DesignationID]'
                        WHEN 'C_DesignationID DESC' THEN '[HRM_Employees].[C_DesignationID] DESC'
                        WHEN 'ActiveState' THEN '[HRM_Employees].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[HRM_Employees].[ActiveState] DESC'
                        WHEN 'C_DateOfReleaving' THEN '[HRM_Employees].[C_DateOfReleaving]'
                        WHEN 'C_DateOfReleaving DESC' THEN '[HRM_Employees].[C_DateOfReleaving] DESC'
                        WHEN 'DateOfBirth' THEN '[HRM_Employees].[DateOfBirth]'
                        WHEN 'DateOfBirth DESC' THEN '[HRM_Employees].[DateOfBirth] DESC'
                        WHEN 'FatherName' THEN '[HRM_Employees].[FatherName]'
                        WHEN 'FatherName DESC' THEN '[HRM_Employees].[FatherName] DESC'
                        WHEN 'EMailID' THEN '[HRM_Employees].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[HRM_Employees].[EMailID] DESC'
                        WHEN 'HRM_Companies4_Description' THEN '[HRM_Companies4].[Description]'
                        WHEN 'HRM_Companies4_Description DESC' THEN '[HRM_Companies4].[Description] DESC'
                        WHEN 'HRM_Departments7_Description' THEN '[HRM_Departments7].[Description]'
                        WHEN 'HRM_Departments7_Description DESC' THEN '[HRM_Departments7].[Description] DESC'
                        WHEN 'HRM_Designations11_Description' THEN '[HRM_Designations11].[Description]'
                        WHEN 'HRM_Designations11_Description DESC' THEN '[HRM_Designations11].[Description] DESC'
                        WHEN 'HRM_Divisions14_Description' THEN '[HRM_Divisions14].[Description]'
                        WHEN 'HRM_Divisions14_Description DESC' THEN '[HRM_Divisions14].[Description] DESC'
                        WHEN 'HRM_Offices22_Description' THEN '[HRM_Offices22].[Description]'
                        WHEN 'HRM_Offices22_Description DESC' THEN '[HRM_Offices22].[Description] DESC'
                        ELSE '[HRM_Employees].[CardNo]'
                    END
  EXEC (@LGSQL)

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
