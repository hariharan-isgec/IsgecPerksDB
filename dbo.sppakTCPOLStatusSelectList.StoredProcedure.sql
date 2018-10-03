USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_POLineStatus].*  
  FROM [PAK_POLineStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ItemStatusID' THEN [PAK_POLineStatus].[ItemStatusID] END,
     CASE @OrderBy WHEN 'ItemStatusID DESC' THEN [PAK_POLineStatus].[ItemStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_POLineStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_POLineStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
