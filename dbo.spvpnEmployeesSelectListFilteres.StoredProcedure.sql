USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnEmployeesSelectListFilteres]
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
  SET @LGSQL = @LGSQL + 'CardNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[HRM_Employees].[CardNo]'
  SET @LGSQL = @LGSQL + ' FROM [HRM_Employees] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments3].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations4]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations4].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices5]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices5].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects6]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects6].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies1].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions2].[DivisionID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[ActiveState] = ''' + CONVERT(NVarChar(10), @ActiveState) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[HRM_Employees].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Employees].[CardNo] DESC'
                        WHEN 'EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[HRM_Employees].[EmployeeName] DESC'
                        WHEN 'C_CompanyID' THEN '[HRM_Employees].[C_CompanyID]'
                        WHEN 'C_CompanyID DESC' THEN '[HRM_Employees].[C_CompanyID] DESC'
                        WHEN 'C_DivisionID' THEN '[HRM_Employees].[C_DivisionID]'
                        WHEN 'C_DivisionID DESC' THEN '[HRM_Employees].[C_DivisionID] DESC'
                        WHEN 'C_DepartmentID' THEN '[HRM_Employees].[C_DepartmentID]'
                        WHEN 'C_DepartmentID DESC' THEN '[HRM_Employees].[C_DepartmentID] DESC'
                        WHEN 'C_DesignationID' THEN '[HRM_Employees].[C_DesignationID]'
                        WHEN 'C_DesignationID DESC' THEN '[HRM_Employees].[C_DesignationID] DESC'
                        WHEN 'C_OfficeID' THEN '[HRM_Employees].[C_OfficeID]'
                        WHEN 'C_OfficeID DESC' THEN '[HRM_Employees].[C_OfficeID] DESC'
                        WHEN 'C_ProjectSiteID' THEN '[HRM_Employees].[C_ProjectSiteID]'
                        WHEN 'C_ProjectSiteID DESC' THEN '[HRM_Employees].[C_ProjectSiteID] DESC'
                        WHEN 'C_DateOfJoining' THEN '[HRM_Employees].[C_DateOfJoining]'
                        WHEN 'C_DateOfJoining DESC' THEN '[HRM_Employees].[C_DateOfJoining] DESC'
                        WHEN 'ContactNumbers' THEN '[HRM_Employees].[ContactNumbers]'
                        WHEN 'ContactNumbers DESC' THEN '[HRM_Employees].[ContactNumbers] DESC'
                        WHEN 'EMailID' THEN '[HRM_Employees].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[HRM_Employees].[EMailID] DESC'
                        WHEN 'Contractual' THEN '[HRM_Employees].[Contractual]'
                        WHEN 'Contractual DESC' THEN '[HRM_Employees].[Contractual] DESC'
                        WHEN 'ActiveState' THEN '[HRM_Employees].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[HRM_Employees].[ActiveState] DESC'
                        WHEN 'HRM_Departments3_Description' THEN '[HRM_Departments].[Description]'
                        WHEN 'HRM_Departments3_Description DESC' THEN '[HRM_Departments3].[Description] DESC'
                        WHEN 'HRM_Designations4_Description' THEN '[HRM_Designations].[Description]'
                        WHEN 'HRM_Designations4_Description DESC' THEN '[HRM_Designations4].[Description] DESC'
                        WHEN 'HRM_Offices5_Description' THEN '[HRM_Offices].[Description]'
                        WHEN 'HRM_Offices5_Description DESC' THEN '[HRM_Offices5].[Description] DESC'
                        WHEN 'IDM_Projects6_Description' THEN '[IDM_Projects].[Description]'
                        WHEN 'IDM_Projects6_Description DESC' THEN '[IDM_Projects6].[Description] DESC'
                        WHEN 'HRM_Companies1_Description' THEN '[HRM_Companies].[Description]'
                        WHEN 'HRM_Companies1_Description DESC' THEN '[HRM_Companies1].[Description] DESC'
                        WHEN 'HRM_Divisions2_Description' THEN '[HRM_Divisions].[Description]'
                        WHEN 'HRM_Divisions2_Description DESC' THEN '[HRM_Divisions2].[Description] DESC'
                        ELSE '[HRM_Employees].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Employees].[CardNo] ,
		[HRM_Employees].[EmployeeName] ,
		[HRM_Employees].[C_CompanyID] ,
		[HRM_Employees].[C_DivisionID] ,
		[HRM_Employees].[C_DepartmentID] ,
		[HRM_Employees].[C_DesignationID] ,
		[HRM_Employees].[C_OfficeID] ,
		[HRM_Employees].[C_ProjectSiteID] ,
		[HRM_Employees].[C_DateOfJoining] ,
		[HRM_Employees].[ContactNumbers] ,
		[HRM_Employees].[EMailID] ,
		[HRM_Employees].[Contractual] ,
		[HRM_Employees].[ActiveState] ,
		[HRM_Departments3].[Description] AS HRM_Departments3_Description,
		[HRM_Designations4].[Description] AS HRM_Designations4_Description,
		[HRM_Offices5].[Description] AS HRM_Offices5_Description,
		[IDM_Projects6].[Description] AS IDM_Projects6_Description,
		[HRM_Companies1].[Description] AS HRM_Companies1_Description,
		[HRM_Divisions2].[Description] AS HRM_Divisions2_Description 
  FROM [HRM_Employees] 
    	INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments3]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments3].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations4]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations4].[DesignationID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices5]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices5].[OfficeID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects6].[ProjectID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies1]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies1].[CompanyID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions2]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions2].[DivisionID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
