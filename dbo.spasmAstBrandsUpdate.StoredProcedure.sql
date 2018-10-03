USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstBrandsUpdate]
  @Original_BrandID NVarChar(15), 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_AstBrands] SET 
   [Description] = @Description
  WHERE
  [BrandID] = @Original_BrandID
  SET @RowCount = @@RowCount
GO
