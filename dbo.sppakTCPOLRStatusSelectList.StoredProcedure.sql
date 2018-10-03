USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLRStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_POLineRecStatus].*  
  FROM [PAK_POLineRecStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [PAK_POLineRecStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [PAK_POLineRecStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_POLineRecStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_POLineRecStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
