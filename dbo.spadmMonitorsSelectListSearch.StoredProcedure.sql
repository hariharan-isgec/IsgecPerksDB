USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMonitorsSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ServiceID NVarChar(10) NOT NULL
 ,MonitorID NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (ServiceID, MonitorID)
  SELECT [ADM_Monitors].[ServiceID], [ADM_Monitors].[MonitorID] FROM [ADM_Monitors]
  INNER JOIN [ADM_Services] AS [ADM_Services1]
    ON [ADM_Monitors].[ServiceID] = [ADM_Services1].[ServiceID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ADM_Monitors].[MonitorID] = [HRM_Employees2].[CardNo]
 WHERE  
   ( 
         LOWER(ISNULL([ADM_Monitors].[ServiceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Monitors].[MonitorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Services1].[ServiceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Services1].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_Services1].[OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Services1].[ScheduleID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_DesignationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ServiceID' THEN [ADM_Monitors].[ServiceID] END,
     CASE @orderBy WHEN 'ServiceID DESC' THEN [ADM_Monitors].[ServiceID] END DESC,
     CASE @orderBy WHEN 'MonitorID' THEN [ADM_Monitors].[MonitorID] END,
     CASE @orderBy WHEN 'MonitorID DESC' THEN [ADM_Monitors].[MonitorID] END DESC,
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

  SELECT
		[ADM_Monitors].[ServiceID],
		[ADM_Monitors].[MonitorID],
		[ADM_Services1].[ServiceID] AS ADM_Services1_ServiceID,
		[ADM_Services1].[Description] AS ADM_Services1_Description,
		[ADM_Services1].[OfficeID] AS ADM_Services1_OfficeID,
		[ADM_Services1].[ScheduleID] AS ADM_Services1_ScheduleID,
		[ADM_Services1].[LastSheetDate] AS ADM_Services1_LastSheetDate,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees2].[C_OfficeID] AS HRM_Employees2_C_OfficeID 
  FROM [ADM_Monitors] 
    	INNER JOIN #PageIndex
          ON [ADM_Monitors].[ServiceID] = #PageIndex.ServiceID
          AND [ADM_Monitors].[MonitorID] = #PageIndex.MonitorID
  INNER JOIN [ADM_Services] AS [ADM_Services1]
    ON [ADM_Monitors].[ServiceID] = [ADM_Services1].[ServiceID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ADM_Monitors].[MonitorID] = [HRM_Employees2].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
