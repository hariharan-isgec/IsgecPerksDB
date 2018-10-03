USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnTranTypeSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  TranType NVarChar(3) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (TranType) ' + 
               'SELECT [ATN_TranType].[TranType] FROM [ATN_TranType] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TranType' THEN '[ATN_TranType].[TranType]'
                        WHEN 'TranType DESC' THEN '[ATN_TranType].[TranType] DESC'
                        WHEN 'Description' THEN '[ATN_TranType].[Description]'
                        WHEN 'Description DESC' THEN '[ATN_TranType].[Description] DESC'
                        ELSE '[ATN_TranType].[TranType]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_TranType].[TranType],
		[ATN_TranType].[Description] 
  FROM [ATN_TranType] 
    	INNER JOIN #PageIndex
          ON [ATN_TranType].[TranType] = #PageIndex.TranType
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
