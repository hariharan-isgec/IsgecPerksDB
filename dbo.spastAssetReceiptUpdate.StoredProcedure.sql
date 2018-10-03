USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetReceiptUpdate]
  @MrnDescription NVarChar(30),
  @AssetTypeID Int,
  @DateOfPurchase DateTime,
  @WarrantyTill DateTime,
  @InsuranceTill DateTime,
  @SupplierID Int,
  @BrandID Int,
  @Model NVarChar(50),
  @PurchasedQuantity Int,
  @Remarks NVarChar(100),
  @Original_MrnID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_MRNAsset] SET 
   [MrnDescription] = @MrnDescription
  ,[AssetTypeID] = @AssetTypeID
  ,[DateOfPurchase] = @DateOfPurchase
  ,[WarrantyTill] = @WarrantyTill
  ,[InsuranceTill] = @InsuranceTill
  ,[SupplierID] = @SupplierID
  ,[BrandID] = @BrandID
  ,[Model] = @Model
  ,[PurchasedQuantity] = @PurchasedQuantity
  ,[Remarks] = @Remarks
  WHERE
  [MrnID] = @Original_MrnID
  SET @RowCount = @@RowCount
GO
