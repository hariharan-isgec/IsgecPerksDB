USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakReasonsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_Reasons].*  
  FROM [PAK_Reasons] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ReasonID' THEN [PAK_Reasons].[ReasonID] END,
     CASE @OrderBy WHEN 'ReasonID DESC' THEN [PAK_Reasons].[ReasonID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_Reasons].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_Reasons].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
