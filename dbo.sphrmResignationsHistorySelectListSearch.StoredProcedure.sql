USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmResignationsHistorySelectListSearch]
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
  ResignID Int NOT NULL
  )
  INSERT INTO #PageIndex (ResignID)
  SELECT [HRM_Resignations].[ResignID] FROM [HRM_Resignations]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Resignations].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [HRM_Status] AS [HRM_Status2]
    ON [HRM_Resignations].[StatusID] = [HRM_Status2].[StatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [HRM_Resignations].[ProcessedBy] = [HRM_Employees3].[CardNo]
 WHERE  
      [HRM_Resignations].[Executed] = @Executed
  AND [HRM_Resignations].[Cancelled] = @Cancelled
   AND ( 
         STR(ISNULL([HRM_Resignations].[ResignID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Resignations].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Resignations].[StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Resignations].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Resignations].[ProcessedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Status2].[StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Status2].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Status2].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees3].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[C_DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees3].[C_DesignationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ResignID' THEN [HRM_Resignations].[ResignID] END,
     CASE @orderBy WHEN 'ResignID DESC' THEN [HRM_Resignations].[ResignID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Resignations].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Resignations].[CardNo] END DESC,
     CASE @orderBy WHEN 'StatusID' THEN [HRM_Resignations].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [HRM_Resignations].[StatusID] END DESC,
     CASE @orderBy WHEN 'ResignedOn' THEN [HRM_Resignations].[ResignedOn] END,
     CASE @orderBy WHEN 'ResignedOn DESC' THEN [HRM_Resignations].[ResignedOn] END DESC,
     CASE @orderBy WHEN 'ReleavedOn' THEN [HRM_Resignations].[ReleavedOn] END,
     CASE @orderBy WHEN 'ReleavedOn DESC' THEN [HRM_Resignations].[ReleavedOn] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [HRM_Resignations].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [HRM_Resignations].[Remarks] END DESC,
     CASE @orderBy WHEN 'Executed' THEN [HRM_Resignations].[Executed] END,
     CASE @orderBy WHEN 'Executed DESC' THEN [HRM_Resignations].[Executed] END DESC,
     CASE @orderBy WHEN 'Cancelled' THEN [HRM_Resignations].[Cancelled] END,
     CASE @orderBy WHEN 'Cancelled DESC' THEN [HRM_Resignations].[Cancelled] END DESC,
     CASE @orderBy WHEN 'ProcessedBy' THEN [HRM_Resignations].[ProcessedBy] END,
     CASE @orderBy WHEN 'ProcessedBy DESC' THEN [HRM_Resignations].[ProcessedBy] END DESC,
     CASE @orderBy WHEN 'ProcessedOn' THEN [HRM_Resignations].[ProcessedOn] END,
     CASE @orderBy WHEN 'ProcessedOn DESC' THEN [HRM_Resignations].[ProcessedOn] END DESC,
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
     CASE @orderBy WHEN 'HRM_Status2_StatusID' THEN [HRM_Status2].[StatusID] END,
     CASE @orderBy WHEN 'HRM_Status2_StatusID DESC' THEN [HRM_Status2].[StatusID] END DESC,
     CASE @orderBy WHEN 'HRM_Status2_Description' THEN [HRM_Status2].[Description] END,
     CASE @orderBy WHEN 'HRM_Status2_Description DESC' THEN [HRM_Status2].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Status2_Sequence' THEN [HRM_Status2].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Status2_Sequence DESC' THEN [HRM_Status2].[Sequence] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_CardNo' THEN [HRM_Employees3].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees3_CardNo DESC' THEN [HRM_Employees3].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_EmployeeName' THEN [HRM_Employees3].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees3_EmployeeName DESC' THEN [HRM_Employees3].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_DateOfJoining' THEN [HRM_Employees3].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_DateOfJoining DESC' THEN [HRM_Employees3].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_CompanyID' THEN [HRM_Employees3].[C_CompanyID] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_CompanyID DESC' THEN [HRM_Employees3].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_DivisionID' THEN [HRM_Employees3].[C_DivisionID] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_DivisionID DESC' THEN [HRM_Employees3].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_OfficeID' THEN [HRM_Employees3].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_OfficeID DESC' THEN [HRM_Employees3].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_DepartmentID' THEN [HRM_Employees3].[C_DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_DepartmentID DESC' THEN [HRM_Employees3].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_ProjectSiteID' THEN [HRM_Employees3].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_ProjectSiteID DESC' THEN [HRM_Employees3].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_DesignationID' THEN [HRM_Employees3].[C_DesignationID] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_DesignationID DESC' THEN [HRM_Employees3].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_ActiveState' THEN [HRM_Employees3].[ActiveState] END,
     CASE @orderBy WHEN 'HRM_Employees3_ActiveState DESC' THEN [HRM_Employees3].[ActiveState] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_Resignations].[ResignID],
		[HRM_Resignations].[CardNo],
		[HRM_Resignations].[StatusID],
		[HRM_Resignations].[ResignedOn],
		[HRM_Resignations].[ReleavedOn],
		[HRM_Resignations].[Remarks],
		[HRM_Resignations].[Executed],
		[HRM_Resignations].[Cancelled],
		[HRM_Resignations].[ProcessedBy],
		[HRM_Resignations].[ProcessedOn],
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
		[HRM_Status2].[StatusID] AS HRM_Status2_StatusID,
		[HRM_Status2].[Description] AS HRM_Status2_Description,
		[HRM_Status2].[Sequence] AS HRM_Status2_Sequence,
		[HRM_Employees3].[CardNo] AS HRM_Employees3_CardNo,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
		[HRM_Employees3].[C_DateOfJoining] AS HRM_Employees3_C_DateOfJoining,
		[HRM_Employees3].[C_CompanyID] AS HRM_Employees3_C_CompanyID,
		[HRM_Employees3].[C_DivisionID] AS HRM_Employees3_C_DivisionID,
		[HRM_Employees3].[C_OfficeID] AS HRM_Employees3_C_OfficeID,
		[HRM_Employees3].[C_DepartmentID] AS HRM_Employees3_C_DepartmentID,
		[HRM_Employees3].[C_ProjectSiteID] AS HRM_Employees3_C_ProjectSiteID,
		[HRM_Employees3].[C_DesignationID] AS HRM_Employees3_C_DesignationID,
		[HRM_Employees3].[ActiveState] AS HRM_Employees3_ActiveState 
  FROM [HRM_Resignations] 
    	INNER JOIN #PageIndex
          ON [HRM_Resignations].[ResignID] = #PageIndex.ResignID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Resignations].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [HRM_Status] AS [HRM_Status2]
    ON [HRM_Resignations].[StatusID] = [HRM_Status2].[StatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [HRM_Resignations].[ProcessedBy] = [HRM_Employees3].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
