USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtImagesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[GRT_Images].[ImageID] ,
		[GRT_Images].[Description] ,
		[GRT_Images].[ImageFileName] ,
		[GRT_Images].[DiskFileName]  
  FROM [GRT_Images] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ImageID' THEN [GRT_Images].[ImageID] END,
     CASE @OrderBy WHEN 'ImageID DESC' THEN [GRT_Images].[ImageID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [GRT_Images].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [GRT_Images].[Description] END DESC,
     CASE @OrderBy WHEN 'ImageFileName' THEN [GRT_Images].[ImageFileName] END,
     CASE @OrderBy WHEN 'ImageFileName DESC' THEN [GRT_Images].[ImageFileName] END DESC,
     CASE @OrderBy WHEN 'DiskFileName' THEN [GRT_Images].[DiskFileName] END,
     CASE @OrderBy WHEN 'DiskFileName DESC' THEN [GRT_Images].[DiskFileName] END DESC 
  SET @RecordCount = @@RowCount
GO
