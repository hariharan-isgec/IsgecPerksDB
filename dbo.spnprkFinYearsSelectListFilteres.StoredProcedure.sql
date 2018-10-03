USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkFinYearsSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinYear Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FinYear'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PRK_FinYears].[FinYear]'
  SET @LGSQL = @LGSQL + ' FROM [PRK_FinYears] '
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
    [PRK_FinYears].*  
  FROM [PRK_FinYears] 
      INNER JOIN #PageIndex
          ON [PRK_FinYears].[FinYear] = #PageIndex.FinYear
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
