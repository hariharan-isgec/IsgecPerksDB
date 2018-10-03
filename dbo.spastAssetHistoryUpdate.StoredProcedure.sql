USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetHistoryUpdate]
  @HistoryType NVarChar(20),
  @MrnID Int,
  @AssetID Int,
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
  @ModifiedOn DateTime,
  @ModifiedBy Int,
  @Original_HistoryID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_AssetHistory] SET 
   [HistoryType] = @HistoryType
  ,[MrnID] = @MrnID
  ,[AssetID] = @AssetID
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
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedBy] = @ModifiedBy
  WHERE
  [HistoryID] = @Original_HistoryID
  SET @RowCount = @@RowCount
GO
