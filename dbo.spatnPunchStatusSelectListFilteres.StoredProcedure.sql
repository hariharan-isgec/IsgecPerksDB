USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  PunchStatusID NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (PunchStatusID) ' + 
               'SELECT [ATN_PunchStatus].[PunchStatusID] FROM [ATN_PunchStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'PunchStatusID' THEN '[ATN_PunchStatus].[PunchStatusID]'
                        WHEN 'PunchStatusID DESC' THEN '[ATN_PunchStatus].[PunchStatusID] DESC'
                        WHEN 'Description' THEN '[ATN_PunchStatus].[Description]'
                        WHEN 'Description DESC' THEN '[ATN_PunchStatus].[Description] DESC'
                        WHEN 'PunchValue' THEN '[ATN_PunchStatus].[PunchValue]'
                        WHEN 'PunchValue DESC' THEN '[ATN_PunchStatus].[PunchValue] DESC'
                        ELSE '[ATN_PunchStatus].[PunchStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_PunchStatus].[PunchStatusID],
		[ATN_PunchStatus].[Description],
		[ATN_PunchStatus].[PunchValue] 
  FROM [ATN_PunchStatus] 
    	INNER JOIN #PageIndex
          ON [ATN_PunchStatus].[PunchStatusID] = #PageIndex.PunchStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
