USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchConfigSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RecordID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (RecordID) ' + 
               'SELECT [ATN_PunchConfig].[RecordID] FROM [ATN_PunchConfig] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [ATN_PunchConfig].[FinYear] = ''' + @FinYear + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RecordID' THEN '[ATN_PunchConfig].[RecordID]'
                        WHEN 'RecordID DESC' THEN '[ATN_PunchConfig].[RecordID] DESC'
                        WHEN 'STD1Time' THEN '[ATN_PunchConfig].[STD1Time]'
                        WHEN 'STD1Time DESC' THEN '[ATN_PunchConfig].[STD1Time] DESC'
                        WHEN 'Range1Start' THEN '[ATN_PunchConfig].[Range1Start]'
                        WHEN 'Range1Start DESC' THEN '[ATN_PunchConfig].[Range1Start] DESC'
                        WHEN 'Range1End' THEN '[ATN_PunchConfig].[Range1End]'
                        WHEN 'Range1End DESC' THEN '[ATN_PunchConfig].[Range1End] DESC'
                        WHEN 'MeanTime' THEN '[ATN_PunchConfig].[MeanTime]'
                        WHEN 'MeanTime DESC' THEN '[ATN_PunchConfig].[MeanTime] DESC'
                        WHEN 'STD2Time' THEN '[ATN_PunchConfig].[STD2Time]'
                        WHEN 'STD2Time DESC' THEN '[ATN_PunchConfig].[STD2Time] DESC'
                        WHEN 'Range2Start' THEN '[ATN_PunchConfig].[Range2Start]'
                        WHEN 'Range2Start DESC' THEN '[ATN_PunchConfig].[Range2Start] DESC'
                        WHEN 'Range2End' THEN '[ATN_PunchConfig].[Range2End]'
                        WHEN 'Range2End DESC' THEN '[ATN_PunchConfig].[Range2End] DESC'
                        WHEN 'EnableMinHrs' THEN '[ATN_PunchConfig].[EnableMinHrs]'
                        WHEN 'EnableMinHrs DESC' THEN '[ATN_PunchConfig].[EnableMinHrs] DESC'
                        WHEN 'MinHrsFullPresent' THEN '[ATN_PunchConfig].[MinHrsFullPresent]'
                        WHEN 'MinHrsFullPresent DESC' THEN '[ATN_PunchConfig].[MinHrsFullPresent] DESC'
                        WHEN 'MinHrsHalfPresent' THEN '[ATN_PunchConfig].[MinHrsHalfPresent]'
                        WHEN 'MinHrsHalfPresent DESC' THEN '[ATN_PunchConfig].[MinHrsHalfPresent] DESC'
                        WHEN 'Active' THEN '[ATN_PunchConfig].[Active]'
                        WHEN 'Active DESC' THEN '[ATN_PunchConfig].[Active] DESC'
                        WHEN 'FinYear' THEN '[ATN_PunchConfig].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_PunchConfig].[FinYear] DESC'
                        WHEN 'DataFileLocation' THEN '[ATN_PunchConfig].[DataFileLocation]'
                        WHEN 'DataFileLocation DESC' THEN '[ATN_PunchConfig].[DataFileLocation] DESC'
                        ELSE '[ATN_PunchConfig].[RecordID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_PunchConfig].[RecordID],
		[ATN_PunchConfig].[STD1Time],
		[ATN_PunchConfig].[Range1Start],
		[ATN_PunchConfig].[Range1End],
		[ATN_PunchConfig].[MeanTime],
		[ATN_PunchConfig].[STD2Time],
		[ATN_PunchConfig].[Range2Start],
		[ATN_PunchConfig].[Range2End],
		[ATN_PunchConfig].[EnableMinHrs],
		[ATN_PunchConfig].[MinHrsFullPresent],
		[ATN_PunchConfig].[MinHrsHalfPresent],
		[ATN_PunchConfig].[Active],
		[ATN_PunchConfig].[FinYear],
		[ATN_PunchConfig].[DataFileLocation] 
  FROM [ATN_PunchConfig] 
    	INNER JOIN #PageIndex
          ON [ATN_PunchConfig].[RecordID] = #PageIndex.RecordID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
