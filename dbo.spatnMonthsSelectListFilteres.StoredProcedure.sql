USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnMonthsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,MonthID NVarChar(3) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'MonthID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ATN_Months].[MonthID]'  SET @LGSQL = @LGSQL + ' FROM [ATN_Months] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'MonthID' THEN '[ATN_Months].[MonthID]'
                        WHEN 'MonthID DESC' THEN '[ATN_Months].[MonthID] DESC'
                        WHEN 'ShortName' THEN '[ATN_Months].[ShortName]'
                        WHEN 'ShortName DESC' THEN '[ATN_Months].[ShortName] DESC'
                        WHEN 'Description' THEN '[ATN_Months].[Description]'
                        WHEN 'Description DESC' THEN '[ATN_Months].[Description] DESC'
                        ELSE '[ATN_Months].[MonthID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_Months].[MonthID],
		[ATN_Months].[ShortName],
		[ATN_Months].[Description] 
  FROM [ATN_Months] 
    	INNER JOIN #PageIndex
          ON [ATN_Months].[MonthID] = #PageIndex.MonthID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
