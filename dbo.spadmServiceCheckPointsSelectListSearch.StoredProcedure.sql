USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmServiceCheckPointsSelectListSearch]
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
 ,ServiceID NVarChar(10) NOT NULL
 ,CheckPointID Int NOT NULL
  )
  INSERT INTO #PageIndex (ServiceID, CheckPointID)
  SELECT [ADM_ServiceCheckPoints].[ServiceID], [ADM_ServiceCheckPoints].[CheckPointID] FROM [ADM_ServiceCheckPoints]
  INNER JOIN [ADM_CheckPoints] AS [ADM_CheckPoints1]
    ON [ADM_ServiceCheckPoints].[CheckPointID] = [ADM_CheckPoints1].[CheckPointID]
  INNER JOIN [ADM_Services] AS [ADM_Services2]
    ON [ADM_ServiceCheckPoints].[ServiceID] = [ADM_Services2].[ServiceID]
 WHERE  
   ( 
         LOWER(ISNULL([ADM_ServiceCheckPoints].[ServiceID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_ServiceCheckPoints].[CheckPointID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_CheckPoints1].[Descriptions],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Services2].[ServiceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Services2].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_Services2].[OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Services2].[ScheduleID],'')) LIKE @KeyWord1
   ) 
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
    	INNER JOIN #PageIndex
          ON [ADM_ServiceCheckPoints].[ServiceID] = #PageIndex.ServiceID
          AND [ADM_ServiceCheckPoints].[CheckPointID] = #PageIndex.CheckPointID
  INNER JOIN [ADM_CheckPoints] AS [ADM_CheckPoints1]
    ON [ADM_ServiceCheckPoints].[CheckPointID] = [ADM_CheckPoints1].[CheckPointID]
  INNER JOIN [ADM_Services] AS [ADM_Services2]
    ON [ADM_ServiceCheckPoints].[ServiceID] = [ADM_Services2].[ServiceID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
