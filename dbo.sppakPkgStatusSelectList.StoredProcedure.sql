USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_PkgStatus].*  
  FROM [PAK_PkgStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [PAK_PkgStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [PAK_PkgStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_PkgStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_PkgStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
