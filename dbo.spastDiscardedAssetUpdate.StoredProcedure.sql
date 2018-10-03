USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastDiscardedAssetUpdate]
  @Remarks NVarChar(100),
  @Discarded Bit,
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @Original_AssetID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_AssetDetails] SET 
   [Remarks] = @Remarks
  ,[Discarded] = @Discarded
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  WHERE
  [AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO
