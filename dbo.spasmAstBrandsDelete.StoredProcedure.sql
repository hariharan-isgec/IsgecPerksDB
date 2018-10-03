USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstBrandsDelete]
  @Original_BrandID NVarChar(15),
  @RowCount int = null OUTPUT
  AS
  DELETE [ASM_AstBrands]
  WHERE
  [ASM_AstBrands].[BrandID] = @Original_BrandID
  SET @RowCount = @@RowCount
GO
