USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastBrandsSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  BrandID Int NOT NULL
  )
  INSERT INTO #PageIndex (BrandID)
  SELECT [AST_Brands].[BrandID] FROM [AST_Brands]
  ORDER BY
     CASE @orderBy WHEN 'BrandID' THEN [AST_Brands].[BrandID] END,
     CASE @orderBy WHEN 'BrandID DESC' THEN [AST_Brands].[BrandID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [AST_Brands].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [AST_Brands].[Description] END DESC 

  SET @RecordCount = @@RowCount

  SELECT
		[AST_Brands].[BrandID],
		[AST_Brands].[Description] 
  FROM [AST_Brands] 
    	INNER JOIN #PageIndex
          ON [AST_Brands].[BrandID] = #PageIndex.BrandID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
