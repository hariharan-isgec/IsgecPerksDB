USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLRCateSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_POLineRecCategory].*  
  FROM [PAK_POLineRecCategory] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DocumentCategoryID' THEN [PAK_POLineRecCategory].[DocumentCategoryID] END,
     CASE @OrderBy WHEN 'DocumentCategoryID DESC' THEN [PAK_POLineRecCategory].[DocumentCategoryID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_POLineRecCategory].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_POLineRecCategory].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
