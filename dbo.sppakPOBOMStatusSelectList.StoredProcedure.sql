USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBOMStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_POBOMStatus].*  
  FROM [PAK_POBOMStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [PAK_POBOMStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [PAK_POBOMStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_POBOMStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_POBOMStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
