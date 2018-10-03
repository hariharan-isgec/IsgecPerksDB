USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAlertToUserSelectByAttenMonth]
  @FinYear NVarChar(4),
  @AttenMonth Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATNv_PendingRegularization].[CardNo],
		[ATNv_PendingRegularization].[AttenMonth],
		[ATNv_PendingRegularization].[EmployeeName],
		[ATNv_PendingRegularization].[SFinalValue],
		[ATNv_PendingRegularization].[Designation_Description],
		[ATNv_PendingRegularization].[Department_Description],
		[ATNv_PendingRegularization].[Office_Description],
		[ATNv_PendingRegularization].[FinYear],
		[ATNv_PendingRegularization].[EMailID],
		[ATN_Months1].[MonthID] AS ATN_Months1_MonthID,
		[ATN_Months1].[Description] AS ATN_Months1_Description,
		[ATN_Months1].[ShortName] AS ATN_Months1_ShortName 
  FROM [ATNv_PendingRegularization] 
  LEFT OUTER JOIN [ATN_Months] AS [ATN_Months1]
    ON [ATNv_PendingRegularization].[AttenMonth] = [ATN_Months1].[MonthID]
  WHERE
  [ATNv_PendingRegularization].[AttenMonth] = @AttenMonth
  AND [ATNv_PendingRegularization].[FinYear] = @FinYear
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [ATNv_PendingRegularization].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATNv_PendingRegularization].[CardNo] END DESC,
     CASE @orderBy WHEN 'AttenMonth' THEN [ATNv_PendingRegularization].[AttenMonth] END,
     CASE @orderBy WHEN 'AttenMonth DESC' THEN [ATNv_PendingRegularization].[AttenMonth] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [ATNv_PendingRegularization].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [ATNv_PendingRegularization].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'SFinalValue' THEN [ATNv_PendingRegularization].[SFinalValue] END,
     CASE @orderBy WHEN 'SFinalValue DESC' THEN [ATNv_PendingRegularization].[SFinalValue] END DESC,
     CASE @orderBy WHEN 'Designation_Description' THEN [ATNv_PendingRegularization].[Designation_Description] END,
     CASE @orderBy WHEN 'Designation_Description DESC' THEN [ATNv_PendingRegularization].[Designation_Description] END DESC,
     CASE @orderBy WHEN 'Department_Description' THEN [ATNv_PendingRegularization].[Department_Description] END,
     CASE @orderBy WHEN 'Department_Description DESC' THEN [ATNv_PendingRegularization].[Department_Description] END DESC,
     CASE @orderBy WHEN 'Office_Description' THEN [ATNv_PendingRegularization].[Office_Description] END,
     CASE @orderBy WHEN 'Office_Description DESC' THEN [ATNv_PendingRegularization].[Office_Description] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATNv_PendingRegularization].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATNv_PendingRegularization].[FinYear] END DESC,
     CASE @orderBy WHEN 'EMailID' THEN [ATNv_PendingRegularization].[EMailID] END,
     CASE @orderBy WHEN 'EMailID DESC' THEN [ATNv_PendingRegularization].[EMailID] END DESC,
     CASE @orderBy WHEN 'ATN_Months1_MonthID' THEN [ATN_Months1].[MonthID] END,
     CASE @orderBy WHEN 'ATN_Months1_MonthID DESC' THEN [ATN_Months1].[MonthID] END DESC,
     CASE @orderBy WHEN 'ATN_Months1_Description' THEN [ATN_Months1].[Description] END,
     CASE @orderBy WHEN 'ATN_Months1_Description DESC' THEN [ATN_Months1].[Description] END DESC,
     CASE @orderBy WHEN 'ATN_Months1_ShortName' THEN [ATN_Months1].[ShortName] END,
     CASE @orderBy WHEN 'ATN_Months1_ShortName DESC' THEN [ATN_Months1].[ShortName] END DESC 
  SET @RecordCount = @@RowCount
GO
