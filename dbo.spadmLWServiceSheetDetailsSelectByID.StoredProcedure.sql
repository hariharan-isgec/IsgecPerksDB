USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmLWServiceSheetDetailsSelectByID]
  @SheetID Int,
  @SerialNo Int 
  AS
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
  [ADM_ServiceSheetDetails].[SheetID] = @SheetID
  AND [ADM_ServiceSheetDetails].[SerialNo] = @SerialNo
GO
