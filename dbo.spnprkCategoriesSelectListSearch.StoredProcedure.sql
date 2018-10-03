USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkCategoriesSelectListSearch]
  @LoginID NVarChar(8),
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
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,CategoryID Int NOT NULL
  )
  INSERT INTO #PageIndex (CategoryID)
  SELECT [PRK_Categories].[CategoryID] FROM [PRK_Categories]
 WHERE  
   ( 
         STR(ISNULL([PRK_Categories].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories].[CategoryCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories].[STDCategory],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CategoryID' THEN [PRK_Categories].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [PRK_Categories].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'CategoryCode' THEN [PRK_Categories].[CategoryCode] END,
     CASE @OrderBy WHEN 'CategoryCode DESC' THEN [PRK_Categories].[CategoryCode] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PRK_Categories].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PRK_Categories].[Description] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [PRK_Categories].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [PRK_Categories].[Active] END DESC,
     CASE @OrderBy WHEN 'STDCategory' THEN [PRK_Categories].[STDCategory] END,
     CASE @OrderBy WHEN 'STDCategory DESC' THEN [PRK_Categories].[STDCategory] END DESC,
     CASE @OrderBy WHEN 'cmba' THEN [PRK_Categories].[cmba] END,
     CASE @OrderBy WHEN 'cmba DESC' THEN [PRK_Categories].[cmba] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PRK_Categories].*  
  FROM [PRK_Categories] 
      INNER JOIN #PageIndex
          ON [PRK_Categories].[CategoryID] = #PageIndex.CategoryID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
