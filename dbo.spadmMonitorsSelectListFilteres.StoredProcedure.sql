USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMonitorsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ServiceID NVarChar(10) NOT NULL
 ,MonitorID NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ServiceID'  SET @LGSQL = @LGSQL + ', MonitorID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_Monitors].[ServiceID]'  SET @LGSQL = @LGSQL + ', [ADM_Monitors].[MonitorID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_Monitors] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ADM_Services] AS [ADM_Services1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_Monitors].[ServiceID] = [ADM_Services1].[ServiceID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [ADM_Monitors].[MonitorID] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ServiceID' THEN '[ADM_Monitors].[ServiceID]'
                        WHEN 'ServiceID DESC' THEN '[ADM_Monitors].[ServiceID] DESC'
                        WHEN 'MonitorID' THEN '[ADM_Monitors].[MonitorID]'
                        WHEN 'MonitorID DESC' THEN '[ADM_Monitors].[MonitorID] DESC'
                        WHEN 'ADM_Services1_ServiceID' THEN '[ADM_Services1].[ServiceID]'
                        WHEN 'ADM_Services1_ServiceID DESC' THEN '[ADM_Services1].[ServiceID] DESC'
                        WHEN 'ADM_Services1_Description' THEN '[ADM_Services1].[Description]'
                        WHEN 'ADM_Services1_Description DESC' THEN '[ADM_Services1].[Description] DESC'
                        WHEN 'ADM_Services1_OfficeID' THEN '[ADM_Services1].[OfficeID]'
                        WHEN 'ADM_Services1_OfficeID DESC' THEN '[ADM_Services1].[OfficeID] DESC'
                        WHEN 'ADM_Services1_ScheduleID' THEN '[ADM_Services1].[ScheduleID]'
                        WHEN 'ADM_Services1_ScheduleID DESC' THEN '[ADM_Services1].[ScheduleID] DESC'
                        WHEN 'ADM_Services1_LastSheetDate' THEN '[ADM_Services1].[LastSheetDate]'
                        WHEN 'ADM_Services1_LastSheetDate DESC' THEN '[ADM_Services1].[LastSheetDate] DESC'
                        WHEN 'HRM_Employees2_CardNo' THEN '[HRM_Employees2].[CardNo]'
                        WHEN 'HRM_Employees2_CardNo DESC' THEN '[HRM_Employees2].[CardNo] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_C_OfficeID' THEN '[HRM_Employees2].[C_OfficeID]'
                        WHEN 'HRM_Employees2_C_OfficeID DESC' THEN '[HRM_Employees2].[C_OfficeID] DESC'
                        ELSE '[ADM_Monitors].[ServiceID],[ADM_Monitors].[MonitorID]'
                    END
  EXEC (@LGSQL)

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
