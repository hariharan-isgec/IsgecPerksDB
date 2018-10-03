USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetTypesDelete]
  @Original_AssetTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_AssetTypes]
  WHERE
  [AST_AssetTypes].[AssetTypeID] = @Original_AssetTypeID
  SET @RowCount = @@RowCount
GO
