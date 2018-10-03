USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmServiceCheckPointsSelectListFilteres]
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
 ,CheckPointID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ServiceID'  SET @LGSQL = @LGSQL + ', CheckPointID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_ServiceCheckPoints].[ServiceID]'  SET @LGSQL = @LGSQL + ', [ADM_ServiceCheckPoints].[CheckPointID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_ServiceCheckPoints] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ADM_CheckPoints] AS [ADM_CheckPoints1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceCheckPoints].[CheckPointID] = [ADM_CheckPoints1].[CheckPointID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ADM_Services] AS [ADM_Services2]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceCheckPoints].[ServiceID] = [ADM_Services2].[ServiceID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ServiceID' THEN '[ADM_ServiceCheckPoints].[ServiceID]'
                        WHEN 'ServiceID DESC' THEN '[ADM_ServiceCheckPoints].[ServiceID] DESC'
                        WHEN 'CheckPointID' THEN '[ADM_ServiceCheckPoints].[CheckPointID]'
                        WHEN 'CheckPointID DESC' THEN '[ADM_ServiceCheckPoints].[CheckPointID] DESC'
                        WHEN 'ADM_CheckPoints1_CheckPointID' THEN '[ADM_CheckPoints1].[CheckPointID]'
                        WHEN 'ADM_CheckPoints1_CheckPointID DESC' THEN '[ADM_CheckPoints1].[CheckPointID] DESC'
                        WHEN 'ADM_CheckPoints1_Descriptions' THEN '[ADM_CheckPoints1].[Descriptions]'
                        WHEN 'ADM_CheckPoints1_Descriptions DESC' THEN '[ADM_CheckPoints1].[Descriptions] DESC'
                        WHEN 'ADM_Services2_ServiceID' THEN '[ADM_Services2].[ServiceID]'
                        WHEN 'ADM_Services2_ServiceID DESC' THEN '[ADM_Services2].[ServiceID] DESC'
                        WHEN 'ADM_Services2_Description' THEN '[ADM_Services2].[Description]'
                        WHEN 'ADM_Services2_Description DESC' THEN '[ADM_Services2].[Description] DESC'
                        WHEN 'ADM_Services2_OfficeID' THEN '[ADM_Services2].[OfficeID]'
                        WHEN 'ADM_Services2_OfficeID DESC' THEN '[ADM_Services2].[OfficeID] DESC'
                        WHEN 'ADM_Services2_ScheduleID' THEN '[ADM_Services2].[ScheduleID]'
                        WHEN 'ADM_Services2_ScheduleID DESC' THEN '[ADM_Services2].[ScheduleID] DESC'
                        WHEN 'ADM_Services2_LastSheetDate' THEN '[ADM_Services2].[LastSheetDate]'
                        WHEN 'ADM_Services2_LastSheetDate DESC' THEN '[ADM_Services2].[LastSheetDate] DESC'
                        ELSE '[ADM_ServiceCheckPoints].[ServiceID],[ADM_ServiceCheckPoints].[CheckPointID]'
                    END
  EXEC (@LGSQL)

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
