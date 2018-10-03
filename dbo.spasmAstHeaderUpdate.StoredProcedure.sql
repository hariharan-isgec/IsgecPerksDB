USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstHeaderUpdate]
  @Original_MrnID Int, 
  @AssetTypeID NVarChar(10),
  @MrnDate DateTime,
  @MrnDescription NVarChar(50),
  @SupplierID Int,
  @DateOfPurchase DateTime,
  @WarrantyTill DateTime,
  @InsuranceTill DateTime,
  @BrandID NVarChar(15),
  @ModelNo NVarChar(50),
  @OtherSpecifications NVarChar(50),
  @PurchasedQuantity Int,
  @RecievedAt Int,
  @RecievedOn DateTime,
  @Remarks NVarChar(50),
  @Keyboard Bit,
  @Mouse Bit,
  @FloppyDrive Bit,
  @CPUBrandID NVarChar(15),
  @NoOfCPUs Int,
  @CPUDetails NVarChar(50),
  @RAMID NVarChar(10),
  @SizeOfRAM Int,
  @HDDBrandID NVarChar(15),
  @NoOfHDD Int,
  @SizeOfHDD Int,
  @HDDDetails NVarChar(50),
  @CDROMBrandID NVarChar(15),
  @NoOfCDROM Int,
  @CDROMDetails NVarChar(50),
  @VDUBrandID NVarChar(15),
  @VDUDetails NVarChar(50),
  @PCOSID NVarChar(15),
  @PCOSDetails NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_AstHeader] SET 
   [AssetTypeID] = @AssetTypeID
  ,[MrnDate] = @MrnDate
  ,[MrnDescription] = @MrnDescription
  ,[SupplierID] = @SupplierID
  ,[DateOfPurchase] = @DateOfPurchase
  ,[WarrantyTill] = @WarrantyTill
  ,[InsuranceTill] = @InsuranceTill
  ,[BrandID] = @BrandID
  ,[ModelNo] = @ModelNo
  ,[OtherSpecifications] = @OtherSpecifications
  ,[PurchasedQuantity] = @PurchasedQuantity
  ,[RecievedAt] = @RecievedAt
  ,[RecievedOn] = @RecievedOn
  ,[Remarks] = @Remarks
  ,[Keyboard] = @Keyboard
  ,[Mouse] = @Mouse
  ,[FloppyDrive] = @FloppyDrive
  ,[CPUBrandID] = @CPUBrandID
  ,[NoOfCPUs] = @NoOfCPUs
  ,[CPUDetails] = @CPUDetails
  ,[RAMID] = @RAMID
  ,[SizeOfRAM] = @SizeOfRAM
  ,[HDDBrandID] = @HDDBrandID
  ,[NoOfHDD] = @NoOfHDD
  ,[SizeOfHDD] = @SizeOfHDD
  ,[HDDDetails] = @HDDDetails
  ,[CDROMBrandID] = @CDROMBrandID
  ,[NoOfCDROM] = @NoOfCDROM
  ,[CDROMDetails] = @CDROMDetails
  ,[VDUBrandID] = @VDUBrandID
  ,[VDUDetails] = @VDUDetails
  ,[PCOSID] = @PCOSID
  ,[PCOSDetails] = @PCOSDetails
  WHERE
  [MrnID] = @Original_MrnID
  SET @RowCount = @@RowCount
GO
