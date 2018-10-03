USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmPRJByEmpSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @HRM_Employees1_ActiveState Bit, 
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, CardNo)
  SELECT [IDM_ProjectsByEmployee].[ProjectID], [IDM_ProjectsByEmployee].[CardNo] FROM [IDM_ProjectsByEmployee]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [IDM_ProjectsByEmployee].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [IDM_ProjectsByEmployee].[ProjectID] = [IDM_Projects2].[ProjectID]
 WHERE  [HRM_Employees1].[ActiveState] = @HRM_Employees1_ActiveState  
   AND ( 
         LOWER(ISNULL([IDM_ProjectsByEmployee].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_ProjectsByEmployee].[CardNo],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ProjectID' THEN [IDM_ProjectsByEmployee].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [IDM_ProjectsByEmployee].[ProjectID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [IDM_ProjectsByEmployee].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [IDM_ProjectsByEmployee].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_ProjectsByEmployee].[ProjectID] ,
		[IDM_ProjectsByEmployee].[CardNo] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [IDM_ProjectsByEmployee] 
    	INNER JOIN #PageIndex
          ON [IDM_ProjectsByEmployee].[ProjectID] = #PageIndex.ProjectID
          AND [IDM_ProjectsByEmployee].[CardNo] = #PageIndex.CardNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [IDM_ProjectsByEmployee].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [IDM_ProjectsByEmployee].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
