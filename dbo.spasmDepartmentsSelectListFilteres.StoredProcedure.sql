USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmDepartmentsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,DepartmentID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DepartmentID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[HRM_Departments].[DepartmentID]'  SET @LGSQL = @LGSQL + ' FROM [HRM_Departments] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DepartmentID' THEN '[HRM_Departments].[DepartmentID]'
                        WHEN 'DepartmentID DESC' THEN '[HRM_Departments].[DepartmentID] DESC'
                        WHEN 'Description' THEN '[HRM_Departments].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_Departments].[Description] DESC'
                        ELSE '[HRM_Departments].[DepartmentID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Departments].[DepartmentID],
		[HRM_Departments].[Description] 
  FROM [HRM_Departments] 
    	INNER JOIN #PageIndex
          ON [HRM_Departments].[DepartmentID] = #PageIndex.DepartmentID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
