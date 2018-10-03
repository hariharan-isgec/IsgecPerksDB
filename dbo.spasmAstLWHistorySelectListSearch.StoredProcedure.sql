USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWHistorySelectListSearch]
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
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (MrnID, AssetID, SerialNo)
  SELECT [ASM_AstHistory].[MrnID], [ASM_AstHistory].[AssetID], [ASM_AstHistory].[SerialNo] FROM [ASM_AstHistory]
 WHERE  
   ( 
         STR(ISNULL([ASM_AstHistory].[MrnID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHistory].[AssetID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHistory].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[ActivityID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[AssetTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[MrnDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHistory].[SupplierID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[ModelNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[OtherSpecifications],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHistory].[PurchasedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHistory].[RecievedAt], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[RecievedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[AssetNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[AssetSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[UserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[LocationID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHistory].[ToOfficeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHistory].[FromOfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[ProblemDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHistory].[ToSupplierID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[ModifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[ModificationRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[IPAddress],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[HostName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[DomainName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[CPUBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHistory].[NoOfCPUs], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[CPUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[CPUSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[RAMID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHistory].[SizeOfRAM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[HDDBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHistory].[NoOfHDD], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHistory].[SizeOfHDD], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[HDDDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[HDDSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[CDROMBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHistory].[NoOfCDROM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[CDROMDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[CDROMSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[VDUBrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[VDUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[VDUSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[PCOSID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[PCOSDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHistory].[PCOSSerialNo],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'MrnID' THEN [ASM_AstHistory].[MrnID] END,
     CASE @orderBy WHEN 'MrnID DESC' THEN [ASM_AstHistory].[MrnID] END DESC,
     CASE @orderBy WHEN 'AssetID' THEN [ASM_AstHistory].[AssetID] END,
     CASE @orderBy WHEN 'AssetID DESC' THEN [ASM_AstHistory].[AssetID] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [ASM_AstHistory].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [ASM_AstHistory].[SerialNo] END DESC,
     CASE @orderBy WHEN 'ActivityID' THEN [ASM_AstHistory].[ActivityID] END,
     CASE @orderBy WHEN 'ActivityID DESC' THEN [ASM_AstHistory].[ActivityID] END DESC,
     CASE @orderBy WHEN 'AssetTypeID' THEN [ASM_AstHistory].[AssetTypeID] END,
     CASE @orderBy WHEN 'AssetTypeID DESC' THEN [ASM_AstHistory].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'MrnDate' THEN [ASM_AstHistory].[MrnDate] END,
     CASE @orderBy WHEN 'MrnDate DESC' THEN [ASM_AstHistory].[MrnDate] END DESC,
     CASE @orderBy WHEN 'MrnDescription' THEN [ASM_AstHistory].[MrnDescription] END,
     CASE @orderBy WHEN 'MrnDescription DESC' THEN [ASM_AstHistory].[MrnDescription] END DESC,
     CASE @orderBy WHEN 'SupplierID' THEN [ASM_AstHistory].[SupplierID] END,
     CASE @orderBy WHEN 'SupplierID DESC' THEN [ASM_AstHistory].[SupplierID] END DESC,
     CASE @orderBy WHEN 'DateOfPurchase' THEN [ASM_AstHistory].[DateOfPurchase] END,
     CASE @orderBy WHEN 'DateOfPurchase DESC' THEN [ASM_AstHistory].[DateOfPurchase] END DESC,
     CASE @orderBy WHEN 'WarrantyTill' THEN [ASM_AstHistory].[WarrantyTill] END,
     CASE @orderBy WHEN 'WarrantyTill DESC' THEN [ASM_AstHistory].[WarrantyTill] END DESC,
     CASE @orderBy WHEN 'InsuranceTill' THEN [ASM_AstHistory].[InsuranceTill] END,
     CASE @orderBy WHEN 'InsuranceTill DESC' THEN [ASM_AstHistory].[InsuranceTill] END DESC,
     CASE @orderBy WHEN 'BrandID' THEN [ASM_AstHistory].[BrandID] END,
     CASE @orderBy WHEN 'BrandID DESC' THEN [ASM_AstHistory].[BrandID] END DESC,
     CASE @orderBy WHEN 'ModelNo' THEN [ASM_AstHistory].[ModelNo] END,
     CASE @orderBy WHEN 'ModelNo DESC' THEN [ASM_AstHistory].[ModelNo] END DESC,
     CASE @orderBy WHEN 'OtherSpecifications' THEN [ASM_AstHistory].[OtherSpecifications] END,
     CASE @orderBy WHEN 'OtherSpecifications DESC' THEN [ASM_AstHistory].[OtherSpecifications] END DESC,
     CASE @orderBy WHEN 'PurchasedQuantity' THEN [ASM_AstHistory].[PurchasedQuantity] END,
     CASE @orderBy WHEN 'PurchasedQuantity DESC' THEN [ASM_AstHistory].[PurchasedQuantity] END DESC,
     CASE @orderBy WHEN 'RecievedAt' THEN [ASM_AstHistory].[RecievedAt] END,
     CASE @orderBy WHEN 'RecievedAt DESC' THEN [ASM_AstHistory].[RecievedAt] END DESC,
     CASE @orderBy WHEN 'RecievedOn' THEN [ASM_AstHistory].[RecievedOn] END,
     CASE @orderBy WHEN 'RecievedOn DESC' THEN [ASM_AstHistory].[RecievedOn] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ASM_AstHistory].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ASM_AstHistory].[Remarks] END DESC,
     CASE @orderBy WHEN 'RecievedBy' THEN [ASM_AstHistory].[RecievedBy] END,
     CASE @orderBy WHEN 'RecievedBy DESC' THEN [ASM_AstHistory].[RecievedBy] END DESC,
     CASE @orderBy WHEN 'AssetNo' THEN [ASM_AstHistory].[AssetNo] END,
     CASE @orderBy WHEN 'AssetNo DESC' THEN [ASM_AstHistory].[AssetNo] END DESC,
     CASE @orderBy WHEN 'AssetSerialNo' THEN [ASM_AstHistory].[AssetSerialNo] END,
     CASE @orderBy WHEN 'AssetSerialNo DESC' THEN [ASM_AstHistory].[AssetSerialNo] END DESC,
     CASE @orderBy WHEN 'IssueToLocation' THEN [ASM_AstHistory].[IssueToLocation] END,
     CASE @orderBy WHEN 'IssueToLocation DESC' THEN [ASM_AstHistory].[IssueToLocation] END DESC,
     CASE @orderBy WHEN 'UserID' THEN [ASM_AstHistory].[UserID] END,
     CASE @orderBy WHEN 'UserID DESC' THEN [ASM_AstHistory].[UserID] END DESC,
     CASE @orderBy WHEN 'LocationID' THEN [ASM_AstHistory].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [ASM_AstHistory].[LocationID] END DESC,
     CASE @orderBy WHEN 'Issued' THEN [ASM_AstHistory].[Issued] END,
     CASE @orderBy WHEN 'Issued DESC' THEN [ASM_AstHistory].[Issued] END DESC,
     CASE @orderBy WHEN 'StandBy' THEN [ASM_AstHistory].[StandBy] END,
     CASE @orderBy WHEN 'StandBy DESC' THEN [ASM_AstHistory].[StandBy] END DESC,
     CASE @orderBy WHEN 'ReplacedTill' THEN [ASM_AstHistory].[ReplacedTill] END,
     CASE @orderBy WHEN 'ReplacedTill DESC' THEN [ASM_AstHistory].[ReplacedTill] END DESC,
     CASE @orderBy WHEN 'Returnable' THEN [ASM_AstHistory].[Returnable] END,
     CASE @orderBy WHEN 'Returnable DESC' THEN [ASM_AstHistory].[Returnable] END DESC,
     CASE @orderBy WHEN 'ExpectedDate' THEN [ASM_AstHistory].[ExpectedDate] END,
     CASE @orderBy WHEN 'ExpectedDate DESC' THEN [ASM_AstHistory].[ExpectedDate] END DESC,
     CASE @orderBy WHEN 'Transferred' THEN [ASM_AstHistory].[Transferred] END,
     CASE @orderBy WHEN 'Transferred DESC' THEN [ASM_AstHistory].[Transferred] END DESC,
     CASE @orderBy WHEN 'ToOfficeID' THEN [ASM_AstHistory].[ToOfficeID] END,
     CASE @orderBy WHEN 'ToOfficeID DESC' THEN [ASM_AstHistory].[ToOfficeID] END DESC,
     CASE @orderBy WHEN 'RecievedTransfered' THEN [ASM_AstHistory].[RecievedTransfered] END,
     CASE @orderBy WHEN 'RecievedTransfered DESC' THEN [ASM_AstHistory].[RecievedTransfered] END DESC,
     CASE @orderBy WHEN 'FromOfficeID' THEN [ASM_AstHistory].[FromOfficeID] END,
     CASE @orderBy WHEN 'FromOfficeID DESC' THEN [ASM_AstHistory].[FromOfficeID] END DESC,
     CASE @orderBy WHEN 'Upgraded' THEN [ASM_AstHistory].[Upgraded] END,
     CASE @orderBy WHEN 'Upgraded DESC' THEN [ASM_AstHistory].[Upgraded] END DESC,
     CASE @orderBy WHEN 'ProblemDetails' THEN [ASM_AstHistory].[ProblemDetails] END,
     CASE @orderBy WHEN 'ProblemDetails DESC' THEN [ASM_AstHistory].[ProblemDetails] END DESC,
     CASE @orderBy WHEN 'OnRepair' THEN [ASM_AstHistory].[OnRepair] END,
     CASE @orderBy WHEN 'OnRepair DESC' THEN [ASM_AstHistory].[OnRepair] END DESC,
     CASE @orderBy WHEN 'ToSupplierID' THEN [ASM_AstHistory].[ToSupplierID] END,
     CASE @orderBy WHEN 'ToSupplierID DESC' THEN [ASM_AstHistory].[ToSupplierID] END DESC,
     CASE @orderBy WHEN 'Discarded' THEN [ASM_AstHistory].[Discarded] END,
     CASE @orderBy WHEN 'Discarded DESC' THEN [ASM_AstHistory].[Discarded] END DESC,
     CASE @orderBy WHEN 'Modified' THEN [ASM_AstHistory].[Modified] END,
     CASE @orderBy WHEN 'Modified DESC' THEN [ASM_AstHistory].[Modified] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [ASM_AstHistory].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [ASM_AstHistory].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [ASM_AstHistory].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [ASM_AstHistory].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'ModificationRemarks' THEN [ASM_AstHistory].[ModificationRemarks] END,
     CASE @orderBy WHEN 'ModificationRemarks DESC' THEN [ASM_AstHistory].[ModificationRemarks] END DESC,
     CASE @orderBy WHEN 'IPAddress' THEN [ASM_AstHistory].[IPAddress] END,
     CASE @orderBy WHEN 'IPAddress DESC' THEN [ASM_AstHistory].[IPAddress] END DESC,
     CASE @orderBy WHEN 'HostName' THEN [ASM_AstHistory].[HostName] END,
     CASE @orderBy WHEN 'HostName DESC' THEN [ASM_AstHistory].[HostName] END DESC,
     CASE @orderBy WHEN 'INDomain' THEN [ASM_AstHistory].[INDomain] END,
     CASE @orderBy WHEN 'INDomain DESC' THEN [ASM_AstHistory].[INDomain] END DESC,
     CASE @orderBy WHEN 'DomainName' THEN [ASM_AstHistory].[DomainName] END,
     CASE @orderBy WHEN 'DomainName DESC' THEN [ASM_AstHistory].[DomainName] END DESC,
     CASE @orderBy WHEN 'MapDrive' THEN [ASM_AstHistory].[MapDrive] END,
     CASE @orderBy WHEN 'MapDrive DESC' THEN [ASM_AstHistory].[MapDrive] END DESC,
     CASE @orderBy WHEN 'PenDriveDisable' THEN [ASM_AstHistory].[PenDriveDisable] END,
     CASE @orderBy WHEN 'PenDriveDisable DESC' THEN [ASM_AstHistory].[PenDriveDisable] END DESC,
     CASE @orderBy WHEN 'CDROMDisable' THEN [ASM_AstHistory].[CDROMDisable] END,
     CASE @orderBy WHEN 'CDROMDisable DESC' THEN [ASM_AstHistory].[CDROMDisable] END DESC,
     CASE @orderBy WHEN 'InternetAccess' THEN [ASM_AstHistory].[InternetAccess] END,
     CASE @orderBy WHEN 'InternetAccess DESC' THEN [ASM_AstHistory].[InternetAccess] END DESC,
     CASE @orderBy WHEN 'Keyboard' THEN [ASM_AstHistory].[Keyboard] END,
     CASE @orderBy WHEN 'Keyboard DESC' THEN [ASM_AstHistory].[Keyboard] END DESC,
     CASE @orderBy WHEN 'Mouse' THEN [ASM_AstHistory].[Mouse] END,
     CASE @orderBy WHEN 'Mouse DESC' THEN [ASM_AstHistory].[Mouse] END DESC,
     CASE @orderBy WHEN 'FloppyDrive' THEN [ASM_AstHistory].[FloppyDrive] END,
     CASE @orderBy WHEN 'FloppyDrive DESC' THEN [ASM_AstHistory].[FloppyDrive] END DESC,
     CASE @orderBy WHEN 'CPUBrandID' THEN [ASM_AstHistory].[CPUBrandID] END,
     CASE @orderBy WHEN 'CPUBrandID DESC' THEN [ASM_AstHistory].[CPUBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfCPUs' THEN [ASM_AstHistory].[NoOfCPUs] END,
     CASE @orderBy WHEN 'NoOfCPUs DESC' THEN [ASM_AstHistory].[NoOfCPUs] END DESC,
     CASE @orderBy WHEN 'CPUDetails' THEN [ASM_AstHistory].[CPUDetails] END,
     CASE @orderBy WHEN 'CPUDetails DESC' THEN [ASM_AstHistory].[CPUDetails] END DESC,
     CASE @orderBy WHEN 'CPUSerialNo' THEN [ASM_AstHistory].[CPUSerialNo] END,
     CASE @orderBy WHEN 'CPUSerialNo DESC' THEN [ASM_AstHistory].[CPUSerialNo] END DESC,
     CASE @orderBy WHEN 'RAMID' THEN [ASM_AstHistory].[RAMID] END,
     CASE @orderBy WHEN 'RAMID DESC' THEN [ASM_AstHistory].[RAMID] END DESC,
     CASE @orderBy WHEN 'SizeOfRAM' THEN [ASM_AstHistory].[SizeOfRAM] END,
     CASE @orderBy WHEN 'SizeOfRAM DESC' THEN [ASM_AstHistory].[SizeOfRAM] END DESC,
     CASE @orderBy WHEN 'HDDBrandID' THEN [ASM_AstHistory].[HDDBrandID] END,
     CASE @orderBy WHEN 'HDDBrandID DESC' THEN [ASM_AstHistory].[HDDBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfHDD' THEN [ASM_AstHistory].[NoOfHDD] END,
     CASE @orderBy WHEN 'NoOfHDD DESC' THEN [ASM_AstHistory].[NoOfHDD] END DESC,
     CASE @orderBy WHEN 'SizeOfHDD' THEN [ASM_AstHistory].[SizeOfHDD] END,
     CASE @orderBy WHEN 'SizeOfHDD DESC' THEN [ASM_AstHistory].[SizeOfHDD] END DESC,
     CASE @orderBy WHEN 'HDDDetails' THEN [ASM_AstHistory].[HDDDetails] END,
     CASE @orderBy WHEN 'HDDDetails DESC' THEN [ASM_AstHistory].[HDDDetails] END DESC,
     CASE @orderBy WHEN 'HDDSerialNo' THEN [ASM_AstHistory].[HDDSerialNo] END,
     CASE @orderBy WHEN 'HDDSerialNo DESC' THEN [ASM_AstHistory].[HDDSerialNo] END DESC,
     CASE @orderBy WHEN 'CDROMBrandID' THEN [ASM_AstHistory].[CDROMBrandID] END,
     CASE @orderBy WHEN 'CDROMBrandID DESC' THEN [ASM_AstHistory].[CDROMBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfCDROM' THEN [ASM_AstHistory].[NoOfCDROM] END,
     CASE @orderBy WHEN 'NoOfCDROM DESC' THEN [ASM_AstHistory].[NoOfCDROM] END DESC,
     CASE @orderBy WHEN 'CDROMDetails' THEN [ASM_AstHistory].[CDROMDetails] END,
     CASE @orderBy WHEN 'CDROMDetails DESC' THEN [ASM_AstHistory].[CDROMDetails] END DESC,
     CASE @orderBy WHEN 'CDROMSerialNo' THEN [ASM_AstHistory].[CDROMSerialNo] END,
     CASE @orderBy WHEN 'CDROMSerialNo DESC' THEN [ASM_AstHistory].[CDROMSerialNo] END DESC,
     CASE @orderBy WHEN 'VDUBrandID' THEN [ASM_AstHistory].[VDUBrandID] END,
     CASE @orderBy WHEN 'VDUBrandID DESC' THEN [ASM_AstHistory].[VDUBrandID] END DESC,
     CASE @orderBy WHEN 'VDUDetails' THEN [ASM_AstHistory].[VDUDetails] END,
     CASE @orderBy WHEN 'VDUDetails DESC' THEN [ASM_AstHistory].[VDUDetails] END DESC,
     CASE @orderBy WHEN 'VDUSerialNo' THEN [ASM_AstHistory].[VDUSerialNo] END,
     CASE @orderBy WHEN 'VDUSerialNo DESC' THEN [ASM_AstHistory].[VDUSerialNo] END DESC,
     CASE @orderBy WHEN 'PCOSID' THEN [ASM_AstHistory].[PCOSID] END,
     CASE @orderBy WHEN 'PCOSID DESC' THEN [ASM_AstHistory].[PCOSID] END DESC,
     CASE @orderBy WHEN 'PCOSDetails' THEN [ASM_AstHistory].[PCOSDetails] END,
     CASE @orderBy WHEN 'PCOSDetails DESC' THEN [ASM_AstHistory].[PCOSDetails] END DESC,
     CASE @orderBy WHEN 'PCOSSerialNo' THEN [ASM_AstHistory].[PCOSSerialNo] END,
     CASE @orderBy WHEN 'PCOSSerialNo DESC' THEN [ASM_AstHistory].[PCOSSerialNo] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ASM_AstHistory].[MrnID],
		[ASM_AstHistory].[AssetID],
		[ASM_AstHistory].[SerialNo],
		[ASM_AstHistory].[ActivityID],
		[ASM_AstHistory].[AssetTypeID],
		[ASM_AstHistory].[MrnDate],
		[ASM_AstHistory].[MrnDescription],
		[ASM_AstHistory].[SupplierID],
		[ASM_AstHistory].[DateOfPurchase],
		[ASM_AstHistory].[WarrantyTill],
		[ASM_AstHistory].[InsuranceTill],
		[ASM_AstHistory].[BrandID],
		[ASM_AstHistory].[ModelNo],
		[ASM_AstHistory].[OtherSpecifications],
		[ASM_AstHistory].[PurchasedQuantity],
		[ASM_AstHistory].[RecievedAt],
		[ASM_AstHistory].[RecievedOn],
		[ASM_AstHistory].[Remarks],
		[ASM_AstHistory].[RecievedBy],
		[ASM_AstHistory].[AssetNo],
		[ASM_AstHistory].[AssetSerialNo],
		[ASM_AstHistory].[IssueToLocation],
		[ASM_AstHistory].[UserID],
		[ASM_AstHistory].[LocationID],
		[ASM_AstHistory].[Issued],
		[ASM_AstHistory].[StandBy],
		[ASM_AstHistory].[ReplacedTill],
		[ASM_AstHistory].[Returnable],
		[ASM_AstHistory].[ExpectedDate],
		[ASM_AstHistory].[Transferred],
		[ASM_AstHistory].[ToOfficeID],
		[ASM_AstHistory].[RecievedTransfered],
		[ASM_AstHistory].[FromOfficeID],
		[ASM_AstHistory].[Upgraded],
		[ASM_AstHistory].[ProblemDetails],
		[ASM_AstHistory].[OnRepair],
		[ASM_AstHistory].[ToSupplierID],
		[ASM_AstHistory].[Discarded],
		[ASM_AstHistory].[Modified],
		[ASM_AstHistory].[ModifiedOn],
		[ASM_AstHistory].[ModifiedBy],
		[ASM_AstHistory].[ModificationRemarks],
		[ASM_AstHistory].[IPAddress],
		[ASM_AstHistory].[HostName],
		[ASM_AstHistory].[INDomain],
		[ASM_AstHistory].[DomainName],
		[ASM_AstHistory].[MapDrive],
		[ASM_AstHistory].[PenDriveDisable],
		[ASM_AstHistory].[CDROMDisable],
		[ASM_AstHistory].[InternetAccess],
		[ASM_AstHistory].[Keyboard],
		[ASM_AstHistory].[Mouse],
		[ASM_AstHistory].[FloppyDrive],
		[ASM_AstHistory].[CPUBrandID],
		[ASM_AstHistory].[NoOfCPUs],
		[ASM_AstHistory].[CPUDetails],
		[ASM_AstHistory].[CPUSerialNo],
		[ASM_AstHistory].[RAMID],
		[ASM_AstHistory].[SizeOfRAM],
		[ASM_AstHistory].[HDDBrandID],
		[ASM_AstHistory].[NoOfHDD],
		[ASM_AstHistory].[SizeOfHDD],
		[ASM_AstHistory].[HDDDetails],
		[ASM_AstHistory].[HDDSerialNo],
		[ASM_AstHistory].[CDROMBrandID],
		[ASM_AstHistory].[NoOfCDROM],
		[ASM_AstHistory].[CDROMDetails],
		[ASM_AstHistory].[CDROMSerialNo],
		[ASM_AstHistory].[VDUBrandID],
		[ASM_AstHistory].[VDUDetails],
		[ASM_AstHistory].[VDUSerialNo],
		[ASM_AstHistory].[PCOSID],
		[ASM_AstHistory].[PCOSDetails],
		[ASM_AstHistory].[PCOSSerialNo] 
  FROM [ASM_AstHistory] 
    	INNER JOIN #PageIndex
          ON [ASM_AstHistory].[MrnID] = #PageIndex.MrnID
          AND [ASM_AstHistory].[AssetID] = #PageIndex.AssetID
          AND [ASM_AstHistory].[SerialNo] = #PageIndex.SerialNo
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
