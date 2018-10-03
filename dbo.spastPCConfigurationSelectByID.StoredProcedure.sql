USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCConfigurationSelectByID]
  @pcID Int
  AS
  SELECT
		[AST_PCDetails].[pcID],
		[AST_PCDetails].[MrnID],
		[AST_PCDetails].[SerialNo],
		[AST_PCDetails].[AssetNo],
		[AST_PCDetails].[IPAddress],
		[AST_PCDetails].[LocationID],
		[AST_PCDetails].[pcUser],
		[AST_PCDetails].[UserID],
		[AST_PCDetails].[pcBrandID],
		[AST_PCDetails].[ModelNo],
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
		[AST_PCDetails].[HostName],
		[AST_PCDetails].[INDomain],
		[AST_PCDetails].[DomainName],
		[AST_PCDetails].[MapDrive],
		[AST_PCDetails].[PenDriveDisabled],
		[AST_PCDetails].[CDRomDisabled],
		[AST_PCDetails].[InternetAccess],
		[AST_PCDetails].[Keyboard],
		[AST_PCDetails].[Mouse],
		[AST_PCDetails].[FloppyDrive],
		[AST_PCDetails].[Remarks],
		[AST_PCDetails].[Discarded],
		[AST_PCDetails].[ModifiedBy],
		[AST_PCDetails].[ModifiedOn],
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
		[AST_Locations2].[LocationID] AS AST_Locations2_LocationID,
		[AST_Locations2].[Descriptions] AS AST_Locations2_Descriptions,
		[PRK_Employees3].[EmployeeID] AS PRK_Employees3_EmployeeID,
		[PRK_Employees3].[CardNo] AS PRK_Employees3_CardNo,
		[PRK_Employees3].[EmployeeName] AS PRK_Employees3_EmployeeName,
		[PRK_Employees3].[PostedAt] AS PRK_Employees3_PostedAt,
		[PRK_Employees3].[Department] AS PRK_Employees3_Department,
		[PRK_Employees3].[Company] AS PRK_Employees3_Company,
		[AST_Brands4].[BrandID] AS AST_Brands4_BrandID,
		[AST_Brands4].[Description] AS AST_Brands4_Description,
		[AST_Brands5].[BrandID] AS AST_Brands5_BrandID,
		[AST_Brands5].[Description] AS AST_Brands5_Description,
		[AST_Rams6].[RamID] AS AST_Rams6_RamID,
		[AST_Rams6].[Description] AS AST_Rams6_Description,
		[AST_Brands7].[BrandID] AS AST_Brands7_BrandID,
		[AST_Brands7].[Description] AS AST_Brands7_Description,
		[AST_Softwares8].[SoftwareID] AS AST_Softwares8_SoftwareID,
		[AST_Softwares8].[Description] AS AST_Softwares8_Description,
		[PRK_Employees9].[EmployeeID] AS PRK_Employees9_EmployeeID,
		[PRK_Employees9].[CardNo] AS PRK_Employees9_CardNo,
		[PRK_Employees9].[EmployeeName] AS PRK_Employees9_EmployeeName,
		[PRK_Employees9].[PostedAt] AS PRK_Employees9_PostedAt,
		[PRK_Employees9].[Department] AS PRK_Employees9_Department,
		[PRK_Employees9].[Company] AS PRK_Employees9_Company 
  FROM [AST_PCDetails] 
  LEFT OUTER JOIN [AST_MrnPC] AS [AST_MrnPC1]
    ON [AST_PCDetails].[MrnID] = [AST_MrnPC1].[MrnID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations2]
    ON [AST_PCDetails].[LocationID] = [AST_Locations2].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]
    ON [AST_PCDetails].[UserID] = [PRK_Employees3].[EmployeeID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]
    ON [AST_PCDetails].[pcBrandID] = [AST_Brands4].[BrandID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands5]
    ON [AST_PCDetails].[cpuBrandID] = [AST_Brands5].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams6]
    ON [AST_PCDetails].[RamID] = [AST_Rams6].[RamID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands7]
    ON [AST_PCDetails].[vduBrandID] = [AST_Brands7].[BrandID]
  LEFT OUTER JOIN [AST_Softwares] AS [AST_Softwares8]
    ON [AST_PCDetails].[pcOSID] = [AST_Softwares8].[SoftwareID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees9]
    ON [AST_PCDetails].[ModifiedBy] = [PRK_Employees9].[EmployeeID]
  WHERE
  [AST_PCDetails].[pcID] = @pcID
GO
