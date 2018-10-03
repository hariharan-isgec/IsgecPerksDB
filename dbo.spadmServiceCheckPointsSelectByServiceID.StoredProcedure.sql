USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmServiceCheckPointsSelectByServiceID]
  @ServiceID NVarChar(10),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  ORDER BY
     CASE @orderBy WHEN 'ServiceID' THEN [ADM_ServiceCheckPoints].[ServiceID] END,
     CASE @orderBy WHEN 'ServiceID DESC' THEN [ADM_ServiceCheckPoints].[ServiceID] END DESC,
     CASE @orderBy WHEN 'CheckPointID' THEN [ADM_ServiceCheckPoints].[CheckPointID] END,
     CASE @orderBy WHEN 'CheckPointID DESC' THEN [ADM_ServiceCheckPoints].[CheckPointID] END DESC,
     CASE @orderBy WHEN 'ADM_CheckPoints1_CheckPointID' THEN [ADM_CheckPoints1].[CheckPointID] END,
     CASE @orderBy WHEN 'ADM_CheckPoints1_CheckPointID DESC' THEN [ADM_CheckPoints1].[CheckPointID] END DESC,
     CASE @orderBy WHEN 'ADM_CheckPoints1_Descriptions' THEN [ADM_CheckPoints1].[Descriptions] END,
     CASE @orderBy WHEN 'ADM_CheckPoints1_Descriptions DESC' THEN [ADM_CheckPoints1].[Descriptions] END DESC,
     CASE @orderBy WHEN 'ADM_Services2_ServiceID' THEN [ADM_Services2].[ServiceID] END,
     CASE @orderBy WHEN 'ADM_Services2_ServiceID DESC' THEN [ADM_Services2].[ServiceID] END DESC,
     CASE @orderBy WHEN 'ADM_Services2_Description' THEN [ADM_Services2].[Description] END,
     CASE @orderBy WHEN 'ADM_Services2_Description DESC' THEN [ADM_Services2].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_Services2_OfficeID' THEN [ADM_Services2].[OfficeID] END,
     CASE @orderBy WHEN 'ADM_Services2_OfficeID DESC' THEN [ADM_Services2].[OfficeID] END DESC,
     CASE @orderBy WHEN 'ADM_Services2_ScheduleID' THEN [ADM_Services2].[ScheduleID] END,
     CASE @orderBy WHEN 'ADM_Services2_ScheduleID DESC' THEN [ADM_Services2].[ScheduleID] END DESC,
     CASE @orderBy WHEN 'ADM_Services2_LastSheetDate' THEN [ADM_Services2].[LastSheetDate] END,
     CASE @orderBy WHEN 'ADM_Services2_LastSheetDate DESC' THEN [ADM_Services2].[LastSheetDate] END DESC 
  SET @RecordCount = @@RowCount
GO
