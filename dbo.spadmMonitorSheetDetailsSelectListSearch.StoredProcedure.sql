USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmMonitorSheetDetailsSelectListSearch]
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
 ,SheetID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SheetID, SerialNo)
  SELECT [ADM_ServiceSheetDetails].[SheetID], [ADM_ServiceSheetDetails].[SerialNo] FROM [ADM_ServiceSheetDetails]
  LEFT OUTER JOIN [ADM_CheckPoints] AS [ADM_CheckPoints1]
    ON [ADM_ServiceSheetDetails].[CheckPointID] = [ADM_CheckPoints1].[CheckPointID]
  LEFT OUTER JOIN [ADM_Measures] AS [ADM_Measures2]
    ON [ADM_ServiceSheetDetails].[MeasureID] = [ADM_Measures2].[MeasureID]
  LEFT OUTER JOIN [ADM_Schedules] AS [ADM_Schedules3]
    ON [ADM_ServiceSheetDetails].[ScheduleID] = [ADM_Schedules3].[ScheduleID]
  LEFT OUTER JOIN [ADM_Services] AS [ADM_Services4]
    ON [ADM_ServiceSheetDetails].[ServiceID] = [ADM_Services4].[ServiceID]
  INNER JOIN [ADM_ServiceSheetHeader] AS [ADM_ServiceSheetHeader5]
    ON [ADM_ServiceSheetDetails].[SheetID] = [ADM_ServiceSheetHeader5].[SheetID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]
    ON [ADM_ServiceSheetDetails].[InitiatedBy] = [HRM_Employees6].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]
    ON [ADM_ServiceSheetDetails].[MonitoredBy] = [HRM_Employees7].[CardNo]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users9]
    ON [ADM_ServiceSheetDetails].[CPInitiator] = [aspnet_users9].[UserName]
 WHERE  
   ( 
         STR(ISNULL([ADM_ServiceSheetDetails].[SheetID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ADM_ServiceSheetDetails].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[ServiceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[ScheduleID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_ServiceSheetDetails].[CheckPointID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ADM_ServiceSheetDetails].[MeasureID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[InitiatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[InitiatorRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[MonitorRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[MonitoredBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_CheckPoints1].[Descriptions],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Measures2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Measures2].[MonitoringMechanism],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Schedules3].[ScheduleID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Schedules3].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_Schedules3].[DaysOrDate], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Services4].[ServiceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Services4].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_Services4].[OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Services4].[ScheduleID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetHeader5].[ServiceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetHeader5].[ScheduleID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetHeader5].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees6].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees6].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees6].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees6].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees6].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees7].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees7].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees7].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees7].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees7].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users9].[UserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_users9].[UserFullName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'SheetID' THEN [ADM_ServiceSheetDetails].[SheetID] END,
     CASE @orderBy WHEN 'SheetID DESC' THEN [ADM_ServiceSheetDetails].[SheetID] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [ADM_ServiceSheetDetails].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [ADM_ServiceSheetDetails].[SerialNo] END DESC,
     CASE @orderBy WHEN 'SheetDate' THEN [ADM_ServiceSheetDetails].[SheetDate] END,
     CASE @orderBy WHEN 'SheetDate DESC' THEN [ADM_ServiceSheetDetails].[SheetDate] END DESC,
     CASE @orderBy WHEN 'ServiceID' THEN [ADM_ServiceSheetDetails].[ServiceID] END,
     CASE @orderBy WHEN 'ServiceID DESC' THEN [ADM_ServiceSheetDetails].[ServiceID] END DESC,
     CASE @orderBy WHEN 'ScheduleID' THEN [ADM_ServiceSheetDetails].[ScheduleID] END,
     CASE @orderBy WHEN 'ScheduleID DESC' THEN [ADM_ServiceSheetDetails].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'CheckPointID' THEN [ADM_ServiceSheetDetails].[CheckPointID] END,
     CASE @orderBy WHEN 'CheckPointID DESC' THEN [ADM_ServiceSheetDetails].[CheckPointID] END DESC,
     CASE @orderBy WHEN 'MeasureID' THEN [ADM_ServiceSheetDetails].[MeasureID] END,
     CASE @orderBy WHEN 'MeasureID DESC' THEN [ADM_ServiceSheetDetails].[MeasureID] END DESC,
     CASE @orderBy WHEN 'Initiated' THEN [ADM_ServiceSheetDetails].[Initiated] END,
     CASE @orderBy WHEN 'Initiated DESC' THEN [ADM_ServiceSheetDetails].[Initiated] END DESC,
     CASE @orderBy WHEN 'InitiatedBy' THEN [ADM_ServiceSheetDetails].[InitiatedBy] END,
     CASE @orderBy WHEN 'InitiatedBy DESC' THEN [ADM_ServiceSheetDetails].[InitiatedBy] END DESC,
     CASE @orderBy WHEN 'InitiatedOn' THEN [ADM_ServiceSheetDetails].[InitiatedOn] END,
     CASE @orderBy WHEN 'InitiatedOn DESC' THEN [ADM_ServiceSheetDetails].[InitiatedOn] END DESC,
     CASE @orderBy WHEN 'InitiatorRemarks' THEN [ADM_ServiceSheetDetails].[InitiatorRemarks] END,
     CASE @orderBy WHEN 'InitiatorRemarks DESC' THEN [ADM_ServiceSheetDetails].[InitiatorRemarks] END DESC,
     CASE @orderBy WHEN 'ProblemIdentified' THEN [ADM_ServiceSheetDetails].[ProblemIdentified] END,
     CASE @orderBy WHEN 'ProblemIdentified DESC' THEN [ADM_ServiceSheetDetails].[ProblemIdentified] END DESC,
     CASE @orderBy WHEN 'MonitorRemarks' THEN [ADM_ServiceSheetDetails].[MonitorRemarks] END,
     CASE @orderBy WHEN 'MonitorRemarks DESC' THEN [ADM_ServiceSheetDetails].[MonitorRemarks] END DESC,
     CASE @orderBy WHEN 'MonitoredBy' THEN [ADM_ServiceSheetDetails].[MonitoredBy] END,
     CASE @orderBy WHEN 'MonitoredBy DESC' THEN [ADM_ServiceSheetDetails].[MonitoredBy] END DESC,
     CASE @orderBy WHEN 'MonitoredOn' THEN [ADM_ServiceSheetDetails].[MonitoredOn] END,
     CASE @orderBy WHEN 'MonitoredOn DESC' THEN [ADM_ServiceSheetDetails].[MonitoredOn] END DESC,
     CASE @orderBy WHEN 'Monitored' THEN [ADM_ServiceSheetDetails].[Monitored] END,
     CASE @orderBy WHEN 'Monitored DESC' THEN [ADM_ServiceSheetDetails].[Monitored] END DESC,
     CASE @orderBy WHEN 'ProblemClosed' THEN [ADM_ServiceSheetDetails].[ProblemClosed] END,
     CASE @orderBy WHEN 'ProblemClosed DESC' THEN [ADM_ServiceSheetDetails].[ProblemClosed] END DESC,
     CASE @orderBy WHEN 'ADM_CheckPoints1_CheckPointID' THEN [ADM_CheckPoints1].[CheckPointID] END,
     CASE @orderBy WHEN 'ADM_CheckPoints1_CheckPointID DESC' THEN [ADM_CheckPoints1].[CheckPointID] END DESC,
     CASE @orderBy WHEN 'ADM_CheckPoints1_Descriptions' THEN [ADM_CheckPoints1].[Descriptions] END,
     CASE @orderBy WHEN 'ADM_CheckPoints1_Descriptions DESC' THEN [ADM_CheckPoints1].[Descriptions] END DESC,
     CASE @orderBy WHEN 'ADM_Measures2_MeasureID' THEN [ADM_Measures2].[MeasureID] END,
     CASE @orderBy WHEN 'ADM_Measures2_MeasureID DESC' THEN [ADM_Measures2].[MeasureID] END DESC,
     CASE @orderBy WHEN 'ADM_Measures2_Description' THEN [ADM_Measures2].[Description] END,
     CASE @orderBy WHEN 'ADM_Measures2_Description DESC' THEN [ADM_Measures2].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_Measures2_MonitoringMechanism' THEN [ADM_Measures2].[MonitoringMechanism] END,
     CASE @orderBy WHEN 'ADM_Measures2_MonitoringMechanism DESC' THEN [ADM_Measures2].[MonitoringMechanism] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules3_ScheduleID' THEN [ADM_Schedules3].[ScheduleID] END,
     CASE @orderBy WHEN 'ADM_Schedules3_ScheduleID DESC' THEN [ADM_Schedules3].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules3_Description' THEN [ADM_Schedules3].[Description] END,
     CASE @orderBy WHEN 'ADM_Schedules3_Description DESC' THEN [ADM_Schedules3].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules3_FixDate' THEN [ADM_Schedules3].[FixDate] END,
     CASE @orderBy WHEN 'ADM_Schedules3_FixDate DESC' THEN [ADM_Schedules3].[FixDate] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules3_DaysOrDate' THEN [ADM_Schedules3].[DaysOrDate] END,
     CASE @orderBy WHEN 'ADM_Schedules3_DaysOrDate DESC' THEN [ADM_Schedules3].[DaysOrDate] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules3_IncludeHolidays' THEN [ADM_Schedules3].[IncludeHolidays] END,
     CASE @orderBy WHEN 'ADM_Schedules3_IncludeHolidays DESC' THEN [ADM_Schedules3].[IncludeHolidays] END DESC,
     CASE @orderBy WHEN 'ADM_Services4_ServiceID' THEN [ADM_Services4].[ServiceID] END,
     CASE @orderBy WHEN 'ADM_Services4_ServiceID DESC' THEN [ADM_Services4].[ServiceID] END DESC,
     CASE @orderBy WHEN 'ADM_Services4_Description' THEN [ADM_Services4].[Description] END,
     CASE @orderBy WHEN 'ADM_Services4_Description DESC' THEN [ADM_Services4].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_Services4_OfficeID' THEN [ADM_Services4].[OfficeID] END,
     CASE @orderBy WHEN 'ADM_Services4_OfficeID DESC' THEN [ADM_Services4].[OfficeID] END DESC,
     CASE @orderBy WHEN 'ADM_Services4_ScheduleID' THEN [ADM_Services4].[ScheduleID] END,
     CASE @orderBy WHEN 'ADM_Services4_ScheduleID DESC' THEN [ADM_Services4].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'ADM_Services4_LastSheetDate' THEN [ADM_Services4].[LastSheetDate] END,
     CASE @orderBy WHEN 'ADM_Services4_LastSheetDate DESC' THEN [ADM_Services4].[LastSheetDate] END DESC,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_SheetID' THEN [ADM_ServiceSheetHeader5].[SheetID] END,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_SheetID DESC' THEN [ADM_ServiceSheetHeader5].[SheetID] END DESC,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_SheetDate' THEN [ADM_ServiceSheetHeader5].[SheetDate] END,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_SheetDate DESC' THEN [ADM_ServiceSheetHeader5].[SheetDate] END DESC,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_ServiceID' THEN [ADM_ServiceSheetHeader5].[ServiceID] END,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_ServiceID DESC' THEN [ADM_ServiceSheetHeader5].[ServiceID] END DESC,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_ScheduleID' THEN [ADM_ServiceSheetHeader5].[ScheduleID] END,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_ScheduleID DESC' THEN [ADM_ServiceSheetHeader5].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_Description' THEN [ADM_ServiceSheetHeader5].[Description] END,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_Description DESC' THEN [ADM_ServiceSheetHeader5].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_Initiated' THEN [ADM_ServiceSheetHeader5].[Initiated] END,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_Initiated DESC' THEN [ADM_ServiceSheetHeader5].[Initiated] END DESC,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_Monitored' THEN [ADM_ServiceSheetHeader5].[Monitored] END,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_Monitored DESC' THEN [ADM_ServiceSheetHeader5].[Monitored] END DESC,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_ProblemIdentified' THEN [ADM_ServiceSheetHeader5].[ProblemIdentified] END,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_ProblemIdentified DESC' THEN [ADM_ServiceSheetHeader5].[ProblemIdentified] END DESC,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_Closed' THEN [ADM_ServiceSheetHeader5].[Closed] END,
     CASE @orderBy WHEN 'ADM_ServiceSheetHeader5_Closed DESC' THEN [ADM_ServiceSheetHeader5].[Closed] END DESC,
     CASE @orderBy WHEN 'HRM_Employees6_CardNo' THEN [HRM_Employees6].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees6_CardNo DESC' THEN [HRM_Employees6].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees6_EmployeeName' THEN [HRM_Employees6].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees6_EmployeeName DESC' THEN [HRM_Employees6].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees6_C_OfficeID' THEN [HRM_Employees6].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees6_C_OfficeID DESC' THEN [HRM_Employees6].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees7_CardNo' THEN [HRM_Employees7].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees7_CardNo DESC' THEN [HRM_Employees7].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees7_EmployeeName' THEN [HRM_Employees7].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees7_EmployeeName DESC' THEN [HRM_Employees7].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees7_C_OfficeID' THEN [HRM_Employees7].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees7_C_OfficeID DESC' THEN [HRM_Employees7].[C_OfficeID] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ADM_ServiceSheetDetails].[SheetID],
		[ADM_ServiceSheetDetails].[SerialNo],
		[ADM_ServiceSheetDetails].[SheetDate],
		[ADM_ServiceSheetDetails].[ServiceID],
		[ADM_ServiceSheetDetails].[ScheduleID],
		[ADM_ServiceSheetDetails].[CheckPointID],
		[ADM_ServiceSheetDetails].[MeasureID],
		[ADM_ServiceSheetDetails].[Initiated],
		[ADM_ServiceSheetDetails].[InitiatedBy],
		[ADM_ServiceSheetDetails].[InitiatedOn],
		[ADM_ServiceSheetDetails].[InitiatorRemarks],
		[ADM_ServiceSheetDetails].[ProblemIdentified],
		[ADM_ServiceSheetDetails].[MonitorRemarks],
		[ADM_ServiceSheetDetails].[MonitoredBy],
		[ADM_ServiceSheetDetails].[MonitoredOn],
		[ADM_ServiceSheetDetails].[Monitored],
		[ADM_ServiceSheetDetails].[ProblemClosed],
		[ADM_ServiceSheetDetails].[CPInitiator],
		[ADM_CheckPoints1].[CheckPointID] AS ADM_CheckPoints1_CheckPointID,
		[ADM_CheckPoints1].[Descriptions] AS ADM_CheckPoints1_Descriptions,
		[ADM_Measures2].[MeasureID] AS ADM_Measures2_MeasureID,
		[ADM_Measures2].[Description] AS ADM_Measures2_Description,
		[ADM_Measures2].[MonitoringMechanism] AS ADM_Measures2_MonitoringMechanism,
		[ADM_Schedules3].[ScheduleID] AS ADM_Schedules3_ScheduleID,
		[ADM_Schedules3].[Description] AS ADM_Schedules3_Description,
		[ADM_Schedules3].[FixDate] AS ADM_Schedules3_FixDate,
		[ADM_Schedules3].[DaysOrDate] AS ADM_Schedules3_DaysOrDate,
		[ADM_Schedules3].[IncludeHolidays] AS ADM_Schedules3_IncludeHolidays,
		[ADM_Services4].[ServiceID] AS ADM_Services4_ServiceID,
		[ADM_Services4].[Description] AS ADM_Services4_Description,
		[ADM_Services4].[OfficeID] AS ADM_Services4_OfficeID,
		[ADM_Services4].[ScheduleID] AS ADM_Services4_ScheduleID,
		[ADM_Services4].[LastSheetDate] AS ADM_Services4_LastSheetDate,
		[ADM_ServiceSheetHeader5].[SheetID] AS ADM_ServiceSheetHeader5_SheetID,
		[ADM_ServiceSheetHeader5].[SheetDate] AS ADM_ServiceSheetHeader5_SheetDate,
		[ADM_ServiceSheetHeader5].[ServiceID] AS ADM_ServiceSheetHeader5_ServiceID,
		[ADM_ServiceSheetHeader5].[ScheduleID] AS ADM_ServiceSheetHeader5_ScheduleID,
		[ADM_ServiceSheetHeader5].[Description] AS ADM_ServiceSheetHeader5_Description,
		[ADM_ServiceSheetHeader5].[Initiated] AS ADM_ServiceSheetHeader5_Initiated,
		[ADM_ServiceSheetHeader5].[Monitored] AS ADM_ServiceSheetHeader5_Monitored,
		[ADM_ServiceSheetHeader5].[ProblemIdentified] AS ADM_ServiceSheetHeader5_ProblemIdentified,
		[ADM_ServiceSheetHeader5].[Closed] AS ADM_ServiceSheetHeader5_Closed,
		[HRM_Employees6].[CardNo] AS HRM_Employees6_CardNo,
		[HRM_Employees6].[EmployeeName] AS HRM_Employees6_EmployeeName,
		[HRM_Employees6].[C_OfficeID] AS HRM_Employees6_C_OfficeID,
		[HRM_Employees7].[CardNo] AS HRM_Employees7_CardNo,
		[HRM_Employees7].[EmployeeName] AS HRM_Employees7_EmployeeName,
		[HRM_Employees7].[C_OfficeID] AS HRM_Employees7_C_OfficeID, 
		[aspnet_users9].[UserName] AS aspnet_users9_UserName,
		[aspnet_users9].[UserFullName] AS aspnet_users9_UserFullName 
  FROM [ADM_ServiceSheetDetails] 
    	INNER JOIN #PageIndex
          ON [ADM_ServiceSheetDetails].[SheetID] = #PageIndex.SheetID
          AND [ADM_ServiceSheetDetails].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [ADM_CheckPoints] AS [ADM_CheckPoints1]
    ON [ADM_ServiceSheetDetails].[CheckPointID] = [ADM_CheckPoints1].[CheckPointID]
  LEFT OUTER JOIN [ADM_Measures] AS [ADM_Measures2]
    ON [ADM_ServiceSheetDetails].[MeasureID] = [ADM_Measures2].[MeasureID]
  LEFT OUTER JOIN [ADM_Schedules] AS [ADM_Schedules3]
    ON [ADM_ServiceSheetDetails].[ScheduleID] = [ADM_Schedules3].[ScheduleID]
  LEFT OUTER JOIN [ADM_Services] AS [ADM_Services4]
    ON [ADM_ServiceSheetDetails].[ServiceID] = [ADM_Services4].[ServiceID]
  INNER JOIN [ADM_ServiceSheetHeader] AS [ADM_ServiceSheetHeader5]
    ON [ADM_ServiceSheetDetails].[SheetID] = [ADM_ServiceSheetHeader5].[SheetID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]
    ON [ADM_ServiceSheetDetails].[InitiatedBy] = [HRM_Employees6].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]
    ON [ADM_ServiceSheetDetails].[MonitoredBy] = [HRM_Employees7].[CardNo]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users9]
    ON [ADM_ServiceSheetDetails].[CPInitiator] = [aspnet_users9].[UserName]

  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
