USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmServicesSelectListFilteres]
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
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ServiceID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_Services].[ServiceID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_Services] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_Services].[OfficeID] = [HRM_Offices1].[OfficeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ADM_Schedules] AS [ADM_Schedules1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_Services].[ScheduleID] = [ADM_Schedules1].[ScheduleID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ServiceID' THEN '[ADM_Services].[ServiceID]'
                        WHEN 'ServiceID DESC' THEN '[ADM_Services].[ServiceID] DESC'
                        WHEN 'Description' THEN '[ADM_Services].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_Services].[Description] DESC'
                        WHEN 'OfficeID' THEN '[ADM_Services].[OfficeID]'
                        WHEN 'OfficeID DESC' THEN '[ADM_Services].[OfficeID] DESC'
                        WHEN 'ScheduleID' THEN '[ADM_Services].[ScheduleID]'
                        WHEN 'ScheduleID DESC' THEN '[ADM_Services].[ScheduleID] DESC'
                        WHEN 'LastSheetDate' THEN '[ADM_Services].[LastSheetDate]'
                        WHEN 'LastSheetDate DESC' THEN '[ADM_Services].[LastSheetDate] DESC'
                        WHEN 'HRM_Offices1_OfficeID' THEN '[HRM_Offices1].[OfficeID]'
                        WHEN 'HRM_Offices1_OfficeID DESC' THEN '[HRM_Offices1].[OfficeID] DESC'
                        WHEN 'HRM_Offices1_Description' THEN '[HRM_Offices1].[Description]'
                        WHEN 'HRM_Offices1_Description DESC' THEN '[HRM_Offices1].[Description] DESC'
                        WHEN 'ADM_Schedules1_ScheduleID' THEN '[ADM_Schedules1].[ScheduleID]'
                        WHEN 'ADM_Schedules1_ScheduleID DESC' THEN '[ADM_Schedules1].[ScheduleID] DESC'
                        WHEN 'ADM_Schedules1_Description' THEN '[ADM_Schedules1].[Description]'
                        WHEN 'ADM_Schedules1_Description DESC' THEN '[ADM_Schedules1].[Description] DESC'
                        WHEN 'ADM_Schedules1_FixDate' THEN '[ADM_Schedules1].[FixDate]'
                        WHEN 'ADM_Schedules1_FixDate DESC' THEN '[ADM_Schedules1].[FixDate] DESC'
                        WHEN 'ADM_Schedules1_DaysOrDate' THEN '[ADM_Schedules1].[DaysOrDate]'
                        WHEN 'ADM_Schedules1_DaysOrDate DESC' THEN '[ADM_Schedules1].[DaysOrDate] DESC'
                        WHEN 'ADM_Schedules1_IncludeHolidays' THEN '[ADM_Schedules1].[IncludeHolidays]'
                        WHEN 'ADM_Schedules1_IncludeHolidays DESC' THEN '[ADM_Schedules1].[IncludeHolidays] DESC'
                        ELSE '[ADM_Services].[ServiceID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ADM_Services].[ServiceID],
		[ADM_Services].[Description],
		[ADM_Services].[OfficeID],
		[ADM_Services].[ScheduleID],
		[ADM_Services].[LastSheetDate],
		[HRM_Offices1].[OfficeID] AS HRM_Offices1_OfficeID,
		[HRM_Offices1].[Description] AS HRM_Offices1_Description,
		[ADM_Schedules1].[ScheduleID] AS ADM_Schedules1_ScheduleID,
		[ADM_Schedules1].[Description] AS ADM_Schedules1_Description,
		[ADM_Schedules1].[FixDate] AS ADM_Schedules1_FixDate,
		[ADM_Schedules1].[DaysOrDate] AS ADM_Schedules1_DaysOrDate,
		[ADM_Schedules1].[IncludeHolidays] AS ADM_Schedules1_IncludeHolidays 
  FROM [ADM_Services] 
    	INNER JOIN #PageIndex
          ON [ADM_Services].[ServiceID] = #PageIndex.ServiceID
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices1]
    ON [ADM_Services].[OfficeID] = [HRM_Offices1].[OfficeID]
  INNER JOIN [ADM_Schedules] AS [ADM_Schedules1]
    ON [ADM_Services].[ScheduleID] = [ADM_Schedules1].[ScheduleID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
