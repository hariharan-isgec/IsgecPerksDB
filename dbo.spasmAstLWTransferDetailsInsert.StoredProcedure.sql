USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWTransferDetailsInsert]
  @TransferID Int,
  @MrnID Int,
  @AssetID Int,
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
  @Return_TransferID Int = null OUTPUT
  AS
  INSERT [ASM_TransferDetails]
  (
   [TransferID]
  ,[MrnID]
  ,[AssetID]
  ,[AssetTypeID]
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
  ,[AssetNo]
  ,[AssetSerialNo]
  ,[IssueToLocation]
  ,[UserID]
  ,[LocationID]
  ,[Issued]
  ,[StandBy]
  ,[ReplacedTill]
  ,[Returnable]
  ,[ExpectedDate]
  ,[Transferred]
  ,[ToOfficeID]
  ,[RecievedTransfered]
  ,[FromOfficeID]
  ,[Upgraded]
  ,[ProblemDetails]
  ,[OnRepair]
  ,[ToSupplierID]
  ,[Discarded]
  ,[Modified]
  ,[ModifiedOn]
  ,[ModifiedBy]
  ,[ModificationRemarks]
  ,[IPAddress]
  ,[HostName]
  ,[INDomain]
  ,[DomainName]
  ,[MapDrive]
  ,[PenDriveDisable]
  ,[CDROMDisable]
  ,[InternetAccess]
  ,[Keyboard]
  ,[Mouse]
  ,[FloppyDrive]
  ,[CPUBrandID]
  ,[NoOfCPUs]
  ,[CPUDetails]
  ,[CPUSerialNo]
  ,[RAMID]
  ,[SizeOfRAM]
  ,[HDDBrandID]
  ,[NoOfHDD]
  ,[SizeOfHDD]
  ,[HDDDetails]
  ,[HDDSerialNo]
  ,[CDROMBrandID]
  ,[NoOfCDROM]
  ,[CDROMDetails]
  ,[CDROMSerialNo]
  ,[VDUBrandID]
  ,[VDUDetails]
  ,[VDUSerialNo]
  ,[PCOSID]
  ,[PCOSDetails]
  ,[PCOSSerialNo]
  )
  VALUES
  (
   @TransferID
  ,@MrnID
  ,@AssetID
  ,@AssetTypeID
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
  ,@AssetNo
  ,@AssetSerialNo
  ,@IssueToLocation
  ,@UserID
  ,@LocationID
  ,@Issued
  ,@StandBy
  ,@ReplacedTill
  ,@Returnable
  ,@ExpectedDate
  ,@Transferred
  ,@ToOfficeID
  ,@RecievedTransfered
  ,@FromOfficeID
  ,@Upgraded
  ,@ProblemDetails
  ,@OnRepair
  ,@ToSupplierID
  ,@Discarded
  ,@Modified
  ,@ModifiedOn
  ,@ModifiedBy
  ,@ModificationRemarks
  ,@IPAddress
  ,@HostName
  ,@INDomain
  ,@DomainName
  ,@MapDrive
  ,@PenDriveDisable
  ,@CDROMDisable
  ,@InternetAccess
  ,@Keyboard
  ,@Mouse
  ,@FloppyDrive
  ,@CPUBrandID
  ,@NoOfCPUs
  ,@CPUDetails
  ,@CPUSerialNo
  ,@RAMID
  ,@SizeOfRAM
  ,@HDDBrandID
  ,@NoOfHDD
  ,@SizeOfHDD
  ,@HDDDetails
  ,@HDDSerialNo
  ,@CDROMBrandID
  ,@NoOfCDROM
  ,@CDROMDetails
  ,@CDROMSerialNo
  ,@VDUBrandID
  ,@VDUDetails
  ,@VDUSerialNo
  ,@PCOSID
  ,@PCOSDetails
  ,@PCOSSerialNo
  )
  SET @Return_TransferID = @TransferID
GO
