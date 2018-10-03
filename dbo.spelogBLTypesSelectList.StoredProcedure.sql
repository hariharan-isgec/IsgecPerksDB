USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_BLTypes].*  
  FROM [ELOG_BLTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'BLTypeID' THEN [ELOG_BLTypes].[BLTypeID] END,
     CASE @OrderBy WHEN 'BLTypeID DESC' THEN [ELOG_BLTypes].[BLTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_BLTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_BLTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
