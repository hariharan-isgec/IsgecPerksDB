USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallTypesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CallTypeID NVarChar(20) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CallTypeID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_ITCallTypes].[CallTypeID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_ITCallTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallTypeID' THEN '[ADM_ITCallTypes].[CallTypeID]'
                        WHEN 'CallTypeID DESC' THEN '[ADM_ITCallTypes].[CallTypeID] DESC'
                        WHEN 'Description' THEN '[ADM_ITCallTypes].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_ITCallTypes].[Description] DESC'
                        ELSE '[ADM_ITCallTypes].[CallTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ADM_ITCallTypes].[CallTypeID],
		[ADM_ITCallTypes].[Description] 
  FROM [ADM_ITCallTypes] 
    	INNER JOIN #PageIndex
          ON [ADM_ITCallTypes].[CallTypeID] = #PageIndex.CallTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
