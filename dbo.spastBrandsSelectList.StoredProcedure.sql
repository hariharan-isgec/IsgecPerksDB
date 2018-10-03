USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastBrandsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[AST_Brands].[BrandID],
		[AST_Brands].[Description] 
  FROM [AST_Brands] 
  ORDER BY
     CASE @orderBy WHEN 'BrandID' THEN [AST_Brands].[BrandID] END,
     CASE @orderBy WHEN 'BrandID DESC' THEN [AST_Brands].[BrandID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [AST_Brands].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [AST_Brands].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
