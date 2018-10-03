USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnProcessPunchSelectListFilteres]
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
               'SELECT [ATN_ProcessPunch].[RecordID] FROM [ATN_ProcessPunch] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [ATN_ProcessPunch].[FinYear] = ''' + @FinYear + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RecordID' THEN '[ATN_ProcessPunch].[RecordID]'
                        WHEN 'RecordID DESC' THEN '[ATN_ProcessPunch].[RecordID] DESC'
                        WHEN 'ProcessDate' THEN '[ATN_ProcessPunch].[ProcessDate]'
                        WHEN 'ProcessDate DESC' THEN '[ATN_ProcessPunch].[ProcessDate] DESC'
                        WHEN 'Processed' THEN '[ATN_ProcessPunch].[Processed]'
                        WHEN 'Processed DESC' THEN '[ATN_ProcessPunch].[Processed] DESC'
                        WHEN 'FinYear' THEN '[ATN_ProcessPunch].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_ProcessPunch].[FinYear] DESC'
                        ELSE '[ATN_ProcessPunch].[RecordID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_ProcessPunch].[RecordID],
		[ATN_ProcessPunch].[ProcessDate],
		[ATN_ProcessPunch].[Processed],
		[ATN_ProcessPunch].[FinYear] 
  FROM [ATN_ProcessPunch] 
    	INNER JOIN #PageIndex
          ON [ATN_ProcessPunch].[RecordID] = #PageIndex.RecordID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
