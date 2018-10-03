USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchPrkCategories]
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
  CategoryID Int NOT NULL
  )
  INSERT INTO #PageIndex (CategoryID)
  SELECT [PRK_Categories].[CategoryID] FROM [PRK_Categories]
  WHERE STR(ISNULL([PRK_Categories].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories].[CategoryCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories].[STDCategory],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [PRK_Categories].[CategoryID] AS SearchCode, 
  ISNULL([PRK_Categories].[CategoryCode],'') 
  + ',' + ISNULL([PRK_Categories].[Description],'') 
  + ',' + ISNULL([PRK_Categories].[STDCategory],'') 
  AS SearchDescription 
  FROM [PRK_Categories] 
    	INNER JOIN #PageIndex
          ON [PRK_Categories].[CategoryID] = #PageIndex.CategoryID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
