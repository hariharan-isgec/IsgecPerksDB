USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCReceiptsSelectByID]
  @MrnID Int
  AS
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
  [AST_MrnPC].[MrnID] = @MrnID
GO
