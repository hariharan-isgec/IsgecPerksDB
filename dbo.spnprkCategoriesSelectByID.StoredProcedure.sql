USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkCategoriesSelectByID]
  @LoginID NVarChar(8),
  @CategoryID Int 
  AS
  SELECT
    [PRK_Categories].*  
  FROM [PRK_Categories] 
  WHERE
  [PRK_Categories].[CategoryID] = @CategoryID
GO
