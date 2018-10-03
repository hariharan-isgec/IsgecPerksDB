USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtFinYearSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,FinYear NVarChar(4) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FinYear'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ATN_FinYear].[FinYear]'  SET @LGSQL = @LGSQL + ' FROM [ATN_FinYear] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FinYear' THEN '[ATN_FinYear].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_FinYear].[FinYear] DESC'
                        WHEN 'Description' THEN '[ATN_FinYear].[Description]'
                        WHEN 'Description DESC' THEN '[ATN_FinYear].[Description] DESC'
                        WHEN 'StartDate' THEN '[ATN_FinYear].[StartDate]'
                        WHEN 'StartDate DESC' THEN '[ATN_FinYear].[StartDate] DESC'
                        WHEN 'EndDate' THEN '[ATN_FinYear].[EndDate]'
                        WHEN 'EndDate DESC' THEN '[ATN_FinYear].[EndDate] DESC'
                        WHEN 'Active' THEN '[ATN_FinYear].[Active]'
                        WHEN 'Active DESC' THEN '[ATN_FinYear].[Active] DESC'
                        ELSE '[ATN_FinYear].[FinYear]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_FinYear].[FinYear],
		[ATN_FinYear].[Description],
		[ATN_FinYear].[StartDate],
		[ATN_FinYear].[EndDate],
		[ATN_FinYear].[Active] 
  FROM [ATN_FinYear] 
    	INNER JOIN #PageIndex
          ON [ATN_FinYear].[FinYear] = #PageIndex.FinYear
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
