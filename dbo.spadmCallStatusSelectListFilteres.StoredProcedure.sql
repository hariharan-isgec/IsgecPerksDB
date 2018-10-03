USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCallStatusSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[ADM_CallStatus].[CallStatusID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_CallStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallStatusID' THEN '[ADM_CallStatus].[CallStatusID]'
                        WHEN 'CallStatusID DESC' THEN '[ADM_CallStatus].[CallStatusID] DESC'
                        WHEN 'Description' THEN '[ADM_CallStatus].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_CallStatus].[Description] DESC'
                        ELSE '[ADM_CallStatus].[CallStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ADM_CallStatus].[CallStatusID],
		[ADM_CallStatus].[Description] 
  FROM [ADM_CallStatus] 
    	INNER JOIN #PageIndex
          ON [ADM_CallStatus].[CallStatusID] = #PageIndex.CallStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
