USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWHistorySelectListFilteres]
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
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'MrnID'  SET @LGSQL = @LGSQL + ', AssetID'  SET @LGSQL = @LGSQL + ', SerialNo'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_AstHistory].[MrnID]'  SET @LGSQL = @LGSQL + ', [ASM_AstHistory].[AssetID]'  SET @LGSQL = @LGSQL + ', [ASM_AstHistory].[SerialNo]'  SET @LGSQL = @LGSQL + ' FROM [ASM_AstHistory] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'MrnID' THEN '[ASM_AstHistory].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[ASM_AstHistory].[MrnID] DESC'
                        WHEN 'AssetID' THEN '[ASM_AstHistory].[AssetID]'
                        WHEN 'AssetID DESC' THEN '[ASM_AstHistory].[AssetID] DESC'
                        WHEN 'SerialNo' THEN '[ASM_AstHistory].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[ASM_AstHistory].[SerialNo] DESC'
                        WHEN 'ActivityID' THEN '[ASM_AstHistory].[ActivityID]'
                        WHEN 'ActivityID DESC' THEN '[ASM_AstHistory].[ActivityID] DESC'
                        WHEN 'AssetTypeID' THEN '[ASM_AstHistory].[AssetTypeID]'
                        WHEN 'AssetTypeID DESC' THEN '[ASM_AstHistory].[AssetTypeID] DESC'
                        WHEN 'MrnDate' THEN '[ASM_AstHistory].[MrnDate]'
                        WHEN 'MrnDate DESC' THEN '[ASM_AstHistory].[MrnDate] DESC'
                        WHEN 'MrnDescription' THEN '[ASM_AstHistory].[MrnDescription]'
                        WHEN 'MrnDescription DESC' THEN '[ASM_AstHistory].[MrnDescription] DESC'
                        WHEN 'SupplierID' THEN '[ASM_AstHistory].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[ASM_AstHistory].[SupplierID] DESC'
                        WHEN 'DateOfPurchase' THEN '[ASM_AstHistory].[DateOfPurchase]'
                        WHEN 'DateOfPurchase DESC' THEN '[ASM_AstHistory].[DateOfPurchase] DESC'
                        WHEN 'WarrantyTill' THEN '[ASM_AstHistory].[WarrantyTill]'
                        WHEN 'WarrantyTill DESC' THEN '[ASM_AstHistory].[WarrantyTill] DESC'
                        WHEN 'InsuranceTill' THEN '[ASM_AstHistory].[InsuranceTill]'
                        WHEN 'InsuranceTill DESC' THEN '[ASM_AstHistory].[InsuranceTill] DESC'
                        WHEN 'BrandID' THEN '[ASM_AstHistory].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[ASM_AstHistory].[BrandID] DESC'
                        WHEN 'ModelNo' THEN '[ASM_AstHistory].[ModelNo]'
                        WHEN 'ModelNo DESC' THEN '[ASM_AstHistory].[ModelNo] DESC'
                        WHEN 'OtherSpecifications' THEN '[ASM_AstHistory].[OtherSpecifications]'
                        WHEN 'OtherSpecifications DESC' THEN '[ASM_AstHistory].[OtherSpecifications] DESC'
                        WHEN 'PurchasedQuantity' THEN '[ASM_AstHistory].[PurchasedQuantity]'
                        WHEN 'PurchasedQuantity DESC' THEN '[ASM_AstHistory].[PurchasedQuantity] DESC'
                        WHEN 'RecievedAt' THEN '[ASM_AstHistory].[RecievedAt]'
                        WHEN 'RecievedAt DESC' THEN '[ASM_AstHistory].[RecievedAt] DESC'
                        WHEN 'RecievedOn' THEN '[ASM_AstHistory].[RecievedOn]'
                        WHEN 'RecievedOn DESC' THEN '[ASM_AstHistory].[RecievedOn] DESC'
                        WHEN 'Remarks' THEN '[ASM_AstHistory].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ASM_AstHistory].[Remarks] DESC'
                        WHEN 'RecievedBy' THEN '[ASM_AstHistory].[RecievedBy]'
                        WHEN 'RecievedBy DESC' THEN '[ASM_AstHistory].[RecievedBy] DESC'
                        WHEN 'AssetNo' THEN '[ASM_AstHistory].[AssetNo]'
                        WHEN 'AssetNo DESC' THEN '[ASM_AstHistory].[AssetNo] DESC'
                        WHEN 'AssetSerialNo' THEN '[ASM_AstHistory].[AssetSerialNo]'
                        WHEN 'AssetSerialNo DESC' THEN '[ASM_AstHistory].[AssetSerialNo] DESC'
                        WHEN 'IssueToLocation' THEN '[ASM_AstHistory].[IssueToLocation]'
                        WHEN 'IssueToLocation DESC' THEN '[ASM_AstHistory].[IssueToLocation] DESC'
                        WHEN 'UserID' THEN '[ASM_AstHistory].[UserID]'
                        WHEN 'UserID DESC' THEN '[ASM_AstHistory].[UserID] DESC'
                        WHEN 'LocationID' THEN '[ASM_AstHistory].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[ASM_AstHistory].[LocationID] DESC'
                        WHEN 'Issued' THEN '[ASM_AstHistory].[Issued]'
                        WHEN 'Issued DESC' THEN '[ASM_AstHistory].[Issued] DESC'
                        WHEN 'StandBy' THEN '[ASM_AstHistory].[StandBy]'
                        WHEN 'StandBy DESC' THEN '[ASM_AstHistory].[StandBy] DESC'
                        WHEN 'ReplacedTill' THEN '[ASM_AstHistory].[ReplacedTill]'
                        WHEN 'ReplacedTill DESC' THEN '[ASM_AstHistory].[ReplacedTill] DESC'
                        WHEN 'Returnable' THEN '[ASM_AstHistory].[Returnable]'
                        WHEN 'Returnable DESC' THEN '[ASM_AstHistory].[Returnable] DESC'
                        WHEN 'ExpectedDate' THEN '[ASM_AstHistory].[ExpectedDate]'
                        WHEN 'ExpectedDate DESC' THEN '[ASM_AstHistory].[ExpectedDate] DESC'
                        WHEN 'Transferred' THEN '[ASM_AstHistory].[Transferred]'
                        WHEN 'Transferred DESC' THEN '[ASM_AstHistory].[Transferred] DESC'
                        WHEN 'ToOfficeID' THEN '[ASM_AstHistory].[ToOfficeID]'
                        WHEN 'ToOfficeID DESC' THEN '[ASM_AstHistory].[ToOfficeID] DESC'
                        WHEN 'RecievedTransfered' THEN '[ASM_AstHistory].[RecievedTransfered]'
                        WHEN 'RecievedTransfered DESC' THEN '[ASM_AstHistory].[RecievedTransfered] DESC'
                        WHEN 'FromOfficeID' THEN '[ASM_AstHistory].[FromOfficeID]'
                        WHEN 'FromOfficeID DESC' THEN '[ASM_AstHistory].[FromOfficeID] DESC'
                        WHEN 'Upgraded' THEN '[ASM_AstHistory].[Upgraded]'
                        WHEN 'Upgraded DESC' THEN '[ASM_AstHistory].[Upgraded] DESC'
                        WHEN 'ProblemDetails' THEN '[ASM_AstHistory].[ProblemDetails]'
                        WHEN 'ProblemDetails DESC' THEN '[ASM_AstHistory].[ProblemDetails] DESC'
                        WHEN 'OnRepair' THEN '[ASM_AstHistory].[OnRepair]'
                        WHEN 'OnRepair DESC' THEN '[ASM_AstHistory].[OnRepair] DESC'
                        WHEN 'ToSupplierID' THEN '[ASM_AstHistory].[ToSupplierID]'
                        WHEN 'ToSupplierID DESC' THEN '[ASM_AstHistory].[ToSupplierID] DESC'
                        WHEN 'Discarded' THEN '[ASM_AstHistory].[Discarded]'
                        WHEN 'Discarded DESC' THEN '[ASM_AstHistory].[Discarded] DESC'
                        WHEN 'Modified' THEN '[ASM_AstHistory].[Modified]'
                        WHEN 'Modified DESC' THEN '[ASM_AstHistory].[Modified] DESC'
                        WHEN 'ModifiedOn' THEN '[ASM_AstHistory].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[ASM_AstHistory].[ModifiedOn] DESC'
                        WHEN 'ModifiedBy' THEN '[ASM_AstHistory].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[ASM_AstHistory].[ModifiedBy] DESC'
                        WHEN 'ModificationRemarks' THEN '[ASM_AstHistory].[ModificationRemarks]'
                        WHEN 'ModificationRemarks DESC' THEN '[ASM_AstHistory].[ModificationRemarks] DESC'
                        WHEN 'IPAddress' THEN '[ASM_AstHistory].[IPAddress]'
                        WHEN 'IPAddress DESC' THEN '[ASM_AstHistory].[IPAddress] DESC'
                        WHEN 'HostName' THEN '[ASM_AstHistory].[HostName]'
                        WHEN 'HostName DESC' THEN '[ASM_AstHistory].[HostName] DESC'
                        WHEN 'INDomain' THEN '[ASM_AstHistory].[INDomain]'
                        WHEN 'INDomain DESC' THEN '[ASM_AstHistory].[INDomain] DESC'
                        WHEN 'DomainName' THEN '[ASM_AstHistory].[DomainName]'
                        WHEN 'DomainName DESC' THEN '[ASM_AstHistory].[DomainName] DESC'
                        WHEN 'MapDrive' THEN '[ASM_AstHistory].[MapDrive]'
                        WHEN 'MapDrive DESC' THEN '[ASM_AstHistory].[MapDrive] DESC'
                        WHEN 'PenDriveDisable' THEN '[ASM_AstHistory].[PenDriveDisable]'
                        WHEN 'PenDriveDisable DESC' THEN '[ASM_AstHistory].[PenDriveDisable] DESC'
                        WHEN 'CDROMDisable' THEN '[ASM_AstHistory].[CDROMDisable]'
                        WHEN 'CDROMDisable DESC' THEN '[ASM_AstHistory].[CDROMDisable] DESC'
                        WHEN 'InternetAccess' THEN '[ASM_AstHistory].[InternetAccess]'
                        WHEN 'InternetAccess DESC' THEN '[ASM_AstHistory].[InternetAccess] DESC'
                        WHEN 'Keyboard' THEN '[ASM_AstHistory].[Keyboard]'
                        WHEN 'Keyboard DESC' THEN '[ASM_AstHistory].[Keyboard] DESC'
                        WHEN 'Mouse' THEN '[ASM_AstHistory].[Mouse]'
                        WHEN 'Mouse DESC' THEN '[ASM_AstHistory].[Mouse] DESC'
                        WHEN 'FloppyDrive' THEN '[ASM_AstHistory].[FloppyDrive]'
                        WHEN 'FloppyDrive DESC' THEN '[ASM_AstHistory].[FloppyDrive] DESC'
                        WHEN 'CPUBrandID' THEN '[ASM_AstHistory].[CPUBrandID]'
                        WHEN 'CPUBrandID DESC' THEN '[ASM_AstHistory].[CPUBrandID] DESC'
                        WHEN 'NoOfCPUs' THEN '[ASM_AstHistory].[NoOfCPUs]'
                        WHEN 'NoOfCPUs DESC' THEN '[ASM_AstHistory].[NoOfCPUs] DESC'
                        WHEN 'CPUDetails' THEN '[ASM_AstHistory].[CPUDetails]'
                        WHEN 'CPUDetails DESC' THEN '[ASM_AstHistory].[CPUDetails] DESC'
                        WHEN 'CPUSerialNo' THEN '[ASM_AstHistory].[CPUSerialNo]'
                        WHEN 'CPUSerialNo DESC' THEN '[ASM_AstHistory].[CPUSerialNo] DESC'
                        WHEN 'RAMID' THEN '[ASM_AstHistory].[RAMID]'
                        WHEN 'RAMID DESC' THEN '[ASM_AstHistory].[RAMID] DESC'
                        WHEN 'SizeOfRAM' THEN '[ASM_AstHistory].[SizeOfRAM]'
                        WHEN 'SizeOfRAM DESC' THEN '[ASM_AstHistory].[SizeOfRAM] DESC'
                        WHEN 'HDDBrandID' THEN '[ASM_AstHistory].[HDDBrandID]'
                        WHEN 'HDDBrandID DESC' THEN '[ASM_AstHistory].[HDDBrandID] DESC'
                        WHEN 'NoOfHDD' THEN '[ASM_AstHistory].[NoOfHDD]'
                        WHEN 'NoOfHDD DESC' THEN '[ASM_AstHistory].[NoOfHDD] DESC'
                        WHEN 'SizeOfHDD' THEN '[ASM_AstHistory].[SizeOfHDD]'
                        WHEN 'SizeOfHDD DESC' THEN '[ASM_AstHistory].[SizeOfHDD] DESC'
                        WHEN 'HDDDetails' THEN '[ASM_AstHistory].[HDDDetails]'
                        WHEN 'HDDDetails DESC' THEN '[ASM_AstHistory].[HDDDetails] DESC'
                        WHEN 'HDDSerialNo' THEN '[ASM_AstHistory].[HDDSerialNo]'
                        WHEN 'HDDSerialNo DESC' THEN '[ASM_AstHistory].[HDDSerialNo] DESC'
                        WHEN 'CDROMBrandID' THEN '[ASM_AstHistory].[CDROMBrandID]'
                        WHEN 'CDROMBrandID DESC' THEN '[ASM_AstHistory].[CDROMBrandID] DESC'
                        WHEN 'NoOfCDROM' THEN '[ASM_AstHistory].[NoOfCDROM]'
                        WHEN 'NoOfCDROM DESC' THEN '[ASM_AstHistory].[NoOfCDROM] DESC'
                        WHEN 'CDROMDetails' THEN '[ASM_AstHistory].[CDROMDetails]'
                        WHEN 'CDROMDetails DESC' THEN '[ASM_AstHistory].[CDROMDetails] DESC'
                        WHEN 'CDROMSerialNo' THEN '[ASM_AstHistory].[CDROMSerialNo]'
                        WHEN 'CDROMSerialNo DESC' THEN '[ASM_AstHistory].[CDROMSerialNo] DESC'
                        WHEN 'VDUBrandID' THEN '[ASM_AstHistory].[VDUBrandID]'
                        WHEN 'VDUBrandID DESC' THEN '[ASM_AstHistory].[VDUBrandID] DESC'
                        WHEN 'VDUDetails' THEN '[ASM_AstHistory].[VDUDetails]'
                        WHEN 'VDUDetails DESC' THEN '[ASM_AstHistory].[VDUDetails] DESC'
                        WHEN 'VDUSerialNo' THEN '[ASM_AstHistory].[VDUSerialNo]'
                        WHEN 'VDUSerialNo DESC' THEN '[ASM_AstHistory].[VDUSerialNo] DESC'
                        WHEN 'PCOSID' THEN '[ASM_AstHistory].[PCOSID]'
                        WHEN 'PCOSID DESC' THEN '[ASM_AstHistory].[PCOSID] DESC'
                        WHEN 'PCOSDetails' THEN '[ASM_AstHistory].[PCOSDetails]'
                        WHEN 'PCOSDetails DESC' THEN '[ASM_AstHistory].[PCOSDetails] DESC'
                        WHEN 'PCOSSerialNo' THEN '[ASM_AstHistory].[PCOSSerialNo]'
                        WHEN 'PCOSSerialNo DESC' THEN '[ASM_AstHistory].[PCOSSerialNo] DESC'
                        ELSE '[ASM_AstHistory].[MrnID],[ASM_AstHistory].[AssetID],[ASM_AstHistory].[SerialNo]'
                    END
  EXEC (@LGSQL)

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
