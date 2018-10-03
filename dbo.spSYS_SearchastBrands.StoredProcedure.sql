USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchastBrands]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  BrandID Int NOT NULL
  )
  INSERT INTO #PageIndex (BrandID)
  SELECT [AST_Brands].[BrandID] FROM [AST_Brands]
  WHERE STR(ISNULL([AST_Brands].[BrandID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Brands].[Description],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [AST_Brands].[BrandID] AS SearchCode, 
  ISNULL([AST_Brands].[Description],'') 
  AS SearchDescription 
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
