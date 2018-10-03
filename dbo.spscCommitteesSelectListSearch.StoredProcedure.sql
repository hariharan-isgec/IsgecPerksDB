USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscCommitteesSelectListSearch]
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
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [SC_Committees].[SerialNo] FROM [SC_Committees]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions1]
    ON [SC_Committees].[DivisionID] = [HRM_Divisions1].[DivisionID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [SC_Committees].[EmployeeID] = [HRM_Employees2].[CardNo]
 WHERE  
   ( 
         STR(ISNULL([SC_Committees].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Committees].[DivisionID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Committees].[EmployeeID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [SC_Committees].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [SC_Committees].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'IsItUnitLevelCommittee' THEN [SC_Committees].[IsItUnitLevelCommittee] END,
     CASE @OrderBy WHEN 'IsItUnitLevelCommittee DESC' THEN [SC_Committees].[IsItUnitLevelCommittee] END DESC,
     CASE @OrderBy WHEN 'DivisionID' THEN [SC_Committees].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [SC_Committees].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'EmployeeID' THEN [SC_Committees].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [SC_Committees].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions1_Description' THEN [HRM_Divisions1].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions1_Description DESC' THEN [HRM_Divisions1].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SC_Committees].* ,
    [HRM_Divisions1].[Description] AS HRM_Divisions1_Description,
    [HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName 
  FROM [SC_Committees] 
      INNER JOIN #PageIndex
          ON [SC_Committees].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions1]
    ON [SC_Committees].[DivisionID] = [HRM_Divisions1].[DivisionID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [SC_Committees].[EmployeeID] = [HRM_Employees2].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
