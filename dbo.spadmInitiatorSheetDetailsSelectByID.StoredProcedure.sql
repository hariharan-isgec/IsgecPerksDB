USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmInitiatorSheetDetailsSelectByID]
  @SheetID Int,
  @SerialNo Int 
  AS
  SELECT
		[ADM_ServiceSheetDetails].[SheetID],
		[ADM_ServiceSheetDetails].[SerialNo],
		[ADM_ServiceSheetDetails].[SheetDate],
		[ADM_ServiceSheetDetails].[ServiceID],
		[ADM_ServiceSheetDetails].[ScheduleID],
		[ADM_ServiceSheetDetails].[CheckPointID],
		[ADM_ServiceSheetDetails].[MeasureID],
		[ADM_ServiceSheetDetails].[Monitored],
		[ADM_ServiceSheetDetails].[ProblemClosed],
		[ADM_ServiceSheetDetails].[Initiated],
		[ADM_ServiceSheetDetails].[InitiatedBy],
		[ADM_ServiceSheetDetails].[InitiatedOn],
		[ADM_ServiceSheetDetails].[ProblemIdentified],
		[ADM_ServiceSheetDetails].[InitiatorRemarks],
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
		[aspnet_users9].[UserName] AS aspnet_users9_UserName,
		[aspnet_users9].[UserFullName] AS aspnet_users9_UserFullName 
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
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]
    ON [ADM_ServiceSheetDetails].[InitiatedBy] = [HRM_Employees6].[CardNo]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users9]
    ON [ADM_ServiceSheetDetails].[CPInitiator] = [aspnet_users9].[UserName]
  WHERE
  [ADM_ServiceSheetDetails].[SheetID] = @SheetID
  AND [ADM_ServiceSheetDetails].[SerialNo] = @SerialNo
GO
