USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CallStatusID NVarChar(20) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CallStatusID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_ITCallStatus].[CallStatusID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_ITCallStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallStatusID' THEN '[ADM_ITCallStatus].[CallStatusID]'
                        WHEN 'CallStatusID DESC' THEN '[ADM_ITCallStatus].[CallStatusID] DESC'
                        WHEN 'Description' THEN '[ADM_ITCallStatus].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_ITCallStatus].[Description] DESC'
                        ELSE '[ADM_ITCallStatus].[CallStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ADM_ITCallStatus].[CallStatusID],
		[ADM_ITCallStatus].[Description] 
  FROM [ADM_ITCallStatus] 
    	INNER JOIN #PageIndex
          ON [ADM_ITCallStatus].[CallStatusID] = #PageIndex.CallStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
