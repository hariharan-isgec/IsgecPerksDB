USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmInitiatorSheetHeaderSelectListFilteres]
  @Filter_ServiceID NVarChar(10),
  @Filter_ScheduleID NVarChar(20),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,SheetID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SheetID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_ServiceSheetHeader].[SheetID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_ServiceSheetHeader] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ADM_Schedules] AS [ADM_Schedules1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetHeader].[ScheduleID] = [ADM_Schedules1].[ScheduleID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ADM_Services] AS [ADM_Services2]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ServiceSheetHeader].[ServiceID] = [ADM_Services2].[ServiceID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ServiceID > '') 
    SET @LGSQL = @LGSQL + ' AND [ADM_ServiceSheetHeader].[ServiceID] = ''' + @Filter_ServiceID + ''''
  IF (@Filter_ScheduleID > '') 
    SET @LGSQL = @LGSQL + ' AND [ADM_ServiceSheetHeader].[ScheduleID] = ''' + @Filter_ScheduleID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SheetID' THEN '[ADM_ServiceSheetHeader].[SheetID]'
                        WHEN 'SheetID DESC' THEN '[ADM_ServiceSheetHeader].[SheetID] DESC'
                        WHEN 'SheetDate' THEN '[ADM_ServiceSheetHeader].[SheetDate]'
                        WHEN 'SheetDate DESC' THEN '[ADM_ServiceSheetHeader].[SheetDate] DESC'
                        WHEN 'ServiceID' THEN '[ADM_ServiceSheetHeader].[ServiceID]'
                        WHEN 'ServiceID DESC' THEN '[ADM_ServiceSheetHeader].[ServiceID] DESC'
                        WHEN 'ScheduleID' THEN '[ADM_ServiceSheetHeader].[ScheduleID]'
                        WHEN 'ScheduleID DESC' THEN '[ADM_ServiceSheetHeader].[ScheduleID] DESC'
                        WHEN 'Description' THEN '[ADM_ServiceSheetHeader].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_ServiceSheetHeader].[Description] DESC'
                        WHEN 'Initiated' THEN '[ADM_ServiceSheetHeader].[Initiated]'
                        WHEN 'Initiated DESC' THEN '[ADM_ServiceSheetHeader].[Initiated] DESC'
                        WHEN 'Monitored' THEN '[ADM_ServiceSheetHeader].[Monitored]'
                        WHEN 'Monitored DESC' THEN '[ADM_ServiceSheetHeader].[Monitored] DESC'
                        WHEN 'ProblemIdentified' THEN '[ADM_ServiceSheetHeader].[ProblemIdentified]'
                        WHEN 'ProblemIdentified DESC' THEN '[ADM_ServiceSheetHeader].[ProblemIdentified] DESC'
                        WHEN 'Closed' THEN '[ADM_ServiceSheetHeader].[Closed]'
                        WHEN 'Closed DESC' THEN '[ADM_ServiceSheetHeader].[Closed] DESC'
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
                        ELSE '[ADM_ServiceSheetHeader].[SheetID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ADM_ServiceSheetHeader].[SheetID],
		[ADM_ServiceSheetHeader].[SheetDate],
		[ADM_ServiceSheetHeader].[ServiceID],
		[ADM_ServiceSheetHeader].[ScheduleID],
		[ADM_ServiceSheetHeader].[Description],
		[ADM_ServiceSheetHeader].[Initiated],
		[ADM_ServiceSheetHeader].[Monitored],
		[ADM_ServiceSheetHeader].[ProblemIdentified],
		[ADM_ServiceSheetHeader].[Closed],
		[ADM_Schedules1].[ScheduleID] AS ADM_Schedules1_ScheduleID,
		[ADM_Schedules1].[Description] AS ADM_Schedules1_Description,
		[ADM_Schedules1].[FixDate] AS ADM_Schedules1_FixDate,
		[ADM_Schedules1].[DaysOrDate] AS ADM_Schedules1_DaysOrDate,
		[ADM_Schedules1].[IncludeHolidays] AS ADM_Schedules1_IncludeHolidays,
		[ADM_Services2].[ServiceID] AS ADM_Services2_ServiceID,
		[ADM_Services2].[Description] AS ADM_Services2_Description,
		[ADM_Services2].[OfficeID] AS ADM_Services2_OfficeID,
		[ADM_Services2].[ScheduleID] AS ADM_Services2_ScheduleID,
		[ADM_Services2].[LastSheetDate] AS ADM_Services2_LastSheetDate 
  FROM [ADM_ServiceSheetHeader] 
    	INNER JOIN #PageIndex
          ON [ADM_ServiceSheetHeader].[SheetID] = #PageIndex.SheetID
  LEFT OUTER JOIN [ADM_Schedules] AS [ADM_Schedules1]
    ON [ADM_ServiceSheetHeader].[ScheduleID] = [ADM_Schedules1].[ScheduleID]
  LEFT OUTER JOIN [ADM_Services] AS [ADM_Services2]
    ON [ADM_ServiceSheetHeader].[ServiceID] = [ADM_Services2].[ServiceID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
