USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosDepartmentsSelectListSearch]
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
 WHERE  
   ( 
         LOWER(ISNULL([HRM_Departments].[DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DepartmentID' THEN [HRM_Departments].[DepartmentID] END,
     CASE @OrderBy WHEN 'DepartmentID DESC' THEN [HRM_Departments].[DepartmentID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Departments].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Departments].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_Departments].[DepartmentID] ,
		[HRM_Departments].[Description]  
  FROM [HRM_Departments] 
    	INNER JOIN #PageIndex
          ON [HRM_Departments].[DepartmentID] = #PageIndex.DepartmentID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
