USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstHeaderSelectByID]
  @MrnID Int 
  AS
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
  [ASM_AstHeader].[MrnID] = @MrnID
GO
