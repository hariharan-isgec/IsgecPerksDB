USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetFeaturesUpdate]
  @Features NVarChar(100),
  @SerialNo NVarChar(50),
  @AssetNo NVarChar(20),
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @Original_AssetID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_AssetDetails] SET 
   [Features] = @Features
  ,[SerialNo] = @SerialNo
  ,[AssetNo] = @AssetNo
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  WHERE
  [AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO
