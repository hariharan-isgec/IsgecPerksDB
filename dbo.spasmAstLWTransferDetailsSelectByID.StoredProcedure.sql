USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWTransferDetailsSelectByID]
  @TransferID Int,
  @MrnID Int,
  @AssetID Int 
  AS
  SELECT
		[ASM_TransferDetails].[TransferID],
		[ASM_TransferDetails].[MrnID],
		[ASM_TransferDetails].[AssetID],
		[ASM_TransferDetails].[AssetTypeID],
		[ASM_TransferDetails].[MrnDate],
		[ASM_TransferDetails].[MrnDescription],
		[ASM_TransferDetails].[SupplierID],
		[ASM_TransferDetails].[DateOfPurchase],
		[ASM_TransferDetails].[WarrantyTill],
		[ASM_TransferDetails].[InsuranceTill],
		[ASM_TransferDetails].[BrandID],
		[ASM_TransferDetails].[ModelNo],
		[ASM_TransferDetails].[OtherSpecifications],
		[ASM_TransferDetails].[PurchasedQuantity],
		[ASM_TransferDetails].[RecievedAt],
		[ASM_TransferDetails].[RecievedOn],
		[ASM_TransferDetails].[Remarks],
		[ASM_TransferDetails].[RecievedBy],
		[ASM_TransferDetails].[AssetNo],
		[ASM_TransferDetails].[AssetSerialNo],
		[ASM_TransferDetails].[IssueToLocation],
		[ASM_TransferDetails].[UserID],
		[ASM_TransferDetails].[LocationID],
		[ASM_TransferDetails].[Issued],
		[ASM_TransferDetails].[StandBy],
		[ASM_TransferDetails].[ReplacedTill],
		[ASM_TransferDetails].[Returnable],
		[ASM_TransferDetails].[ExpectedDate],
		[ASM_TransferDetails].[Transferred],
		[ASM_TransferDetails].[ToOfficeID],
		[ASM_TransferDetails].[RecievedTransfered],
		[ASM_TransferDetails].[FromOfficeID],
		[ASM_TransferDetails].[Upgraded],
		[ASM_TransferDetails].[ProblemDetails],
		[ASM_TransferDetails].[OnRepair],
		[ASM_TransferDetails].[ToSupplierID],
		[ASM_TransferDetails].[Discarded],
		[ASM_TransferDetails].[Modified],
		[ASM_TransferDetails].[ModifiedOn],
		[ASM_TransferDetails].[ModifiedBy],
		[ASM_TransferDetails].[ModificationRemarks],
		[ASM_TransferDetails].[IPAddress],
		[ASM_TransferDetails].[HostName],
		[ASM_TransferDetails].[INDomain],
		[ASM_TransferDetails].[DomainName],
		[ASM_TransferDetails].[MapDrive],
		[ASM_TransferDetails].[PenDriveDisable],
		[ASM_TransferDetails].[CDROMDisable],
		[ASM_TransferDetails].[InternetAccess],
		[ASM_TransferDetails].[Keyboard],
		[ASM_TransferDetails].[Mouse],
		[ASM_TransferDetails].[FloppyDrive],
		[ASM_TransferDetails].[CPUBrandID],
		[ASM_TransferDetails].[NoOfCPUs],
		[ASM_TransferDetails].[CPUDetails],
		[ASM_TransferDetails].[CPUSerialNo],
		[ASM_TransferDetails].[RAMID],
		[ASM_TransferDetails].[SizeOfRAM],
		[ASM_TransferDetails].[HDDBrandID],
		[ASM_TransferDetails].[NoOfHDD],
		[ASM_TransferDetails].[SizeOfHDD],
		[ASM_TransferDetails].[HDDDetails],
		[ASM_TransferDetails].[HDDSerialNo],
		[ASM_TransferDetails].[CDROMBrandID],
		[ASM_TransferDetails].[NoOfCDROM],
		[ASM_TransferDetails].[CDROMDetails],
		[ASM_TransferDetails].[CDROMSerialNo],
		[ASM_TransferDetails].[VDUBrandID],
		[ASM_TransferDetails].[VDUDetails],
		[ASM_TransferDetails].[VDUSerialNo],
		[ASM_TransferDetails].[PCOSID],
		[ASM_TransferDetails].[PCOSDetails],
		[ASM_TransferDetails].[PCOSSerialNo] 
  FROM [ASM_TransferDetails] 
  WHERE
  [ASM_TransferDetails].[TransferID] = @TransferID
  AND [ASM_TransferDetails].[MrnID] = @MrnID
  AND [ASM_TransferDetails].[AssetID] = @AssetID
GO
