USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogICDCFSsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ICDCFSID Int NOT NULL
  )
  INSERT INTO #PageIndex (ICDCFSID)
  SELECT [ELOG_ICDCFSs].[ICDCFSID] FROM [ELOG_ICDCFSs]
  LEFT OUTER JOIN [ELOG_StuffingPoints] AS [ELOG_StuffingPoints1]
    ON [ELOG_ICDCFSs].[StuffingPointID] = [ELOG_StuffingPoints1].[StuffingPointID]
 WHERE  
   ( 
         STR(ISNULL([ELOG_ICDCFSs].[ICDCFSID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_ICDCFSs].[StuffingPointID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_ICDCFSs].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ICDCFSID' THEN [ELOG_ICDCFSs].[ICDCFSID] END,
     CASE @OrderBy WHEN 'ICDCFSID DESC' THEN [ELOG_ICDCFSs].[ICDCFSID] END DESC,
     CASE @OrderBy WHEN 'StuffingPointID' THEN [ELOG_ICDCFSs].[StuffingPointID] END,
     CASE @OrderBy WHEN 'StuffingPointID DESC' THEN [ELOG_ICDCFSs].[StuffingPointID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_ICDCFSs].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_ICDCFSs].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_StuffingPoints1_Description' THEN [ELOG_StuffingPoints1].[Description] END,
     CASE @OrderBy WHEN 'ELOG_StuffingPoints1_Description DESC' THEN [ELOG_StuffingPoints1].[Description] END DESC 

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
