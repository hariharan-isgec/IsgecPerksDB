USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogICDCFSsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_ICDCFSs].* ,
    [ELOG_StuffingPoints1].[Description] AS ELOG_StuffingPoints1_Description 
  FROM [ELOG_ICDCFSs] 
  LEFT OUTER JOIN [ELOG_StuffingPoints] AS [ELOG_StuffingPoints1]
    ON [ELOG_ICDCFSs].[StuffingPointID] = [ELOG_StuffingPoints1].[StuffingPointID]
  WHERE 1 = 1  
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
GO
