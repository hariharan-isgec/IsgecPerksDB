USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastDiscardedAssetDelete]
  @Original_AssetID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_AssetDetails]
  WHERE
  [AST_AssetDetails].[AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO
