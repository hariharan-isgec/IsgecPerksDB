USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaDepartmentsSelectListSearch]
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
 ,DepartmentID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (DepartmentID)
  SELECT [HRM_Departments].[DepartmentID] FROM [HRM_Departments]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_Departments].[BusinessHead] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Departments].[DepartmentHead] = [HRM_Employees1].[CardNo]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_Departments].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments].[DepartmentHead],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments].[BusinessHead],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments].[DepartmentID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'Description' THEN [HRM_Departments].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Departments].[Description] END DESC,
     CASE @OrderBy WHEN 'DepartmentHead' THEN [HRM_Departments].[DepartmentHead] END,
     CASE @OrderBy WHEN 'DepartmentHead DESC' THEN [HRM_Departments].[DepartmentHead] END DESC,
     CASE @OrderBy WHEN 'BusinessHead' THEN [HRM_Departments].[BusinessHead] END,
     CASE @OrderBy WHEN 'BusinessHead DESC' THEN [HRM_Departments].[BusinessHead] END DESC,
     CASE @OrderBy WHEN 'DepartmentID' THEN [HRM_Departments].[DepartmentID] END,
     CASE @OrderBy WHEN 'DepartmentID DESC' THEN [HRM_Departments].[DepartmentID] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_Departments].[Description] ,
		[HRM_Departments].[DepartmentHead] ,
		[HRM_Departments].[BusinessHead] ,
		[HRM_Departments].[DepartmentID] ,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [HRM_Departments] 
      INNER JOIN #PageIndex
          ON [HRM_Departments].[DepartmentID] = #PageIndex.DepartmentID
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_Departments].[BusinessHead] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Departments].[DepartmentHead] = [HRM_Employees1].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
