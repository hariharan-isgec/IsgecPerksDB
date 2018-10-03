USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWDetailsSelectListSearch]
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
 ,MrnID Int NOT NULL
 ,AssetID Int NOT NULL
  )
  INSERT INTO #PageIndex (MrnID, AssetID)
  SELECT [ASM_AstDetails].[MrnID], [ASM_AstDetails].[AssetID] FROM [ASM_AstDetails]
 WHERE  
   ( 
         STR(ISNULL([ASM_AstDetails].[MrnID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[AssetID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[AssetTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[MrnDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[SupplierID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[ModelNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[OtherSpecifications],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[PurchasedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[RecievedAt], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[RecievedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[AssetNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[AssetSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[UserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[LocationID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[ToOfficeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[FromOfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[ProblemDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[ToSupplierID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[ModifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[ModificationRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[IPAddress],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[HostName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[DomainName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CPUBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[NoOfCPUs], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CPUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CPUSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[RAMID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[SizeOfRAM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[HDDBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[NoOfHDD], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[SizeOfHDD], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[HDDDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[HDDSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CDROMBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[NoOfCDROM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CDROMDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CDROMSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[VDUBrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[VDUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[VDUSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[PCOSID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[PCOSDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[PCOSSerialNo],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'MrnID' THEN [ASM_AstDetails].[MrnID] END,
     CASE @orderBy WHEN 'MrnID DESC' THEN [ASM_AstDetails].[MrnID] END DESC,
     CASE @orderBy WHEN 'AssetID' THEN [ASM_AstDetails].[AssetID] END,
     CASE @orderBy WHEN 'AssetID DESC' THEN [ASM_AstDetails].[AssetID] END DESC,
     CASE @orderBy WHEN 'AssetTypeID' THEN [ASM_AstDetails].[AssetTypeID] END,
     CASE @orderBy WHEN 'AssetTypeID DESC' THEN [ASM_AstDetails].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'MrnDate' THEN [ASM_AstDetails].[MrnDate] END,
     CASE @orderBy WHEN 'MrnDate DESC' THEN [ASM_AstDetails].[MrnDate] END DESC,
     CASE @orderBy WHEN 'MrnDescription' THEN [ASM_AstDetails].[MrnDescription] END,
     CASE @orderBy WHEN 'MrnDescription DESC' THEN [ASM_AstDetails].[MrnDescription] END DESC,
     CASE @orderBy WHEN 'SupplierID' THEN [ASM_AstDetails].[SupplierID] END,
     CASE @orderBy WHEN 'SupplierID DESC' THEN [ASM_AstDetails].[SupplierID] END DESC,
     CASE @orderBy WHEN 'DateOfPurchase' THEN [ASM_AstDetails].[DateOfPurchase] END,
     CASE @orderBy WHEN 'DateOfPurchase DESC' THEN [ASM_AstDetails].[DateOfPurchase] END DESC,
     CASE @orderBy WHEN 'WarrantyTill' THEN [ASM_AstDetails].[WarrantyTill] END,
     CASE @orderBy WHEN 'WarrantyTill DESC' THEN [ASM_AstDetails].[WarrantyTill] END DESC,
     CASE @orderBy WHEN 'InsuranceTill' THEN [ASM_AstDetails].[InsuranceTill] END,
     CASE @orderBy WHEN 'InsuranceTill DESC' THEN [ASM_AstDetails].[InsuranceTill] END DESC,
     CASE @orderBy WHEN 'BrandID' THEN [ASM_AstDetails].[BrandID] END,
     CASE @orderBy WHEN 'BrandID DESC' THEN [ASM_AstDetails].[BrandID] END DESC,
     CASE @orderBy WHEN 'ModelNo' THEN [ASM_AstDetails].[ModelNo] END,
     CASE @orderBy WHEN 'ModelNo DESC' THEN [ASM_AstDetails].[ModelNo] END DESC,
     CASE @orderBy WHEN 'OtherSpecifications' THEN [ASM_AstDetails].[OtherSpecifications] END,
     CASE @orderBy WHEN 'OtherSpecifications DESC' THEN [ASM_AstDetails].[OtherSpecifications] END DESC,
     CASE @orderBy WHEN 'PurchasedQuantity' THEN [ASM_AstDetails].[PurchasedQuantity] END,
     CASE @orderBy WHEN 'PurchasedQuantity DESC' THEN [ASM_AstDetails].[PurchasedQuantity] END DESC,
     CASE @orderBy WHEN 'RecievedAt' THEN [ASM_AstDetails].[RecievedAt] END,
     CASE @orderBy WHEN 'RecievedAt DESC' THEN [ASM_AstDetails].[RecievedAt] END DESC,
     CASE @orderBy WHEN 'RecievedOn' THEN [ASM_AstDetails].[RecievedOn] END,
     CASE @orderBy WHEN 'RecievedOn DESC' THEN [ASM_AstDetails].[RecievedOn] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ASM_AstDetails].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ASM_AstDetails].[Remarks] END DESC,
     CASE @orderBy WHEN 'RecievedBy' THEN [ASM_AstDetails].[RecievedBy] END,
     CASE @orderBy WHEN 'RecievedBy DESC' THEN [ASM_AstDetails].[RecievedBy] END DESC,
     CASE @orderBy WHEN 'AssetNo' THEN [ASM_AstDetails].[AssetNo] END,
     CASE @orderBy WHEN 'AssetNo DESC' THEN [ASM_AstDetails].[AssetNo] END DESC,
     CASE @orderBy WHEN 'AssetSerialNo' THEN [ASM_AstDetails].[AssetSerialNo] END,
     CASE @orderBy WHEN 'AssetSerialNo DESC' THEN [ASM_AstDetails].[AssetSerialNo] END DESC,
     CASE @orderBy WHEN 'IssueToLocation' THEN [ASM_AstDetails].[IssueToLocation] END,
     CASE @orderBy WHEN 'IssueToLocation DESC' THEN [ASM_AstDetails].[IssueToLocation] END DESC,
     CASE @orderBy WHEN 'UserID' THEN [ASM_AstDetails].[UserID] END,
     CASE @orderBy WHEN 'UserID DESC' THEN [ASM_AstDetails].[UserID] END DESC,
     CASE @orderBy WHEN 'LocationID' THEN [ASM_AstDetails].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [ASM_AstDetails].[LocationID] END DESC,
     CASE @orderBy WHEN 'Issued' THEN [ASM_AstDetails].[Issued] END,
     CASE @orderBy WHEN 'Issued DESC' THEN [ASM_AstDetails].[Issued] END DESC,
     CASE @orderBy WHEN 'StandBy' THEN [ASM_AstDetails].[StandBy] END,
     CASE @orderBy WHEN 'StandBy DESC' THEN [ASM_AstDetails].[StandBy] END DESC,
     CASE @orderBy WHEN 'ReplacedTill' THEN [ASM_AstDetails].[ReplacedTill] END,
     CASE @orderBy WHEN 'ReplacedTill DESC' THEN [ASM_AstDetails].[ReplacedTill] END DESC,
     CASE @orderBy WHEN 'Returnable' THEN [ASM_AstDetails].[Returnable] END,
     CASE @orderBy WHEN 'Returnable DESC' THEN [ASM_AstDetails].[Returnable] END DESC,
     CASE @orderBy WHEN 'ExpectedDate' THEN [ASM_AstDetails].[ExpectedDate] END,
     CASE @orderBy WHEN 'ExpectedDate DESC' THEN [ASM_AstDetails].[ExpectedDate] END DESC,
     CASE @orderBy WHEN 'Transferred' THEN [ASM_AstDetails].[Transferred] END,
     CASE @orderBy WHEN 'Transferred DESC' THEN [ASM_AstDetails].[Transferred] END DESC,
     CASE @orderBy WHEN 'ToOfficeID' THEN [ASM_AstDetails].[ToOfficeID] END,
     CASE @orderBy WHEN 'ToOfficeID DESC' THEN [ASM_AstDetails].[ToOfficeID] END DESC,
     CASE @orderBy WHEN 'RecievedTransfered' THEN [ASM_AstDetails].[RecievedTransfered] END,
     CASE @orderBy WHEN 'RecievedTransfered DESC' THEN [ASM_AstDetails].[RecievedTransfered] END DESC,
     CASE @orderBy WHEN 'FromOfficeID' THEN [ASM_AstDetails].[FromOfficeID] END,
     CASE @orderBy WHEN 'FromOfficeID DESC' THEN [ASM_AstDetails].[FromOfficeID] END DESC,
     CASE @orderBy WHEN 'Upgraded' THEN [ASM_AstDetails].[Upgraded] END,
     CASE @orderBy WHEN 'Upgraded DESC' THEN [ASM_AstDetails].[Upgraded] END DESC,
     CASE @orderBy WHEN 'ProblemDetails' THEN [ASM_AstDetails].[ProblemDetails] END,
     CASE @orderBy WHEN 'ProblemDetails DESC' THEN [ASM_AstDetails].[ProblemDetails] END DESC,
     CASE @orderBy WHEN 'OnRepair' THEN [ASM_AstDetails].[OnRepair] END,
     CASE @orderBy WHEN 'OnRepair DESC' THEN [ASM_AstDetails].[OnRepair] END DESC,
     CASE @orderBy WHEN 'ToSupplierID' THEN [ASM_AstDetails].[ToSupplierID] END,
     CASE @orderBy WHEN 'ToSupplierID DESC' THEN [ASM_AstDetails].[ToSupplierID] END DESC,
     CASE @orderBy WHEN 'Discarded' THEN [ASM_AstDetails].[Discarded] END,
     CASE @orderBy WHEN 'Discarded DESC' THEN [ASM_AstDetails].[Discarded] END DESC,
     CASE @orderBy WHEN 'Modified' THEN [ASM_AstDetails].[Modified] END,
     CASE @orderBy WHEN 'Modified DESC' THEN [ASM_AstDetails].[Modified] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [ASM_AstDetails].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [ASM_AstDetails].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [ASM_AstDetails].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [ASM_AstDetails].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'ModificationRemarks' THEN [ASM_AstDetails].[ModificationRemarks] END,
     CASE @orderBy WHEN 'ModificationRemarks DESC' THEN [ASM_AstDetails].[ModificationRemarks] END DESC,
     CASE @orderBy WHEN 'IPAddress' THEN [ASM_AstDetails].[IPAddress] END,
     CASE @orderBy WHEN 'IPAddress DESC' THEN [ASM_AstDetails].[IPAddress] END DESC,
     CASE @orderBy WHEN 'HostName' THEN [ASM_AstDetails].[HostName] END,
     CASE @orderBy WHEN 'HostName DESC' THEN [ASM_AstDetails].[HostName] END DESC,
     CASE @orderBy WHEN 'INDomain' THEN [ASM_AstDetails].[INDomain] END,
     CASE @orderBy WHEN 'INDomain DESC' THEN [ASM_AstDetails].[INDomain] END DESC,
     CASE @orderBy WHEN 'DomainName' THEN [ASM_AstDetails].[DomainName] END,
     CASE @orderBy WHEN 'DomainName DESC' THEN [ASM_AstDetails].[DomainName] END DESC,
     CASE @orderBy WHEN 'MapDrive' THEN [ASM_AstDetails].[MapDrive] END,
     CASE @orderBy WHEN 'MapDrive DESC' THEN [ASM_AstDetails].[MapDrive] END DESC,
     CASE @orderBy WHEN 'PenDriveDisable' THEN [ASM_AstDetails].[PenDriveDisable] END,
     CASE @orderBy WHEN 'PenDriveDisable DESC' THEN [ASM_AstDetails].[PenDriveDisable] END DESC,
     CASE @orderBy WHEN 'CDROMDisable' THEN [ASM_AstDetails].[CDROMDisable] END,
     CASE @orderBy WHEN 'CDROMDisable DESC' THEN [ASM_AstDetails].[CDROMDisable] END DESC,
     CASE @orderBy WHEN 'InternetAccess' THEN [ASM_AstDetails].[InternetAccess] END,
     CASE @orderBy WHEN 'InternetAccess DESC' THEN [ASM_AstDetails].[InternetAccess] END DESC,
     CASE @orderBy WHEN 'Keyboard' THEN [ASM_AstDetails].[Keyboard] END,
     CASE @orderBy WHEN 'Keyboard DESC' THEN [ASM_AstDetails].[Keyboard] END DESC,
     CASE @orderBy WHEN 'Mouse' THEN [ASM_AstDetails].[Mouse] END,
     CASE @orderBy WHEN 'Mouse DESC' THEN [ASM_AstDetails].[Mouse] END DESC,
     CASE @orderBy WHEN 'FloppyDrive' THEN [ASM_AstDetails].[FloppyDrive] END,
     CASE @orderBy WHEN 'FloppyDrive DESC' THEN [ASM_AstDetails].[FloppyDrive] END DESC,
     CASE @orderBy WHEN 'CPUBrandID' THEN [ASM_AstDetails].[CPUBrandID] END,
     CASE @orderBy WHEN 'CPUBrandID DESC' THEN [ASM_AstDetails].[CPUBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfCPUs' THEN [ASM_AstDetails].[NoOfCPUs] END,
     CASE @orderBy WHEN 'NoOfCPUs DESC' THEN [ASM_AstDetails].[NoOfCPUs] END DESC,
     CASE @orderBy WHEN 'CPUDetails' THEN [ASM_AstDetails].[CPUDetails] END,
     CASE @orderBy WHEN 'CPUDetails DESC' THEN [ASM_AstDetails].[CPUDetails] END DESC,
     CASE @orderBy WHEN 'CPUSerialNo' THEN [ASM_AstDetails].[CPUSerialNo] END,
     CASE @orderBy WHEN 'CPUSerialNo DESC' THEN [ASM_AstDetails].[CPUSerialNo] END DESC,
     CASE @orderBy WHEN 'RAMID' THEN [ASM_AstDetails].[RAMID] END,
     CASE @orderBy WHEN 'RAMID DESC' THEN [ASM_AstDetails].[RAMID] END DESC,
     CASE @orderBy WHEN 'SizeOfRAM' THEN [ASM_AstDetails].[SizeOfRAM] END,
     CASE @orderBy WHEN 'SizeOfRAM DESC' THEN [ASM_AstDetails].[SizeOfRAM] END DESC,
     CASE @orderBy WHEN 'HDDBrandID' THEN [ASM_AstDetails].[HDDBrandID] END,
     CASE @orderBy WHEN 'HDDBrandID DESC' THEN [ASM_AstDetails].[HDDBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfHDD' THEN [ASM_AstDetails].[NoOfHDD] END,
     CASE @orderBy WHEN 'NoOfHDD DESC' THEN [ASM_AstDetails].[NoOfHDD] END DESC,
     CASE @orderBy WHEN 'SizeOfHDD' THEN [ASM_AstDetails].[SizeOfHDD] END,
     CASE @orderBy WHEN 'SizeOfHDD DESC' THEN [ASM_AstDetails].[SizeOfHDD] END DESC,
     CASE @orderBy WHEN 'HDDDetails' THEN [ASM_AstDetails].[HDDDetails] END,
     CASE @orderBy WHEN 'HDDDetails DESC' THEN [ASM_AstDetails].[HDDDetails] END DESC,
     CASE @orderBy WHEN 'HDDSerialNo' THEN [ASM_AstDetails].[HDDSerialNo] END,
     CASE @orderBy WHEN 'HDDSerialNo DESC' THEN [ASM_AstDetails].[HDDSerialNo] END DESC,
     CASE @orderBy WHEN 'CDROMBrandID' THEN [ASM_AstDetails].[CDROMBrandID] END,
     CASE @orderBy WHEN 'CDROMBrandID DESC' THEN [ASM_AstDetails].[CDROMBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfCDROM' THEN [ASM_AstDetails].[NoOfCDROM] END,
     CASE @orderBy WHEN 'NoOfCDROM DESC' THEN [ASM_AstDetails].[NoOfCDROM] END DESC,
     CASE @orderBy WHEN 'CDROMDetails' THEN [ASM_AstDetails].[CDROMDetails] END,
     CASE @orderBy WHEN 'CDROMDetails DESC' THEN [ASM_AstDetails].[CDROMDetails] END DESC,
     CASE @orderBy WHEN 'CDROMSerialNo' THEN [ASM_AstDetails].[CDROMSerialNo] END,
     CASE @orderBy WHEN 'CDROMSerialNo DESC' THEN [ASM_AstDetails].[CDROMSerialNo] END DESC,
     CASE @orderBy WHEN 'VDUBrandID' THEN [ASM_AstDetails].[VDUBrandID] END,
     CASE @orderBy WHEN 'VDUBrandID DESC' THEN [ASM_AstDetails].[VDUBrandID] END DESC,
     CASE @orderBy WHEN 'VDUDetails' THEN [ASM_AstDetails].[VDUDetails] END,
     CASE @orderBy WHEN 'VDUDetails DESC' THEN [ASM_AstDetails].[VDUDetails] END DESC,
     CASE @orderBy WHEN 'VDUSerialNo' THEN [ASM_AstDetails].[VDUSerialNo] END,
     CASE @orderBy WHEN 'VDUSerialNo DESC' THEN [ASM_AstDetails].[VDUSerialNo] END DESC,
     CASE @orderBy WHEN 'PCOSID' THEN [ASM_AstDetails].[PCOSID] END,
     CASE @orderBy WHEN 'PCOSID DESC' THEN [ASM_AstDetails].[PCOSID] END DESC,
     CASE @orderBy WHEN 'PCOSDetails' THEN [ASM_AstDetails].[PCOSDetails] END,
     CASE @orderBy WHEN 'PCOSDetails DESC' THEN [ASM_AstDetails].[PCOSDetails] END DESC,
     CASE @orderBy WHEN 'PCOSSerialNo' THEN [ASM_AstDetails].[PCOSSerialNo] END,
     CASE @orderBy WHEN 'PCOSSerialNo DESC' THEN [ASM_AstDetails].[PCOSSerialNo] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ASM_AstDetails].[MrnID],
		[ASM_AstDetails].[AssetID],
		[ASM_AstDetails].[AssetTypeID],
		[ASM_AstDetails].[MrnDate],
		[ASM_AstDetails].[MrnDescription],
		[ASM_AstDetails].[SupplierID],
		[ASM_AstDetails].[DateOfPurchase],
		[ASM_AstDetails].[WarrantyTill],
		[ASM_AstDetails].[InsuranceTill],
		[ASM_AstDetails].[BrandID],
		[ASM_AstDetails].[ModelNo],
		[ASM_AstDetails].[OtherSpecifications],
		[ASM_AstDetails].[PurchasedQuantity],
		[ASM_AstDetails].[RecievedAt],
		[ASM_AstDetails].[RecievedOn],
		[ASM_AstDetails].[Remarks],
		[ASM_AstDetails].[RecievedBy],
		[ASM_AstDetails].[AssetNo],
		[ASM_AstDetails].[AssetSerialNo],
		[ASM_AstDetails].[IssueToLocation],
		[ASM_AstDetails].[UserID],
		[ASM_AstDetails].[LocationID],
		[ASM_AstDetails].[Issued],
		[ASM_AstDetails].[StandBy],
		[ASM_AstDetails].[ReplacedTill],
		[ASM_AstDetails].[Returnable],
		[ASM_AstDetails].[ExpectedDate],
		[ASM_AstDetails].[Transferred],
		[ASM_AstDetails].[ToOfficeID],
		[ASM_AstDetails].[RecievedTransfered],
		[ASM_AstDetails].[FromOfficeID],
		[ASM_AstDetails].[Upgraded],
		[ASM_AstDetails].[ProblemDetails],
		[ASM_AstDetails].[OnRepair],
		[ASM_AstDetails].[ToSupplierID],
		[ASM_AstDetails].[Discarded],
		[ASM_AstDetails].[Modified],
		[ASM_AstDetails].[ModifiedOn],
		[ASM_AstDetails].[ModifiedBy],
		[ASM_AstDetails].[ModificationRemarks],
		[ASM_AstDetails].[IPAddress],
		[ASM_AstDetails].[HostName],
		[ASM_AstDetails].[INDomain],
		[ASM_AstDetails].[DomainName],
		[ASM_AstDetails].[MapDrive],
		[ASM_AstDetails].[PenDriveDisable],
		[ASM_AstDetails].[CDROMDisable],
		[ASM_AstDetails].[InternetAccess],
		[ASM_AstDetails].[Keyboard],
		[ASM_AstDetails].[Mouse],
		[ASM_AstDetails].[FloppyDrive],
		[ASM_AstDetails].[CPUBrandID],
		[ASM_AstDetails].[NoOfCPUs],
		[ASM_AstDetails].[CPUDetails],
		[ASM_AstDetails].[CPUSerialNo],
		[ASM_AstDetails].[RAMID],
		[ASM_AstDetails].[SizeOfRAM],
		[ASM_AstDetails].[HDDBrandID],
		[ASM_AstDetails].[NoOfHDD],
		[ASM_AstDetails].[SizeOfHDD],
		[ASM_AstDetails].[HDDDetails],
		[ASM_AstDetails].[HDDSerialNo],
		[ASM_AstDetails].[CDROMBrandID],
		[ASM_AstDetails].[NoOfCDROM],
		[ASM_AstDetails].[CDROMDetails],
		[ASM_AstDetails].[CDROMSerialNo],
		[ASM_AstDetails].[VDUBrandID],
		[ASM_AstDetails].[VDUDetails],
		[ASM_AstDetails].[VDUSerialNo],
		[ASM_AstDetails].[PCOSID],
		[ASM_AstDetails].[PCOSDetails],
		[ASM_AstDetails].[PCOSSerialNo] 
  FROM [ASM_AstDetails] 
    	INNER JOIN #PageIndex
          ON [ASM_AstDetails].[MrnID] = #PageIndex.MrnID
          AND [ASM_AstDetails].[AssetID] = #PageIndex.AssetID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
