USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastBrandsUpdate]
  @Description NVarChar(50),
  @Original_BrandID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_Brands] SET 
   [Description] = @Description
  WHERE
  [BrandID] = @Original_BrandID
  SET @RowCount = @@RowCount
GO
