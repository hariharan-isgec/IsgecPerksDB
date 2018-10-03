USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSAStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ATN_SAStatus].*  
  FROM [ATN_SAStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [ATN_SAStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [ATN_SAStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ATN_SAStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ATN_SAStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
