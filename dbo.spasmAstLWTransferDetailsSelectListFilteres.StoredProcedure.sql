USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWTransferDetailsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TransferID Int NOT NULL
 ,MrnID Int NOT NULL
 ,AssetID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TransferID'  SET @LGSQL = @LGSQL + ', MrnID'  SET @LGSQL = @LGSQL + ', AssetID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_TransferDetails].[TransferID]'  SET @LGSQL = @LGSQL + ', [ASM_TransferDetails].[MrnID]'  SET @LGSQL = @LGSQL + ', [ASM_TransferDetails].[AssetID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_TransferDetails] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TransferID' THEN '[ASM_TransferDetails].[TransferID]'
                        WHEN 'TransferID DESC' THEN '[ASM_TransferDetails].[TransferID] DESC'
                        WHEN 'MrnID' THEN '[ASM_TransferDetails].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[ASM_TransferDetails].[MrnID] DESC'
                        WHEN 'AssetID' THEN '[ASM_TransferDetails].[AssetID]'
                        WHEN 'AssetID DESC' THEN '[ASM_TransferDetails].[AssetID] DESC'
                        WHEN 'AssetTypeID' THEN '[ASM_TransferDetails].[AssetTypeID]'
                        WHEN 'AssetTypeID DESC' THEN '[ASM_TransferDetails].[AssetTypeID] DESC'
                        WHEN 'MrnDate' THEN '[ASM_TransferDetails].[MrnDate]'
                        WHEN 'MrnDate DESC' THEN '[ASM_TransferDetails].[MrnDate] DESC'
                        WHEN 'MrnDescription' THEN '[ASM_TransferDetails].[MrnDescription]'
                        WHEN 'MrnDescription DESC' THEN '[ASM_TransferDetails].[MrnDescription] DESC'
                        WHEN 'SupplierID' THEN '[ASM_TransferDetails].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[ASM_TransferDetails].[SupplierID] DESC'
                        WHEN 'DateOfPurchase' THEN '[ASM_TransferDetails].[DateOfPurchase]'
                        WHEN 'DateOfPurchase DESC' THEN '[ASM_TransferDetails].[DateOfPurchase] DESC'
                        WHEN 'WarrantyTill' THEN '[ASM_TransferDetails].[WarrantyTill]'
                        WHEN 'WarrantyTill DESC' THEN '[ASM_TransferDetails].[WarrantyTill] DESC'
                        WHEN 'InsuranceTill' THEN '[ASM_TransferDetails].[InsuranceTill]'
                        WHEN 'InsuranceTill DESC' THEN '[ASM_TransferDetails].[InsuranceTill] DESC'
                        WHEN 'BrandID' THEN '[ASM_TransferDetails].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[ASM_TransferDetails].[BrandID] DESC'
                        WHEN 'ModelNo' THEN '[ASM_TransferDetails].[ModelNo]'
                        WHEN 'ModelNo DESC' THEN '[ASM_TransferDetails].[ModelNo] DESC'
                        WHEN 'OtherSpecifications' THEN '[ASM_TransferDetails].[OtherSpecifications]'
                        WHEN 'OtherSpecifications DESC' THEN '[ASM_TransferDetails].[OtherSpecifications] DESC'
                        WHEN 'PurchasedQuantity' THEN '[ASM_TransferDetails].[PurchasedQuantity]'
                        WHEN 'PurchasedQuantity DESC' THEN '[ASM_TransferDetails].[PurchasedQuantity] DESC'
                        WHEN 'RecievedAt' THEN '[ASM_TransferDetails].[RecievedAt]'
                        WHEN 'RecievedAt DESC' THEN '[ASM_TransferDetails].[RecievedAt] DESC'
                        WHEN 'RecievedOn' THEN '[ASM_TransferDetails].[RecievedOn]'
                        WHEN 'RecievedOn DESC' THEN '[ASM_TransferDetails].[RecievedOn] DESC'
                        WHEN 'Remarks' THEN '[ASM_TransferDetails].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ASM_TransferDetails].[Remarks] DESC'
                        WHEN 'RecievedBy' THEN '[ASM_TransferDetails].[RecievedBy]'
                        WHEN 'RecievedBy DESC' THEN '[ASM_TransferDetails].[RecievedBy] DESC'
                        WHEN 'AssetNo' THEN '[ASM_TransferDetails].[AssetNo]'
                        WHEN 'AssetNo DESC' THEN '[ASM_TransferDetails].[AssetNo] DESC'
                        WHEN 'AssetSerialNo' THEN '[ASM_TransferDetails].[AssetSerialNo]'
                        WHEN 'AssetSerialNo DESC' THEN '[ASM_TransferDetails].[AssetSerialNo] DESC'
                        WHEN 'IssueToLocation' THEN '[ASM_TransferDetails].[IssueToLocation]'
                        WHEN 'IssueToLocation DESC' THEN '[ASM_TransferDetails].[IssueToLocation] DESC'
                        WHEN 'UserID' THEN '[ASM_TransferDetails].[UserID]'
                        WHEN 'UserID DESC' THEN '[ASM_TransferDetails].[UserID] DESC'
                        WHEN 'LocationID' THEN '[ASM_TransferDetails].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[ASM_TransferDetails].[LocationID] DESC'
                        WHEN 'Issued' THEN '[ASM_TransferDetails].[Issued]'
                        WHEN 'Issued DESC' THEN '[ASM_TransferDetails].[Issued] DESC'
                        WHEN 'StandBy' THEN '[ASM_TransferDetails].[StandBy]'
                        WHEN 'StandBy DESC' THEN '[ASM_TransferDetails].[StandBy] DESC'
                        WHEN 'ReplacedTill' THEN '[ASM_TransferDetails].[ReplacedTill]'
                        WHEN 'ReplacedTill DESC' THEN '[ASM_TransferDetails].[ReplacedTill] DESC'
                        WHEN 'Returnable' THEN '[ASM_TransferDetails].[Returnable]'
                        WHEN 'Returnable DESC' THEN '[ASM_TransferDetails].[Returnable] DESC'
                        WHEN 'ExpectedDate' THEN '[ASM_TransferDetails].[ExpectedDate]'
                        WHEN 'ExpectedDate DESC' THEN '[ASM_TransferDetails].[ExpectedDate] DESC'
                        WHEN 'Transferred' THEN '[ASM_TransferDetails].[Transferred]'
                        WHEN 'Transferred DESC' THEN '[ASM_TransferDetails].[Transferred] DESC'
                        WHEN 'ToOfficeID' THEN '[ASM_TransferDetails].[ToOfficeID]'
                        WHEN 'ToOfficeID DESC' THEN '[ASM_TransferDetails].[ToOfficeID] DESC'
                        WHEN 'RecievedTransfered' THEN '[ASM_TransferDetails].[RecievedTransfered]'
                        WHEN 'RecievedTransfered DESC' THEN '[ASM_TransferDetails].[RecievedTransfered] DESC'
                        WHEN 'FromOfficeID' THEN '[ASM_TransferDetails].[FromOfficeID]'
                        WHEN 'FromOfficeID DESC' THEN '[ASM_TransferDetails].[FromOfficeID] DESC'
                        WHEN 'Upgraded' THEN '[ASM_TransferDetails].[Upgraded]'
                        WHEN 'Upgraded DESC' THEN '[ASM_TransferDetails].[Upgraded] DESC'
                        WHEN 'ProblemDetails' THEN '[ASM_TransferDetails].[ProblemDetails]'
                        WHEN 'ProblemDetails DESC' THEN '[ASM_TransferDetails].[ProblemDetails] DESC'
                        WHEN 'OnRepair' THEN '[ASM_TransferDetails].[OnRepair]'
                        WHEN 'OnRepair DESC' THEN '[ASM_TransferDetails].[OnRepair] DESC'
                        WHEN 'ToSupplierID' THEN '[ASM_TransferDetails].[ToSupplierID]'
                        WHEN 'ToSupplierID DESC' THEN '[ASM_TransferDetails].[ToSupplierID] DESC'
                        WHEN 'Discarded' THEN '[ASM_TransferDetails].[Discarded]'
                        WHEN 'Discarded DESC' THEN '[ASM_TransferDetails].[Discarded] DESC'
                        WHEN 'Modified' THEN '[ASM_TransferDetails].[Modified]'
                        WHEN 'Modified DESC' THEN '[ASM_TransferDetails].[Modified] DESC'
                        WHEN 'ModifiedOn' THEN '[ASM_TransferDetails].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[ASM_TransferDetails].[ModifiedOn] DESC'
                        WHEN 'ModifiedBy' THEN '[ASM_TransferDetails].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[ASM_TransferDetails].[ModifiedBy] DESC'
                        WHEN 'ModificationRemarks' THEN '[ASM_TransferDetails].[ModificationRemarks]'
                        WHEN 'ModificationRemarks DESC' THEN '[ASM_TransferDetails].[ModificationRemarks] DESC'
                        WHEN 'IPAddress' THEN '[ASM_TransferDetails].[IPAddress]'
                        WHEN 'IPAddress DESC' THEN '[ASM_TransferDetails].[IPAddress] DESC'
                        WHEN 'HostName' THEN '[ASM_TransferDetails].[HostName]'
                        WHEN 'HostName DESC' THEN '[ASM_TransferDetails].[HostName] DESC'
                        WHEN 'INDomain' THEN '[ASM_TransferDetails].[INDomain]'
                        WHEN 'INDomain DESC' THEN '[ASM_TransferDetails].[INDomain] DESC'
                        WHEN 'DomainName' THEN '[ASM_TransferDetails].[DomainName]'
                        WHEN 'DomainName DESC' THEN '[ASM_TransferDetails].[DomainName] DESC'
                        WHEN 'MapDrive' THEN '[ASM_TransferDetails].[MapDrive]'
                        WHEN 'MapDrive DESC' THEN '[ASM_TransferDetails].[MapDrive] DESC'
                        WHEN 'PenDriveDisable' THEN '[ASM_TransferDetails].[PenDriveDisable]'
                        WHEN 'PenDriveDisable DESC' THEN '[ASM_TransferDetails].[PenDriveDisable] DESC'
                        WHEN 'CDROMDisable' THEN '[ASM_TransferDetails].[CDROMDisable]'
                        WHEN 'CDROMDisable DESC' THEN '[ASM_TransferDetails].[CDROMDisable] DESC'
                        WHEN 'InternetAccess' THEN '[ASM_TransferDetails].[InternetAccess]'
                        WHEN 'InternetAccess DESC' THEN '[ASM_TransferDetails].[InternetAccess] DESC'
                        WHEN 'Keyboard' THEN '[ASM_TransferDetails].[Keyboard]'
                        WHEN 'Keyboard DESC' THEN '[ASM_TransferDetails].[Keyboard] DESC'
                        WHEN 'Mouse' THEN '[ASM_TransferDetails].[Mouse]'
                        WHEN 'Mouse DESC' THEN '[ASM_TransferDetails].[Mouse] DESC'
                        WHEN 'FloppyDrive' THEN '[ASM_TransferDetails].[FloppyDrive]'
                        WHEN 'FloppyDrive DESC' THEN '[ASM_TransferDetails].[FloppyDrive] DESC'
                        WHEN 'CPUBrandID' THEN '[ASM_TransferDetails].[CPUBrandID]'
                        WHEN 'CPUBrandID DESC' THEN '[ASM_TransferDetails].[CPUBrandID] DESC'
                        WHEN 'NoOfCPUs' THEN '[ASM_TransferDetails].[NoOfCPUs]'
                        WHEN 'NoOfCPUs DESC' THEN '[ASM_TransferDetails].[NoOfCPUs] DESC'
                        WHEN 'CPUDetails' THEN '[ASM_TransferDetails].[CPUDetails]'
                        WHEN 'CPUDetails DESC' THEN '[ASM_TransferDetails].[CPUDetails] DESC'
                        WHEN 'CPUSerialNo' THEN '[ASM_TransferDetails].[CPUSerialNo]'
                        WHEN 'CPUSerialNo DESC' THEN '[ASM_TransferDetails].[CPUSerialNo] DESC'
                        WHEN 'RAMID' THEN '[ASM_TransferDetails].[RAMID]'
                        WHEN 'RAMID DESC' THEN '[ASM_TransferDetails].[RAMID] DESC'
                        WHEN 'SizeOfRAM' THEN '[ASM_TransferDetails].[SizeOfRAM]'
                        WHEN 'SizeOfRAM DESC' THEN '[ASM_TransferDetails].[SizeOfRAM] DESC'
                        WHEN 'HDDBrandID' THEN '[ASM_TransferDetails].[HDDBrandID]'
                        WHEN 'HDDBrandID DESC' THEN '[ASM_TransferDetails].[HDDBrandID] DESC'
                        WHEN 'NoOfHDD' THEN '[ASM_TransferDetails].[NoOfHDD]'
                        WHEN 'NoOfHDD DESC' THEN '[ASM_TransferDetails].[NoOfHDD] DESC'
                        WHEN 'SizeOfHDD' THEN '[ASM_TransferDetails].[SizeOfHDD]'
                        WHEN 'SizeOfHDD DESC' THEN '[ASM_TransferDetails].[SizeOfHDD] DESC'
                        WHEN 'HDDDetails' THEN '[ASM_TransferDetails].[HDDDetails]'
                        WHEN 'HDDDetails DESC' THEN '[ASM_TransferDetails].[HDDDetails] DESC'
                        WHEN 'HDDSerialNo' THEN '[ASM_TransferDetails].[HDDSerialNo]'
                        WHEN 'HDDSerialNo DESC' THEN '[ASM_TransferDetails].[HDDSerialNo] DESC'
                        WHEN 'CDROMBrandID' THEN '[ASM_TransferDetails].[CDROMBrandID]'
                        WHEN 'CDROMBrandID DESC' THEN '[ASM_TransferDetails].[CDROMBrandID] DESC'
                        WHEN 'NoOfCDROM' THEN '[ASM_TransferDetails].[NoOfCDROM]'
                        WHEN 'NoOfCDROM DESC' THEN '[ASM_TransferDetails].[NoOfCDROM] DESC'
                        WHEN 'CDROMDetails' THEN '[ASM_TransferDetails].[CDROMDetails]'
                        WHEN 'CDROMDetails DESC' THEN '[ASM_TransferDetails].[CDROMDetails] DESC'
                        WHEN 'CDROMSerialNo' THEN '[ASM_TransferDetails].[CDROMSerialNo]'
                        WHEN 'CDROMSerialNo DESC' THEN '[ASM_TransferDetails].[CDROMSerialNo] DESC'
                        WHEN 'VDUBrandID' THEN '[ASM_TransferDetails].[VDUBrandID]'
                        WHEN 'VDUBrandID DESC' THEN '[ASM_TransferDetails].[VDUBrandID] DESC'
                        WHEN 'VDUDetails' THEN '[ASM_TransferDetails].[VDUDetails]'
                        WHEN 'VDUDetails DESC' THEN '[ASM_TransferDetails].[VDUDetails] DESC'
                        WHEN 'VDUSerialNo' THEN '[ASM_TransferDetails].[VDUSerialNo]'
                        WHEN 'VDUSerialNo DESC' THEN '[ASM_TransferDetails].[VDUSerialNo] DESC'
                        WHEN 'PCOSID' THEN '[ASM_TransferDetails].[PCOSID]'
                        WHEN 'PCOSID DESC' THEN '[ASM_TransferDetails].[PCOSID] DESC'
                        WHEN 'PCOSDetails' THEN '[ASM_TransferDetails].[PCOSDetails]'
                        WHEN 'PCOSDetails DESC' THEN '[ASM_TransferDetails].[PCOSDetails] DESC'
                        WHEN 'PCOSSerialNo' THEN '[ASM_TransferDetails].[PCOSSerialNo]'
                        WHEN 'PCOSSerialNo DESC' THEN '[ASM_TransferDetails].[PCOSSerialNo] DESC'
                        ELSE '[ASM_TransferDetails].[TransferID],[ASM_TransferDetails].[MrnID],[ASM_TransferDetails].[AssetID]'
                    END
  EXEC (@LGSQL)

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
