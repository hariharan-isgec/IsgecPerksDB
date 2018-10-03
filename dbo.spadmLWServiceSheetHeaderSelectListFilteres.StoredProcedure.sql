USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWServiceSheetHeaderSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SheetID' THEN '[ADM_ServiceSheetHeader].[SheetID]'
                        WHEN 'SheetID DESC' THEN '[ADM_ServiceSheetHeader].[SheetID] DESC'
                        WHEN 'SheetDate' THEN '[ADM_ServiceSheetHeader].[SheetDate]'
                        WHEN 'SheetDate DESC' THEN '[ADM_ServiceSheetHeader].[SheetDate] DESC'
                        WHEN 'Description' THEN '[ADM_ServiceSheetHeader].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_ServiceSheetHeader].[Description] DESC'
                        WHEN 'ServiceID' THEN '[ADM_ServiceSheetHeader].[ServiceID]'
                        WHEN 'ServiceID DESC' THEN '[ADM_ServiceSheetHeader].[ServiceID] DESC'
                        WHEN 'ScheduleID' THEN '[ADM_ServiceSheetHeader].[ScheduleID]'
                        WHEN 'ScheduleID DESC' THEN '[ADM_ServiceSheetHeader].[ScheduleID] DESC'
                        WHEN 'Initiated' THEN '[ADM_ServiceSheetHeader].[Initiated]'
                        WHEN 'Initiated DESC' THEN '[ADM_ServiceSheetHeader].[Initiated] DESC'
                        WHEN 'Monitored' THEN '[ADM_ServiceSheetHeader].[Monitored]'
                        WHEN 'Monitored DESC' THEN '[ADM_ServiceSheetHeader].[Monitored] DESC'
                        WHEN 'ProblemIdentified' THEN '[ADM_ServiceSheetHeader].[ProblemIdentified]'
                        WHEN 'ProblemIdentified DESC' THEN '[ADM_ServiceSheetHeader].[ProblemIdentified] DESC'
                        WHEN 'Closed' THEN '[ADM_ServiceSheetHeader].[Closed]'
                        WHEN 'Closed DESC' THEN '[ADM_ServiceSheetHeader].[Closed] DESC'
                        ELSE '[ADM_ServiceSheetHeader].[SheetID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ADM_ServiceSheetHeader].[SheetID],
		[ADM_ServiceSheetHeader].[SheetDate],
		[ADM_ServiceSheetHeader].[Description],
		[ADM_ServiceSheetHeader].[ServiceID],
		[ADM_ServiceSheetHeader].[ScheduleID],
		[ADM_ServiceSheetHeader].[Initiated],
		[ADM_ServiceSheetHeader].[Monitored],
		[ADM_ServiceSheetHeader].[ProblemIdentified],
		[ADM_ServiceSheetHeader].[Closed] 
  FROM [ADM_ServiceSheetHeader] 
    	INNER JOIN #PageIndex
          ON [ADM_ServiceSheetHeader].[SheetID] = #PageIndex.SheetID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
