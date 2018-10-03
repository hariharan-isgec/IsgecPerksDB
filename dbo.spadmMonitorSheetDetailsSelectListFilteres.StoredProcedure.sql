USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmMonitorSheetDetailsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,SheetID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SheetID'  SET @LGSQL = @LGSQL + ', SerialNo'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_ServiceSheetDetails].[SheetID]'  SET @LGSQL = @LGSQL + ', [ADM_ServiceSheetDetails].[SerialNo]'  SET @LGSQL = @LGSQL + ' FROM [ADM_ServiceSheetDetails] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ADM_CheckPoints] AS [ADM_CheckPoints1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetDetails].[CheckPointID] = [ADM_CheckPoints1].[CheckPointID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ADM_Measures] AS [ADM_Measures2]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetDetails].[MeasureID] = [ADM_Measures2].[MeasureID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ADM_Schedules] AS [ADM_Schedules3]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetDetails].[ScheduleID] = [ADM_Schedules3].[ScheduleID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ADM_Services] AS [ADM_Services4]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetDetails].[ServiceID] = [ADM_Services4].[ServiceID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ADM_ServiceSheetHeader] AS [ADM_ServiceSheetHeader5]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetDetails].[SheetID] = [ADM_ServiceSheetHeader5].[SheetID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetDetails].[InitiatedBy] = [HRM_Employees6].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetDetails].[MonitoredBy] = [HRM_Employees7].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users9]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetDetails].[CPInitiator] = [aspnet_users9].[UserName]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SheetID' THEN '[ADM_ServiceSheetDetails].[SheetID]'
                        WHEN 'SheetID DESC' THEN '[ADM_ServiceSheetDetails].[SheetID] DESC'
                        WHEN 'SerialNo' THEN '[ADM_ServiceSheetDetails].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[ADM_ServiceSheetDetails].[SerialNo] DESC'
                        WHEN 'SheetDate' THEN '[ADM_ServiceSheetDetails].[SheetDate]'
                        WHEN 'SheetDate DESC' THEN '[ADM_ServiceSheetDetails].[SheetDate] DESC'
                        WHEN 'ServiceID' THEN '[ADM_ServiceSheetDetails].[ServiceID]'
                        WHEN 'ServiceID DESC' THEN '[ADM_ServiceSheetDetails].[ServiceID] DESC'
                        WHEN 'ScheduleID' THEN '[ADM_ServiceSheetDetails].[ScheduleID]'
                        WHEN 'ScheduleID DESC' THEN '[ADM_ServiceSheetDetails].[ScheduleID] DESC'
                        WHEN 'CheckPointID' THEN '[ADM_ServiceSheetDetails].[CheckPointID]'
                        WHEN 'CheckPointID DESC' THEN '[ADM_ServiceSheetDetails].[CheckPointID] DESC'
                        WHEN 'MeasureID' THEN '[ADM_ServiceSheetDetails].[MeasureID]'
                        WHEN 'MeasureID DESC' THEN '[ADM_ServiceSheetDetails].[MeasureID] DESC'
                        WHEN 'Initiated' THEN '[ADM_ServiceSheetDetails].[Initiated]'
                        WHEN 'Initiated DESC' THEN '[ADM_ServiceSheetDetails].[Initiated] DESC'
                        WHEN 'InitiatedBy' THEN '[ADM_ServiceSheetDetails].[InitiatedBy]'
                        WHEN 'InitiatedBy DESC' THEN '[ADM_ServiceSheetDetails].[InitiatedBy] DESC'
                        WHEN 'InitiatedOn' THEN '[ADM_ServiceSheetDetails].[InitiatedOn]'
                        WHEN 'InitiatedOn DESC' THEN '[ADM_ServiceSheetDetails].[InitiatedOn] DESC'
                        WHEN 'InitiatorRemarks' THEN '[ADM_ServiceSheetDetails].[InitiatorRemarks]'
                        WHEN 'InitiatorRemarks DESC' THEN '[ADM_ServiceSheetDetails].[InitiatorRemarks] DESC'
                        WHEN 'ProblemIdentified' THEN '[ADM_ServiceSheetDetails].[ProblemIdentified]'
                        WHEN 'ProblemIdentified DESC' THEN '[ADM_ServiceSheetDetails].[ProblemIdentified] DESC'
                        WHEN 'MonitorRemarks' THEN '[ADM_ServiceSheetDetails].[MonitorRemarks]'
                        WHEN 'MonitorRemarks DESC' THEN '[ADM_ServiceSheetDetails].[MonitorRemarks] DESC'
                        WHEN 'MonitoredBy' THEN '[ADM_ServiceSheetDetails].[MonitoredBy]'
                        WHEN 'MonitoredBy DESC' THEN '[ADM_ServiceSheetDetails].[MonitoredBy] DESC'
                        WHEN 'MonitoredOn' THEN '[ADM_ServiceSheetDetails].[MonitoredOn]'
                        WHEN 'MonitoredOn DESC' THEN '[ADM_ServiceSheetDetails].[MonitoredOn] DESC'
                        WHEN 'Monitored' THEN '[ADM_ServiceSheetDetails].[Monitored]'
                        WHEN 'Monitored DESC' THEN '[ADM_ServiceSheetDetails].[Monitored] DESC'
                        WHEN 'ProblemClosed' THEN '[ADM_ServiceSheetDetails].[ProblemClosed]'
                        WHEN 'ProblemClosed DESC' THEN '[ADM_ServiceSheetDetails].[ProblemClosed] DESC'
                        WHEN 'ADM_CheckPoints1_CheckPointID' THEN '[ADM_CheckPoints1].[CheckPointID]'
                        WHEN 'ADM_CheckPoints1_CheckPointID DESC' THEN '[ADM_CheckPoints1].[CheckPointID] DESC'
                        WHEN 'ADM_CheckPoints1_Descriptions' THEN '[ADM_CheckPoints1].[Descriptions]'
                        WHEN 'ADM_CheckPoints1_Descriptions DESC' THEN '[ADM_CheckPoints1].[Descriptions] DESC'
                        WHEN 'ADM_Measures2_MeasureID' THEN '[ADM_Measures2].[MeasureID]'
                        WHEN 'ADM_Measures2_MeasureID DESC' THEN '[ADM_Measures2].[MeasureID] DESC'
                        WHEN 'ADM_Measures2_Description' THEN '[ADM_Measures2].[Description]'
                        WHEN 'ADM_Measures2_Description DESC' THEN '[ADM_Measures2].[Description] DESC'
                        WHEN 'ADM_Measures2_MonitoringMechanism' THEN '[ADM_Measures2].[MonitoringMechanism]'
                        WHEN 'ADM_Measures2_MonitoringMechanism DESC' THEN '[ADM_Measures2].[MonitoringMechanism] DESC'
                        WHEN 'ADM_Schedules3_ScheduleID' THEN '[ADM_Schedules3].[ScheduleID]'
                        WHEN 'ADM_Schedules3_ScheduleID DESC' THEN '[ADM_Schedules3].[ScheduleID] DESC'
                        WHEN 'ADM_Schedules3_Description' THEN '[ADM_Schedules3].[Description]'
                        WHEN 'ADM_Schedules3_Description DESC' THEN '[ADM_Schedules3].[Description] DESC'
                        WHEN 'ADM_Schedules3_FixDate' THEN '[ADM_Schedules3].[FixDate]'
                        WHEN 'ADM_Schedules3_FixDate DESC' THEN '[ADM_Schedules3].[FixDate] DESC'
                        WHEN 'ADM_Schedules3_DaysOrDate' THEN '[ADM_Schedules3].[DaysOrDate]'
                        WHEN 'ADM_Schedules3_DaysOrDate DESC' THEN '[ADM_Schedules3].[DaysOrDate] DESC'
                        WHEN 'ADM_Schedules3_IncludeHolidays' THEN '[ADM_Schedules3].[IncludeHolidays]'
                        WHEN 'ADM_Schedules3_IncludeHolidays DESC' THEN '[ADM_Schedules3].[IncludeHolidays] DESC'
                        WHEN 'ADM_Services4_ServiceID' THEN '[ADM_Services4].[ServiceID]'
                        WHEN 'ADM_Services4_ServiceID DESC' THEN '[ADM_Services4].[ServiceID] DESC'
                        WHEN 'ADM_Services4_Description' THEN '[ADM_Services4].[Description]'
                        WHEN 'ADM_Services4_Description DESC' THEN '[ADM_Services4].[Description] DESC'
                        WHEN 'ADM_Services4_OfficeID' THEN '[ADM_Services4].[OfficeID]'
                        WHEN 'ADM_Services4_OfficeID DESC' THEN '[ADM_Services4].[OfficeID] DESC'
                        WHEN 'ADM_Services4_ScheduleID' THEN '[ADM_Services4].[ScheduleID]'
                        WHEN 'ADM_Services4_ScheduleID DESC' THEN '[ADM_Services4].[ScheduleID] DESC'
                        WHEN 'ADM_Services4_LastSheetDate' THEN '[ADM_Services4].[LastSheetDate]'
                        WHEN 'ADM_Services4_LastSheetDate DESC' THEN '[ADM_Services4].[LastSheetDate] DESC'
                        WHEN 'ADM_ServiceSheetHeader5_SheetID' THEN '[ADM_ServiceSheetHeader5].[SheetID]'
                        WHEN 'ADM_ServiceSheetHeader5_SheetID DESC' THEN '[ADM_ServiceSheetHeader5].[SheetID] DESC'
                        WHEN 'ADM_ServiceSheetHeader5_SheetDate' THEN '[ADM_ServiceSheetHeader5].[SheetDate]'
                        WHEN 'ADM_ServiceSheetHeader5_SheetDate DESC' THEN '[ADM_ServiceSheetHeader5].[SheetDate] DESC'
                        WHEN 'ADM_ServiceSheetHeader5_ServiceID' THEN '[ADM_ServiceSheetHeader5].[ServiceID]'
                        WHEN 'ADM_ServiceSheetHeader5_ServiceID DESC' THEN '[ADM_ServiceSheetHeader5].[ServiceID] DESC'
                        WHEN 'ADM_ServiceSheetHeader5_ScheduleID' THEN '[ADM_ServiceSheetHeader5].[ScheduleID]'
                        WHEN 'ADM_ServiceSheetHeader5_ScheduleID DESC' THEN '[ADM_ServiceSheetHeader5].[ScheduleID] DESC'
                        WHEN 'ADM_ServiceSheetHeader5_Description' THEN '[ADM_ServiceSheetHeader5].[Description]'
                        WHEN 'ADM_ServiceSheetHeader5_Description DESC' THEN '[ADM_ServiceSheetHeader5].[Description] DESC'
                        WHEN 'ADM_ServiceSheetHeader5_Initiated' THEN '[ADM_ServiceSheetHeader5].[Initiated]'
                        WHEN 'ADM_ServiceSheetHeader5_Initiated DESC' THEN '[ADM_ServiceSheetHeader5].[Initiated] DESC'
                        WHEN 'ADM_ServiceSheetHeader5_Monitored' THEN '[ADM_ServiceSheetHeader5].[Monitored]'
                        WHEN 'ADM_ServiceSheetHeader5_Monitored DESC' THEN '[ADM_ServiceSheetHeader5].[Monitored] DESC'
                        WHEN 'ADM_ServiceSheetHeader5_ProblemIdentified' THEN '[ADM_ServiceSheetHeader5].[ProblemIdentified]'
                        WHEN 'ADM_ServiceSheetHeader5_ProblemIdentified DESC' THEN '[ADM_ServiceSheetHeader5].[ProblemIdentified] DESC'
                        WHEN 'ADM_ServiceSheetHeader5_Closed' THEN '[ADM_ServiceSheetHeader5].[Closed]'
                        WHEN 'ADM_ServiceSheetHeader5_Closed DESC' THEN '[ADM_ServiceSheetHeader5].[Closed] DESC'
                        WHEN 'HRM_Employees6_CardNo' THEN '[HRM_Employees6].[CardNo]'
                        WHEN 'HRM_Employees6_CardNo DESC' THEN '[HRM_Employees6].[CardNo] DESC'
                        WHEN 'HRM_Employees6_EmployeeName' THEN '[HRM_Employees6].[EmployeeName]'
                        WHEN 'HRM_Employees6_EmployeeName DESC' THEN '[HRM_Employees6].[EmployeeName] DESC'
                        WHEN 'HRM_Employees6_C_OfficeID' THEN '[HRM_Employees6].[C_OfficeID]'
                        WHEN 'HRM_Employees6_C_OfficeID DESC' THEN '[HRM_Employees6].[C_OfficeID] DESC'
                        WHEN 'HRM_Employees7_CardNo' THEN '[HRM_Employees7].[CardNo]'
                        WHEN 'HRM_Employees7_CardNo DESC' THEN '[HRM_Employees7].[CardNo] DESC'
                        WHEN 'HRM_Employees7_EmployeeName' THEN '[HRM_Employees7].[EmployeeName]'
                        WHEN 'HRM_Employees7_EmployeeName DESC' THEN '[HRM_Employees7].[EmployeeName] DESC'
                        WHEN 'HRM_Employees7_C_OfficeID' THEN '[HRM_Employees7].[C_OfficeID]'
                        WHEN 'HRM_Employees7_C_OfficeID DESC' THEN '[HRM_Employees7].[C_OfficeID] DESC'
                        ELSE '[ADM_ServiceSheetDetails].[SheetID],[ADM_ServiceSheetDetails].[SerialNo]'
                    END
  EXEC (@LGSQL)

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
