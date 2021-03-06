USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstSerialsSelectByID]
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
		[ASM_AstDetails].[BrandID],
		[ASM_AstDetails].[ModelNo],
		[ASM_AstDetails].[RecievedAt],
		[ASM_AstDetails].[RecievedOn],
		[ASM_AstDetails].[Remarks],
		[ASM_AstDetails].[AssetNo],
		[ASM_AstDetails].[AssetSerialNo],
		[ASM_AstDetails].[Modified],
		[ASM_AstDetails].[ModifiedOn],
		[ASM_AstDetails].[ModifiedBy],
		[ASM_AstDetails].[CPUSerialNo],
		[ASM_AstDetails].[HDDSerialNo],
		[ASM_AstDetails].[CDROMSerialNo],
		[ASM_AstDetails].[VDUSerialNo],
		[ASM_AstDetails].[PCOSID],
		[ASM_AstDetails].[PCOSSerialNo],
		[ASM_AstBrands5].[BrandID] AS ASM_AstBrands5_BrandID,
		[ASM_AstBrands5].[Description] AS ASM_AstBrands5_Description,
		[ASM_AstSoftwares9].[SoftwareID] AS ASM_AstSoftwares9_SoftwareID,
		[ASM_AstSoftwares9].[Description] AS ASM_AstSoftwares9_Description,
		[ASM_AstTypes10].[AssetTypeID] AS ASM_AstTypes10_AssetTypeID,
		[ASM_AstTypes10].[Description] AS ASM_AstTypes10_Description,
		[ASM_AstTypes10].[IssueToLocation] AS ASM_AstTypes10_IssueToLocation,
		[ASM_Suppliers11].[SupplierID] AS ASM_Suppliers11_SupplierID,
		[ASM_Suppliers11].[Description] AS ASM_Suppliers11_Description,
		[HRM_Offices18].[OfficeID] AS HRM_Offices18_OfficeID,
		[HRM_Offices18].[Description] AS HRM_Offices18_Description 
  FROM [ASM_AstDetails] 
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands5]
    ON [ASM_AstDetails].[BrandID] = [ASM_AstBrands5].[BrandID]
  LEFT OUTER JOIN [ASM_AstSoftwares] AS [ASM_AstSoftwares9]
    ON [ASM_AstDetails].[PCOSID] = [ASM_AstSoftwares9].[SoftwareID]
  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes10]
    ON [ASM_AstDetails].[AssetTypeID] = [ASM_AstTypes10].[AssetTypeID]
  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers11]
    ON [ASM_AstDetails].[SupplierID] = [ASM_Suppliers11].[SupplierID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices18]
    ON [ASM_AstDetails].[RecievedAt] = [HRM_Offices18].[OfficeID]
  WHERE
  [ASM_AstDetails].[MrnID] = @MrnID
  AND [ASM_AstDetails].[AssetID] = @AssetID
GO
