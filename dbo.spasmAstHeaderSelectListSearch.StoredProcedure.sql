USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstHeaderSelectListSearch]
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
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands1]
    ON [ASM_AstHeader].[BrandID] = [ASM_AstBrands1].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands2]
    ON [ASM_AstHeader].[HDDBrandID] = [ASM_AstBrands2].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands3]
    ON [ASM_AstHeader].[CDROMBrandID] = [ASM_AstBrands3].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands4]
    ON [ASM_AstHeader].[VDUBrandID] = [ASM_AstBrands4].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands5]
    ON [ASM_AstHeader].[CPUBrandID] = [ASM_AstBrands5].[BrandID]
  LEFT OUTER JOIN [ASM_AstRAMS] AS [ASM_AstRAMS6]
    ON [ASM_AstHeader].[RAMID] = [ASM_AstRAMS6].[RAMID]
  LEFT OUTER JOIN [ASM_AstSoftwares] AS [ASM_AstSoftwares7]
    ON [ASM_AstHeader].[PCOSID] = [ASM_AstSoftwares7].[SoftwareID]
  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes8]
    ON [ASM_AstHeader].[AssetTypeID] = [ASM_AstTypes8].[AssetTypeID]
  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers9]
    ON [ASM_AstHeader].[SupplierID] = [ASM_Suppliers9].[SupplierID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees10]
    ON [ASM_AstHeader].[RecievedBy] = [HRM_Employees10].[CardNo]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices11]
    ON [ASM_AstHeader].[RecievedAt] = [HRM_Offices11].[OfficeID]
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
     OR LOWER(ISNULL([ASM_AstBrands1].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands2].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands3].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands4].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands4].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands5].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands5].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstRAMS6].[RAMID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstRAMS6].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstSoftwares7].[SoftwareID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstSoftwares7].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstTypes8].[AssetTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstTypes8].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_Suppliers9].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees10].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees10].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees10].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees10].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees10].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices11].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices11].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices11].[City],'')) LIKE @KeyWord1
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
     CASE @orderBy WHEN 'PCOSDetails DESC' THEN [ASM_AstHeader].[PCOSDetails] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands1_BrandID' THEN [ASM_AstBrands1].[BrandID] END,
     CASE @orderBy WHEN 'ASM_AstBrands1_BrandID DESC' THEN [ASM_AstBrands1].[BrandID] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands1_Description' THEN [ASM_AstBrands1].[Description] END,
     CASE @orderBy WHEN 'ASM_AstBrands1_Description DESC' THEN [ASM_AstBrands1].[Description] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands2_BrandID' THEN [ASM_AstBrands2].[BrandID] END,
     CASE @orderBy WHEN 'ASM_AstBrands2_BrandID DESC' THEN [ASM_AstBrands2].[BrandID] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands2_Description' THEN [ASM_AstBrands2].[Description] END,
     CASE @orderBy WHEN 'ASM_AstBrands2_Description DESC' THEN [ASM_AstBrands2].[Description] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands3_BrandID' THEN [ASM_AstBrands3].[BrandID] END,
     CASE @orderBy WHEN 'ASM_AstBrands3_BrandID DESC' THEN [ASM_AstBrands3].[BrandID] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands3_Description' THEN [ASM_AstBrands3].[Description] END,
     CASE @orderBy WHEN 'ASM_AstBrands3_Description DESC' THEN [ASM_AstBrands3].[Description] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands4_BrandID' THEN [ASM_AstBrands4].[BrandID] END,
     CASE @orderBy WHEN 'ASM_AstBrands4_BrandID DESC' THEN [ASM_AstBrands4].[BrandID] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands4_Description' THEN [ASM_AstBrands4].[Description] END,
     CASE @orderBy WHEN 'ASM_AstBrands4_Description DESC' THEN [ASM_AstBrands4].[Description] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands5_BrandID' THEN [ASM_AstBrands5].[BrandID] END,
     CASE @orderBy WHEN 'ASM_AstBrands5_BrandID DESC' THEN [ASM_AstBrands5].[BrandID] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands5_Description' THEN [ASM_AstBrands5].[Description] END,
     CASE @orderBy WHEN 'ASM_AstBrands5_Description DESC' THEN [ASM_AstBrands5].[Description] END DESC,
     CASE @orderBy WHEN 'ASM_AstRAMS6_RAMID' THEN [ASM_AstRAMS6].[RAMID] END,
     CASE @orderBy WHEN 'ASM_AstRAMS6_RAMID DESC' THEN [ASM_AstRAMS6].[RAMID] END DESC,
     CASE @orderBy WHEN 'ASM_AstRAMS6_Description' THEN [ASM_AstRAMS6].[Description] END,
     CASE @orderBy WHEN 'ASM_AstRAMS6_Description DESC' THEN [ASM_AstRAMS6].[Description] END DESC,
     CASE @orderBy WHEN 'ASM_AstSoftwares7_SoftwareID' THEN [ASM_AstSoftwares7].[SoftwareID] END,
     CASE @orderBy WHEN 'ASM_AstSoftwares7_SoftwareID DESC' THEN [ASM_AstSoftwares7].[SoftwareID] END DESC,
     CASE @orderBy WHEN 'ASM_AstSoftwares7_Description' THEN [ASM_AstSoftwares7].[Description] END,
     CASE @orderBy WHEN 'ASM_AstSoftwares7_Description DESC' THEN [ASM_AstSoftwares7].[Description] END DESC,
     CASE @orderBy WHEN 'ASM_AstTypes8_AssetTypeID' THEN [ASM_AstTypes8].[AssetTypeID] END,
     CASE @orderBy WHEN 'ASM_AstTypes8_AssetTypeID DESC' THEN [ASM_AstTypes8].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'ASM_AstTypes8_Description' THEN [ASM_AstTypes8].[Description] END,
     CASE @orderBy WHEN 'ASM_AstTypes8_Description DESC' THEN [ASM_AstTypes8].[Description] END DESC,
     CASE @orderBy WHEN 'ASM_AstTypes8_IssueToLocation' THEN [ASM_AstTypes8].[IssueToLocation] END,
     CASE @orderBy WHEN 'ASM_AstTypes8_IssueToLocation DESC' THEN [ASM_AstTypes8].[IssueToLocation] END DESC,
     CASE @orderBy WHEN 'ASM_Suppliers9_SupplierID' THEN [ASM_Suppliers9].[SupplierID] END,
     CASE @orderBy WHEN 'ASM_Suppliers9_SupplierID DESC' THEN [ASM_Suppliers9].[SupplierID] END DESC,
     CASE @orderBy WHEN 'ASM_Suppliers9_Description' THEN [ASM_Suppliers9].[Description] END,
     CASE @orderBy WHEN 'ASM_Suppliers9_Description DESC' THEN [ASM_Suppliers9].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees10_CardNo' THEN [HRM_Employees10].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees10_CardNo DESC' THEN [HRM_Employees10].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees10_EmployeeName' THEN [HRM_Employees10].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees10_EmployeeName DESC' THEN [HRM_Employees10].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Offices11_OfficeID' THEN [HRM_Offices11].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices11_OfficeID DESC' THEN [HRM_Offices11].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices11_Description' THEN [HRM_Offices11].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices11_Description DESC' THEN [HRM_Offices11].[Description] END DESC 

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
		[ASM_AstHeader].[PCOSDetails],
		[ASM_AstBrands1].[BrandID] AS ASM_AstBrands1_BrandID,
		[ASM_AstBrands1].[Description] AS ASM_AstBrands1_Description,
		[ASM_AstBrands2].[BrandID] AS ASM_AstBrands2_BrandID,
		[ASM_AstBrands2].[Description] AS ASM_AstBrands2_Description,
		[ASM_AstBrands3].[BrandID] AS ASM_AstBrands3_BrandID,
		[ASM_AstBrands3].[Description] AS ASM_AstBrands3_Description,
		[ASM_AstBrands4].[BrandID] AS ASM_AstBrands4_BrandID,
		[ASM_AstBrands4].[Description] AS ASM_AstBrands4_Description,
		[ASM_AstBrands5].[BrandID] AS ASM_AstBrands5_BrandID,
		[ASM_AstBrands5].[Description] AS ASM_AstBrands5_Description,
		[ASM_AstRAMS6].[RAMID] AS ASM_AstRAMS6_RAMID,
		[ASM_AstRAMS6].[Description] AS ASM_AstRAMS6_Description,
		[ASM_AstSoftwares7].[SoftwareID] AS ASM_AstSoftwares7_SoftwareID,
		[ASM_AstSoftwares7].[Description] AS ASM_AstSoftwares7_Description,
		[ASM_AstTypes8].[AssetTypeID] AS ASM_AstTypes8_AssetTypeID,
		[ASM_AstTypes8].[Description] AS ASM_AstTypes8_Description,
		[ASM_AstTypes8].[IssueToLocation] AS ASM_AstTypes8_IssueToLocation,
		[ASM_Suppliers9].[SupplierID] AS ASM_Suppliers9_SupplierID,
		[ASM_Suppliers9].[Description] AS ASM_Suppliers9_Description,
		[HRM_Employees10].[CardNo] AS HRM_Employees10_CardNo,
		[HRM_Employees10].[EmployeeName] AS HRM_Employees10_EmployeeName,
		[HRM_Offices11].[OfficeID] AS HRM_Offices11_OfficeID,
		[HRM_Offices11].[Description] AS HRM_Offices11_Description 
  FROM [ASM_AstHeader] 
    	INNER JOIN #PageIndex
          ON [ASM_AstHeader].[MrnID] = #PageIndex.MrnID
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands1]
    ON [ASM_AstHeader].[BrandID] = [ASM_AstBrands1].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands2]
    ON [ASM_AstHeader].[HDDBrandID] = [ASM_AstBrands2].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands3]
    ON [ASM_AstHeader].[CDROMBrandID] = [ASM_AstBrands3].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands4]
    ON [ASM_AstHeader].[VDUBrandID] = [ASM_AstBrands4].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands5]
    ON [ASM_AstHeader].[CPUBrandID] = [ASM_AstBrands5].[BrandID]
  LEFT OUTER JOIN [ASM_AstRAMS] AS [ASM_AstRAMS6]
    ON [ASM_AstHeader].[RAMID] = [ASM_AstRAMS6].[RAMID]
  LEFT OUTER JOIN [ASM_AstSoftwares] AS [ASM_AstSoftwares7]
    ON [ASM_AstHeader].[PCOSID] = [ASM_AstSoftwares7].[SoftwareID]
  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes8]
    ON [ASM_AstHeader].[AssetTypeID] = [ASM_AstTypes8].[AssetTypeID]
  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers9]
    ON [ASM_AstHeader].[SupplierID] = [ASM_Suppliers9].[SupplierID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees10]
    ON [ASM_AstHeader].[RecievedBy] = [HRM_Employees10].[CardNo]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices11]
    ON [ASM_AstHeader].[RecievedAt] = [HRM_Offices11].[OfficeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
