USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWDetailsUpdate]
  @Original_MrnID Int, 
  @Original_AssetID Int, 
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
  @AssetNo NVarChar(50),
  @AssetSerialNo NVarChar(50),
  @IssueToLocation Bit,
  @UserID NVarChar(8),
  @LocationID NVarChar(20),
  @Issued Bit,
  @StandBy Bit,
  @ReplacedTill DateTime,
  @Returnable Bit,
  @ExpectedDate DateTime,
  @Transferred Bit,
  @ToOfficeID Int,
  @RecievedTransfered Bit,
  @FromOfficeID Int,
  @Upgraded Bit,
  @ProblemDetails NVarChar(100),
  @OnRepair Bit,
  @ToSupplierID Int,
  @Discarded Bit,
  @Modified Bit,
  @ModifiedOn DateTime,
  @ModifiedBy NVarChar(8),
  @ModificationRemarks NVarChar(50),
  @IPAddress NVarChar(50),
  @HostName NVarChar(50),
  @INDomain Bit,
  @DomainName NVarChar(50),
  @MapDrive Bit,
  @PenDriveDisable Bit,
  @CDROMDisable Bit,
  @InternetAccess Bit,
  @Keyboard Bit,
  @Mouse Bit,
  @FloppyDrive Bit,
  @CPUBrandID NVarChar(15),
  @NoOfCPUs Int,
  @CPUDetails NVarChar(50),
  @CPUSerialNo NVarChar(100),
  @RAMID NVarChar(10),
  @SizeOfRAM Int,
  @HDDBrandID NVarChar(15),
  @NoOfHDD Int,
  @SizeOfHDD Int,
  @HDDDetails NVarChar(50),
  @HDDSerialNo NVarChar(100),
  @CDROMBrandID NVarChar(15),
  @NoOfCDROM Int,
  @CDROMDetails NVarChar(50),
  @CDROMSerialNo NVarChar(100),
  @VDUBrandID NVarChar(15),
  @VDUDetails NVarChar(50),
  @VDUSerialNo NVarChar(100),
  @PCOSID NVarChar(15),
  @PCOSDetails NVarChar(50),
  @PCOSSerialNo NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_AstDetails] SET 
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
  ,[RecievedBy] = @RecievedBy
  ,[AssetNo] = @AssetNo
  ,[AssetSerialNo] = @AssetSerialNo
  ,[IssueToLocation] = @IssueToLocation
  ,[UserID] = @UserID
  ,[LocationID] = @LocationID
  ,[Issued] = @Issued
  ,[StandBy] = @StandBy
  ,[ReplacedTill] = @ReplacedTill
  ,[Returnable] = @Returnable
  ,[ExpectedDate] = @ExpectedDate
  ,[Transferred] = @Transferred
  ,[ToOfficeID] = @ToOfficeID
  ,[RecievedTransfered] = @RecievedTransfered
  ,[FromOfficeID] = @FromOfficeID
  ,[Upgraded] = @Upgraded
  ,[ProblemDetails] = @ProblemDetails
  ,[OnRepair] = @OnRepair
  ,[ToSupplierID] = @ToSupplierID
  ,[Discarded] = @Discarded
  ,[Modified] = @Modified
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedBy] = @ModifiedBy
  ,[ModificationRemarks] = @ModificationRemarks
  ,[IPAddress] = @IPAddress
  ,[HostName] = @HostName
  ,[INDomain] = @INDomain
  ,[DomainName] = @DomainName
  ,[MapDrive] = @MapDrive
  ,[PenDriveDisable] = @PenDriveDisable
  ,[CDROMDisable] = @CDROMDisable
  ,[InternetAccess] = @InternetAccess
  ,[Keyboard] = @Keyboard
  ,[Mouse] = @Mouse
  ,[FloppyDrive] = @FloppyDrive
  ,[CPUBrandID] = @CPUBrandID
  ,[NoOfCPUs] = @NoOfCPUs
  ,[CPUDetails] = @CPUDetails
  ,[CPUSerialNo] = @CPUSerialNo
  ,[RAMID] = @RAMID
  ,[SizeOfRAM] = @SizeOfRAM
  ,[HDDBrandID] = @HDDBrandID
  ,[NoOfHDD] = @NoOfHDD
  ,[SizeOfHDD] = @SizeOfHDD
  ,[HDDDetails] = @HDDDetails
  ,[HDDSerialNo] = @HDDSerialNo
  ,[CDROMBrandID] = @CDROMBrandID
  ,[NoOfCDROM] = @NoOfCDROM
  ,[CDROMDetails] = @CDROMDetails
  ,[CDROMSerialNo] = @CDROMSerialNo
  ,[VDUBrandID] = @VDUBrandID
  ,[VDUDetails] = @VDUDetails
  ,[VDUSerialNo] = @VDUSerialNo
  ,[PCOSID] = @PCOSID
  ,[PCOSDetails] = @PCOSDetails
  ,[PCOSSerialNo] = @PCOSSerialNo
  WHERE
  [MrnID] = @Original_MrnID
  AND [AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO
