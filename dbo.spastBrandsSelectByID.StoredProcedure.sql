USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastBrandsSelectByID]
  @BrandID Int
  AS
  SELECT
		[AST_Brands].[BrandID],
		[AST_Brands].[Description] 
  FROM [AST_Brands] 
  WHERE
  [AST_Brands].[BrandID] = @BrandID
GO
