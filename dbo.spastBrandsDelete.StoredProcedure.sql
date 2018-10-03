USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastBrandsDelete]
  @Original_BrandID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_Brands]
  WHERE
  [AST_Brands].[BrandID] = @Original_BrandID
  SET @RowCount = @@RowCount
GO
