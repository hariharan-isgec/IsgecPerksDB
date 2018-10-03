USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmSchedulesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ScheduleID NVarChar(20) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ScheduleID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_Schedules].[ScheduleID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_Schedules] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ScheduleID' THEN '[ADM_Schedules].[ScheduleID]'
                        WHEN 'ScheduleID DESC' THEN '[ADM_Schedules].[ScheduleID] DESC'
                        WHEN 'Description' THEN '[ADM_Schedules].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_Schedules].[Description] DESC'
                        WHEN 'FixDate' THEN '[ADM_Schedules].[FixDate]'
                        WHEN 'FixDate DESC' THEN '[ADM_Schedules].[FixDate] DESC'
                        WHEN 'DaysOrDate' THEN '[ADM_Schedules].[DaysOrDate]'
                        WHEN 'DaysOrDate DESC' THEN '[ADM_Schedules].[DaysOrDate] DESC'
                        WHEN 'IncludeHolidays' THEN '[ADM_Schedules].[IncludeHolidays]'
                        WHEN 'IncludeHolidays DESC' THEN '[ADM_Schedules].[IncludeHolidays] DESC'
                        ELSE '[ADM_Schedules].[ScheduleID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ADM_Schedules].[ScheduleID],
		[ADM_Schedules].[Description],
		[ADM_Schedules].[FixDate],
		[ADM_Schedules].[DaysOrDate],
		[ADM_Schedules].[IncludeHolidays] 
  FROM [ADM_Schedules] 
    	INNER JOIN #PageIndex
          ON [ADM_Schedules].[ScheduleID] = #PageIndex.ScheduleID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
