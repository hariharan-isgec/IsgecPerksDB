USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstBrandsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,BrandID NVarChar(15) NOT NULL
  )
  INSERT INTO #PageIndex (BrandID)
  SELECT [ASM_AstBrands].[BrandID] FROM [ASM_AstBrands]
 WHERE  
   ( 
         LOWER(ISNULL([ASM_AstBrands].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'BrandID' THEN [ASM_AstBrands].[BrandID] END,
     CASE @orderBy WHEN 'BrandID DESC' THEN [ASM_AstBrands].[BrandID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_AstBrands].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_AstBrands].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ASM_AstBrands].[BrandID],
		[ASM_AstBrands].[Description] 
  FROM [ASM_AstBrands] 
    	INNER JOIN #PageIndex
          ON [ASM_AstBrands].[BrandID] = #PageIndex.BrandID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
