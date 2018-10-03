USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmServiceCheckPointsSelectByID]
  @ServiceID NVarChar(10),
  @CheckPointID Int 
  AS
  SELECT
		[ADM_ServiceCheckPoints].[ServiceID],
		[ADM_ServiceCheckPoints].[CheckPointID],
		[ADM_CheckPoints1].[CheckPointID] AS ADM_CheckPoints1_CheckPointID,
		[ADM_CheckPoints1].[Descriptions] AS ADM_CheckPoints1_Descriptions,
		[ADM_Services2].[ServiceID] AS ADM_Services2_ServiceID,
		[ADM_Services2].[Description] AS ADM_Services2_Description,
		[ADM_Services2].[OfficeID] AS ADM_Services2_OfficeID,
		[ADM_Services2].[ScheduleID] AS ADM_Services2_ScheduleID,
		[ADM_Services2].[LastSheetDate] AS ADM_Services2_LastSheetDate 
  FROM [ADM_ServiceCheckPoints] 
  INNER JOIN [ADM_CheckPoints] AS [ADM_CheckPoints1]
    ON [ADM_ServiceCheckPoints].[CheckPointID] = [ADM_CheckPoints1].[CheckPointID]
  INNER JOIN [ADM_Services] AS [ADM_Services2]
    ON [ADM_ServiceCheckPoints].[ServiceID] = [ADM_Services2].[ServiceID]
  WHERE
  [ADM_ServiceCheckPoints].[ServiceID] = @ServiceID
  AND [ADM_ServiceCheckPoints].[CheckPointID] = @CheckPointID
GO
