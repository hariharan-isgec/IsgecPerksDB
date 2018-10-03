USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWHeaderInsert]
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
  @RecievedBy NVarChar(8),
  @IssuedQuantity Int,
  @WriteOffQuantity Int,
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
  @Return_MrnID Int = null OUTPUT
  AS
  INSERT [ASM_AstHeader]
  (
   [AssetTypeID]
  ,[MrnDate]
  ,[MrnDescription]
  ,[SupplierID]
  ,[DateOfPurchase]
  ,[WarrantyTill]
  ,[InsuranceTill]
  ,[BrandID]
  ,[ModelNo]
  ,[OtherSpecifications]
  ,[PurchasedQuantity]
  ,[RecievedAt]
  ,[RecievedOn]
  ,[Remarks]
  ,[RecievedBy]
  ,[IssuedQuantity]
  ,[WriteOffQuantity]
  ,[Keyboard]
  ,[Mouse]
  ,[FloppyDrive]
  ,[CPUBrandID]
  ,[NoOfCPUs]
  ,[CPUDetails]
  ,[RAMID]
  ,[SizeOfRAM]
  ,[HDDBrandID]
  ,[NoOfHDD]
  ,[SizeOfHDD]
  ,[HDDDetails]
  ,[CDROMBrandID]
  ,[NoOfCDROM]
  ,[CDROMDetails]
  ,[VDUBrandID]
  ,[VDUDetails]
  ,[PCOSID]
  ,[PCOSDetails]
  )
  VALUES
  (
   @AssetTypeID
  ,@MrnDate
  ,@MrnDescription
  ,@SupplierID
  ,@DateOfPurchase
  ,@WarrantyTill
  ,@InsuranceTill
  ,@BrandID
  ,@ModelNo
  ,@OtherSpecifications
  ,@PurchasedQuantity
  ,@RecievedAt
  ,@RecievedOn
  ,@Remarks
  ,@RecievedBy
  ,@IssuedQuantity
  ,@WriteOffQuantity
  ,@Keyboard
  ,@Mouse
  ,@FloppyDrive
  ,@CPUBrandID
  ,@NoOfCPUs
  ,@CPUDetails
  ,@RAMID
  ,@SizeOfRAM
  ,@HDDBrandID
  ,@NoOfHDD
  ,@SizeOfHDD
  ,@HDDDetails
  ,@CDROMBrandID
  ,@NoOfCDROM
  ,@CDROMDetails
  ,@VDUBrandID
  ,@VDUDetails
  ,@PCOSID
  ,@PCOSDetails
  )
  SET @Return_MrnID = Scope_Identity()
GO
