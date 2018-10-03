USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWTransferDetailsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TransferID Int NOT NULL
 ,MrnID Int NOT NULL
 ,AssetID Int NOT NULL
  )
  INSERT INTO #PageIndex (TransferID, MrnID, AssetID)
  SELECT [ASM_TransferDetails].[TransferID], [ASM_TransferDetails].[MrnID], [ASM_TransferDetails].[AssetID] FROM [ASM_TransferDetails]
 WHERE  
   ( 
         STR(ISNULL([ASM_TransferDetails].[TransferID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[MrnID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[AssetID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[AssetTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[MrnDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[SupplierID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[ModelNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[OtherSpecifications],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[PurchasedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[RecievedAt], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[RecievedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[AssetNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[AssetSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[UserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[LocationID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[ToOfficeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[FromOfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[ProblemDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[ToSupplierID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[ModifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[ModificationRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[IPAddress],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[HostName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[DomainName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[CPUBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[NoOfCPUs], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[CPUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[CPUSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[RAMID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[SizeOfRAM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[HDDBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[NoOfHDD], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[SizeOfHDD], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[HDDDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[HDDSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[CDROMBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[NoOfCDROM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[CDROMDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[CDROMSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[VDUBrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[VDUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[VDUSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[PCOSID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[PCOSDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[PCOSSerialNo],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'TransferID' THEN [ASM_TransferDetails].[TransferID] END,
     CASE @orderBy WHEN 'TransferID DESC' THEN [ASM_TransferDetails].[TransferID] END DESC,
     CASE @orderBy WHEN 'MrnID' THEN [ASM_TransferDetails].[MrnID] END,
     CASE @orderBy WHEN 'MrnID DESC' THEN [ASM_TransferDetails].[MrnID] END DESC,
     CASE @orderBy WHEN 'AssetID' THEN [ASM_TransferDetails].[AssetID] END,
     CASE @orderBy WHEN 'AssetID DESC' THEN [ASM_TransferDetails].[AssetID] END DESC,
     CASE @orderBy WHEN 'AssetTypeID' THEN [ASM_TransferDetails].[AssetTypeID] END,
     CASE @orderBy WHEN 'AssetTypeID DESC' THEN [ASM_TransferDetails].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'MrnDate' THEN [ASM_TransferDetails].[MrnDate] END,
     CASE @orderBy WHEN 'MrnDate DESC' THEN [ASM_TransferDetails].[MrnDate] END DESC,
     CASE @orderBy WHEN 'MrnDescription' THEN [ASM_TransferDetails].[MrnDescription] END,
     CASE @orderBy WHEN 'MrnDescription DESC' THEN [ASM_TransferDetails].[MrnDescription] END DESC,
     CASE @orderBy WHEN 'SupplierID' THEN [ASM_TransferDetails].[SupplierID] END,
     CASE @orderBy WHEN 'SupplierID DESC' THEN [ASM_TransferDetails].[SupplierID] END DESC,
     CASE @orderBy WHEN 'DateOfPurchase' THEN [ASM_TransferDetails].[DateOfPurchase] END,
     CASE @orderBy WHEN 'DateOfPurchase DESC' THEN [ASM_TransferDetails].[DateOfPurchase] END DESC,
     CASE @orderBy WHEN 'WarrantyTill' THEN [ASM_TransferDetails].[WarrantyTill] END,
     CASE @orderBy WHEN 'WarrantyTill DESC' THEN [ASM_TransferDetails].[WarrantyTill] END DESC,
     CASE @orderBy WHEN 'InsuranceTill' THEN [ASM_TransferDetails].[InsuranceTill] END,
     CASE @orderBy WHEN 'InsuranceTill DESC' THEN [ASM_TransferDetails].[InsuranceTill] END DESC,
     CASE @orderBy WHEN 'BrandID' THEN [ASM_TransferDetails].[BrandID] END,
     CASE @orderBy WHEN 'BrandID DESC' THEN [ASM_TransferDetails].[BrandID] END DESC,
     CASE @orderBy WHEN 'ModelNo' THEN [ASM_TransferDetails].[ModelNo] END,
     CASE @orderBy WHEN 'ModelNo DESC' THEN [ASM_TransferDetails].[ModelNo] END DESC,
     CASE @orderBy WHEN 'OtherSpecifications' THEN [ASM_TransferDetails].[OtherSpecifications] END,
     CASE @orderBy WHEN 'OtherSpecifications DESC' THEN [ASM_TransferDetails].[OtherSpecifications] END DESC,
     CASE @orderBy WHEN 'PurchasedQuantity' THEN [ASM_TransferDetails].[PurchasedQuantity] END,
     CASE @orderBy WHEN 'PurchasedQuantity DESC' THEN [ASM_TransferDetails].[PurchasedQuantity] END DESC,
     CASE @orderBy WHEN 'RecievedAt' THEN [ASM_TransferDetails].[RecievedAt] END,
     CASE @orderBy WHEN 'RecievedAt DESC' THEN [ASM_TransferDetails].[RecievedAt] END DESC,
     CASE @orderBy WHEN 'RecievedOn' THEN [ASM_TransferDetails].[RecievedOn] END,
     CASE @orderBy WHEN 'RecievedOn DESC' THEN [ASM_TransferDetails].[RecievedOn] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ASM_TransferDetails].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ASM_TransferDetails].[Remarks] END DESC,
     CASE @orderBy WHEN 'RecievedBy' THEN [ASM_TransferDetails].[RecievedBy] END,
     CASE @orderBy WHEN 'RecievedBy DESC' THEN [ASM_TransferDetails].[RecievedBy] END DESC,
     CASE @orderBy WHEN 'AssetNo' THEN [ASM_TransferDetails].[AssetNo] END,
     CASE @orderBy WHEN 'AssetNo DESC' THEN [ASM_TransferDetails].[AssetNo] END DESC,
     CASE @orderBy WHEN 'AssetSerialNo' THEN [ASM_TransferDetails].[AssetSerialNo] END,
     CASE @orderBy WHEN 'AssetSerialNo DESC' THEN [ASM_TransferDetails].[AssetSerialNo] END DESC,
     CASE @orderBy WHEN 'IssueToLocation' THEN [ASM_TransferDetails].[IssueToLocation] END,
     CASE @orderBy WHEN 'IssueToLocation DESC' THEN [ASM_TransferDetails].[IssueToLocation] END DESC,
     CASE @orderBy WHEN 'UserID' THEN [ASM_TransferDetails].[UserID] END,
     CASE @orderBy WHEN 'UserID DESC' THEN [ASM_TransferDetails].[UserID] END DESC,
     CASE @orderBy WHEN 'LocationID' THEN [ASM_TransferDetails].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [ASM_TransferDetails].[LocationID] END DESC,
     CASE @orderBy WHEN 'Issued' THEN [ASM_TransferDetails].[Issued] END,
     CASE @orderBy WHEN 'Issued DESC' THEN [ASM_TransferDetails].[Issued] END DESC,
     CASE @orderBy WHEN 'StandBy' THEN [ASM_TransferDetails].[StandBy] END,
     CASE @orderBy WHEN 'StandBy DESC' THEN [ASM_TransferDetails].[StandBy] END DESC,
     CASE @orderBy WHEN 'ReplacedTill' THEN [ASM_TransferDetails].[ReplacedTill] END,
     CASE @orderBy WHEN 'ReplacedTill DESC' THEN [ASM_TransferDetails].[ReplacedTill] END DESC,
     CASE @orderBy WHEN 'Returnable' THEN [ASM_TransferDetails].[Returnable] END,
     CASE @orderBy WHEN 'Returnable DESC' THEN [ASM_TransferDetails].[Returnable] END DESC,
     CASE @orderBy WHEN 'ExpectedDate' THEN [ASM_TransferDetails].[ExpectedDate] END,
     CASE @orderBy WHEN 'ExpectedDate DESC' THEN [ASM_TransferDetails].[ExpectedDate] END DESC,
     CASE @orderBy WHEN 'Transferred' THEN [ASM_TransferDetails].[Transferred] END,
     CASE @orderBy WHEN 'Transferred DESC' THEN [ASM_TransferDetails].[Transferred] END DESC,
     CASE @orderBy WHEN 'ToOfficeID' THEN [ASM_TransferDetails].[ToOfficeID] END,
     CASE @orderBy WHEN 'ToOfficeID DESC' THEN [ASM_TransferDetails].[ToOfficeID] END DESC,
     CASE @orderBy WHEN 'RecievedTransfered' THEN [ASM_TransferDetails].[RecievedTransfered] END,
     CASE @orderBy WHEN 'RecievedTransfered DESC' THEN [ASM_TransferDetails].[RecievedTransfered] END DESC,
     CASE @orderBy WHEN 'FromOfficeID' THEN [ASM_TransferDetails].[FromOfficeID] END,
     CASE @orderBy WHEN 'FromOfficeID DESC' THEN [ASM_TransferDetails].[FromOfficeID] END DESC,
     CASE @orderBy WHEN 'Upgraded' THEN [ASM_TransferDetails].[Upgraded] END,
     CASE @orderBy WHEN 'Upgraded DESC' THEN [ASM_TransferDetails].[Upgraded] END DESC,
     CASE @orderBy WHEN 'ProblemDetails' THEN [ASM_TransferDetails].[ProblemDetails] END,
     CASE @orderBy WHEN 'ProblemDetails DESC' THEN [ASM_TransferDetails].[ProblemDetails] END DESC,
     CASE @orderBy WHEN 'OnRepair' THEN [ASM_TransferDetails].[OnRepair] END,
     CASE @orderBy WHEN 'OnRepair DESC' THEN [ASM_TransferDetails].[OnRepair] END DESC,
     CASE @orderBy WHEN 'ToSupplierID' THEN [ASM_TransferDetails].[ToSupplierID] END,
     CASE @orderBy WHEN 'ToSupplierID DESC' THEN [ASM_TransferDetails].[ToSupplierID] END DESC,
     CASE @orderBy WHEN 'Discarded' THEN [ASM_TransferDetails].[Discarded] END,
     CASE @orderBy WHEN 'Discarded DESC' THEN [ASM_TransferDetails].[Discarded] END DESC,
     CASE @orderBy WHEN 'Modified' THEN [ASM_TransferDetails].[Modified] END,
     CASE @orderBy WHEN 'Modified DESC' THEN [ASM_TransferDetails].[Modified] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [ASM_TransferDetails].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [ASM_TransferDetails].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [ASM_TransferDetails].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [ASM_TransferDetails].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'ModificationRemarks' THEN [ASM_TransferDetails].[ModificationRemarks] END,
     CASE @orderBy WHEN 'ModificationRemarks DESC' THEN [ASM_TransferDetails].[ModificationRemarks] END DESC,
     CASE @orderBy WHEN 'IPAddress' THEN [ASM_TransferDetails].[IPAddress] END,
     CASE @orderBy WHEN 'IPAddress DESC' THEN [ASM_TransferDetails].[IPAddress] END DESC,
     CASE @orderBy WHEN 'HostName' THEN [ASM_TransferDetails].[HostName] END,
     CASE @orderBy WHEN 'HostName DESC' THEN [ASM_TransferDetails].[HostName] END DESC,
     CASE @orderBy WHEN 'INDomain' THEN [ASM_TransferDetails].[INDomain] END,
     CASE @orderBy WHEN 'INDomain DESC' THEN [ASM_TransferDetails].[INDomain] END DESC,
     CASE @orderBy WHEN 'DomainName' THEN [ASM_TransferDetails].[DomainName] END,
     CASE @orderBy WHEN 'DomainName DESC' THEN [ASM_TransferDetails].[DomainName] END DESC,
     CASE @orderBy WHEN 'MapDrive' THEN [ASM_TransferDetails].[MapDrive] END,
     CASE @orderBy WHEN 'MapDrive DESC' THEN [ASM_TransferDetails].[MapDrive] END DESC,
     CASE @orderBy WHEN 'PenDriveDisable' THEN [ASM_TransferDetails].[PenDriveDisable] END,
     CASE @orderBy WHEN 'PenDriveDisable DESC' THEN [ASM_TransferDetails].[PenDriveDisable] END DESC,
     CASE @orderBy WHEN 'CDROMDisable' THEN [ASM_TransferDetails].[CDROMDisable] END,
     CASE @orderBy WHEN 'CDROMDisable DESC' THEN [ASM_TransferDetails].[CDROMDisable] END DESC,
     CASE @orderBy WHEN 'InternetAccess' THEN [ASM_TransferDetails].[InternetAccess] END,
     CASE @orderBy WHEN 'InternetAccess DESC' THEN [ASM_TransferDetails].[InternetAccess] END DESC,
     CASE @orderBy WHEN 'Keyboard' THEN [ASM_TransferDetails].[Keyboard] END,
     CASE @orderBy WHEN 'Keyboard DESC' THEN [ASM_TransferDetails].[Keyboard] END DESC,
     CASE @orderBy WHEN 'Mouse' THEN [ASM_TransferDetails].[Mouse] END,
     CASE @orderBy WHEN 'Mouse DESC' THEN [ASM_TransferDetails].[Mouse] END DESC,
     CASE @orderBy WHEN 'FloppyDrive' THEN [ASM_TransferDetails].[FloppyDrive] END,
     CASE @orderBy WHEN 'FloppyDrive DESC' THEN [ASM_TransferDetails].[FloppyDrive] END DESC,
     CASE @orderBy WHEN 'CPUBrandID' THEN [ASM_TransferDetails].[CPUBrandID] END,
     CASE @orderBy WHEN 'CPUBrandID DESC' THEN [ASM_TransferDetails].[CPUBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfCPUs' THEN [ASM_TransferDetails].[NoOfCPUs] END,
     CASE @orderBy WHEN 'NoOfCPUs DESC' THEN [ASM_TransferDetails].[NoOfCPUs] END DESC,
     CASE @orderBy WHEN 'CPUDetails' THEN [ASM_TransferDetails].[CPUDetails] END,
     CASE @orderBy WHEN 'CPUDetails DESC' THEN [ASM_TransferDetails].[CPUDetails] END DESC,
     CASE @orderBy WHEN 'CPUSerialNo' THEN [ASM_TransferDetails].[CPUSerialNo] END,
     CASE @orderBy WHEN 'CPUSerialNo DESC' THEN [ASM_TransferDetails].[CPUSerialNo] END DESC,
     CASE @orderBy WHEN 'RAMID' THEN [ASM_TransferDetails].[RAMID] END,
     CASE @orderBy WHEN 'RAMID DESC' THEN [ASM_TransferDetails].[RAMID] END DESC,
     CASE @orderBy WHEN 'SizeOfRAM' THEN [ASM_TransferDetails].[SizeOfRAM] END,
     CASE @orderBy WHEN 'SizeOfRAM DESC' THEN [ASM_TransferDetails].[SizeOfRAM] END DESC,
     CASE @orderBy WHEN 'HDDBrandID' THEN [ASM_TransferDetails].[HDDBrandID] END,
     CASE @orderBy WHEN 'HDDBrandID DESC' THEN [ASM_TransferDetails].[HDDBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfHDD' THEN [ASM_TransferDetails].[NoOfHDD] END,
     CASE @orderBy WHEN 'NoOfHDD DESC' THEN [ASM_TransferDetails].[NoOfHDD] END DESC,
     CASE @orderBy WHEN 'SizeOfHDD' THEN [ASM_TransferDetails].[SizeOfHDD] END,
     CASE @orderBy WHEN 'SizeOfHDD DESC' THEN [ASM_TransferDetails].[SizeOfHDD] END DESC,
     CASE @orderBy WHEN 'HDDDetails' THEN [ASM_TransferDetails].[HDDDetails] END,
     CASE @orderBy WHEN 'HDDDetails DESC' THEN [ASM_TransferDetails].[HDDDetails] END DESC,
     CASE @orderBy WHEN 'HDDSerialNo' THEN [ASM_TransferDetails].[HDDSerialNo] END,
     CASE @orderBy WHEN 'HDDSerialNo DESC' THEN [ASM_TransferDetails].[HDDSerialNo] END DESC,
     CASE @orderBy WHEN 'CDROMBrandID' THEN [ASM_TransferDetails].[CDROMBrandID] END,
     CASE @orderBy WHEN 'CDROMBrandID DESC' THEN [ASM_TransferDetails].[CDROMBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfCDROM' THEN [ASM_TransferDetails].[NoOfCDROM] END,
     CASE @orderBy WHEN 'NoOfCDROM DESC' THEN [ASM_TransferDetails].[NoOfCDROM] END DESC,
     CASE @orderBy WHEN 'CDROMDetails' THEN [ASM_TransferDetails].[CDROMDetails] END,
     CASE @orderBy WHEN 'CDROMDetails DESC' THEN [ASM_TransferDetails].[CDROMDetails] END DESC,
     CASE @orderBy WHEN 'CDROMSerialNo' THEN [ASM_TransferDetails].[CDROMSerialNo] END,
     CASE @orderBy WHEN 'CDROMSerialNo DESC' THEN [ASM_TransferDetails].[CDROMSerialNo] END DESC,
     CASE @orderBy WHEN 'VDUBrandID' THEN [ASM_TransferDetails].[VDUBrandID] END,
     CASE @orderBy WHEN 'VDUBrandID DESC' THEN [ASM_TransferDetails].[VDUBrandID] END DESC,
     CASE @orderBy WHEN 'VDUDetails' THEN [ASM_TransferDetails].[VDUDetails] END,
     CASE @orderBy WHEN 'VDUDetails DESC' THEN [ASM_TransferDetails].[VDUDetails] END DESC,
     CASE @orderBy WHEN 'VDUSerialNo' THEN [ASM_TransferDetails].[VDUSerialNo] END,
     CASE @orderBy WHEN 'VDUSerialNo DESC' THEN [ASM_TransferDetails].[VDUSerialNo] END DESC,
     CASE @orderBy WHEN 'PCOSID' THEN [ASM_TransferDetails].[PCOSID] END,
     CASE @orderBy WHEN 'PCOSID DESC' THEN [ASM_TransferDetails].[PCOSID] END DESC,
     CASE @orderBy WHEN 'PCOSDetails' THEN [ASM_TransferDetails].[PCOSDetails] END,
     CASE @orderBy WHEN 'PCOSDetails DESC' THEN [ASM_TransferDetails].[PCOSDetails] END DESC,
     CASE @orderBy WHEN 'PCOSSerialNo' THEN [ASM_TransferDetails].[PCOSSerialNo] END,
     CASE @orderBy WHEN 'PCOSSerialNo DESC' THEN [ASM_TransferDetails].[PCOSSerialNo] END DESC 

    SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [ASM_TransferDetails].[TransferID] = #PageIndex.TransferID
          AND [ASM_TransferDetails].[MrnID] = #PageIndex.MrnID
          AND [ASM_TransferDetails].[AssetID] = #PageIndex.AssetID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
