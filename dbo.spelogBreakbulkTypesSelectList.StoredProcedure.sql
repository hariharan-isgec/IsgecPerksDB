USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBreakbulkTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_BreakbulkTypes].*  
  FROM [ELOG_BreakbulkTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'BreakbulkTypeID' THEN [ELOG_BreakbulkTypes].[BreakbulkTypeID] END,
     CASE @OrderBy WHEN 'BreakbulkTypeID DESC' THEN [ELOG_BreakbulkTypes].[BreakbulkTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_BreakbulkTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_BreakbulkTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
