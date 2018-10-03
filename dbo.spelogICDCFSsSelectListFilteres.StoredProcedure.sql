USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogICDCFSsSelectListFilteres]
  @Filter_StuffingPointID Int,
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
 ,ICDCFSID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ICDCFSID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_ICDCFSs].[ICDCFSID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_ICDCFSs] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_StuffingPoints] AS [ELOG_StuffingPoints1]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_ICDCFSs].[StuffingPointID] = [ELOG_StuffingPoints1].[StuffingPointID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_StuffingPointID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ELOG_ICDCFSs].[StuffingPointID] = ' + STR(@Filter_StuffingPointID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ICDCFSID' THEN '[ELOG_ICDCFSs].[ICDCFSID]'
                        WHEN 'ICDCFSID DESC' THEN '[ELOG_ICDCFSs].[ICDCFSID] DESC'
                        WHEN 'StuffingPointID' THEN '[ELOG_ICDCFSs].[StuffingPointID]'
                        WHEN 'StuffingPointID DESC' THEN '[ELOG_ICDCFSs].[StuffingPointID] DESC'
                        WHEN 'Description' THEN '[ELOG_ICDCFSs].[Description]'
                        WHEN 'Description DESC' THEN '[ELOG_ICDCFSs].[Description] DESC'
                        WHEN 'ELOG_StuffingPoints1_Description' THEN '[ELOG_StuffingPoints1].[Description]'
                        WHEN 'ELOG_StuffingPoints1_Description DESC' THEN '[ELOG_StuffingPoints1].[Description] DESC'
                        ELSE '[ELOG_ICDCFSs].[ICDCFSID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_ICDCFSs].* ,
    [ELOG_StuffingPoints1].[Description] AS ELOG_StuffingPoints1_Description 
  FROM [ELOG_ICDCFSs] 
      INNER JOIN #PageIndex
          ON [ELOG_ICDCFSs].[ICDCFSID] = #PageIndex.ICDCFSID
  LEFT OUTER JOIN [ELOG_StuffingPoints] AS [ELOG_StuffingPoints1]
    ON [ELOG_ICDCFSs].[StuffingPointID] = [ELOG_StuffingPoints1].[StuffingPointID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
