USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalPrioritySelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  Priority NVarChar(1) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (Priority) ' + 
               'SELECT [CAL_Priority].[Priority] FROM [CAL_Priority] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'Priority' THEN '[CAL_Priority].[Priority]'
                        WHEN 'Priority DESC' THEN '[CAL_Priority].[Priority] DESC'
                        WHEN 'Description' THEN '[CAL_Priority].[Description]'
                        WHEN 'Description DESC' THEN '[CAL_Priority].[Description] DESC'
                        ELSE '[CAL_Priority].[Priority]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[CAL_Priority].[Priority],
		[CAL_Priority].[Description] 
  FROM [CAL_Priority] 
    	INNER JOIN #PageIndex
          ON [CAL_Priority].[Priority] = #PageIndex.Priority
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
