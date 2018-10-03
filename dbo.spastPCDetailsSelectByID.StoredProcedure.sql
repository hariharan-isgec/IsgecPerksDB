USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCDetailsSelectByID]
  @pcID Int
  AS
  SELECT
		[AST_PCDetails].[pcID],
		[AST_PCDetails].[pcBrandID],
		[AST_PCDetails].[ModelNo],
		[AST_PCDetails].[SerialNo],
		[AST_PCDetails].[NoOfCPUs],
		[AST_PCDetails].[cpuBrandID],
		[AST_PCDetails].[CPUModel],
		[AST_PCDetails].[RamID],
		[AST_PCDetails].[NoOfHDDs],
		[AST_PCDetails].[TotalHDDGB],
		[AST_PCDetails].[HDDDetails],
		[AST_PCDetails].[NoOfCDROMs],
		[AST_PCDetails].[CDRomDetails],
		[AST_PCDetails].[vduBrandID],
		[AST_PCDetails].[vduSerialNo],
		[AST_PCDetails].[pcOSID],
		[AST_PCDetails].[pcOSDetails],
		[AST_PCDetails].[IPAddress],
		[AST_PCDetails].[HostName],
		[AST_PCDetails].[INDomain],
		[AST_PCDetails].[DomainName],
		[AST_PCDetails].[pcUser],
		[AST_PCDetails].[UserID],
		[AST_PCDetails].[MrnID],
		[AST_PCDetails].[AssetNo],
		[AST_PCDetails].[LocationID],
		[AST_PCDetails].[MapDrive],
		[AST_PCDetails].[PenDriveDisabled],
		[AST_PCDetails].[CDRomDisabled],
		[AST_PCDetails].[InternetAccess],
		[AST_PCDetails].[Keyboard],
		[AST_PCDetails].[Mouse],
		[AST_PCDetails].[FloppyDrive],
		[AST_PCDetails].[Remarks],
		[AST_PCDetails].[Issued],
		[AST_PCDetails].[Discarded],
		[AST_PCDetails].[ModifiedBy],
		[AST_PCDetails].[ModifiedOn],
		[AST_Brands1].[BrandID] AS AST_Brands1_BrandID,
		[AST_Brands1].[Description] AS AST_Brands1_Description,
		[AST_Brands2].[BrandID] AS AST_Brands2_BrandID,
		[AST_Brands2].[Description] AS AST_Brands2_Description,
		[AST_Rams3].[RamID] AS AST_Rams3_RamID,
		[AST_Rams3].[Description] AS AST_Rams3_Description,
		[AST_Brands4].[BrandID] AS AST_Brands4_BrandID,
		[AST_Brands4].[Description] AS AST_Brands4_Description,
		[AST_Softwares5].[SoftwareID] AS AST_Softwares5_SoftwareID,
		[AST_Softwares5].[Description] AS AST_Softwares5_Description,
		[PRK_Employees6].[EmployeeID] AS PRK_Employees6_EmployeeID,
		[PRK_Employees6].[CardNo] AS PRK_Employees6_CardNo,
		[PRK_Employees6].[EmployeeName] AS PRK_Employees6_EmployeeName,
		[PRK_Employees6].[PostedAt] AS PRK_Employees6_PostedAt,
		[PRK_Employees6].[Department] AS PRK_Employees6_Department,
		[PRK_Employees6].[Company] AS PRK_Employees6_Company,
		[AST_MrnPC7].[MrnID] AS AST_MrnPC7_MrnID,
		[AST_MrnPC7].[MrnDate] AS AST_MrnPC7_MrnDate,
		[AST_MrnPC7].[MrnDescription] AS AST_MrnPC7_MrnDescription,
		[AST_MrnPC7].[DateOfPurchase] AS AST_MrnPC7_DateOfPurchase,
		[AST_MrnPC7].[WarrantyTill] AS AST_MrnPC7_WarrantyTill,
		[AST_MrnPC7].[InsuranceTill] AS AST_MrnPC7_InsuranceTill,
		[AST_MrnPC7].[SupplierID] AS AST_MrnPC7_SupplierID,
		[AST_MrnPC7].[Keyboard] AS AST_MrnPC7_Keyboard,
		[AST_MrnPC7].[Mouse] AS AST_MrnPC7_Mouse,
		[AST_MrnPC7].[FloppyDrive] AS AST_MrnPC7_FloppyDrive,
		[AST_MrnPC7].[PurchasedQuantity] AS AST_MrnPC7_PurchasedQuantity,
		[AST_MrnPC7].[IssuedQuantity] AS AST_MrnPC7_IssuedQuantity,
		[AST_MrnPC7].[WriteoffQuantity] AS AST_MrnPC7_WriteoffQuantity,
		[AST_MrnPC7].[pcBrandID] AS AST_MrnPC7_pcBrandID,
		[AST_MrnPC7].[NoOfCPUs] AS AST_MrnPC7_NoOfCPUs,
		[AST_MrnPC7].[cpuBrandID] AS AST_MrnPC7_cpuBrandID,
		[AST_MrnPC7].[CPUModel] AS AST_MrnPC7_CPUModel,
		[AST_MrnPC7].[RamID] AS AST_MrnPC7_RamID,
		[AST_MrnPC7].[NoOfHDDs] AS AST_MrnPC7_NoOfHDDs,
		[AST_MrnPC7].[TotalHDDGB] AS AST_MrnPC7_TotalHDDGB,
		[AST_MrnPC7].[HDDDetails] AS AST_MrnPC7_HDDDetails,
		[AST_MrnPC7].[NoOfCDROMs] AS AST_MrnPC7_NoOfCDROMs,
		[AST_MrnPC7].[CDRomDetails] AS AST_MrnPC7_CDRomDetails,
		[AST_MrnPC7].[vduBrandID] AS AST_MrnPC7_vduBrandID,
		[AST_MrnPC7].[pcOSID] AS AST_MrnPC7_pcOSID,
		[AST_MrnPC7].[pcOSDetails] AS AST_MrnPC7_pcOSDetails,
		[AST_MrnPC7].[Remarks] AS AST_MrnPC7_Remarks,
		[AST_Locations8].[LocationID] AS AST_Locations8_LocationID,
		[AST_Locations8].[Descriptions] AS AST_Locations8_Descriptions,
		[PRK_Employees9].[EmployeeID] AS PRK_Employees9_EmployeeID,
		[PRK_Employees9].[CardNo] AS PRK_Employees9_CardNo,
		[PRK_Employees9].[EmployeeName] AS PRK_Employees9_EmployeeName,
		[PRK_Employees9].[PostedAt] AS PRK_Employees9_PostedAt,
		[PRK_Employees9].[Department] AS PRK_Employees9_Department,
		[PRK_Employees9].[Company] AS PRK_Employees9_Company 
  FROM [AST_PCDetails] 
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands1]
    ON [AST_PCDetails].[pcBrandID] = [AST_Brands1].[BrandID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands2]
    ON [AST_PCDetails].[cpuBrandID] = [AST_Brands2].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams3]
    ON [AST_PCDetails].[RamID] = [AST_Rams3].[RamID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]
    ON [AST_PCDetails].[vduBrandID] = [AST_Brands4].[BrandID]
  LEFT OUTER JOIN [AST_Softwares] AS [AST_Softwares5]
    ON [AST_PCDetails].[pcOSID] = [AST_Softwares5].[SoftwareID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees6]
    ON [AST_PCDetails].[UserID] = [PRK_Employees6].[EmployeeID]
  LEFT OUTER JOIN [AST_MrnPC] AS [AST_MrnPC7]
    ON [AST_PCDetails].[MrnID] = [AST_MrnPC7].[MrnID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations8]
    ON [AST_PCDetails].[LocationID] = [AST_Locations8].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees9]
    ON [AST_PCDetails].[ModifiedBy] = [PRK_Employees9].[EmployeeID]
  WHERE
  [AST_PCDetails].[pcID] = @pcID
GO
