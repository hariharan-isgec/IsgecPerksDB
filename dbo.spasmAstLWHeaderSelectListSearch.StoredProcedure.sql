USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWHeaderSelectListSearch]
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
  )
  INSERT INTO #PageIndex (MrnID)
  SELECT [ASM_AstHeader].[MrnID] FROM [ASM_AstHeader]
 WHERE  
   ( 
         STR(ISNULL([ASM_AstHeader].[MrnID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[AssetTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[MrnDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader].[SupplierID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[ModelNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[OtherSpecifications],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader].[PurchasedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader].[RecievedAt], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[RecievedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader].[IssuedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader].[WriteOffQuantity], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[CPUBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader].[NoOfCPUs], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[CPUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[RAMID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader].[SizeOfRAM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[HDDBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader].[NoOfHDD], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader].[SizeOfHDD], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[HDDDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[CDROMBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader].[NoOfCDROM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[CDROMDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[VDUBrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[VDUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[PCOSID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader].[PCOSDetails],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'MrnID' THEN [ASM_AstHeader].[MrnID] END,
     CASE @orderBy WHEN 'MrnID DESC' THEN [ASM_AstHeader].[MrnID] END DESC,
     CASE @orderBy WHEN 'AssetTypeID' THEN [ASM_AstHeader].[AssetTypeID] END,
     CASE @orderBy WHEN 'AssetTypeID DESC' THEN [ASM_AstHeader].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'MrnDate' THEN [ASM_AstHeader].[MrnDate] END,
     CASE @orderBy WHEN 'MrnDate DESC' THEN [ASM_AstHeader].[MrnDate] END DESC,
     CASE @orderBy WHEN 'MrnDescription' THEN [ASM_AstHeader].[MrnDescription] END,
     CASE @orderBy WHEN 'MrnDescription DESC' THEN [ASM_AstHeader].[MrnDescription] END DESC,
     CASE @orderBy WHEN 'SupplierID' THEN [ASM_AstHeader].[SupplierID] END,
     CASE @orderBy WHEN 'SupplierID DESC' THEN [ASM_AstHeader].[SupplierID] END DESC,
     CASE @orderBy WHEN 'DateOfPurchase' THEN [ASM_AstHeader].[DateOfPurchase] END,
     CASE @orderBy WHEN 'DateOfPurchase DESC' THEN [ASM_AstHeader].[DateOfPurchase] END DESC,
     CASE @orderBy WHEN 'WarrantyTill' THEN [ASM_AstHeader].[WarrantyTill] END,
     CASE @orderBy WHEN 'WarrantyTill DESC' THEN [ASM_AstHeader].[WarrantyTill] END DESC,
     CASE @orderBy WHEN 'InsuranceTill' THEN [ASM_AstHeader].[InsuranceTill] END,
     CASE @orderBy WHEN 'InsuranceTill DESC' THEN [ASM_AstHeader].[InsuranceTill] END DESC,
     CASE @orderBy WHEN 'BrandID' THEN [ASM_AstHeader].[BrandID] END,
     CASE @orderBy WHEN 'BrandID DESC' THEN [ASM_AstHeader].[BrandID] END DESC,
     CASE @orderBy WHEN 'ModelNo' THEN [ASM_AstHeader].[ModelNo] END,
     CASE @orderBy WHEN 'ModelNo DESC' THEN [ASM_AstHeader].[ModelNo] END DESC,
     CASE @orderBy WHEN 'OtherSpecifications' THEN [ASM_AstHeader].[OtherSpecifications] END,
     CASE @orderBy WHEN 'OtherSpecifications DESC' THEN [ASM_AstHeader].[OtherSpecifications] END DESC,
     CASE @orderBy WHEN 'PurchasedQuantity' THEN [ASM_AstHeader].[PurchasedQuantity] END,
     CASE @orderBy WHEN 'PurchasedQuantity DESC' THEN [ASM_AstHeader].[PurchasedQuantity] END DESC,
     CASE @orderBy WHEN 'RecievedAt' THEN [ASM_AstHeader].[RecievedAt] END,
     CASE @orderBy WHEN 'RecievedAt DESC' THEN [ASM_AstHeader].[RecievedAt] END DESC,
     CASE @orderBy WHEN 'RecievedOn' THEN [ASM_AstHeader].[RecievedOn] END,
     CASE @orderBy WHEN 'RecievedOn DESC' THEN [ASM_AstHeader].[RecievedOn] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ASM_AstHeader].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ASM_AstHeader].[Remarks] END DESC,
     CASE @orderBy WHEN 'RecievedBy' THEN [ASM_AstHeader].[RecievedBy] END,
     CASE @orderBy WHEN 'RecievedBy DESC' THEN [ASM_AstHeader].[RecievedBy] END DESC,
     CASE @orderBy WHEN 'IssuedQuantity' THEN [ASM_AstHeader].[IssuedQuantity] END,
     CASE @orderBy WHEN 'IssuedQuantity DESC' THEN [ASM_AstHeader].[IssuedQuantity] END DESC,
     CASE @orderBy WHEN 'WriteOffQuantity' THEN [ASM_AstHeader].[WriteOffQuantity] END,
     CASE @orderBy WHEN 'WriteOffQuantity DESC' THEN [ASM_AstHeader].[WriteOffQuantity] END DESC,
     CASE @orderBy WHEN 'Keyboard' THEN [ASM_AstHeader].[Keyboard] END,
     CASE @orderBy WHEN 'Keyboard DESC' THEN [ASM_AstHeader].[Keyboard] END DESC,
     CASE @orderBy WHEN 'Mouse' THEN [ASM_AstHeader].[Mouse] END,
     CASE @orderBy WHEN 'Mouse DESC' THEN [ASM_AstHeader].[Mouse] END DESC,
     CASE @orderBy WHEN 'FloppyDrive' THEN [ASM_AstHeader].[FloppyDrive] END,
     CASE @orderBy WHEN 'FloppyDrive DESC' THEN [ASM_AstHeader].[FloppyDrive] END DESC,
     CASE @orderBy WHEN 'CPUBrandID' THEN [ASM_AstHeader].[CPUBrandID] END,
     CASE @orderBy WHEN 'CPUBrandID DESC' THEN [ASM_AstHeader].[CPUBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfCPUs' THEN [ASM_AstHeader].[NoOfCPUs] END,
     CASE @orderBy WHEN 'NoOfCPUs DESC' THEN [ASM_AstHeader].[NoOfCPUs] END DESC,
     CASE @orderBy WHEN 'CPUDetails' THEN [ASM_AstHeader].[CPUDetails] END,
     CASE @orderBy WHEN 'CPUDetails DESC' THEN [ASM_AstHeader].[CPUDetails] END DESC,
     CASE @orderBy WHEN 'RAMID' THEN [ASM_AstHeader].[RAMID] END,
     CASE @orderBy WHEN 'RAMID DESC' THEN [ASM_AstHeader].[RAMID] END DESC,
     CASE @orderBy WHEN 'SizeOfRAM' THEN [ASM_AstHeader].[SizeOfRAM] END,
     CASE @orderBy WHEN 'SizeOfRAM DESC' THEN [ASM_AstHeader].[SizeOfRAM] END DESC,
     CASE @orderBy WHEN 'HDDBrandID' THEN [ASM_AstHeader].[HDDBrandID] END,
     CASE @orderBy WHEN 'HDDBrandID DESC' THEN [ASM_AstHeader].[HDDBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfHDD' THEN [ASM_AstHeader].[NoOfHDD] END,
     CASE @orderBy WHEN 'NoOfHDD DESC' THEN [ASM_AstHeader].[NoOfHDD] END DESC,
     CASE @orderBy WHEN 'SizeOfHDD' THEN [ASM_AstHeader].[SizeOfHDD] END,
     CASE @orderBy WHEN 'SizeOfHDD DESC' THEN [ASM_AstHeader].[SizeOfHDD] END DESC,
     CASE @orderBy WHEN 'HDDDetails' THEN [ASM_AstHeader].[HDDDetails] END,
     CASE @orderBy WHEN 'HDDDetails DESC' THEN [ASM_AstHeader].[HDDDetails] END DESC,
     CASE @orderBy WHEN 'CDROMBrandID' THEN [ASM_AstHeader].[CDROMBrandID] END,
     CASE @orderBy WHEN 'CDROMBrandID DESC' THEN [ASM_AstHeader].[CDROMBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfCDROM' THEN [ASM_AstHeader].[NoOfCDROM] END,
     CASE @orderBy WHEN 'NoOfCDROM DESC' THEN [ASM_AstHeader].[NoOfCDROM] END DESC,
     CASE @orderBy WHEN 'CDROMDetails' THEN [ASM_AstHeader].[CDROMDetails] END,
     CASE @orderBy WHEN 'CDROMDetails DESC' THEN [ASM_AstHeader].[CDROMDetails] END DESC,
     CASE @orderBy WHEN 'VDUBrandID' THEN [ASM_AstHeader].[VDUBrandID] END,
     CASE @orderBy WHEN 'VDUBrandID DESC' THEN [ASM_AstHeader].[VDUBrandID] END DESC,
     CASE @orderBy WHEN 'VDUDetails' THEN [ASM_AstHeader].[VDUDetails] END,
     CASE @orderBy WHEN 'VDUDetails DESC' THEN [ASM_AstHeader].[VDUDetails] END DESC,
     CASE @orderBy WHEN 'PCOSID' THEN [ASM_AstHeader].[PCOSID] END,
     CASE @orderBy WHEN 'PCOSID DESC' THEN [ASM_AstHeader].[PCOSID] END DESC,
     CASE @orderBy WHEN 'PCOSDetails' THEN [ASM_AstHeader].[PCOSDetails] END,
     CASE @orderBy WHEN 'PCOSDetails DESC' THEN [ASM_AstHeader].[PCOSDetails] END DESC 

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
