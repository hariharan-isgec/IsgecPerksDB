USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtAttendanceSelectByID]
  @RecordID Int 
  AS
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
  FROM [IJT_Attendance] 
  INNER JOIN [ATN_FinYear] AS [ATN_FinYear1]
    ON [IJT_Attendance].[FinYear] = [ATN_FinYear1].[FinYear]
  INNER JOIN [ATN_Months] AS [ATN_Months2]
    ON [IJT_Attendance].[DataMonth] = [ATN_Months2].[MonthID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [IJT_Attendance].[CardNo] = [HRM_Employees3].[CardNo]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [IJT_Attendance].[ProjectID] = [IDM_Projects1].[ProjectID]
  WHERE
  [IJT_Attendance].[RecordID] = @RecordID
GO
