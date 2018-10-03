USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogStuffingPointsSelectListFilteres]
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
 ,StuffingPointID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'StuffingPointID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_StuffingPoints].[StuffingPointID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_StuffingPoints] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'StuffingPointID' THEN '[ELOG_StuffingPoints].[StuffingPointID]'
                        WHEN 'StuffingPointID DESC' THEN '[ELOG_StuffingPoints].[StuffingPointID] DESC'
                        WHEN 'Description' THEN '[ELOG_StuffingPoints].[Description]'
                        WHEN 'Description DESC' THEN '[ELOG_StuffingPoints].[Description] DESC'
                        ELSE '[ELOG_StuffingPoints].[StuffingPointID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_StuffingPoints].*  
  FROM [ELOG_StuffingPoints] 
      INNER JOIN #PageIndex
          ON [ELOG_StuffingPoints].[StuffingPointID] = #PageIndex.StuffingPointID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
