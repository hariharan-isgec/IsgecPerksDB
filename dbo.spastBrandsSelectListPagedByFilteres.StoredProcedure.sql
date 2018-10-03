USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastBrandsSelectListPagedByFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  BrandID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (BrandID) ' + 
               'SELECT [AST_Brands].[BrandID] FROM [AST_Brands] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BrandID' THEN '[AST_Brands].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[AST_Brands].[BrandID] DESC'
                        WHEN 'Description' THEN '[AST_Brands].[Description]'
                        WHEN 'Description DESC' THEN '[AST_Brands].[Description] DESC'
                        ELSE '[AST_Brands].[BrandID]'
                    END
  EXEC (@LGSQL)

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
  END
GO
