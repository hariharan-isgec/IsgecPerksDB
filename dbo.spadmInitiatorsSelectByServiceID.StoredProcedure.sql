USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmInitiatorsSelectByServiceID]
  @ServiceID NVarChar(10),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ADM_Initiators].[ServiceID],
		[ADM_Initiators].[InitiatorID],
		[ADM_Services1].[ServiceID] AS ADM_Services1_ServiceID,
		[ADM_Services1].[Description] AS ADM_Services1_Description,
		[ADM_Services1].[OfficeID] AS ADM_Services1_OfficeID,
		[ADM_Services1].[ScheduleID] AS ADM_Services1_ScheduleID,
		[ADM_Services1].[LastSheetDate] AS ADM_Services1_LastSheetDate,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees2].[C_OfficeID] AS HRM_Employees2_C_OfficeID 
  FROM [ADM_Initiators] 
  INNER JOIN [ADM_Services] AS [ADM_Services1]
    ON [ADM_Initiators].[ServiceID] = [ADM_Services1].[ServiceID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ADM_Initiators].[InitiatorID] = [HRM_Employees2].[CardNo]
  WHERE
  [ADM_Initiators].[ServiceID] = @ServiceID
  ORDER BY
     CASE @orderBy WHEN 'ServiceID' THEN [ADM_Initiators].[ServiceID] END,
     CASE @orderBy WHEN 'ServiceID DESC' THEN [ADM_Initiators].[ServiceID] END DESC,
     CASE @orderBy WHEN 'InitiatorID' THEN [ADM_Initiators].[InitiatorID] END,
     CASE @orderBy WHEN 'InitiatorID DESC' THEN [ADM_Initiators].[InitiatorID] END DESC,
     CASE @orderBy WHEN 'ADM_Services1_ServiceID' THEN [ADM_Services1].[ServiceID] END,
     CASE @orderBy WHEN 'ADM_Services1_ServiceID DESC' THEN [ADM_Services1].[ServiceID] END DESC,
     CASE @orderBy WHEN 'ADM_Services1_Description' THEN [ADM_Services1].[Description] END,
     CASE @orderBy WHEN 'ADM_Services1_Description DESC' THEN [ADM_Services1].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_Services1_OfficeID' THEN [ADM_Services1].[OfficeID] END,
     CASE @orderBy WHEN 'ADM_Services1_OfficeID DESC' THEN [ADM_Services1].[OfficeID] END DESC,
     CASE @orderBy WHEN 'ADM_Services1_ScheduleID' THEN [ADM_Services1].[ScheduleID] END,
     CASE @orderBy WHEN 'ADM_Services1_ScheduleID DESC' THEN [ADM_Services1].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'ADM_Services1_LastSheetDate' THEN [ADM_Services1].[LastSheetDate] END,
     CASE @orderBy WHEN 'ADM_Services1_LastSheetDate DESC' THEN [ADM_Services1].[LastSheetDate] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo' THEN [HRM_Employees2].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo DESC' THEN [HRM_Employees2].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID' THEN [HRM_Employees2].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID DESC' THEN [HRM_Employees2].[C_OfficeID] END DESC 
  SET @RecordCount = @@RowCount
GO
