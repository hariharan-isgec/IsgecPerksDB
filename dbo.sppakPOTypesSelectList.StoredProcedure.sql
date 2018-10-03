USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_POTypes].*  
  FROM [PAK_POTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'POTypeID' THEN [PAK_POTypes].[POTypeID] END,
     CASE @OrderBy WHEN 'POTypeID DESC' THEN [PAK_POTypes].[POTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_POTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_POTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
