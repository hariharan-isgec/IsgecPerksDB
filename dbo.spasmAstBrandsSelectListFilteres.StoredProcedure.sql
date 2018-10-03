USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstBrandsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,BrandID NVarChar(15) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BrandID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_AstBrands].[BrandID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_AstBrands] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BrandID' THEN '[ASM_AstBrands].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[ASM_AstBrands].[BrandID] DESC'
                        WHEN 'Description' THEN '[ASM_AstBrands].[Description]'
                        WHEN 'Description DESC' THEN '[ASM_AstBrands].[Description] DESC'
                        ELSE '[ASM_AstBrands].[BrandID]'
                    END
  EXEC (@LGSQL)

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
