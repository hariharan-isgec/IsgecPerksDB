USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkCategoriesSelectByID]
  @CategoryID Int
  AS
  SELECT
		[PRK_Categories].[CategoryID],
		[PRK_Categories].[CategoryCode],
		[PRK_Categories].[Description],
		[PRK_Categories].[Active],
		[PRK_Categories].[STDCategory],
		[PRK_Categories].[cmba] 
  FROM [PRK_Categories] 
  WHERE
  [PRK_Categories].[CategoryID] = @CategoryID
GO
