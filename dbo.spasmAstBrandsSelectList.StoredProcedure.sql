USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstBrandsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ASM_AstBrands].[BrandID],
		[ASM_AstBrands].[Description] 
  FROM [ASM_AstBrands] 
  ORDER BY
     CASE @orderBy WHEN 'BrandID' THEN [ASM_AstBrands].[BrandID] END,
     CASE @orderBy WHEN 'BrandID DESC' THEN [ASM_AstBrands].[BrandID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_AstBrands].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_AstBrands].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
