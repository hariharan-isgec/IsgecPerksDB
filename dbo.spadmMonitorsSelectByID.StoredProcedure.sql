USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMonitorsSelectByID]
  @ServiceID NVarChar(10),
  @MonitorID NVarChar(8) 
  AS
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
  INNER JOIN [ADM_Services] AS [ADM_Services1]
    ON [ADM_Monitors].[ServiceID] = [ADM_Services1].[ServiceID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ADM_Monitors].[MonitorID] = [HRM_Employees2].[CardNo]
  WHERE
  [ADM_Monitors].[ServiceID] = @ServiceID
  AND [ADM_Monitors].[MonitorID] = @MonitorID
GO
