USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwDepartmentsSelectListFilteres]
  @Filter_DepartmentID NVarChar(6),
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
 ,DepartmentID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DepartmentID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[HRM_Departments].[DepartmentID]'
  SET @LGSQL = @LGSQL + ' FROM [HRM_Departments] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Departments].[BusinessHead] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Departments].[DepartmentHead] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_DepartmentID > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Departments].[DepartmentID] = ''' + @Filter_DepartmentID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DepartmentID' THEN '[HRM_Departments].[DepartmentID]'
                        WHEN 'DepartmentID DESC' THEN '[HRM_Departments].[DepartmentID] DESC'
                        WHEN 'Description' THEN '[HRM_Departments].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_Departments].[Description] DESC'
                        WHEN 'DepartmentHead' THEN '[HRM_Departments].[DepartmentHead]'
                        WHEN 'DepartmentHead DESC' THEN '[HRM_Departments].[DepartmentHead] DESC'
                        WHEN 'BusinessHead' THEN '[HRM_Departments].[BusinessHead]'
                        WHEN 'BusinessHead DESC' THEN '[HRM_Departments].[BusinessHead] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        ELSE '[HRM_Departments].[DepartmentID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [HRM_Departments].* ,
    [HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
    [HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName 
  FROM [HRM_Departments] 
      INNER JOIN #PageIndex
          ON [HRM_Departments].[DepartmentID] = #PageIndex.DepartmentID
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Departments].[BusinessHead] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [HRM_Departments].[DepartmentHead] = [HRM_Employees2].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
