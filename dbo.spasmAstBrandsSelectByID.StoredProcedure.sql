USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstBrandsSelectByID]
  @BrandID NVarChar(15) 
  AS
  SELECT
		[ASM_AstBrands].[BrandID],
		[ASM_AstBrands].[Description] 
  FROM [ASM_AstBrands] 
  WHERE
  [ASM_AstBrands].[BrandID] = @BrandID
GO
