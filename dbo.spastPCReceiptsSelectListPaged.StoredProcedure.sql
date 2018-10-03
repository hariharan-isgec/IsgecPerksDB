USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCReceiptsSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  MrnID Int NOT NULL
  )
  INSERT INTO #PageIndex (MrnID)
  SELECT [AST_MrnPC].[MrnID] FROM [AST_MrnPC]
  INNER JOIN [AST_MrnPC] AS [AST_MrnPC1]
    ON [AST_MrnPC].[MrnID] = [AST_MrnPC1].[MrnID]
  INNER JOIN [AST_Suppliers] AS [AST_Suppliers2]
    ON [AST_MrnPC].[SupplierID] = [AST_Suppliers2].[SupplierID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]
    ON [AST_MrnPC].[pcBrandID] = [AST_Brands3].[BrandID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]
    ON [AST_MrnPC].[cpuBrandID] = [AST_Brands4].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams5]
    ON [AST_MrnPC].[RamID] = [AST_Rams5].[RamID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands6]
    ON [AST_MrnPC].[vduBrandID] = [AST_Brands6].[BrandID]
  LEFT OUTER JOIN [AST_Softwares] AS [AST_Softwares7]
    ON [AST_MrnPC].[pcOSID] = [AST_Softwares7].[SoftwareID]
  ORDER BY
     CASE @orderBy WHEN 'MrnID' THEN [AST_MrnPC].[MrnID] END,
     CASE @orderBy WHEN 'MrnID DESC' THEN [AST_MrnPC].[MrnID] END DESC,
     CASE @orderBy WHEN 'MrnDate' THEN [AST_MrnPC].[MrnDate] END,
     CASE @orderBy WHEN 'MrnDate DESC' THEN [AST_MrnPC].[MrnDate] END DESC,
     CASE @orderBy WHEN 'MrnDescription' THEN [AST_MrnPC].[MrnDescription] END,
     CASE @orderBy WHEN 'MrnDescription DESC' THEN [AST_MrnPC].[MrnDescription] END DESC,
     CASE @orderBy WHEN 'DateOfPurchase' THEN [AST_MrnPC].[DateOfPurchase] END,
     CASE @orderBy WHEN 'DateOfPurchase DESC' THEN [AST_MrnPC].[DateOfPurchase] END DESC,
     CASE @orderBy WHEN 'WarrantyTill' THEN [AST_MrnPC].[WarrantyTill] END,
     CASE @orderBy WHEN 'WarrantyTill DESC' THEN [AST_MrnPC].[WarrantyTill] END DESC,
     CASE @orderBy WHEN 'InsuranceTill' THEN [AST_MrnPC].[InsuranceTill] END,
     CASE @orderBy WHEN 'InsuranceTill DESC' THEN [AST_MrnPC].[InsuranceTill] END DESC,
     CASE @orderBy WHEN 'SupplierID' THEN [AST_MrnPC].[SupplierID] END,
     CASE @orderBy WHEN 'SupplierID DESC' THEN [AST_MrnPC].[SupplierID] END DESC,
     CASE @orderBy WHEN 'Keyboard' THEN [AST_MrnPC].[Keyboard] END,
     CASE @orderBy WHEN 'Keyboard DESC' THEN [AST_MrnPC].[Keyboard] END DESC,
     CASE @orderBy WHEN 'Mouse' THEN [AST_MrnPC].[Mouse] END,
     CASE @orderBy WHEN 'Mouse DESC' THEN [AST_MrnPC].[Mouse] END DESC,
     CASE @orderBy WHEN 'FloppyDrive' THEN [AST_MrnPC].[FloppyDrive] END,
     CASE @orderBy WHEN 'FloppyDrive DESC' THEN [AST_MrnPC].[FloppyDrive] END DESC,
     CASE @orderBy WHEN 'PurchasedQuantity' THEN [AST_MrnPC].[PurchasedQuantity] END,
     CASE @orderBy WHEN 'PurchasedQuantity DESC' THEN [AST_MrnPC].[PurchasedQuantity] END DESC,
     CASE @orderBy WHEN 'IssuedQuantity' THEN [AST_MrnPC].[IssuedQuantity] END,
     CASE @orderBy WHEN 'IssuedQuantity DESC' THEN [AST_MrnPC].[IssuedQuantity] END DESC,
     CASE @orderBy WHEN 'WriteoffQuantity' THEN [AST_MrnPC].[WriteoffQuantity] END,
     CASE @orderBy WHEN 'WriteoffQuantity DESC' THEN [AST_MrnPC].[WriteoffQuantity] END DESC,
     CASE @orderBy WHEN 'pcBrandID' THEN [AST_MrnPC].[pcBrandID] END,
     CASE @orderBy WHEN 'pcBrandID DESC' THEN [AST_MrnPC].[pcBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfCPUs' THEN [AST_MrnPC].[NoOfCPUs] END,
     CASE @orderBy WHEN 'NoOfCPUs DESC' THEN [AST_MrnPC].[NoOfCPUs] END DESC,
     CASE @orderBy WHEN 'cpuBrandID' THEN [AST_MrnPC].[cpuBrandID] END,
     CASE @orderBy WHEN 'cpuBrandID DESC' THEN [AST_MrnPC].[cpuBrandID] END DESC,
     CASE @orderBy WHEN 'CPUModel' THEN [AST_MrnPC].[CPUModel] END,
     CASE @orderBy WHEN 'CPUModel DESC' THEN [AST_MrnPC].[CPUModel] END DESC,
     CASE @orderBy WHEN 'RamID' THEN [AST_MrnPC].[RamID] END,
     CASE @orderBy WHEN 'RamID DESC' THEN [AST_MrnPC].[RamID] END DESC,
     CASE @orderBy WHEN 'NoOfHDDs' THEN [AST_MrnPC].[NoOfHDDs] END,
     CASE @orderBy WHEN 'NoOfHDDs DESC' THEN [AST_MrnPC].[NoOfHDDs] END DESC,
     CASE @orderBy WHEN 'TotalHDDGB' THEN [AST_MrnPC].[TotalHDDGB] END,
     CASE @orderBy WHEN 'TotalHDDGB DESC' THEN [AST_MrnPC].[TotalHDDGB] END DESC,
     CASE @orderBy WHEN 'HDDDetails' THEN [AST_MrnPC].[HDDDetails] END,
     CASE @orderBy WHEN 'HDDDetails DESC' THEN [AST_MrnPC].[HDDDetails] END DESC,
     CASE @orderBy WHEN 'NoOfCDROMs' THEN [AST_MrnPC].[NoOfCDROMs] END,
     CASE @orderBy WHEN 'NoOfCDROMs DESC' THEN [AST_MrnPC].[NoOfCDROMs] END DESC,
     CASE @orderBy WHEN 'CDRomDetails' THEN [AST_MrnPC].[CDRomDetails] END,
     CASE @orderBy WHEN 'CDRomDetails DESC' THEN [AST_MrnPC].[CDRomDetails] END DESC,
     CASE @orderBy WHEN 'vduBrandID' THEN [AST_MrnPC].[vduBrandID] END,
     CASE @orderBy WHEN 'vduBrandID DESC' THEN [AST_MrnPC].[vduBrandID] END DESC,
     CASE @orderBy WHEN 'pcOSID' THEN [AST_MrnPC].[pcOSID] END,
     CASE @orderBy WHEN 'pcOSID DESC' THEN [AST_MrnPC].[pcOSID] END DESC,
     CASE @orderBy WHEN 'pcOSDetails' THEN [AST_MrnPC].[pcOSDetails] END,
     CASE @orderBy WHEN 'pcOSDetails DESC' THEN [AST_MrnPC].[pcOSDetails] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [AST_MrnPC].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [AST_MrnPC].[Remarks] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_MrnID' THEN [AST_MrnPC1].[MrnID] END,
     CASE @orderBy WHEN 'AST_MrnPC1_MrnID DESC' THEN [AST_MrnPC1].[MrnID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_MrnDate' THEN [AST_MrnPC1].[MrnDate] END,
     CASE @orderBy WHEN 'AST_MrnPC1_MrnDate DESC' THEN [AST_MrnPC1].[MrnDate] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_MrnDescription' THEN [AST_MrnPC1].[MrnDescription] END,
     CASE @orderBy WHEN 'AST_MrnPC1_MrnDescription DESC' THEN [AST_MrnPC1].[MrnDescription] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_DateOfPurchase' THEN [AST_MrnPC1].[DateOfPurchase] END,
     CASE @orderBy WHEN 'AST_MrnPC1_DateOfPurchase DESC' THEN [AST_MrnPC1].[DateOfPurchase] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_WarrantyTill' THEN [AST_MrnPC1].[WarrantyTill] END,
     CASE @orderBy WHEN 'AST_MrnPC1_WarrantyTill DESC' THEN [AST_MrnPC1].[WarrantyTill] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_InsuranceTill' THEN [AST_MrnPC1].[InsuranceTill] END,
     CASE @orderBy WHEN 'AST_MrnPC1_InsuranceTill DESC' THEN [AST_MrnPC1].[InsuranceTill] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_SupplierID' THEN [AST_MrnPC1].[SupplierID] END,
     CASE @orderBy WHEN 'AST_MrnPC1_SupplierID DESC' THEN [AST_MrnPC1].[SupplierID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_Keyboard' THEN [AST_MrnPC1].[Keyboard] END,
     CASE @orderBy WHEN 'AST_MrnPC1_Keyboard DESC' THEN [AST_MrnPC1].[Keyboard] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_Mouse' THEN [AST_MrnPC1].[Mouse] END,
     CASE @orderBy WHEN 'AST_MrnPC1_Mouse DESC' THEN [AST_MrnPC1].[Mouse] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_FloppyDrive' THEN [AST_MrnPC1].[FloppyDrive] END,
     CASE @orderBy WHEN 'AST_MrnPC1_FloppyDrive DESC' THEN [AST_MrnPC1].[FloppyDrive] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_PurchasedQuantity' THEN [AST_MrnPC1].[PurchasedQuantity] END,
     CASE @orderBy WHEN 'AST_MrnPC1_PurchasedQuantity DESC' THEN [AST_MrnPC1].[PurchasedQuantity] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_IssuedQuantity' THEN [AST_MrnPC1].[IssuedQuantity] END,
     CASE @orderBy WHEN 'AST_MrnPC1_IssuedQuantity DESC' THEN [AST_MrnPC1].[IssuedQuantity] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_WriteoffQuantity' THEN [AST_MrnPC1].[WriteoffQuantity] END,
     CASE @orderBy WHEN 'AST_MrnPC1_WriteoffQuantity DESC' THEN [AST_MrnPC1].[WriteoffQuantity] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_pcBrandID' THEN [AST_MrnPC1].[pcBrandID] END,
     CASE @orderBy WHEN 'AST_MrnPC1_pcBrandID DESC' THEN [AST_MrnPC1].[pcBrandID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_NoOfCPUs' THEN [AST_MrnPC1].[NoOfCPUs] END,
     CASE @orderBy WHEN 'AST_MrnPC1_NoOfCPUs DESC' THEN [AST_MrnPC1].[NoOfCPUs] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_cpuBrandID' THEN [AST_MrnPC1].[cpuBrandID] END,
     CASE @orderBy WHEN 'AST_MrnPC1_cpuBrandID DESC' THEN [AST_MrnPC1].[cpuBrandID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_CPUModel' THEN [AST_MrnPC1].[CPUModel] END,
     CASE @orderBy WHEN 'AST_MrnPC1_CPUModel DESC' THEN [AST_MrnPC1].[CPUModel] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_RamID' THEN [AST_MrnPC1].[RamID] END,
     CASE @orderBy WHEN 'AST_MrnPC1_RamID DESC' THEN [AST_MrnPC1].[RamID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_NoOfHDDs' THEN [AST_MrnPC1].[NoOfHDDs] END,
     CASE @orderBy WHEN 'AST_MrnPC1_NoOfHDDs DESC' THEN [AST_MrnPC1].[NoOfHDDs] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_TotalHDDGB' THEN [AST_MrnPC1].[TotalHDDGB] END,
     CASE @orderBy WHEN 'AST_MrnPC1_TotalHDDGB DESC' THEN [AST_MrnPC1].[TotalHDDGB] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_HDDDetails' THEN [AST_MrnPC1].[HDDDetails] END,
     CASE @orderBy WHEN 'AST_MrnPC1_HDDDetails DESC' THEN [AST_MrnPC1].[HDDDetails] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_NoOfCDROMs' THEN [AST_MrnPC1].[NoOfCDROMs] END,
     CASE @orderBy WHEN 'AST_MrnPC1_NoOfCDROMs DESC' THEN [AST_MrnPC1].[NoOfCDROMs] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_CDRomDetails' THEN [AST_MrnPC1].[CDRomDetails] END,
     CASE @orderBy WHEN 'AST_MrnPC1_CDRomDetails DESC' THEN [AST_MrnPC1].[CDRomDetails] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_vduBrandID' THEN [AST_MrnPC1].[vduBrandID] END,
     CASE @orderBy WHEN 'AST_MrnPC1_vduBrandID DESC' THEN [AST_MrnPC1].[vduBrandID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_pcOSID' THEN [AST_MrnPC1].[pcOSID] END,
     CASE @orderBy WHEN 'AST_MrnPC1_pcOSID DESC' THEN [AST_MrnPC1].[pcOSID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_pcOSDetails' THEN [AST_MrnPC1].[pcOSDetails] END,
     CASE @orderBy WHEN 'AST_MrnPC1_pcOSDetails DESC' THEN [AST_MrnPC1].[pcOSDetails] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC1_Remarks' THEN [AST_MrnPC1].[Remarks] END,
     CASE @orderBy WHEN 'AST_MrnPC1_Remarks DESC' THEN [AST_MrnPC1].[Remarks] END DESC,
     CASE @orderBy WHEN 'AST_Suppliers2_SupplierID' THEN [AST_Suppliers2].[SupplierID] END,
     CASE @orderBy WHEN 'AST_Suppliers2_SupplierID DESC' THEN [AST_Suppliers2].[SupplierID] END DESC,
     CASE @orderBy WHEN 'AST_Suppliers2_Description' THEN [AST_Suppliers2].[Description] END,
     CASE @orderBy WHEN 'AST_Suppliers2_Description DESC' THEN [AST_Suppliers2].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Brands3_BrandID' THEN [AST_Brands3].[BrandID] END,
     CASE @orderBy WHEN 'AST_Brands3_BrandID DESC' THEN [AST_Brands3].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_Brands3_Description' THEN [AST_Brands3].[Description] END,
     CASE @orderBy WHEN 'AST_Brands3_Description DESC' THEN [AST_Brands3].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Brands4_BrandID' THEN [AST_Brands4].[BrandID] END,
     CASE @orderBy WHEN 'AST_Brands4_BrandID DESC' THEN [AST_Brands4].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_Brands4_Description' THEN [AST_Brands4].[Description] END,
     CASE @orderBy WHEN 'AST_Brands4_Description DESC' THEN [AST_Brands4].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Rams5_RamID' THEN [AST_Rams5].[RamID] END,
     CASE @orderBy WHEN 'AST_Rams5_RamID DESC' THEN [AST_Rams5].[RamID] END DESC,
     CASE @orderBy WHEN 'AST_Rams5_Description' THEN [AST_Rams5].[Description] END,
     CASE @orderBy WHEN 'AST_Rams5_Description DESC' THEN [AST_Rams5].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Brands6_BrandID' THEN [AST_Brands6].[BrandID] END,
     CASE @orderBy WHEN 'AST_Brands6_BrandID DESC' THEN [AST_Brands6].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_Brands6_Description' THEN [AST_Brands6].[Description] END,
     CASE @orderBy WHEN 'AST_Brands6_Description DESC' THEN [AST_Brands6].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Softwares7_SoftwareID' THEN [AST_Softwares7].[SoftwareID] END,
     CASE @orderBy WHEN 'AST_Softwares7_SoftwareID DESC' THEN [AST_Softwares7].[SoftwareID] END DESC,
     CASE @orderBy WHEN 'AST_Softwares7_Description' THEN [AST_Softwares7].[Description] END,
     CASE @orderBy WHEN 'AST_Softwares7_Description DESC' THEN [AST_Softwares7].[Description] END DESC 

  SET @RecordCount = @@RowCount

  SELECT
		[AST_MrnPC].[MrnID],
		[AST_MrnPC].[MrnDate],
		[AST_MrnPC].[MrnDescription],
		[AST_MrnPC].[DateOfPurchase],
		[AST_MrnPC].[WarrantyTill],
		[AST_MrnPC].[InsuranceTill],
		[AST_MrnPC].[SupplierID],
		[AST_MrnPC].[Keyboard],
		[AST_MrnPC].[Mouse],
		[AST_MrnPC].[FloppyDrive],
		[AST_MrnPC].[PurchasedQuantity],
		[AST_MrnPC].[IssuedQuantity],
		[AST_MrnPC].[WriteoffQuantity],
		[AST_MrnPC].[pcBrandID],
		[AST_MrnPC].[NoOfCPUs],
		[AST_MrnPC].[cpuBrandID],
		[AST_MrnPC].[CPUModel],
		[AST_MrnPC].[RamID],
		[AST_MrnPC].[NoOfHDDs],
		[AST_MrnPC].[TotalHDDGB],
		[AST_MrnPC].[HDDDetails],
		[AST_MrnPC].[NoOfCDROMs],
		[AST_MrnPC].[CDRomDetails],
		[AST_MrnPC].[vduBrandID],
		[AST_MrnPC].[pcOSID],
		[AST_MrnPC].[pcOSDetails],
		[AST_MrnPC].[Remarks],
		[AST_MrnPC1].[MrnID] AS AST_MrnPC1_MrnID,
		[AST_MrnPC1].[MrnDate] AS AST_MrnPC1_MrnDate,
		[AST_MrnPC1].[MrnDescription] AS AST_MrnPC1_MrnDescription,
		[AST_MrnPC1].[DateOfPurchase] AS AST_MrnPC1_DateOfPurchase,
		[AST_MrnPC1].[WarrantyTill] AS AST_MrnPC1_WarrantyTill,
		[AST_MrnPC1].[InsuranceTill] AS AST_MrnPC1_InsuranceTill,
		[AST_MrnPC1].[SupplierID] AS AST_MrnPC1_SupplierID,
		[AST_MrnPC1].[Keyboard] AS AST_MrnPC1_Keyboard,
		[AST_MrnPC1].[Mouse] AS AST_MrnPC1_Mouse,
		[AST_MrnPC1].[FloppyDrive] AS AST_MrnPC1_FloppyDrive,
		[AST_MrnPC1].[PurchasedQuantity] AS AST_MrnPC1_PurchasedQuantity,
		[AST_MrnPC1].[IssuedQuantity] AS AST_MrnPC1_IssuedQuantity,
		[AST_MrnPC1].[WriteoffQuantity] AS AST_MrnPC1_WriteoffQuantity,
		[AST_MrnPC1].[pcBrandID] AS AST_MrnPC1_pcBrandID,
		[AST_MrnPC1].[NoOfCPUs] AS AST_MrnPC1_NoOfCPUs,
		[AST_MrnPC1].[cpuBrandID] AS AST_MrnPC1_cpuBrandID,
		[AST_MrnPC1].[CPUModel] AS AST_MrnPC1_CPUModel,
		[AST_MrnPC1].[RamID] AS AST_MrnPC1_RamID,
		[AST_MrnPC1].[NoOfHDDs] AS AST_MrnPC1_NoOfHDDs,
		[AST_MrnPC1].[TotalHDDGB] AS AST_MrnPC1_TotalHDDGB,
		[AST_MrnPC1].[HDDDetails] AS AST_MrnPC1_HDDDetails,
		[AST_MrnPC1].[NoOfCDROMs] AS AST_MrnPC1_NoOfCDROMs,
		[AST_MrnPC1].[CDRomDetails] AS AST_MrnPC1_CDRomDetails,
		[AST_MrnPC1].[vduBrandID] AS AST_MrnPC1_vduBrandID,
		[AST_MrnPC1].[pcOSID] AS AST_MrnPC1_pcOSID,
		[AST_MrnPC1].[pcOSDetails] AS AST_MrnPC1_pcOSDetails,
		[AST_MrnPC1].[Remarks] AS AST_MrnPC1_Remarks,
		[AST_Suppliers2].[SupplierID] AS AST_Suppliers2_SupplierID,
		[AST_Suppliers2].[Description] AS AST_Suppliers2_Description,
		[AST_Brands3].[BrandID] AS AST_Brands3_BrandID,
		[AST_Brands3].[Description] AS AST_Brands3_Description,
		[AST_Brands4].[BrandID] AS AST_Brands4_BrandID,
		[AST_Brands4].[Description] AS AST_Brands4_Description,
		[AST_Rams5].[RamID] AS AST_Rams5_RamID,
		[AST_Rams5].[Description] AS AST_Rams5_Description,
		[AST_Brands6].[BrandID] AS AST_Brands6_BrandID,
		[AST_Brands6].[Description] AS AST_Brands6_Description,
		[AST_Softwares7].[SoftwareID] AS AST_Softwares7_SoftwareID,
		[AST_Softwares7].[Description] AS AST_Softwares7_Description 
  FROM [AST_MrnPC] 
    	INNER JOIN #PageIndex
          ON [AST_MrnPC].[MrnID] = #PageIndex.MrnID
  INNER JOIN [AST_MrnPC] AS [AST_MrnPC1]
    ON [AST_MrnPC].[MrnID] = [AST_MrnPC1].[MrnID]
  INNER JOIN [AST_Suppliers] AS [AST_Suppliers2]
    ON [AST_MrnPC].[SupplierID] = [AST_Suppliers2].[SupplierID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]
    ON [AST_MrnPC].[pcBrandID] = [AST_Brands3].[BrandID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]
    ON [AST_MrnPC].[cpuBrandID] = [AST_Brands4].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams5]
    ON [AST_MrnPC].[RamID] = [AST_Rams5].[RamID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands6]
    ON [AST_MrnPC].[vduBrandID] = [AST_Brands6].[BrandID]
  LEFT OUTER JOIN [AST_Softwares] AS [AST_Softwares7]
    ON [AST_MrnPC].[pcOSID] = [AST_Softwares7].[SoftwareID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
