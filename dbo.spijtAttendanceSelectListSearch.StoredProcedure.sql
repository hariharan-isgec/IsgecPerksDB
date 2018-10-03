USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtAttendanceSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @FinYear NVarChar(4),
  @ProjectID NVarChar(6),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,RecordID Int NOT NULL
  )
  INSERT INTO #PageIndex (RecordID)
  SELECT [ATNv_SiteAttendance].[RecordID] FROM [ATNv_SiteAttendance]
  INNER JOIN [ATN_FinYear] AS [ATN_FinYear1]
    ON [ATNv_SiteAttendance].[FinYear] = [ATN_FinYear1].[FinYear]
  INNER JOIN [ATN_Months] AS [ATN_Months2]
    ON [ATNv_SiteAttendance].[DataMonth] = [ATN_Months2].[MonthID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ATNv_SiteAttendance].[CardNo] = [HRM_Employees3].[CardNo]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [ATNv_SiteAttendance].[ProjectID] = [IDM_Projects1].[ProjectID]
 WHERE  
      [ATNv_SiteAttendance].[FinYear] = @FinYear
  AND [ATNv_SiteAttendance].[ProjectID] = @ProjectID
   AND ( 
         STR(ISNULL([ATNv_SiteAttendance].[RecordID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[CardNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATNv_SiteAttendance].[DataMonth], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D5],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D6],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D7],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D8],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D9],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D10],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D11],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D12],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D13],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D14],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D15],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D16],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D17],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D18],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D19],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D20],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D21],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D22],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D23],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D24],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D25],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D26],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D27],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D28],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D29],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D30],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[D31],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATNv_SiteAttendance].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_FinYear1].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_FinYear1].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_Months2].[MonthID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Months2].[ShortName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_Months2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees3].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees3].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[C_ProjectSiteID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects1].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_Projects1].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'RecordID' THEN [ATNv_SiteAttendance].[RecordID] END,
     CASE @orderBy WHEN 'RecordID DESC' THEN [ATNv_SiteAttendance].[RecordID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ATNv_SiteAttendance].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATNv_SiteAttendance].[CardNo] END DESC,
     CASE @orderBy WHEN 'DataMonth' THEN [ATNv_SiteAttendance].[DataMonth] END,
     CASE @orderBy WHEN 'DataMonth DESC' THEN [ATNv_SiteAttendance].[DataMonth] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATNv_SiteAttendance].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATNv_SiteAttendance].[FinYear] END DESC,
     CASE @orderBy WHEN 'D1' THEN [ATNv_SiteAttendance].[D1] END,
     CASE @orderBy WHEN 'D1 DESC' THEN [ATNv_SiteAttendance].[D1] END DESC,
     CASE @orderBy WHEN 'D2' THEN [ATNv_SiteAttendance].[D2] END,
     CASE @orderBy WHEN 'D2 DESC' THEN [ATNv_SiteAttendance].[D2] END DESC,
     CASE @orderBy WHEN 'D3' THEN [ATNv_SiteAttendance].[D3] END,
     CASE @orderBy WHEN 'D3 DESC' THEN [ATNv_SiteAttendance].[D3] END DESC,
     CASE @orderBy WHEN 'D4' THEN [ATNv_SiteAttendance].[D4] END,
     CASE @orderBy WHEN 'D4 DESC' THEN [ATNv_SiteAttendance].[D4] END DESC,
     CASE @orderBy WHEN 'D5' THEN [ATNv_SiteAttendance].[D5] END,
     CASE @orderBy WHEN 'D5 DESC' THEN [ATNv_SiteAttendance].[D5] END DESC,
     CASE @orderBy WHEN 'D6' THEN [ATNv_SiteAttendance].[D6] END,
     CASE @orderBy WHEN 'D6 DESC' THEN [ATNv_SiteAttendance].[D6] END DESC,
     CASE @orderBy WHEN 'D7' THEN [ATNv_SiteAttendance].[D7] END,
     CASE @orderBy WHEN 'D7 DESC' THEN [ATNv_SiteAttendance].[D7] END DESC,
     CASE @orderBy WHEN 'D8' THEN [ATNv_SiteAttendance].[D8] END,
     CASE @orderBy WHEN 'D8 DESC' THEN [ATNv_SiteAttendance].[D8] END DESC,
     CASE @orderBy WHEN 'D9' THEN [ATNv_SiteAttendance].[D9] END,
     CASE @orderBy WHEN 'D9 DESC' THEN [ATNv_SiteAttendance].[D9] END DESC,
     CASE @orderBy WHEN 'D10' THEN [ATNv_SiteAttendance].[D10] END,
     CASE @orderBy WHEN 'D10 DESC' THEN [ATNv_SiteAttendance].[D10] END DESC,
     CASE @orderBy WHEN 'D11' THEN [ATNv_SiteAttendance].[D11] END,
     CASE @orderBy WHEN 'D11 DESC' THEN [ATNv_SiteAttendance].[D11] END DESC,
     CASE @orderBy WHEN 'D12' THEN [ATNv_SiteAttendance].[D12] END,
     CASE @orderBy WHEN 'D12 DESC' THEN [ATNv_SiteAttendance].[D12] END DESC,
     CASE @orderBy WHEN 'D13' THEN [ATNv_SiteAttendance].[D13] END,
     CASE @orderBy WHEN 'D13 DESC' THEN [ATNv_SiteAttendance].[D13] END DESC,
     CASE @orderBy WHEN 'D14' THEN [ATNv_SiteAttendance].[D14] END,
     CASE @orderBy WHEN 'D14 DESC' THEN [ATNv_SiteAttendance].[D14] END DESC,
     CASE @orderBy WHEN 'D15' THEN [ATNv_SiteAttendance].[D15] END,
     CASE @orderBy WHEN 'D15 DESC' THEN [ATNv_SiteAttendance].[D15] END DESC,
     CASE @orderBy WHEN 'D16' THEN [ATNv_SiteAttendance].[D16] END,
     CASE @orderBy WHEN 'D16 DESC' THEN [ATNv_SiteAttendance].[D16] END DESC,
     CASE @orderBy WHEN 'D17' THEN [ATNv_SiteAttendance].[D17] END,
     CASE @orderBy WHEN 'D17 DESC' THEN [ATNv_SiteAttendance].[D17] END DESC,
     CASE @orderBy WHEN 'D18' THEN [ATNv_SiteAttendance].[D18] END,
     CASE @orderBy WHEN 'D18 DESC' THEN [ATNv_SiteAttendance].[D18] END DESC,
     CASE @orderBy WHEN 'D19' THEN [ATNv_SiteAttendance].[D19] END,
     CASE @orderBy WHEN 'D19 DESC' THEN [ATNv_SiteAttendance].[D19] END DESC,
     CASE @orderBy WHEN 'D20' THEN [ATNv_SiteAttendance].[D20] END,
     CASE @orderBy WHEN 'D20 DESC' THEN [ATNv_SiteAttendance].[D20] END DESC,
     CASE @orderBy WHEN 'D21' THEN [ATNv_SiteAttendance].[D21] END,
     CASE @orderBy WHEN 'D21 DESC' THEN [ATNv_SiteAttendance].[D21] END DESC,
     CASE @orderBy WHEN 'D22' THEN [ATNv_SiteAttendance].[D22] END,
     CASE @orderBy WHEN 'D22 DESC' THEN [ATNv_SiteAttendance].[D22] END DESC,
     CASE @orderBy WHEN 'D23' THEN [ATNv_SiteAttendance].[D23] END,
     CASE @orderBy WHEN 'D23 DESC' THEN [ATNv_SiteAttendance].[D23] END DESC,
     CASE @orderBy WHEN 'D24' THEN [ATNv_SiteAttendance].[D24] END,
     CASE @orderBy WHEN 'D24 DESC' THEN [ATNv_SiteAttendance].[D24] END DESC,
     CASE @orderBy WHEN 'D25' THEN [ATNv_SiteAttendance].[D25] END,
     CASE @orderBy WHEN 'D25 DESC' THEN [ATNv_SiteAttendance].[D25] END DESC,
     CASE @orderBy WHEN 'D26' THEN [ATNv_SiteAttendance].[D26] END,
     CASE @orderBy WHEN 'D26 DESC' THEN [ATNv_SiteAttendance].[D26] END DESC,
     CASE @orderBy WHEN 'D27' THEN [ATNv_SiteAttendance].[D27] END,
     CASE @orderBy WHEN 'D27 DESC' THEN [ATNv_SiteAttendance].[D27] END DESC,
     CASE @orderBy WHEN 'D28' THEN [ATNv_SiteAttendance].[D28] END,
     CASE @orderBy WHEN 'D28 DESC' THEN [ATNv_SiteAttendance].[D28] END DESC,
     CASE @orderBy WHEN 'D29' THEN [ATNv_SiteAttendance].[D29] END,
     CASE @orderBy WHEN 'D29 DESC' THEN [ATNv_SiteAttendance].[D29] END DESC,
     CASE @orderBy WHEN 'D30' THEN [ATNv_SiteAttendance].[D30] END,
     CASE @orderBy WHEN 'D30 DESC' THEN [ATNv_SiteAttendance].[D30] END DESC,
     CASE @orderBy WHEN 'D31' THEN [ATNv_SiteAttendance].[D31] END,
     CASE @orderBy WHEN 'D31 DESC' THEN [ATNv_SiteAttendance].[D31] END DESC,
     CASE @orderBy WHEN 'Locked' THEN [ATNv_SiteAttendance].[Locked] END,
     CASE @orderBy WHEN 'Locked DESC' THEN [ATNv_SiteAttendance].[Locked] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ATNv_SiteAttendance].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ATNv_SiteAttendance].[Remarks] END DESC,
     CASE @orderBy WHEN 'ProjectID' THEN [ATNv_SiteAttendance].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [ATNv_SiteAttendance].[ProjectID] END DESC,
     CASE @orderBy WHEN 'ATN_FinYear1_FinYear' THEN [ATN_FinYear1].[FinYear] END,
     CASE @orderBy WHEN 'ATN_FinYear1_FinYear DESC' THEN [ATN_FinYear1].[FinYear] END DESC,
     CASE @orderBy WHEN 'ATN_FinYear1_Description' THEN [ATN_FinYear1].[Description] END,
     CASE @orderBy WHEN 'ATN_FinYear1_Description DESC' THEN [ATN_FinYear1].[Description] END DESC,
     CASE @orderBy WHEN 'ATN_Months2_MonthID' THEN [ATN_Months2].[MonthID] END,
     CASE @orderBy WHEN 'ATN_Months2_MonthID DESC' THEN [ATN_Months2].[MonthID] END DESC,
     CASE @orderBy WHEN 'ATN_Months2_Description' THEN [ATN_Months2].[Description] END,
     CASE @orderBy WHEN 'ATN_Months2_Description DESC' THEN [ATN_Months2].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_CardNo' THEN [HRM_Employees3].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees3_CardNo DESC' THEN [HRM_Employees3].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_EmployeeName' THEN [HRM_Employees3].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees3_EmployeeName DESC' THEN [HRM_Employees3].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'IDM_Projects1_ProjectID' THEN [IDM_Projects1].[ProjectID] END,
     CASE @orderBy WHEN 'IDM_Projects1_ProjectID DESC' THEN [IDM_Projects1].[ProjectID] END DESC,
     CASE @orderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IJT_Attendance].[RecordID],
		[IJT_Attendance].[CardNo],
		[IJT_Attendance].[DataMonth],
		[IJT_Attendance].[FinYear],
		[IJT_Attendance].[D1],
		[IJT_Attendance].[D2],
		[IJT_Attendance].[D3],
		[IJT_Attendance].[D4],
		[IJT_Attendance].[D5],
		[IJT_Attendance].[D6],
		[IJT_Attendance].[D7],
		[IJT_Attendance].[D8],
		[IJT_Attendance].[D9],
		[IJT_Attendance].[D10],
		[IJT_Attendance].[D11],
		[IJT_Attendance].[D12],
		[IJT_Attendance].[D13],
		[IJT_Attendance].[D14],
		[IJT_Attendance].[D15],
		[IJT_Attendance].[D16],
		[IJT_Attendance].[D17],
		[IJT_Attendance].[D18],
		[IJT_Attendance].[D19],
		[IJT_Attendance].[D20],
		[IJT_Attendance].[D21],
		[IJT_Attendance].[D22],
		[IJT_Attendance].[D23],
		[IJT_Attendance].[D24],
		[IJT_Attendance].[D25],
		[IJT_Attendance].[D26],
		[IJT_Attendance].[D27],
		[IJT_Attendance].[D28],
		[IJT_Attendance].[D29],
		[IJT_Attendance].[D30],
		[IJT_Attendance].[D31],
		[IJT_Attendance].[Locked],
		[IJT_Attendance].[Remarks],
		[IJT_Attendance].[ProjectID],
		[ATN_FinYear1].[FinYear] AS ATN_FinYear1_FinYear,
		[ATN_FinYear1].[Description] AS ATN_FinYear1_Description,
		[ATN_Months2].[MonthID] AS ATN_Months2_MonthID,
		[ATN_Months2].[Description] AS ATN_Months2_Description,
		[HRM_Employees3].[CardNo] AS HRM_Employees3_CardNo,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
		[IDM_Projects1].[ProjectID] AS IDM_Projects1_ProjectID,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description 
  FROM [ATNv_SiteAttendance] AS [IJT_Attendance] 
    	INNER JOIN #PageIndex
          ON [IJT_Attendance].[RecordID] = #PageIndex.RecordID
  INNER JOIN [ATN_FinYear] AS [ATN_FinYear1]
    ON [IJT_Attendance].[FinYear] = [ATN_FinYear1].[FinYear]
  INNER JOIN [ATN_Months] AS [ATN_Months2]
    ON [IJT_Attendance].[DataMonth] = [ATN_Months2].[MonthID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [IJT_Attendance].[CardNo] = [HRM_Employees3].[CardNo]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [IJT_Attendance].[ProjectID] = [IDM_Projects1].[ProjectID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
