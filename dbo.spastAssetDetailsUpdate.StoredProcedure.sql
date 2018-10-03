USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetDetailsUpdate]
  @MrnID Int,
  @AssetTypeID Int,
  @BrandID Int,
  @Model NVarChar(50),
  @Features NVarChar(100),
  @AssetNo NVarChar(20),
  @SerialNo NVarChar(50),
  @LocationID Int,
  @UserID Int,
  @Remarks NVarChar(100),
  @Discarded Bit,
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @Original_AssetID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_AssetDetails] SET 
   [MrnID] = @MrnID
  ,[AssetTypeID] = @AssetTypeID
  ,[BrandID] = @BrandID
  ,[Model] = @Model
  ,[Features] = @Features
  ,[AssetNo] = @AssetNo
  ,[SerialNo] = @SerialNo
  ,[LocationID] = @LocationID
  ,[UserID] = @UserID
  ,[Remarks] = @Remarks
  ,[Discarded] = @Discarded
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  WHERE
  [AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO
