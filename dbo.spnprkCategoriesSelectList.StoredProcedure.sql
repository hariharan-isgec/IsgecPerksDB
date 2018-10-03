USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkCategoriesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PRK_Categories].*  
  FROM [PRK_Categories] 
  WHERE 1 = 1  
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
GO
