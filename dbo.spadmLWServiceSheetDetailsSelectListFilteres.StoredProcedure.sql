USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmLWServiceSheetDetailsSelectListFilteres]
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
  SET @LGSQL = @LGSQL + 'SheetID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_ServiceSheetDetails].[SheetID]'
  SET @LGSQL = @LGSQL + ', [ADM_ServiceSheetDetails].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [ADM_ServiceSheetDetails] '
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users9]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetDetails].[CPInitiator] = [aspnet_Users9].[UserName]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetDetails].[InitiatedBy] = [HRM_Employees7].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees8]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetDetails].[MonitoredBy] = [HRM_Employees8].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees9]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetDetails].[ClosedBy] = [HRM_Employees9].[CardNo]'
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
                        WHEN 'MeasureID' THEN '[ADM_ServiceSheetDetails].[MeasureID]'
                        WHEN 'MeasureID DESC' THEN '[ADM_ServiceSheetDetails].[MeasureID] DESC'
                        WHEN 'CheckPointID' THEN '[ADM_ServiceSheetDetails].[CheckPointID]'
                        WHEN 'CheckPointID DESC' THEN '[ADM_ServiceSheetDetails].[CheckPointID] DESC'
                        WHEN 'Initiated' THEN '[ADM_ServiceSheetDetails].[Initiated]'
                        WHEN 'Initiated DESC' THEN '[ADM_ServiceSheetDetails].[Initiated] DESC'
                        WHEN 'InitiatedBy' THEN '[ADM_ServiceSheetDetails].[InitiatedBy]'
                        WHEN 'InitiatedBy DESC' THEN '[ADM_ServiceSheetDetails].[InitiatedBy] DESC'
                        WHEN 'InitiatedOn' THEN '[ADM_ServiceSheetDetails].[InitiatedOn]'
                        WHEN 'InitiatedOn DESC' THEN '[ADM_ServiceSheetDetails].[InitiatedOn] DESC'
                        WHEN 'InitiatorRemarks' THEN '[ADM_ServiceSheetDetails].[InitiatorRemarks]'
                        WHEN 'InitiatorRemarks DESC' THEN '[ADM_ServiceSheetDetails].[InitiatorRemarks] DESC'
                        WHEN 'MonitoredBy' THEN '[ADM_ServiceSheetDetails].[MonitoredBy]'
                        WHEN 'MonitoredBy DESC' THEN '[ADM_ServiceSheetDetails].[MonitoredBy] DESC'
                        WHEN 'Monitored' THEN '[ADM_ServiceSheetDetails].[Monitored]'
                        WHEN 'Monitored DESC' THEN '[ADM_ServiceSheetDetails].[Monitored] DESC'
                        WHEN 'MonitoredOn' THEN '[ADM_ServiceSheetDetails].[MonitoredOn]'
                        WHEN 'MonitoredOn DESC' THEN '[ADM_ServiceSheetDetails].[MonitoredOn] DESC'
                        WHEN 'MonitorRemarks' THEN '[ADM_ServiceSheetDetails].[MonitorRemarks]'
                        WHEN 'MonitorRemarks DESC' THEN '[ADM_ServiceSheetDetails].[MonitorRemarks] DESC'
                        WHEN 'ProblemIdentified' THEN '[ADM_ServiceSheetDetails].[ProblemIdentified]'
                        WHEN 'ProblemIdentified DESC' THEN '[ADM_ServiceSheetDetails].[ProblemIdentified] DESC'
                        WHEN 'ProblemClosed' THEN '[ADM_ServiceSheetDetails].[ProblemClosed]'
                        WHEN 'ProblemClosed DESC' THEN '[ADM_ServiceSheetDetails].[ProblemClosed] DESC'
                        WHEN 'ClosedBy' THEN '[ADM_ServiceSheetDetails].[ClosedBy]'
                        WHEN 'ClosedBy DESC' THEN '[ADM_ServiceSheetDetails].[ClosedBy] DESC'
                        WHEN 'ClosedOn' THEN '[ADM_ServiceSheetDetails].[ClosedOn]'
                        WHEN 'ClosedOn DESC' THEN '[ADM_ServiceSheetDetails].[ClosedOn] DESC'
                        WHEN 'ClosingRemarks' THEN '[ADM_ServiceSheetDetails].[ClosingRemarks]'
                        WHEN 'ClosingRemarks DESC' THEN '[ADM_ServiceSheetDetails].[ClosingRemarks] DESC'
                        WHEN 'CPInitiator' THEN '[ADM_ServiceSheetDetails].[CPInitiator]'
                        WHEN 'CPInitiator DESC' THEN '[ADM_ServiceSheetDetails].[CPInitiator] DESC'
                        WHEN 'ADM_CheckPoints1_Descriptions' THEN '[ADM_CheckPoints].[Descriptions]'
                        WHEN 'ADM_CheckPoints1_Descriptions DESC' THEN '[ADM_CheckPoints1].[Descriptions] DESC'
                        WHEN 'ADM_Measures2_Description' THEN '[ADM_Measures].[Description]'
                        WHEN 'ADM_Measures2_Description DESC' THEN '[ADM_Measures2].[Description] DESC'
                        WHEN 'ADM_Schedules3_Description' THEN '[ADM_Schedules].[Description]'
                        WHEN 'ADM_Schedules3_Description DESC' THEN '[ADM_Schedules3].[Description] DESC'
                        WHEN 'ADM_Services4_Description' THEN '[ADM_Services].[Description]'
                        WHEN 'ADM_Services4_Description DESC' THEN '[ADM_Services4].[Description] DESC'
                        WHEN 'aspnet_users9_UserFullName' THEN '[aspnet_users].[UserFullName]'
                        WHEN 'aspnet_users9_UserFullName DESC' THEN '[aspnet_users9].[UserFullName] DESC'
                        WHEN 'HRM_Employees7_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees7_EmployeeName DESC' THEN '[HRM_Employees7].[EmployeeName] DESC'
                        WHEN 'HRM_Employees8_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees8_EmployeeName DESC' THEN '[HRM_Employees8].[EmployeeName] DESC'
                        WHEN 'HRM_Employees9_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees9_EmployeeName DESC' THEN '[HRM_Employees9].[EmployeeName] DESC'
                        ELSE '[ADM_ServiceSheetDetails].[SheetID],[ADM_ServiceSheetDetails].[SerialNo]'
                    END
  EXEC (@LGSQL)

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
