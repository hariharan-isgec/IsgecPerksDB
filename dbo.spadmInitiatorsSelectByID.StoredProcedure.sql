USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmInitiatorsSelectByID]
  @ServiceID NVarChar(10),
  @InitiatorID NVarChar(8) 
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
  AND [ADM_Initiators].[InitiatorID] = @InitiatorID
GO
