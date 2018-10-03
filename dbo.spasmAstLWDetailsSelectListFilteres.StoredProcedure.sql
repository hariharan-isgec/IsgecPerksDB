USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWDetailsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,MrnID Int NOT NULL
 ,AssetID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'MrnID'  SET @LGSQL = @LGSQL + ', AssetID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_AstDetails].[MrnID]'  SET @LGSQL = @LGSQL + ', [ASM_AstDetails].[AssetID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_AstDetails] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'MrnID' THEN '[ASM_AstDetails].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[ASM_AstDetails].[MrnID] DESC'
                        WHEN 'AssetID' THEN '[ASM_AstDetails].[AssetID]'
                        WHEN 'AssetID DESC' THEN '[ASM_AstDetails].[AssetID] DESC'
                        WHEN 'AssetTypeID' THEN '[ASM_AstDetails].[AssetTypeID]'
                        WHEN 'AssetTypeID DESC' THEN '[ASM_AstDetails].[AssetTypeID] DESC'
                        WHEN 'MrnDate' THEN '[ASM_AstDetails].[MrnDate]'
                        WHEN 'MrnDate DESC' THEN '[ASM_AstDetails].[MrnDate] DESC'
                        WHEN 'MrnDescription' THEN '[ASM_AstDetails].[MrnDescription]'
                        WHEN 'MrnDescription DESC' THEN '[ASM_AstDetails].[MrnDescription] DESC'
                        WHEN 'SupplierID' THEN '[ASM_AstDetails].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[ASM_AstDetails].[SupplierID] DESC'
                        WHEN 'DateOfPurchase' THEN '[ASM_AstDetails].[DateOfPurchase]'
                        WHEN 'DateOfPurchase DESC' THEN '[ASM_AstDetails].[DateOfPurchase] DESC'
                        WHEN 'WarrantyTill' THEN '[ASM_AstDetails].[WarrantyTill]'
                        WHEN 'WarrantyTill DESC' THEN '[ASM_AstDetails].[WarrantyTill] DESC'
                        WHEN 'InsuranceTill' THEN '[ASM_AstDetails].[InsuranceTill]'
                        WHEN 'InsuranceTill DESC' THEN '[ASM_AstDetails].[InsuranceTill] DESC'
                        WHEN 'BrandID' THEN '[ASM_AstDetails].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[ASM_AstDetails].[BrandID] DESC'
                        WHEN 'ModelNo' THEN '[ASM_AstDetails].[ModelNo]'
                        WHEN 'ModelNo DESC' THEN '[ASM_AstDetails].[ModelNo] DESC'
                        WHEN 'OtherSpecifications' THEN '[ASM_AstDetails].[OtherSpecifications]'
                        WHEN 'OtherSpecifications DESC' THEN '[ASM_AstDetails].[OtherSpecifications] DESC'
                        WHEN 'PurchasedQuantity' THEN '[ASM_AstDetails].[PurchasedQuantity]'
                        WHEN 'PurchasedQuantity DESC' THEN '[ASM_AstDetails].[PurchasedQuantity] DESC'
                        WHEN 'RecievedAt' THEN '[ASM_AstDetails].[RecievedAt]'
                        WHEN 'RecievedAt DESC' THEN '[ASM_AstDetails].[RecievedAt] DESC'
                        WHEN 'RecievedOn' THEN '[ASM_AstDetails].[RecievedOn]'
                        WHEN 'RecievedOn DESC' THEN '[ASM_AstDetails].[RecievedOn] DESC'
                        WHEN 'Remarks' THEN '[ASM_AstDetails].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ASM_AstDetails].[Remarks] DESC'
                        WHEN 'RecievedBy' THEN '[ASM_AstDetails].[RecievedBy]'
                        WHEN 'RecievedBy DESC' THEN '[ASM_AstDetails].[RecievedBy] DESC'
                        WHEN 'AssetNo' THEN '[ASM_AstDetails].[AssetNo]'
                        WHEN 'AssetNo DESC' THEN '[ASM_AstDetails].[AssetNo] DESC'
                        WHEN 'AssetSerialNo' THEN '[ASM_AstDetails].[AssetSerialNo]'
                        WHEN 'AssetSerialNo DESC' THEN '[ASM_AstDetails].[AssetSerialNo] DESC'
                        WHEN 'IssueToLocation' THEN '[ASM_AstDetails].[IssueToLocation]'
                        WHEN 'IssueToLocation DESC' THEN '[ASM_AstDetails].[IssueToLocation] DESC'
                        WHEN 'UserID' THEN '[ASM_AstDetails].[UserID]'
                        WHEN 'UserID DESC' THEN '[ASM_AstDetails].[UserID] DESC'
                        WHEN 'LocationID' THEN '[ASM_AstDetails].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[ASM_AstDetails].[LocationID] DESC'
                        WHEN 'Issued' THEN '[ASM_AstDetails].[Issued]'
                        WHEN 'Issued DESC' THEN '[ASM_AstDetails].[Issued] DESC'
                        WHEN 'StandBy' THEN '[ASM_AstDetails].[StandBy]'
                        WHEN 'StandBy DESC' THEN '[ASM_AstDetails].[StandBy] DESC'
                        WHEN 'ReplacedTill' THEN '[ASM_AstDetails].[ReplacedTill]'
                        WHEN 'ReplacedTill DESC' THEN '[ASM_AstDetails].[ReplacedTill] DESC'
                        WHEN 'Returnable' THEN '[ASM_AstDetails].[Returnable]'
                        WHEN 'Returnable DESC' THEN '[ASM_AstDetails].[Returnable] DESC'
                        WHEN 'ExpectedDate' THEN '[ASM_AstDetails].[ExpectedDate]'
                        WHEN 'ExpectedDate DESC' THEN '[ASM_AstDetails].[ExpectedDate] DESC'
                        WHEN 'Transferred' THEN '[ASM_AstDetails].[Transferred]'
                        WHEN 'Transferred DESC' THEN '[ASM_AstDetails].[Transferred] DESC'
                        WHEN 'ToOfficeID' THEN '[ASM_AstDetails].[ToOfficeID]'
                        WHEN 'ToOfficeID DESC' THEN '[ASM_AstDetails].[ToOfficeID] DESC'
                        WHEN 'RecievedTransfered' THEN '[ASM_AstDetails].[RecievedTransfered]'
                        WHEN 'RecievedTransfered DESC' THEN '[ASM_AstDetails].[RecievedTransfered] DESC'
                        WHEN 'FromOfficeID' THEN '[ASM_AstDetails].[FromOfficeID]'
                        WHEN 'FromOfficeID DESC' THEN '[ASM_AstDetails].[FromOfficeID] DESC'
                        WHEN 'Upgraded' THEN '[ASM_AstDetails].[Upgraded]'
                        WHEN 'Upgraded DESC' THEN '[ASM_AstDetails].[Upgraded] DESC'
                        WHEN 'ProblemDetails' THEN '[ASM_AstDetails].[ProblemDetails]'
                        WHEN 'ProblemDetails DESC' THEN '[ASM_AstDetails].[ProblemDetails] DESC'
                        WHEN 'OnRepair' THEN '[ASM_AstDetails].[OnRepair]'
                        WHEN 'OnRepair DESC' THEN '[ASM_AstDetails].[OnRepair] DESC'
                        WHEN 'ToSupplierID' THEN '[ASM_AstDetails].[ToSupplierID]'
                        WHEN 'ToSupplierID DESC' THEN '[ASM_AstDetails].[ToSupplierID] DESC'
                        WHEN 'Discarded' THEN '[ASM_AstDetails].[Discarded]'
                        WHEN 'Discarded DESC' THEN '[ASM_AstDetails].[Discarded] DESC'
                        WHEN 'Modified' THEN '[ASM_AstDetails].[Modified]'
                        WHEN 'Modified DESC' THEN '[ASM_AstDetails].[Modified] DESC'
                        WHEN 'ModifiedOn' THEN '[ASM_AstDetails].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[ASM_AstDetails].[ModifiedOn] DESC'
                        WHEN 'ModifiedBy' THEN '[ASM_AstDetails].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[ASM_AstDetails].[ModifiedBy] DESC'
                        WHEN 'ModificationRemarks' THEN '[ASM_AstDetails].[ModificationRemarks]'
                        WHEN 'ModificationRemarks DESC' THEN '[ASM_AstDetails].[ModificationRemarks] DESC'
                        WHEN 'IPAddress' THEN '[ASM_AstDetails].[IPAddress]'
                        WHEN 'IPAddress DESC' THEN '[ASM_AstDetails].[IPAddress] DESC'
                        WHEN 'HostName' THEN '[ASM_AstDetails].[HostName]'
                        WHEN 'HostName DESC' THEN '[ASM_AstDetails].[HostName] DESC'
                        WHEN 'INDomain' THEN '[ASM_AstDetails].[INDomain]'
                        WHEN 'INDomain DESC' THEN '[ASM_AstDetails].[INDomain] DESC'
                        WHEN 'DomainName' THEN '[ASM_AstDetails].[DomainName]'
                        WHEN 'DomainName DESC' THEN '[ASM_AstDetails].[DomainName] DESC'
                        WHEN 'MapDrive' THEN '[ASM_AstDetails].[MapDrive]'
                        WHEN 'MapDrive DESC' THEN '[ASM_AstDetails].[MapDrive] DESC'
                        WHEN 'PenDriveDisable' THEN '[ASM_AstDetails].[PenDriveDisable]'
                        WHEN 'PenDriveDisable DESC' THEN '[ASM_AstDetails].[PenDriveDisable] DESC'
                        WHEN 'CDROMDisable' THEN '[ASM_AstDetails].[CDROMDisable]'
                        WHEN 'CDROMDisable DESC' THEN '[ASM_AstDetails].[CDROMDisable] DESC'
                        WHEN 'InternetAccess' THEN '[ASM_AstDetails].[InternetAccess]'
                        WHEN 'InternetAccess DESC' THEN '[ASM_AstDetails].[InternetAccess] DESC'
                        WHEN 'Keyboard' THEN '[ASM_AstDetails].[Keyboard]'
                        WHEN 'Keyboard DESC' THEN '[ASM_AstDetails].[Keyboard] DESC'
                        WHEN 'Mouse' THEN '[ASM_AstDetails].[Mouse]'
                        WHEN 'Mouse DESC' THEN '[ASM_AstDetails].[Mouse] DESC'
                        WHEN 'FloppyDrive' THEN '[ASM_AstDetails].[FloppyDrive]'
                        WHEN 'FloppyDrive DESC' THEN '[ASM_AstDetails].[FloppyDrive] DESC'
                        WHEN 'CPUBrandID' THEN '[ASM_AstDetails].[CPUBrandID]'
                        WHEN 'CPUBrandID DESC' THEN '[ASM_AstDetails].[CPUBrandID] DESC'
                        WHEN 'NoOfCPUs' THEN '[ASM_AstDetails].[NoOfCPUs]'
                        WHEN 'NoOfCPUs DESC' THEN '[ASM_AstDetails].[NoOfCPUs] DESC'
                        WHEN 'CPUDetails' THEN '[ASM_AstDetails].[CPUDetails]'
                        WHEN 'CPUDetails DESC' THEN '[ASM_AstDetails].[CPUDetails] DESC'
                        WHEN 'CPUSerialNo' THEN '[ASM_AstDetails].[CPUSerialNo]'
                        WHEN 'CPUSerialNo DESC' THEN '[ASM_AstDetails].[CPUSerialNo] DESC'
                        WHEN 'RAMID' THEN '[ASM_AstDetails].[RAMID]'
                        WHEN 'RAMID DESC' THEN '[ASM_AstDetails].[RAMID] DESC'
                        WHEN 'SizeOfRAM' THEN '[ASM_AstDetails].[SizeOfRAM]'
                        WHEN 'SizeOfRAM DESC' THEN '[ASM_AstDetails].[SizeOfRAM] DESC'
                        WHEN 'HDDBrandID' THEN '[ASM_AstDetails].[HDDBrandID]'
                        WHEN 'HDDBrandID DESC' THEN '[ASM_AstDetails].[HDDBrandID] DESC'
                        WHEN 'NoOfHDD' THEN '[ASM_AstDetails].[NoOfHDD]'
                        WHEN 'NoOfHDD DESC' THEN '[ASM_AstDetails].[NoOfHDD] DESC'
                        WHEN 'SizeOfHDD' THEN '[ASM_AstDetails].[SizeOfHDD]'
                        WHEN 'SizeOfHDD DESC' THEN '[ASM_AstDetails].[SizeOfHDD] DESC'
                        WHEN 'HDDDetails' THEN '[ASM_AstDetails].[HDDDetails]'
                        WHEN 'HDDDetails DESC' THEN '[ASM_AstDetails].[HDDDetails] DESC'
                        WHEN 'HDDSerialNo' THEN '[ASM_AstDetails].[HDDSerialNo]'
                        WHEN 'HDDSerialNo DESC' THEN '[ASM_AstDetails].[HDDSerialNo] DESC'
                        WHEN 'CDROMBrandID' THEN '[ASM_AstDetails].[CDROMBrandID]'
                        WHEN 'CDROMBrandID DESC' THEN '[ASM_AstDetails].[CDROMBrandID] DESC'
                        WHEN 'NoOfCDROM' THEN '[ASM_AstDetails].[NoOfCDROM]'
                        WHEN 'NoOfCDROM DESC' THEN '[ASM_AstDetails].[NoOfCDROM] DESC'
                        WHEN 'CDROMDetails' THEN '[ASM_AstDetails].[CDROMDetails]'
                        WHEN 'CDROMDetails DESC' THEN '[ASM_AstDetails].[CDROMDetails] DESC'
                        WHEN 'CDROMSerialNo' THEN '[ASM_AstDetails].[CDROMSerialNo]'
                        WHEN 'CDROMSerialNo DESC' THEN '[ASM_AstDetails].[CDROMSerialNo] DESC'
                        WHEN 'VDUBrandID' THEN '[ASM_AstDetails].[VDUBrandID]'
                        WHEN 'VDUBrandID DESC' THEN '[ASM_AstDetails].[VDUBrandID] DESC'
                        WHEN 'VDUDetails' THEN '[ASM_AstDetails].[VDUDetails]'
                        WHEN 'VDUDetails DESC' THEN '[ASM_AstDetails].[VDUDetails] DESC'
                        WHEN 'VDUSerialNo' THEN '[ASM_AstDetails].[VDUSerialNo]'
                        WHEN 'VDUSerialNo DESC' THEN '[ASM_AstDetails].[VDUSerialNo] DESC'
                        WHEN 'PCOSID' THEN '[ASM_AstDetails].[PCOSID]'
                        WHEN 'PCOSID DESC' THEN '[ASM_AstDetails].[PCOSID] DESC'
                        WHEN 'PCOSDetails' THEN '[ASM_AstDetails].[PCOSDetails]'
                        WHEN 'PCOSDetails DESC' THEN '[ASM_AstDetails].[PCOSDetails] DESC'
                        WHEN 'PCOSSerialNo' THEN '[ASM_AstDetails].[PCOSSerialNo]'
                        WHEN 'PCOSSerialNo DESC' THEN '[ASM_AstDetails].[PCOSSerialNo] DESC'
                        ELSE '[ASM_AstDetails].[MrnID],[ASM_AstDetails].[AssetID]'
                    END
  EXEC (@LGSQL)

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
