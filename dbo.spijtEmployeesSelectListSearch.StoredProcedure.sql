USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtEmployeesSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (CardNo)
  SELECT [HRM_Employees].[CardNo] FROM [HRM_Employees]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments2].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations3]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations3].[DesignationID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices1].[OfficeID]
 WHERE   [HRM_Employees].[C_OfficeID] = 6 
    AND 
   ( 
         LOWER(ISNULL([HRM_Employees].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects4].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects4].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments2].[DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments2].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Designations3].[DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations3].[ShortName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Designations3].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices1].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices1].[City],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'C_DateOfJoining' THEN [HRM_Employees].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'C_DateOfJoining DESC' THEN [HRM_Employees].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'C_OfficeID' THEN [HRM_Employees].[C_OfficeID] END,
     CASE @orderBy WHEN 'C_OfficeID DESC' THEN [HRM_Employees].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'C_DepartmentID' THEN [HRM_Employees].[C_DepartmentID] END,
     CASE @orderBy WHEN 'C_DepartmentID DESC' THEN [HRM_Employees].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'C_DesignationID' THEN [HRM_Employees].[C_DesignationID] END,
     CASE @orderBy WHEN 'C_DesignationID DESC' THEN [HRM_Employees].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'C_ProjectSiteID' THEN [HRM_Employees].[C_ProjectSiteID] END,
     CASE @orderBy WHEN 'C_ProjectSiteID DESC' THEN [HRM_Employees].[C_ProjectSiteID] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @orderBy WHEN 'IDM_Projects4_ProjectID' THEN [IDM_Projects4].[ProjectID] END,
     CASE @orderBy WHEN 'IDM_Projects4_ProjectID DESC' THEN [IDM_Projects4].[ProjectID] END DESC,
     CASE @orderBy WHEN 'IDM_Projects4_Description' THEN [IDM_Projects4].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects4_Description DESC' THEN [IDM_Projects4].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Departments2_DepartmentID' THEN [HRM_Departments2].[DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Departments2_DepartmentID DESC' THEN [HRM_Departments2].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Departments2_Description' THEN [HRM_Departments2].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments2_Description DESC' THEN [HRM_Departments2].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations3_DesignationID' THEN [HRM_Designations3].[DesignationID] END,
     CASE @orderBy WHEN 'HRM_Designations3_DesignationID DESC' THEN [HRM_Designations3].[DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Designations3_Description' THEN [HRM_Designations3].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations3_Description DESC' THEN [HRM_Designations3].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations3_Sequence' THEN [HRM_Designations3].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Designations3_Sequence DESC' THEN [HRM_Designations3].[Sequence] END DESC,
     CASE @orderBy WHEN 'HRM_Offices1_OfficeID' THEN [HRM_Offices1].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices1_OfficeID DESC' THEN [HRM_Offices1].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices1_Description' THEN [HRM_Offices1].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices1_Description DESC' THEN [HRM_Offices1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[C_OfficeID],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[C_ProjectSiteID],
		[HRM_Employees].[ActiveState],
		[IDM_Projects4].[ProjectID] AS IDM_Projects4_ProjectID,
		[IDM_Projects4].[Description] AS IDM_Projects4_Description,
		[HRM_Departments2].[DepartmentID] AS HRM_Departments2_DepartmentID,
		[HRM_Departments2].[Description] AS HRM_Departments2_Description,
		[HRM_Designations3].[DesignationID] AS HRM_Designations3_DesignationID,
		[HRM_Designations3].[Description] AS HRM_Designations3_Description,
		[HRM_Designations3].[Sequence] AS HRM_Designations3_Sequence,
		[HRM_Offices1].[OfficeID] AS HRM_Offices1_OfficeID,
		[HRM_Offices1].[Description] AS HRM_Offices1_Description 
  FROM [HRM_Employees] 
    	INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [HRM_Employees].[C_ProjectSiteID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments2]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments2].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations3]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations3].[DesignationID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]
    ON [HRM_Employees].[C_OfficeID] = [HRM_Offices1].[OfficeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
