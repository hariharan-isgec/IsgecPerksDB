USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwDivisionsSelectListSearch]
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
 ,DivisionID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (DivisionID)
  SELECT [HRM_Divisions].[DivisionID] FROM [HRM_Divisions]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Divisions].[DivisionHead] = [HRM_Employees1].[CardNo]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_Divisions].[DivisionID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions].[DivisionHead],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions].[ERP_EU],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Divisions].[ERP_Div],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DivisionID' THEN [HRM_Divisions].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [HRM_Divisions].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Divisions].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Divisions].[Description] END DESC,
     CASE @OrderBy WHEN 'DivisionHead' THEN [HRM_Divisions].[DivisionHead] END,
     CASE @OrderBy WHEN 'DivisionHead DESC' THEN [HRM_Divisions].[DivisionHead] END DESC,
     CASE @OrderBy WHEN 'ERP_EU' THEN [HRM_Divisions].[ERP_EU] END,
     CASE @OrderBy WHEN 'ERP_EU DESC' THEN [HRM_Divisions].[ERP_EU] END DESC,
     CASE @OrderBy WHEN 'ERP_Div' THEN [HRM_Divisions].[ERP_Div] END,
     CASE @OrderBy WHEN 'ERP_Div DESC' THEN [HRM_Divisions].[ERP_Div] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [HRM_Divisions].* ,
    [HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [HRM_Divisions] 
      INNER JOIN #PageIndex
          ON [HRM_Divisions].[DivisionID] = #PageIndex.DivisionID
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Divisions].[DivisionHead] = [HRM_Employees1].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
