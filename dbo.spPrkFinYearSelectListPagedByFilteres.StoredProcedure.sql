USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkFinYearSelectListPagedByFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  FinYear Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (FinYear) ' + 
               'SELECT [PRK_FinYears].[FinYear] FROM [PRK_FinYears] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FinYear' THEN '[PRK_FinYears].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PRK_FinYears].[FinYear] DESC'
                        WHEN 'Description' THEN '[PRK_FinYears].[Description]'
                        WHEN 'Description DESC' THEN '[PRK_FinYears].[Description] DESC'
                        WHEN 'StartDate' THEN '[PRK_FinYears].[StartDate]'
                        WHEN 'StartDate DESC' THEN '[PRK_FinYears].[StartDate] DESC'
                        WHEN 'EndDate' THEN '[PRK_FinYears].[EndDate]'
                        WHEN 'EndDate DESC' THEN '[PRK_FinYears].[EndDate] DESC'
                        WHEN 'Status' THEN '[PRK_FinYears].[Status]'
                        WHEN 'Status DESC' THEN '[PRK_FinYears].[Status] DESC'
                        ELSE '[PRK_FinYears].[FinYear]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PRK_FinYears].[FinYear],
		[PRK_FinYears].[Description],
		[PRK_FinYears].[StartDate],
		[PRK_FinYears].[EndDate],
		[PRK_FinYears].[Status] 
  FROM [PRK_FinYears] 
    	INNER JOIN #PageIndex
          ON [PRK_FinYears].[FinYear] = #PageIndex.FinYear
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
