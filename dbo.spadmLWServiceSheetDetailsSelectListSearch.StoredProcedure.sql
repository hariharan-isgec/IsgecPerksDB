USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmLWServiceSheetDetailsSelectListSearch]
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
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users9]
    ON [ADM_ServiceSheetDetails].[CPInitiator] = [aspnet_Users9].[UserName]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]
    ON [ADM_ServiceSheetDetails].[InitiatedBy] = [HRM_Employees7].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees8]
    ON [ADM_ServiceSheetDetails].[MonitoredBy] = [HRM_Employees8].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees9]
    ON [ADM_ServiceSheetDetails].[ClosedBy] = [HRM_Employees9].[CardNo]
 WHERE  
   ( 
         STR(ISNULL([ADM_ServiceSheetDetails].[SheetID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ADM_ServiceSheetDetails].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[ServiceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[ScheduleID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_ServiceSheetDetails].[MeasureID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ADM_ServiceSheetDetails].[CheckPointID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[InitiatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[InitiatorRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[MonitoredBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[MonitorRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[ClosedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[ClosingRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ServiceSheetDetails].[CPInitiator],'')) LIKE @KeyWord1
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
     CASE @orderBy WHEN 'MeasureID' THEN [ADM_ServiceSheetDetails].[MeasureID] END,
     CASE @orderBy WHEN 'MeasureID DESC' THEN [ADM_ServiceSheetDetails].[MeasureID] END DESC,
     CASE @orderBy WHEN 'CheckPointID' THEN [ADM_ServiceSheetDetails].[CheckPointID] END,
     CASE @orderBy WHEN 'CheckPointID DESC' THEN [ADM_ServiceSheetDetails].[CheckPointID] END DESC,
     CASE @orderBy WHEN 'Initiated' THEN [ADM_ServiceSheetDetails].[Initiated] END,
     CASE @orderBy WHEN 'Initiated DESC' THEN [ADM_ServiceSheetDetails].[Initiated] END DESC,
     CASE @orderBy WHEN 'InitiatedBy' THEN [ADM_ServiceSheetDetails].[InitiatedBy] END,
     CASE @orderBy WHEN 'InitiatedBy DESC' THEN [ADM_ServiceSheetDetails].[InitiatedBy] END DESC,
     CASE @orderBy WHEN 'InitiatedOn' THEN [ADM_ServiceSheetDetails].[InitiatedOn] END,
     CASE @orderBy WHEN 'InitiatedOn DESC' THEN [ADM_ServiceSheetDetails].[InitiatedOn] END DESC,
     CASE @orderBy WHEN 'InitiatorRemarks' THEN [ADM_ServiceSheetDetails].[InitiatorRemarks] END,
     CASE @orderBy WHEN 'InitiatorRemarks DESC' THEN [ADM_ServiceSheetDetails].[InitiatorRemarks] END DESC,
     CASE @orderBy WHEN 'MonitoredBy' THEN [ADM_ServiceSheetDetails].[MonitoredBy] END,
     CASE @orderBy WHEN 'MonitoredBy DESC' THEN [ADM_ServiceSheetDetails].[MonitoredBy] END DESC,
     CASE @orderBy WHEN 'Monitored' THEN [ADM_ServiceSheetDetails].[Monitored] END,
     CASE @orderBy WHEN 'Monitored DESC' THEN [ADM_ServiceSheetDetails].[Monitored] END DESC,
     CASE @orderBy WHEN 'MonitoredOn' THEN [ADM_ServiceSheetDetails].[MonitoredOn] END,
     CASE @orderBy WHEN 'MonitoredOn DESC' THEN [ADM_ServiceSheetDetails].[MonitoredOn] END DESC,
     CASE @orderBy WHEN 'MonitorRemarks' THEN [ADM_ServiceSheetDetails].[MonitorRemarks] END,
     CASE @orderBy WHEN 'MonitorRemarks DESC' THEN [ADM_ServiceSheetDetails].[MonitorRemarks] END DESC,
     CASE @orderBy WHEN 'ProblemIdentified' THEN [ADM_ServiceSheetDetails].[ProblemIdentified] END,
     CASE @orderBy WHEN 'ProblemIdentified DESC' THEN [ADM_ServiceSheetDetails].[ProblemIdentified] END DESC,
     CASE @orderBy WHEN 'ProblemClosed' THEN [ADM_ServiceSheetDetails].[ProblemClosed] END,
     CASE @orderBy WHEN 'ProblemClosed DESC' THEN [ADM_ServiceSheetDetails].[ProblemClosed] END DESC,
     CASE @orderBy WHEN 'ClosedBy' THEN [ADM_ServiceSheetDetails].[ClosedBy] END,
     CASE @orderBy WHEN 'ClosedBy DESC' THEN [ADM_ServiceSheetDetails].[ClosedBy] END DESC,
     CASE @orderBy WHEN 'ClosedOn' THEN [ADM_ServiceSheetDetails].[ClosedOn] END,
     CASE @orderBy WHEN 'ClosedOn DESC' THEN [ADM_ServiceSheetDetails].[ClosedOn] END DESC,
     CASE @orderBy WHEN 'ClosingRemarks' THEN [ADM_ServiceSheetDetails].[ClosingRemarks] END,
     CASE @orderBy WHEN 'ClosingRemarks DESC' THEN [ADM_ServiceSheetDetails].[ClosingRemarks] END DESC,
     CASE @orderBy WHEN 'CPInitiator' THEN [ADM_ServiceSheetDetails].[CPInitiator] END,
     CASE @orderBy WHEN 'CPInitiator DESC' THEN [ADM_ServiceSheetDetails].[CPInitiator] END DESC,
     CASE @orderBy WHEN 'ADM_CheckPoints1_Descriptions' THEN [ADM_CheckPoints1].[Descriptions] END,
     CASE @orderBy WHEN 'ADM_CheckPoints1_Descriptions DESC' THEN [ADM_CheckPoints1].[Descriptions] END DESC,
     CASE @orderBy WHEN 'ADM_Measures2_Description' THEN [ADM_Measures2].[Description] END,
     CASE @orderBy WHEN 'ADM_Measures2_Description DESC' THEN [ADM_Measures2].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_Schedules3_Description' THEN [ADM_Schedules3].[Description] END,
     CASE @orderBy WHEN 'ADM_Schedules3_Description DESC' THEN [ADM_Schedules3].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_Services4_Description' THEN [ADM_Services4].[Description] END,
     CASE @orderBy WHEN 'ADM_Services4_Description DESC' THEN [ADM_Services4].[Description] END DESC,
     CASE @orderBy WHEN 'aspnet_users9_UserFullName' THEN [aspnet_users9].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_users9_UserFullName DESC' THEN [aspnet_users9].[UserFullName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees7_EmployeeName' THEN [HRM_Employees7].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees7_EmployeeName DESC' THEN [HRM_Employees7].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees8_EmployeeName' THEN [HRM_Employees8].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees8_EmployeeName DESC' THEN [HRM_Employees8].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees9_EmployeeName' THEN [HRM_Employees9].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees9_EmployeeName DESC' THEN [HRM_Employees9].[EmployeeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ADM_ServiceSheetDetails].[SheetID] ,
		[ADM_ServiceSheetDetails].[SerialNo] ,
		[ADM_ServiceSheetDetails].[SheetDate] ,
		[ADM_ServiceSheetDetails].[ServiceID] ,
		[ADM_ServiceSheetDetails].[ScheduleID] ,
		[ADM_ServiceSheetDetails].[MeasureID] ,
		[ADM_ServiceSheetDetails].[CheckPointID] ,
		[ADM_ServiceSheetDetails].[Initiated] ,
		[ADM_ServiceSheetDetails].[InitiatedBy] ,
		[ADM_ServiceSheetDetails].[InitiatedOn] ,
		[ADM_ServiceSheetDetails].[InitiatorRemarks] ,
		[ADM_ServiceSheetDetails].[MonitoredBy] ,
		[ADM_ServiceSheetDetails].[Monitored] ,
		[ADM_ServiceSheetDetails].[MonitoredOn] ,
		[ADM_ServiceSheetDetails].[MonitorRemarks] ,
		[ADM_ServiceSheetDetails].[ProblemIdentified] ,
		[ADM_ServiceSheetDetails].[ProblemClosed] ,
		[ADM_ServiceSheetDetails].[ClosedBy] ,
		[ADM_ServiceSheetDetails].[ClosedOn] ,
		[ADM_ServiceSheetDetails].[ClosingRemarks] ,
		[ADM_ServiceSheetDetails].[CPInitiator] ,
		[ADM_CheckPoints1].[Descriptions] AS ADM_CheckPoints1_Descriptions,
		[ADM_Measures2].[Description] AS ADM_Measures2_Description,
		[ADM_Schedules3].[Description] AS ADM_Schedules3_Description,
		[ADM_Services4].[Description] AS ADM_Services4_Description,
		[aspnet_users9].[UserFullName] AS aspnet_users9_UserFullName,
		[HRM_Employees7].[EmployeeName] AS HRM_Employees7_EmployeeName,
		[HRM_Employees8].[EmployeeName] AS HRM_Employees8_EmployeeName,
		[HRM_Employees9].[EmployeeName] AS HRM_Employees9_EmployeeName 
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
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users9]
    ON [ADM_ServiceSheetDetails].[CPInitiator] = [aspnet_Users9].[UserName]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]
    ON [ADM_ServiceSheetDetails].[InitiatedBy] = [HRM_Employees7].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees8]
    ON [ADM_ServiceSheetDetails].[MonitoredBy] = [HRM_Employees8].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees9]
    ON [ADM_ServiceSheetDetails].[ClosedBy] = [HRM_Employees9].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
