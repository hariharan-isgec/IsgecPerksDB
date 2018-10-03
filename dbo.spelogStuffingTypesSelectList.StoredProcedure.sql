USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogStuffingTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_StuffingTypes].*  
  FROM [ELOG_StuffingTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StuffingTypeID' THEN [ELOG_StuffingTypes].[StuffingTypeID] END,
     CASE @OrderBy WHEN 'StuffingTypeID DESC' THEN [ELOG_StuffingTypes].[StuffingTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_StuffingTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_StuffingTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
