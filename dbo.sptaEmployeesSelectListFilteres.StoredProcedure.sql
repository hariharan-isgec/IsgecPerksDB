USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaEmployeesSelectListFilteres]
  @Filter_C_OfficeID Int,
  @Filter_C_DepartmentID NVarChar(6),
  @Filter_C_DesignationID Int,
  @Filter_C_CompanyID NVarChar(6),
  @Filter_C_DivisionID NVarChar(6),
  @Filter_CategoryID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @ActiveState Bit,
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments2].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations3].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions5].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices1].[OfficeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories8]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[CategoryID] = [TA_Categories8].[CategoryID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[ActiveState] = ''' + CONVERT(NVarChar(10), @ActiveState) + ''''
  IF (@Filter_C_OfficeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_OfficeID] = ' + STR(@Filter_C_OfficeID)
  IF (@Filter_C_DepartmentID > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_DepartmentID] = ''' + @Filter_C_DepartmentID + ''''
  IF (@Filter_C_DesignationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_DesignationID] = ' + STR(@Filter_C_DesignationID)
  IF (@Filter_C_CompanyID > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_CompanyID] = ''' + @Filter_C_CompanyID + ''''
  IF (@Filter_C_DivisionID > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[C_DivisionID] = ''' + @Filter_C_DivisionID + ''''
  IF (@Filter_CategoryID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[CategoryID] = ' + STR(@Filter_CategoryID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[HRM_Employees].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Employees].[CardNo] DESC'
                        WHEN 'EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[HRM_Employees].[EmployeeName] DESC'
                        WHEN 'C_OfficeID' THEN '[HRM_Employees].[C_OfficeID]'
                        WHEN 'C_OfficeID DESC' THEN '[HRM_Employees].[C_OfficeID] DESC'
                        WHEN 'C_DepartmentID' THEN '[HRM_Employees].[C_DepartmentID]'
                        WHEN 'C_DepartmentID DESC' THEN '[HRM_Employees].[C_DepartmentID] DESC'
                        WHEN 'C_DesignationID' THEN '[HRM_Employees].[C_DesignationID]'
                        WHEN 'C_DesignationID DESC' THEN '[HRM_Employees].[C_DesignationID] DESC'
                        WHEN 'C_CompanyID' THEN '[HRM_Employees].[C_CompanyID]'
                        WHEN 'C_CompanyID DESC' THEN '[HRM_Employees].[C_CompanyID] DESC'
                        WHEN 'C_DivisionID' THEN '[HRM_Employees].[C_DivisionID]'
                        WHEN 'C_DivisionID DESC' THEN '[HRM_Employees].[C_DivisionID] DESC'
                        WHEN 'ActiveState' THEN '[HRM_Employees].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[HRM_Employees].[ActiveState] DESC'
                        WHEN 'Contractual' THEN '[HRM_Employees].[Contractual]'
                        WHEN 'Contractual DESC' THEN '[HRM_Employees].[Contractual] DESC'
                        WHEN 'EMailID' THEN '[HRM_Employees].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[HRM_Employees].[EMailID] DESC'
                        WHEN 'CategoryID' THEN '[HRM_Employees].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[HRM_Employees].[CategoryID] DESC'
                        WHEN 'NonTechnical' THEN '[HRM_Employees].[NonTechnical]'
                        WHEN 'NonTechnical DESC' THEN '[HRM_Employees].[NonTechnical] DESC'
                        WHEN 'HRM_Companies4_Description' THEN '[HRM_Companies4].[Description]'
                        WHEN 'HRM_Companies4_Description DESC' THEN '[HRM_Companies4].[Description] DESC'
                        WHEN 'HRM_Departments2_Description' THEN '[HRM_Departments2].[Description]'
                        WHEN 'HRM_Departments2_Description DESC' THEN '[HRM_Departments2].[Description] DESC'
                        WHEN 'HRM_Designations3_Description' THEN '[HRM_Designations3].[Description]'
                        WHEN 'HRM_Designations3_Description DESC' THEN '[HRM_Designations3].[Description] DESC'
                        WHEN 'HRM_Divisions5_Description' THEN '[HRM_Divisions5].[Description]'
                        WHEN 'HRM_Divisions5_Description DESC' THEN '[HRM_Divisions5].[Description] DESC'
                        WHEN 'HRM_Offices1_Description' THEN '[HRM_Offices1].[Description]'
                        WHEN 'HRM_Offices1_Description DESC' THEN '[HRM_Offices1].[Description] DESC'
                        ELSE '[HRM_Employees].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Employees].* ,
		[HRM_Companies4].[Description] AS HRM_Companies4_Description,
		[HRM_Departments2].[Description] AS HRM_Departments2_Description,
		[HRM_Designations3].[Description] AS HRM_Designations3_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Offices1].[Description] AS HRM_Offices1_Description,
		[TA_Categories8].[cmba] AS TA_Categories8_cmba 
  FROM [HRM_Employees] 
      INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies4]
    ON [HRM_Employees].[C_CompanyID] = [HRM_Companies4].[CompanyID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments2].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations3]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations3].[DesignationID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [HRM_Employees].[C_DivisionID] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices1].[OfficeID]
  LEFT OUTER JOIN [TA_Categories] AS [TA_Categories8]
    ON [HRM_Employees].[CategoryID] = [TA_Categories8].[CategoryID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
