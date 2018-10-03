USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplicationStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ApplStatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (ApplStatusID) ' + 
               'SELECT [ATN_ApplicationStatus].[ApplStatusID] FROM [ATN_ApplicationStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ApplStatusID' THEN '[ATN_ApplicationStatus].[ApplStatusID]'
                        WHEN 'ApplStatusID DESC' THEN '[ATN_ApplicationStatus].[ApplStatusID] DESC'
                        WHEN 'Description' THEN '[ATN_ApplicationStatus].[Description]'
                        WHEN 'Description DESC' THEN '[ATN_ApplicationStatus].[Description] DESC'
                        ELSE '[ATN_ApplicationStatus].[ApplStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_ApplicationStatus].[ApplStatusID],
		[ATN_ApplicationStatus].[Description] 
  FROM [ATN_ApplicationStatus] 
    	INNER JOIN #PageIndex
          ON [ATN_ApplicationStatus].[ApplStatusID] = #PageIndex.ApplStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
