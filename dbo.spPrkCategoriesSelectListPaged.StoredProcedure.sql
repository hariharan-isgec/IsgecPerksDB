USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkCategoriesSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CategoryID Int NOT NULL
  )
  INSERT INTO #PageIndex (CategoryID)
  SELECT [PRK_Categories].[CategoryID] FROM [PRK_Categories]
  ORDER BY
     CASE @orderBy WHEN 'CategoryID' THEN [PRK_Categories].[CategoryID] END,
     CASE @orderBy WHEN 'CategoryID DESC' THEN [PRK_Categories].[CategoryID] END DESC,
     CASE @orderBy WHEN 'CategoryCode' THEN [PRK_Categories].[CategoryCode] END,
     CASE @orderBy WHEN 'CategoryCode DESC' THEN [PRK_Categories].[CategoryCode] END DESC,
     CASE @orderBy WHEN 'Description' THEN [PRK_Categories].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [PRK_Categories].[Description] END DESC,
     CASE @orderBy WHEN 'Active' THEN [PRK_Categories].[Active] END,
     CASE @orderBy WHEN 'Active DESC' THEN [PRK_Categories].[Active] END DESC,
     CASE @orderBy WHEN 'STDCategory' THEN [PRK_Categories].[STDCategory] END,
     CASE @orderBy WHEN 'STDCategory DESC' THEN [PRK_Categories].[STDCategory] END DESC,
     CASE @orderBy WHEN 'cmba' THEN [PRK_Categories].[cmba] END,
     CASE @orderBy WHEN 'cmba DESC' THEN [PRK_Categories].[cmba] END DESC 

  SET @RecordCount = @@RowCount

  SELECT
		[PRK_Categories].[CategoryID],
		[PRK_Categories].[CategoryCode],
		[PRK_Categories].[Description],
		[PRK_Categories].[Active],
		[PRK_Categories].[STDCategory],
		[PRK_Categories].[cmba] 
  FROM [PRK_Categories] 
    	INNER JOIN #PageIndex
          ON [PRK_Categories].[CategoryID] = #PageIndex.CategoryID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
