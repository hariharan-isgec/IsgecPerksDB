USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmNewEmployeesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @ActiveState Bit,
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
  SET @LGSQL = @LGSQL + 'CardNo'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[HRM_Employees].[CardNo]'  SET @LGSQL = @LGSQL + ' FROM [HRM_Employees] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies8]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies8].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments11]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments11].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Designations] AS [HRM_Designations14]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations14].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions16]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions16].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices25]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices25].[OfficeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[ActiveState] = ''' + CONVERT(NVarChar(10), @ActiveState) + ''''
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
                        WHEN 'HRM_Companies8_CompanyID' THEN '[HRM_Companies8].[CompanyID]'
                        WHEN 'HRM_Companies8_CompanyID DESC' THEN '[HRM_Companies8].[CompanyID] DESC'
                        WHEN 'HRM_Companies8_Description' THEN '[HRM_Companies8].[Description]'
                        WHEN 'HRM_Companies8_Description DESC' THEN '[HRM_Companies8].[Description] DESC'
                        WHEN 'HRM_Companies8_ShortName' THEN '[HRM_Companies8].[ShortName]'
                        WHEN 'HRM_Companies8_ShortName DESC' THEN '[HRM_Companies8].[ShortName] DESC'
                        WHEN 'HRM_Companies8_BaaNID' THEN '[HRM_Companies8].[BaaNID]'
                        WHEN 'HRM_Companies8_BaaNID DESC' THEN '[HRM_Companies8].[BaaNID] DESC'
                        WHEN 'HRM_Departments11_DepartmentID' THEN '[HRM_Departments11].[DepartmentID]'
                        WHEN 'HRM_Departments11_DepartmentID DESC' THEN '[HRM_Departments11].[DepartmentID] DESC'
                        WHEN 'HRM_Departments11_Description' THEN '[HRM_Departments11].[Description]'
                        WHEN 'HRM_Departments11_Description DESC' THEN '[HRM_Departments11].[Description] DESC'
                        WHEN 'HRM_Designations14_DesignationID' THEN '[HRM_Designations14].[DesignationID]'
                        WHEN 'HRM_Designations14_DesignationID DESC' THEN '[HRM_Designations14].[DesignationID] DESC'
                        WHEN 'HRM_Designations14_Description' THEN '[HRM_Designations14].[Description]'
                        WHEN 'HRM_Designations14_Description DESC' THEN '[HRM_Designations14].[Description] DESC'
                        WHEN 'HRM_Designations14_ShortName' THEN '[HRM_Designations14].[ShortName]'
                        WHEN 'HRM_Designations14_ShortName DESC' THEN '[HRM_Designations14].[ShortName] DESC'
                        WHEN 'HRM_Designations14_Sequence' THEN '[HRM_Designations14].[Sequence]'
                        WHEN 'HRM_Designations14_Sequence DESC' THEN '[HRM_Designations14].[Sequence] DESC'
                        WHEN 'HRM_Divisions16_DivisionID' THEN '[HRM_Divisions16].[DivisionID]'
                        WHEN 'HRM_Divisions16_DivisionID DESC' THEN '[HRM_Divisions16].[DivisionID] DESC'
                        WHEN 'HRM_Divisions16_Description' THEN '[HRM_Divisions16].[Description]'
                        WHEN 'HRM_Divisions16_Description DESC' THEN '[HRM_Divisions16].[Description] DESC'
                        WHEN 'HRM_Offices25_OfficeID' THEN '[HRM_Offices25].[OfficeID]'
                        WHEN 'HRM_Offices25_OfficeID DESC' THEN '[HRM_Offices25].[OfficeID] DESC'
                        WHEN 'HRM_Offices25_Description' THEN '[HRM_Offices25].[Description]'
                        WHEN 'HRM_Offices25_Description DESC' THEN '[HRM_Offices25].[Description] DESC'
                        WHEN 'HRM_Offices25_Address' THEN '[HRM_Offices25].[Address]'
                        WHEN 'HRM_Offices25_Address DESC' THEN '[HRM_Offices25].[Address] DESC'
                        WHEN 'HRM_Offices25_City' THEN '[HRM_Offices25].[City]'
                        WHEN 'HRM_Offices25_City DESC' THEN '[HRM_Offices25].[City] DESC'
                        ELSE '[HRM_Employees].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[C_CompanyID],
		[HRM_Employees].[C_DivisionID],
		[HRM_Employees].[C_OfficeID],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[ActiveState],
		[HRM_Companies8].[CompanyID] AS HRM_Companies8_CompanyID,
		[HRM_Companies8].[Description] AS HRM_Companies8_Description,
		[HRM_Companies8].[ShortName] AS HRM_Companies8_ShortName,
		[HRM_Companies8].[BaaNID] AS HRM_Companies8_BaaNID,
		[HRM_Departments11].[DepartmentID] AS HRM_Departments11_DepartmentID,
		[HRM_Departments11].[Description] AS HRM_Departments11_Description,
		[HRM_Designations14].[DesignationID] AS HRM_Designations14_DesignationID,
		[HRM_Designations14].[Description] AS HRM_Designations14_Description,
		[HRM_Designations14].[ShortName] AS HRM_Designations14_ShortName,
		[HRM_Designations14].[Sequence] AS HRM_Designations14_Sequence,
		[HRM_Divisions16].[DivisionID] AS HRM_Divisions16_DivisionID,
		[HRM_Divisions16].[Description] AS HRM_Divisions16_Description,
		[HRM_Offices25].[OfficeID] AS HRM_Offices25_OfficeID,
		[HRM_Offices25].[Description] AS HRM_Offices25_Description,
		[HRM_Offices25].[Address] AS HRM_Offices25_Address,
		[HRM_Offices25].[City] AS HRM_Offices25_City 
  FROM [HRM_Employees] 
    	INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies8]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies8].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments11]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments11].[DepartmentID]
  INNER JOIN [HRM_Designations] AS [HRM_Designations14]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations14].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions16]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions16].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices25]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices25].[OfficeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
