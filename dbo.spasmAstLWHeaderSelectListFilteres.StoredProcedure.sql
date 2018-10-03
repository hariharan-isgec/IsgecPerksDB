USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWHeaderSelectListFilteres]
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
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'MrnID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_AstHeader].[MrnID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_AstHeader] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'MrnID' THEN '[ASM_AstHeader].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[ASM_AstHeader].[MrnID] DESC'
                        WHEN 'AssetTypeID' THEN '[ASM_AstHeader].[AssetTypeID]'
                        WHEN 'AssetTypeID DESC' THEN '[ASM_AstHeader].[AssetTypeID] DESC'
                        WHEN 'MrnDate' THEN '[ASM_AstHeader].[MrnDate]'
                        WHEN 'MrnDate DESC' THEN '[ASM_AstHeader].[MrnDate] DESC'
                        WHEN 'MrnDescription' THEN '[ASM_AstHeader].[MrnDescription]'
                        WHEN 'MrnDescription DESC' THEN '[ASM_AstHeader].[MrnDescription] DESC'
                        WHEN 'SupplierID' THEN '[ASM_AstHeader].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[ASM_AstHeader].[SupplierID] DESC'
                        WHEN 'DateOfPurchase' THEN '[ASM_AstHeader].[DateOfPurchase]'
                        WHEN 'DateOfPurchase DESC' THEN '[ASM_AstHeader].[DateOfPurchase] DESC'
                        WHEN 'WarrantyTill' THEN '[ASM_AstHeader].[WarrantyTill]'
                        WHEN 'WarrantyTill DESC' THEN '[ASM_AstHeader].[WarrantyTill] DESC'
                        WHEN 'InsuranceTill' THEN '[ASM_AstHeader].[InsuranceTill]'
                        WHEN 'InsuranceTill DESC' THEN '[ASM_AstHeader].[InsuranceTill] DESC'
                        WHEN 'BrandID' THEN '[ASM_AstHeader].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[ASM_AstHeader].[BrandID] DESC'
                        WHEN 'ModelNo' THEN '[ASM_AstHeader].[ModelNo]'
                        WHEN 'ModelNo DESC' THEN '[ASM_AstHeader].[ModelNo] DESC'
                        WHEN 'OtherSpecifications' THEN '[ASM_AstHeader].[OtherSpecifications]'
                        WHEN 'OtherSpecifications DESC' THEN '[ASM_AstHeader].[OtherSpecifications] DESC'
                        WHEN 'PurchasedQuantity' THEN '[ASM_AstHeader].[PurchasedQuantity]'
                        WHEN 'PurchasedQuantity DESC' THEN '[ASM_AstHeader].[PurchasedQuantity] DESC'
                        WHEN 'RecievedAt' THEN '[ASM_AstHeader].[RecievedAt]'
                        WHEN 'RecievedAt DESC' THEN '[ASM_AstHeader].[RecievedAt] DESC'
                        WHEN 'RecievedOn' THEN '[ASM_AstHeader].[RecievedOn]'
                        WHEN 'RecievedOn DESC' THEN '[ASM_AstHeader].[RecievedOn] DESC'
                        WHEN 'Remarks' THEN '[ASM_AstHeader].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ASM_AstHeader].[Remarks] DESC'
                        WHEN 'RecievedBy' THEN '[ASM_AstHeader].[RecievedBy]'
                        WHEN 'RecievedBy DESC' THEN '[ASM_AstHeader].[RecievedBy] DESC'
                        WHEN 'IssuedQuantity' THEN '[ASM_AstHeader].[IssuedQuantity]'
                        WHEN 'IssuedQuantity DESC' THEN '[ASM_AstHeader].[IssuedQuantity] DESC'
                        WHEN 'WriteOffQuantity' THEN '[ASM_AstHeader].[WriteOffQuantity]'
                        WHEN 'WriteOffQuantity DESC' THEN '[ASM_AstHeader].[WriteOffQuantity] DESC'
                        WHEN 'Keyboard' THEN '[ASM_AstHeader].[Keyboard]'
                        WHEN 'Keyboard DESC' THEN '[ASM_AstHeader].[Keyboard] DESC'
                        WHEN 'Mouse' THEN '[ASM_AstHeader].[Mouse]'
                        WHEN 'Mouse DESC' THEN '[ASM_AstHeader].[Mouse] DESC'
                        WHEN 'FloppyDrive' THEN '[ASM_AstHeader].[FloppyDrive]'
                        WHEN 'FloppyDrive DESC' THEN '[ASM_AstHeader].[FloppyDrive] DESC'
                        WHEN 'CPUBrandID' THEN '[ASM_AstHeader].[CPUBrandID]'
                        WHEN 'CPUBrandID DESC' THEN '[ASM_AstHeader].[CPUBrandID] DESC'
                        WHEN 'NoOfCPUs' THEN '[ASM_AstHeader].[NoOfCPUs]'
                        WHEN 'NoOfCPUs DESC' THEN '[ASM_AstHeader].[NoOfCPUs] DESC'
                        WHEN 'CPUDetails' THEN '[ASM_AstHeader].[CPUDetails]'
                        WHEN 'CPUDetails DESC' THEN '[ASM_AstHeader].[CPUDetails] DESC'
                        WHEN 'RAMID' THEN '[ASM_AstHeader].[RAMID]'
                        WHEN 'RAMID DESC' THEN '[ASM_AstHeader].[RAMID] DESC'
                        WHEN 'SizeOfRAM' THEN '[ASM_AstHeader].[SizeOfRAM]'
                        WHEN 'SizeOfRAM DESC' THEN '[ASM_AstHeader].[SizeOfRAM] DESC'
                        WHEN 'HDDBrandID' THEN '[ASM_AstHeader].[HDDBrandID]'
                        WHEN 'HDDBrandID DESC' THEN '[ASM_AstHeader].[HDDBrandID] DESC'
                        WHEN 'NoOfHDD' THEN '[ASM_AstHeader].[NoOfHDD]'
                        WHEN 'NoOfHDD DESC' THEN '[ASM_AstHeader].[NoOfHDD] DESC'
                        WHEN 'SizeOfHDD' THEN '[ASM_AstHeader].[SizeOfHDD]'
                        WHEN 'SizeOfHDD DESC' THEN '[ASM_AstHeader].[SizeOfHDD] DESC'
                        WHEN 'HDDDetails' THEN '[ASM_AstHeader].[HDDDetails]'
                        WHEN 'HDDDetails DESC' THEN '[ASM_AstHeader].[HDDDetails] DESC'
                        WHEN 'CDROMBrandID' THEN '[ASM_AstHeader].[CDROMBrandID]'
                        WHEN 'CDROMBrandID DESC' THEN '[ASM_AstHeader].[CDROMBrandID] DESC'
                        WHEN 'NoOfCDROM' THEN '[ASM_AstHeader].[NoOfCDROM]'
                        WHEN 'NoOfCDROM DESC' THEN '[ASM_AstHeader].[NoOfCDROM] DESC'
                        WHEN 'CDROMDetails' THEN '[ASM_AstHeader].[CDROMDetails]'
                        WHEN 'CDROMDetails DESC' THEN '[ASM_AstHeader].[CDROMDetails] DESC'
                        WHEN 'VDUBrandID' THEN '[ASM_AstHeader].[VDUBrandID]'
                        WHEN 'VDUBrandID DESC' THEN '[ASM_AstHeader].[VDUBrandID] DESC'
                        WHEN 'VDUDetails' THEN '[ASM_AstHeader].[VDUDetails]'
                        WHEN 'VDUDetails DESC' THEN '[ASM_AstHeader].[VDUDetails] DESC'
                        WHEN 'PCOSID' THEN '[ASM_AstHeader].[PCOSID]'
                        WHEN 'PCOSID DESC' THEN '[ASM_AstHeader].[PCOSID] DESC'
                        WHEN 'PCOSDetails' THEN '[ASM_AstHeader].[PCOSDetails]'
                        WHEN 'PCOSDetails DESC' THEN '[ASM_AstHeader].[PCOSDetails] DESC'
                        ELSE '[ASM_AstHeader].[MrnID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ASM_AstHeader].[MrnID],
		[ASM_AstHeader].[AssetTypeID],
		[ASM_AstHeader].[MrnDate],
		[ASM_AstHeader].[MrnDescription],
		[ASM_AstHeader].[SupplierID],
		[ASM_AstHeader].[DateOfPurchase],
		[ASM_AstHeader].[WarrantyTill],
		[ASM_AstHeader].[InsuranceTill],
		[ASM_AstHeader].[BrandID],
		[ASM_AstHeader].[ModelNo],
		[ASM_AstHeader].[OtherSpecifications],
		[ASM_AstHeader].[PurchasedQuantity],
		[ASM_AstHeader].[RecievedAt],
		[ASM_AstHeader].[RecievedOn],
		[ASM_AstHeader].[Remarks],
		[ASM_AstHeader].[RecievedBy],
		[ASM_AstHeader].[IssuedQuantity],
		[ASM_AstHeader].[WriteOffQuantity],
		[ASM_AstHeader].[Keyboard],
		[ASM_AstHeader].[Mouse],
		[ASM_AstHeader].[FloppyDrive],
		[ASM_AstHeader].[CPUBrandID],
		[ASM_AstHeader].[NoOfCPUs],
		[ASM_AstHeader].[CPUDetails],
		[ASM_AstHeader].[RAMID],
		[ASM_AstHeader].[SizeOfRAM],
		[ASM_AstHeader].[HDDBrandID],
		[ASM_AstHeader].[NoOfHDD],
		[ASM_AstHeader].[SizeOfHDD],
		[ASM_AstHeader].[HDDDetails],
		[ASM_AstHeader].[CDROMBrandID],
		[ASM_AstHeader].[NoOfCDROM],
		[ASM_AstHeader].[CDROMDetails],
		[ASM_AstHeader].[VDUBrandID],
		[ASM_AstHeader].[VDUDetails],
		[ASM_AstHeader].[PCOSID],
		[ASM_AstHeader].[PCOSDetails] 
  FROM [ASM_AstHeader] 
    	INNER JOIN #PageIndex
          ON [ASM_AstHeader].[MrnID] = #PageIndex.MrnID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
