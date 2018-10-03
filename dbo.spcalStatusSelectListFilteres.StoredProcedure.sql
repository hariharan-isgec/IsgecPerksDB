USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CallStatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (CallStatusID) ' + 
               'SELECT [CAL_Status].[CallStatusID] FROM [CAL_Status] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallStatusID' THEN '[CAL_Status].[CallStatusID]'
                        WHEN 'CallStatusID DESC' THEN '[CAL_Status].[CallStatusID] DESC'
                        WHEN 'Description' THEN '[CAL_Status].[Description]'
                        WHEN 'Description DESC' THEN '[CAL_Status].[Description] DESC'
                        ELSE '[CAL_Status].[CallStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[CAL_Status].[CallStatusID],
		[CAL_Status].[Description] 
  FROM [CAL_Status] 
    	INNER JOIN #PageIndex
          ON [CAL_Status].[CallStatusID] = #PageIndex.CallStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
