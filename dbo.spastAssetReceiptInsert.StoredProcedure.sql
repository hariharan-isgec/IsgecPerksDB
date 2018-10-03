USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastAssetReceiptInsert]
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
  @MrnID Int = null OUTPUT
  AS
  INSERT [AST_MRNAsset]
  (
   [MrnDescription]
  ,[AssetTypeID]
  ,[DateOfPurchase]
  ,[WarrantyTill]
  ,[InsuranceTill]
  ,[SupplierID]
  ,[BrandID]
  ,[Model]
  ,[PurchasedQuantity]
  ,[Remarks]
  )
  VALUES
  (
   @MrnDescription
  ,@AssetTypeID
  ,@DateOfPurchase
  ,@WarrantyTill
  ,@InsuranceTill
  ,@SupplierID
  ,@BrandID
  ,@Model
  ,@PurchasedQuantity
  ,@Remarks
  )
  SET @MrnID = Scope_Identity()
GO
