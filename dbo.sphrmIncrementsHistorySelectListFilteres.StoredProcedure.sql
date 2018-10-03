USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmIncrementsHistorySelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @Executed Bit,
  @Cancelled Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  IncrementID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (IncrementID) ' + 
               'SELECT [HRM_Increments].[IncrementID] FROM [HRM_Increments] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Increments].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Increments].[ProcessedBy] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [HRM_Increments].[Executed] = ''' + CONVERT(NVarChar(10), @Executed) + ''''
  SET @LGSQL = @LGSQL + ' AND [HRM_Increments].[Cancelled] = ''' + CONVERT(NVarChar(10), @Cancelled) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IncrementID' THEN '[HRM_Increments].[IncrementID]'
                        WHEN 'IncrementID DESC' THEN '[HRM_Increments].[IncrementID] DESC'
                        WHEN 'CardNo' THEN '[HRM_Increments].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Increments].[CardNo] DESC'
                        WHEN 'IncrementOn' THEN '[HRM_Increments].[IncrementOn]'
                        WHEN 'IncrementOn DESC' THEN '[HRM_Increments].[IncrementOn] DESC'
                        WHEN 'BasicSalary' THEN '[HRM_Increments].[BasicSalary]'
                        WHEN 'BasicSalary DESC' THEN '[HRM_Increments].[BasicSalary] DESC'
                        WHEN 'Remarks' THEN '[HRM_Increments].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[HRM_Increments].[Remarks] DESC'
                        WHEN 'Executed' THEN '[HRM_Increments].[Executed]'
                        WHEN 'Executed DESC' THEN '[HRM_Increments].[Executed] DESC'
                        WHEN 'Cancelled' THEN '[HRM_Increments].[Cancelled]'
                        WHEN 'Cancelled DESC' THEN '[HRM_Increments].[Cancelled] DESC'
                        WHEN 'ProcessedBy' THEN '[HRM_Increments].[ProcessedBy]'
                        WHEN 'ProcessedBy DESC' THEN '[HRM_Increments].[ProcessedBy] DESC'
                        WHEN 'ProcessedOn' THEN '[HRM_Increments].[ProcessedOn]'
                        WHEN 'ProcessedOn DESC' THEN '[HRM_Increments].[ProcessedOn] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees1_C_DateOfJoining' THEN '[HRM_Employees1].[C_DateOfJoining]'
                        WHEN 'HRM_Employees1_C_DateOfJoining DESC' THEN '[HRM_Employees1].[C_DateOfJoining] DESC'
                        WHEN 'HRM_Employees1_C_CompanyID' THEN '[HRM_Employees1].[C_CompanyID]'
                        WHEN 'HRM_Employees1_C_CompanyID DESC' THEN '[HRM_Employees1].[C_CompanyID] DESC'
                        WHEN 'HRM_Employees1_C_DivisionID' THEN '[HRM_Employees1].[C_DivisionID]'
                        WHEN 'HRM_Employees1_C_DivisionID DESC' THEN '[HRM_Employees1].[C_DivisionID] DESC'
                        WHEN 'HRM_Employees1_C_OfficeID' THEN '[HRM_Employees1].[C_OfficeID]'
                        WHEN 'HRM_Employees1_C_OfficeID DESC' THEN '[HRM_Employees1].[C_OfficeID] DESC'
                        WHEN 'HRM_Employees1_C_DepartmentID' THEN '[HRM_Employees1].[C_DepartmentID]'
                        WHEN 'HRM_Employees1_C_DepartmentID DESC' THEN '[HRM_Employees1].[C_DepartmentID] DESC'
                        WHEN 'HRM_Employees1_C_ProjectSiteID' THEN '[HRM_Employees1].[C_ProjectSiteID]'
                        WHEN 'HRM_Employees1_C_ProjectSiteID DESC' THEN '[HRM_Employees1].[C_ProjectSiteID] DESC'
                        WHEN 'HRM_Employees1_C_DesignationID' THEN '[HRM_Employees1].[C_DesignationID]'
                        WHEN 'HRM_Employees1_C_DesignationID DESC' THEN '[HRM_Employees1].[C_DesignationID] DESC'
                        WHEN 'HRM_Employees1_ActiveState' THEN '[HRM_Employees1].[ActiveState]'
                        WHEN 'HRM_Employees1_ActiveState DESC' THEN '[HRM_Employees1].[ActiveState] DESC'
                        WHEN 'HRM_Employees2_CardNo' THEN '[HRM_Employees2].[CardNo]'
                        WHEN 'HRM_Employees2_CardNo DESC' THEN '[HRM_Employees2].[CardNo] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_C_DateOfJoining' THEN '[HRM_Employees2].[C_DateOfJoining]'
                        WHEN 'HRM_Employees2_C_DateOfJoining DESC' THEN '[HRM_Employees2].[C_DateOfJoining] DESC'
                        WHEN 'HRM_Employees2_C_CompanyID' THEN '[HRM_Employees2].[C_CompanyID]'
                        WHEN 'HRM_Employees2_C_CompanyID DESC' THEN '[HRM_Employees2].[C_CompanyID] DESC'
                        WHEN 'HRM_Employees2_C_DivisionID' THEN '[HRM_Employees2].[C_DivisionID]'
                        WHEN 'HRM_Employees2_C_DivisionID DESC' THEN '[HRM_Employees2].[C_DivisionID] DESC'
                        WHEN 'HRM_Employees2_C_OfficeID' THEN '[HRM_Employees2].[C_OfficeID]'
                        WHEN 'HRM_Employees2_C_OfficeID DESC' THEN '[HRM_Employees2].[C_OfficeID] DESC'
                        WHEN 'HRM_Employees2_C_DepartmentID' THEN '[HRM_Employees2].[C_DepartmentID]'
                        WHEN 'HRM_Employees2_C_DepartmentID DESC' THEN '[HRM_Employees2].[C_DepartmentID] DESC'
                        WHEN 'HRM_Employees2_C_ProjectSiteID' THEN '[HRM_Employees2].[C_ProjectSiteID]'
                        WHEN 'HRM_Employees2_C_ProjectSiteID DESC' THEN '[HRM_Employees2].[C_ProjectSiteID] DESC'
                        WHEN 'HRM_Employees2_C_DesignationID' THEN '[HRM_Employees2].[C_DesignationID]'
                        WHEN 'HRM_Employees2_C_DesignationID DESC' THEN '[HRM_Employees2].[C_DesignationID] DESC'
                        WHEN 'HRM_Employees2_ActiveState' THEN '[HRM_Employees2].[ActiveState]'
                        WHEN 'HRM_Employees2_ActiveState DESC' THEN '[HRM_Employees2].[ActiveState] DESC'
                        ELSE '[HRM_Increments].[IncrementID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Increments].[IncrementID],
		[HRM_Increments].[CardNo],
		[HRM_Increments].[IncrementOn],
		[HRM_Increments].[BasicSalary],
		[HRM_Increments].[Remarks],
		[HRM_Increments].[Executed],
		[HRM_Increments].[Cancelled],
		[HRM_Increments].[ProcessedBy],
		[HRM_Increments].[ProcessedOn],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[C_DateOfJoining] AS HRM_Employees1_C_DateOfJoining,
		[HRM_Employees1].[C_CompanyID] AS HRM_Employees1_C_CompanyID,
		[HRM_Employees1].[C_DivisionID] AS HRM_Employees1_C_DivisionID,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[HRM_Employees1].[C_DepartmentID] AS HRM_Employees1_C_DepartmentID,
		[HRM_Employees1].[C_ProjectSiteID] AS HRM_Employees1_C_ProjectSiteID,
		[HRM_Employees1].[C_DesignationID] AS HRM_Employees1_C_DesignationID,
		[HRM_Employees1].[ActiveState] AS HRM_Employees1_ActiveState,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees2].[C_DateOfJoining] AS HRM_Employees2_C_DateOfJoining,
		[HRM_Employees2].[C_CompanyID] AS HRM_Employees2_C_CompanyID,
		[HRM_Employees2].[C_DivisionID] AS HRM_Employees2_C_DivisionID,
		[HRM_Employees2].[C_OfficeID] AS HRM_Employees2_C_OfficeID,
		[HRM_Employees2].[C_DepartmentID] AS HRM_Employees2_C_DepartmentID,
		[HRM_Employees2].[C_ProjectSiteID] AS HRM_Employees2_C_ProjectSiteID,
		[HRM_Employees2].[C_DesignationID] AS HRM_Employees2_C_DesignationID,
		[HRM_Employees2].[ActiveState] AS HRM_Employees2_ActiveState 
  FROM [HRM_Increments] 
    	INNER JOIN #PageIndex
          ON [HRM_Increments].[IncrementID] = #PageIndex.IncrementID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Increments].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_Increments].[ProcessedBy] = [HRM_Employees2].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
