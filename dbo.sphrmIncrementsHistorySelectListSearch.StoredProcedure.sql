USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmIncrementsHistorySelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @Executed Bit,
  @Cancelled Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  IncrementID Int NOT NULL
  )
  INSERT INTO #PageIndex (IncrementID)
  SELECT [HRM_Increments].[IncrementID] FROM [HRM_Increments]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Increments].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_Increments].[ProcessedBy] = [HRM_Employees2].[CardNo]
 WHERE  
      [HRM_Increments].[Executed] = @Executed
  AND [HRM_Increments].[Cancelled] = @Cancelled
   AND ( 
         STR(ISNULL([HRM_Increments].[IncrementID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Increments].[CardNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Increments].[BasicSalary], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Increments].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Increments].[ProcessedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_DesignationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'IncrementID' THEN [HRM_Increments].[IncrementID] END,
     CASE @orderBy WHEN 'IncrementID DESC' THEN [HRM_Increments].[IncrementID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Increments].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Increments].[CardNo] END DESC,
     CASE @orderBy WHEN 'IncrementOn' THEN [HRM_Increments].[IncrementOn] END,
     CASE @orderBy WHEN 'IncrementOn DESC' THEN [HRM_Increments].[IncrementOn] END DESC,
     CASE @orderBy WHEN 'BasicSalary' THEN [HRM_Increments].[BasicSalary] END,
     CASE @orderBy WHEN 'BasicSalary DESC' THEN [HRM_Increments].[BasicSalary] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [HRM_Increments].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [HRM_Increments].[Remarks] END DESC,
     CASE @orderBy WHEN 'Executed' THEN [HRM_Increments].[Executed] END,
     CASE @orderBy WHEN 'Executed DESC' THEN [HRM_Increments].[Executed] END DESC,
     CASE @orderBy WHEN 'Cancelled' THEN [HRM_Increments].[Cancelled] END,
     CASE @orderBy WHEN 'Cancelled DESC' THEN [HRM_Increments].[Cancelled] END DESC,
     CASE @orderBy WHEN 'ProcessedBy' THEN [HRM_Increments].[ProcessedBy] END,
     CASE @orderBy WHEN 'ProcessedBy DESC' THEN [HRM_Increments].[ProcessedBy] END DESC,
     CASE @orderBy WHEN 'ProcessedOn' THEN [HRM_Increments].[ProcessedOn] END,
     CASE @orderBy WHEN 'ProcessedOn DESC' THEN [HRM_Increments].[ProcessedOn] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo' THEN [HRM_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo DESC' THEN [HRM_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DateOfJoining' THEN [HRM_Employees1].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DateOfJoining DESC' THEN [HRM_Employees1].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_CompanyID' THEN [HRM_Employees1].[C_CompanyID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_CompanyID DESC' THEN [HRM_Employees1].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DivisionID' THEN [HRM_Employees1].[C_DivisionID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DivisionID DESC' THEN [HRM_Employees1].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID' THEN [HRM_Employees1].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID DESC' THEN [HRM_Employees1].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DepartmentID' THEN [HRM_Employees1].[C_DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DepartmentID DESC' THEN [HRM_Employees1].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_ProjectSiteID' THEN [HRM_Employees1].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_ProjectSiteID DESC' THEN [HRM_Employees1].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DesignationID' THEN [HRM_Employees1].[C_DesignationID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DesignationID DESC' THEN [HRM_Employees1].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_ActiveState' THEN [HRM_Employees1].[ActiveState] END,
     CASE @orderBy WHEN 'HRM_Employees1_ActiveState DESC' THEN [HRM_Employees1].[ActiveState] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo' THEN [HRM_Employees2].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo DESC' THEN [HRM_Employees2].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DateOfJoining' THEN [HRM_Employees2].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DateOfJoining DESC' THEN [HRM_Employees2].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_CompanyID' THEN [HRM_Employees2].[C_CompanyID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_CompanyID DESC' THEN [HRM_Employees2].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DivisionID' THEN [HRM_Employees2].[C_DivisionID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DivisionID DESC' THEN [HRM_Employees2].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID' THEN [HRM_Employees2].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID DESC' THEN [HRM_Employees2].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DepartmentID' THEN [HRM_Employees2].[C_DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DepartmentID DESC' THEN [HRM_Employees2].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_ProjectSiteID' THEN [HRM_Employees2].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_ProjectSiteID DESC' THEN [HRM_Employees2].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_DesignationID' THEN [HRM_Employees2].[C_DesignationID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_DesignationID DESC' THEN [HRM_Employees2].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_ActiveState' THEN [HRM_Employees2].[ActiveState] END,
     CASE @orderBy WHEN 'HRM_Employees2_ActiveState DESC' THEN [HRM_Employees2].[ActiveState] END DESC 

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
