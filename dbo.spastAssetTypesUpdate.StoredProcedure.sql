USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetTypesUpdate]
  @Description NVarChar(30),
  @Original_AssetTypeID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_AssetTypes] SET 
   [Description] = @Description
  WHERE
  [AssetTypeID] = @Original_AssetTypeID
  SET @RowCount = @@RowCount
GO
