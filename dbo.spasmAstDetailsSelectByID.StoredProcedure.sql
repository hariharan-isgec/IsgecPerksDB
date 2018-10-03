USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstDetailsSelectByID]
  @MrnID Int,
  @AssetID Int 
  AS
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
  [ASM_AstDetails].[MrnID] = @MrnID
  AND [ASM_AstDetails].[AssetID] = @AssetID
GO
