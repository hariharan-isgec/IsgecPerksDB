USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkStatusSelectListPagedByFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  StatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (StatusID) ' + 
               'SELECT [PRK_Status].[StatusID] FROM [PRK_Status] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'StatusID' THEN '[PRK_Status].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[PRK_Status].[StatusID] DESC'
                        WHEN 'Description' THEN '[PRK_Status].[Description]'
                        WHEN 'Description DESC' THEN '[PRK_Status].[Description] DESC'
                        ELSE '[PRK_Status].[StatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PRK_Status].[StatusID],
		[PRK_Status].[Description] 
  FROM [PRK_Status] 
    	INNER JOIN #PageIndex
          ON [PRK_Status].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
