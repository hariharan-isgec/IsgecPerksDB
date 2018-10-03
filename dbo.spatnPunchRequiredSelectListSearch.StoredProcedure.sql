USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchRequiredSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RecordID Int NOT NULL
  )
  INSERT INTO #PageIndex (RecordID)
  SELECT [ATN_PunchRequired].[RecordID] FROM [ATN_PunchRequired]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_PunchRequired].[CardNo] = [HRM_Employees1].[CardNo]
 WHERE  
   ( 
         STR(ISNULL([ATN_PunchRequired].[RecordID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_PunchRequired].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'RecordID' THEN [ATN_PunchRequired].[RecordID] END,
     CASE @orderBy WHEN 'RecordID DESC' THEN [ATN_PunchRequired].[RecordID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ATN_PunchRequired].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATN_PunchRequired].[CardNo] END DESC,
     CASE @orderBy WHEN 'NoPunch' THEN [ATN_PunchRequired].[NoPunch] END,
     CASE @orderBy WHEN 'NoPunch DESC' THEN [ATN_PunchRequired].[NoPunch] END DESC,
     CASE @orderBy WHEN 'OnePunch' THEN [ATN_PunchRequired].[OnePunch] END,
     CASE @orderBy WHEN 'OnePunch DESC' THEN [ATN_PunchRequired].[OnePunch] END DESC,
     CASE @orderBy WHEN 'RuleException' THEN [ATN_PunchRequired].[RuleException] END,
     CASE @orderBy WHEN 'RuleException DESC' THEN [ATN_PunchRequired].[RuleException] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo' THEN [HRM_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo DESC' THEN [HRM_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATN_PunchRequired].[RecordID],
		[ATN_PunchRequired].[CardNo],
		[ATN_PunchRequired].[NoPunch],
		[ATN_PunchRequired].[OnePunch],
		[ATN_PunchRequired].[RuleException],
		[ATN_PunchRequired].[AllLocation],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [ATN_PunchRequired] 
    	INNER JOIN #PageIndex
          ON [ATN_PunchRequired].[RecordID] = #PageIndex.RecordID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_PunchRequired].[CardNo] = [HRM_Employees1].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
