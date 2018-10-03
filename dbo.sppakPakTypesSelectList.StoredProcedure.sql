USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPakTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_PakTypes].*  
  FROM [PAK_PakTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'PackTypeID' THEN [PAK_PakTypes].[PackTypeID] END,
     CASE @OrderBy WHEN 'PackTypeID DESC' THEN [PAK_PakTypes].[PackTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_PakTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_PakTypes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
