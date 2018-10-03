USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogStuffingPointsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_StuffingPoints].*  
  FROM [ELOG_StuffingPoints] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StuffingPointID' THEN [ELOG_StuffingPoints].[StuffingPointID] END,
     CASE @OrderBy WHEN 'StuffingPointID DESC' THEN [ELOG_StuffingPoints].[StuffingPointID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_StuffingPoints].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_StuffingPoints].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
