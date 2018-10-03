USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstDetailsSelectListSearch]
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
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands1]
    ON [ASM_AstDetails].[CPUBrandID] = [ASM_AstBrands1].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands2]
    ON [ASM_AstDetails].[CDROMBrandID] = [ASM_AstBrands2].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands3]
    ON [ASM_AstDetails].[VDUBrandID] = [ASM_AstBrands3].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands4]
    ON [ASM_AstDetails].[HDDBrandID] = [ASM_AstBrands4].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands5]
    ON [ASM_AstDetails].[BrandID] = [ASM_AstBrands5].[BrandID]
  LEFT OUTER JOIN [ASM_AstRAMS] AS [ASM_AstRAMS8]
    ON [ASM_AstDetails].[RAMID] = [ASM_AstRAMS8].[RAMID]
  LEFT OUTER JOIN [ASM_AstSoftwares] AS [ASM_AstSoftwares9]
    ON [ASM_AstDetails].[PCOSID] = [ASM_AstSoftwares9].[SoftwareID]
  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes10]
    ON [ASM_AstDetails].[AssetTypeID] = [ASM_AstTypes10].[AssetTypeID]
  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers11]
    ON [ASM_AstDetails].[SupplierID] = [ASM_Suppliers11].[SupplierID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees13]
    ON [ASM_AstDetails].[RecievedBy] = [HRM_Employees13].[CardNo]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices18]
    ON [ASM_AstDetails].[RecievedAt] = [HRM_Offices18].[OfficeID]
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
     OR LOWER(ISNULL([ASM_AstDetails].[CPUBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[NoOfCPUs], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CPUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[RAMID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[SizeOfRAM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[HDDBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[NoOfHDD], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[SizeOfHDD], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[HDDDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CDROMBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[NoOfCDROM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CDROMDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[VDUBrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[VDUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[PCOSID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[PCOSDetails],'')) LIKE @KeyWord1
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
     OR LOWER(ISNULL([ASM_AstRAMS8].[RAMID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstRAMS8].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstSoftwares9].[SoftwareID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstSoftwares9].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstTypes10].[AssetTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstTypes10].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_Suppliers11].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees13].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees13].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees13].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees13].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees13].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices18].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices18].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices18].[City],'')) LIKE @KeyWord1
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
     CASE @orderBy WHEN 'IssueToLocation' THEN [ASM_AstDetails].[IssueToLocation] END,
     CASE @orderBy WHEN 'IssueToLocation DESC' THEN [ASM_AstDetails].[IssueToLocation] END DESC,
     CASE @orderBy WHEN 'Modified' THEN [ASM_AstDetails].[Modified] END,
     CASE @orderBy WHEN 'Modified DESC' THEN [ASM_AstDetails].[Modified] END DESC,
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
     CASE @orderBy WHEN 'CDROMBrandID' THEN [ASM_AstDetails].[CDROMBrandID] END,
     CASE @orderBy WHEN 'CDROMBrandID DESC' THEN [ASM_AstDetails].[CDROMBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfCDROM' THEN [ASM_AstDetails].[NoOfCDROM] END,
     CASE @orderBy WHEN 'NoOfCDROM DESC' THEN [ASM_AstDetails].[NoOfCDROM] END DESC,
     CASE @orderBy WHEN 'CDROMDetails' THEN [ASM_AstDetails].[CDROMDetails] END,
     CASE @orderBy WHEN 'CDROMDetails DESC' THEN [ASM_AstDetails].[CDROMDetails] END DESC,
     CASE @orderBy WHEN 'VDUBrandID' THEN [ASM_AstDetails].[VDUBrandID] END,
     CASE @orderBy WHEN 'VDUBrandID DESC' THEN [ASM_AstDetails].[VDUBrandID] END DESC,
     CASE @orderBy WHEN 'VDUDetails' THEN [ASM_AstDetails].[VDUDetails] END,
     CASE @orderBy WHEN 'VDUDetails DESC' THEN [ASM_AstDetails].[VDUDetails] END DESC,
     CASE @orderBy WHEN 'PCOSID' THEN [ASM_AstDetails].[PCOSID] END,
     CASE @orderBy WHEN 'PCOSID DESC' THEN [ASM_AstDetails].[PCOSID] END DESC,
     CASE @orderBy WHEN 'PCOSDetails' THEN [ASM_AstDetails].[PCOSDetails] END,
     CASE @orderBy WHEN 'PCOSDetails DESC' THEN [ASM_AstDetails].[PCOSDetails] END DESC,
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
     CASE @orderBy WHEN 'ASM_AstRAMS8_RAMID' THEN [ASM_AstRAMS8].[RAMID] END,
     CASE @orderBy WHEN 'ASM_AstRAMS8_RAMID DESC' THEN [ASM_AstRAMS8].[RAMID] END DESC,
     CASE @orderBy WHEN 'ASM_AstRAMS8_Description' THEN [ASM_AstRAMS8].[Description] END,
     CASE @orderBy WHEN 'ASM_AstRAMS8_Description DESC' THEN [ASM_AstRAMS8].[Description] END DESC,
     CASE @orderBy WHEN 'ASM_AstSoftwares9_SoftwareID' THEN [ASM_AstSoftwares9].[SoftwareID] END,
     CASE @orderBy WHEN 'ASM_AstSoftwares9_SoftwareID DESC' THEN [ASM_AstSoftwares9].[SoftwareID] END DESC,
     CASE @orderBy WHEN 'ASM_AstSoftwares9_Description' THEN [ASM_AstSoftwares9].[Description] END,
     CASE @orderBy WHEN 'ASM_AstSoftwares9_Description DESC' THEN [ASM_AstSoftwares9].[Description] END DESC,
     CASE @orderBy WHEN 'ASM_AstTypes10_AssetTypeID' THEN [ASM_AstTypes10].[AssetTypeID] END,
     CASE @orderBy WHEN 'ASM_AstTypes10_AssetTypeID DESC' THEN [ASM_AstTypes10].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'ASM_AstTypes10_Description' THEN [ASM_AstTypes10].[Description] END,
     CASE @orderBy WHEN 'ASM_AstTypes10_Description DESC' THEN [ASM_AstTypes10].[Description] END DESC,
     CASE @orderBy WHEN 'ASM_AstTypes10_IssueToLocation' THEN [ASM_AstTypes10].[IssueToLocation] END,
     CASE @orderBy WHEN 'ASM_AstTypes10_IssueToLocation DESC' THEN [ASM_AstTypes10].[IssueToLocation] END DESC,
     CASE @orderBy WHEN 'ASM_Suppliers11_SupplierID' THEN [ASM_Suppliers11].[SupplierID] END,
     CASE @orderBy WHEN 'ASM_Suppliers11_SupplierID DESC' THEN [ASM_Suppliers11].[SupplierID] END DESC,
     CASE @orderBy WHEN 'ASM_Suppliers11_Description' THEN [ASM_Suppliers11].[Description] END,
     CASE @orderBy WHEN 'ASM_Suppliers11_Description DESC' THEN [ASM_Suppliers11].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees13_CardNo' THEN [HRM_Employees13].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees13_CardNo DESC' THEN [HRM_Employees13].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees13_EmployeeName' THEN [HRM_Employees13].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees13_EmployeeName DESC' THEN [HRM_Employees13].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees13_C_OfficeID' THEN [HRM_Employees13].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees13_C_OfficeID DESC' THEN [HRM_Employees13].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices18_OfficeID' THEN [HRM_Offices18].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices18_OfficeID DESC' THEN [HRM_Offices18].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices18_Description' THEN [HRM_Offices18].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices18_Description DESC' THEN [HRM_Offices18].[Description] END DESC 

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
		[ASM_AstDetails].[IssueToLocation],
		[ASM_AstDetails].[Modified],
		[ASM_AstDetails].[Keyboard],
		[ASM_AstDetails].[Mouse],
		[ASM_AstDetails].[FloppyDrive],
		[ASM_AstDetails].[CPUBrandID],
		[ASM_AstDetails].[NoOfCPUs],
		[ASM_AstDetails].[CPUDetails],
		[ASM_AstDetails].[RAMID],
		[ASM_AstDetails].[SizeOfRAM],
		[ASM_AstDetails].[HDDBrandID],
		[ASM_AstDetails].[NoOfHDD],
		[ASM_AstDetails].[SizeOfHDD],
		[ASM_AstDetails].[HDDDetails],
		[ASM_AstDetails].[CDROMBrandID],
		[ASM_AstDetails].[NoOfCDROM],
		[ASM_AstDetails].[CDROMDetails],
		[ASM_AstDetails].[VDUBrandID],
		[ASM_AstDetails].[VDUDetails],
		[ASM_AstDetails].[PCOSID],
		[ASM_AstDetails].[PCOSDetails],
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
		[ASM_AstRAMS8].[RAMID] AS ASM_AstRAMS8_RAMID,
		[ASM_AstRAMS8].[Description] AS ASM_AstRAMS8_Description,
		[ASM_AstSoftwares9].[SoftwareID] AS ASM_AstSoftwares9_SoftwareID,
		[ASM_AstSoftwares9].[Description] AS ASM_AstSoftwares9_Description,
		[ASM_AstTypes10].[AssetTypeID] AS ASM_AstTypes10_AssetTypeID,
		[ASM_AstTypes10].[Description] AS ASM_AstTypes10_Description,
		[ASM_AstTypes10].[IssueToLocation] AS ASM_AstTypes10_IssueToLocation,
		[ASM_Suppliers11].[SupplierID] AS ASM_Suppliers11_SupplierID,
		[ASM_Suppliers11].[Description] AS ASM_Suppliers11_Description,
		[HRM_Employees13].[CardNo] AS HRM_Employees13_CardNo,
		[HRM_Employees13].[EmployeeName] AS HRM_Employees13_EmployeeName,
		[HRM_Employees13].[C_OfficeID] AS HRM_Employees13_C_OfficeID,
		[HRM_Offices18].[OfficeID] AS HRM_Offices18_OfficeID,
		[HRM_Offices18].[Description] AS HRM_Offices18_Description 
  FROM [ASM_AstDetails] 
    	INNER JOIN #PageIndex
          ON [ASM_AstDetails].[MrnID] = #PageIndex.MrnID
          AND [ASM_AstDetails].[AssetID] = #PageIndex.AssetID
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands1]
    ON [ASM_AstDetails].[CPUBrandID] = [ASM_AstBrands1].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands2]
    ON [ASM_AstDetails].[CDROMBrandID] = [ASM_AstBrands2].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands3]
    ON [ASM_AstDetails].[VDUBrandID] = [ASM_AstBrands3].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands4]
    ON [ASM_AstDetails].[HDDBrandID] = [ASM_AstBrands4].[BrandID]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands5]
    ON [ASM_AstDetails].[BrandID] = [ASM_AstBrands5].[BrandID]
  LEFT OUTER JOIN [ASM_AstRAMS] AS [ASM_AstRAMS8]
    ON [ASM_AstDetails].[RAMID] = [ASM_AstRAMS8].[RAMID]
  LEFT OUTER JOIN [ASM_AstSoftwares] AS [ASM_AstSoftwares9]
    ON [ASM_AstDetails].[PCOSID] = [ASM_AstSoftwares9].[SoftwareID]
  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes10]
    ON [ASM_AstDetails].[AssetTypeID] = [ASM_AstTypes10].[AssetTypeID]
  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers11]
    ON [ASM_AstDetails].[SupplierID] = [ASM_Suppliers11].[SupplierID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees13]
    ON [ASM_AstDetails].[RecievedBy] = [HRM_Employees13].[CardNo]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices18]
    ON [ASM_AstDetails].[RecievedAt] = [HRM_Offices18].[OfficeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
