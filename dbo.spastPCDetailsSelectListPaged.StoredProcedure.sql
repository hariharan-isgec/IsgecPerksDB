USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCDetailsSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  pcID Int NOT NULL
  )
  INSERT INTO #PageIndex (pcID)
  SELECT [AST_PCDetails].[pcID] FROM [AST_PCDetails]
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
  ORDER BY
     CASE @orderBy WHEN 'pcID' THEN [AST_PCDetails].[pcID] END,
     CASE @orderBy WHEN 'pcID DESC' THEN [AST_PCDetails].[pcID] END DESC,
     CASE @orderBy WHEN 'pcBrandID' THEN [AST_PCDetails].[pcBrandID] END,
     CASE @orderBy WHEN 'pcBrandID DESC' THEN [AST_PCDetails].[pcBrandID] END DESC,
     CASE @orderBy WHEN 'ModelNo' THEN [AST_PCDetails].[ModelNo] END,
     CASE @orderBy WHEN 'ModelNo DESC' THEN [AST_PCDetails].[ModelNo] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [AST_PCDetails].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [AST_PCDetails].[SerialNo] END DESC,
     CASE @orderBy WHEN 'NoOfCPUs' THEN [AST_PCDetails].[NoOfCPUs] END,
     CASE @orderBy WHEN 'NoOfCPUs DESC' THEN [AST_PCDetails].[NoOfCPUs] END DESC,
     CASE @orderBy WHEN 'cpuBrandID' THEN [AST_PCDetails].[cpuBrandID] END,
     CASE @orderBy WHEN 'cpuBrandID DESC' THEN [AST_PCDetails].[cpuBrandID] END DESC,
     CASE @orderBy WHEN 'CPUModel' THEN [AST_PCDetails].[CPUModel] END,
     CASE @orderBy WHEN 'CPUModel DESC' THEN [AST_PCDetails].[CPUModel] END DESC,
     CASE @orderBy WHEN 'RamID' THEN [AST_PCDetails].[RamID] END,
     CASE @orderBy WHEN 'RamID DESC' THEN [AST_PCDetails].[RamID] END DESC,
     CASE @orderBy WHEN 'NoOfHDDs' THEN [AST_PCDetails].[NoOfHDDs] END,
     CASE @orderBy WHEN 'NoOfHDDs DESC' THEN [AST_PCDetails].[NoOfHDDs] END DESC,
     CASE @orderBy WHEN 'TotalHDDGB' THEN [AST_PCDetails].[TotalHDDGB] END,
     CASE @orderBy WHEN 'TotalHDDGB DESC' THEN [AST_PCDetails].[TotalHDDGB] END DESC,
     CASE @orderBy WHEN 'HDDDetails' THEN [AST_PCDetails].[HDDDetails] END,
     CASE @orderBy WHEN 'HDDDetails DESC' THEN [AST_PCDetails].[HDDDetails] END DESC,
     CASE @orderBy WHEN 'NoOfCDROMs' THEN [AST_PCDetails].[NoOfCDROMs] END,
     CASE @orderBy WHEN 'NoOfCDROMs DESC' THEN [AST_PCDetails].[NoOfCDROMs] END DESC,
     CASE @orderBy WHEN 'CDRomDetails' THEN [AST_PCDetails].[CDRomDetails] END,
     CASE @orderBy WHEN 'CDRomDetails DESC' THEN [AST_PCDetails].[CDRomDetails] END DESC,
     CASE @orderBy WHEN 'vduBrandID' THEN [AST_PCDetails].[vduBrandID] END,
     CASE @orderBy WHEN 'vduBrandID DESC' THEN [AST_PCDetails].[vduBrandID] END DESC,
     CASE @orderBy WHEN 'vduSerialNo' THEN [AST_PCDetails].[vduSerialNo] END,
     CASE @orderBy WHEN 'vduSerialNo DESC' THEN [AST_PCDetails].[vduSerialNo] END DESC,
     CASE @orderBy WHEN 'pcOSID' THEN [AST_PCDetails].[pcOSID] END,
     CASE @orderBy WHEN 'pcOSID DESC' THEN [AST_PCDetails].[pcOSID] END DESC,
     CASE @orderBy WHEN 'pcOSDetails' THEN [AST_PCDetails].[pcOSDetails] END,
     CASE @orderBy WHEN 'pcOSDetails DESC' THEN [AST_PCDetails].[pcOSDetails] END DESC,
     CASE @orderBy WHEN 'IPAddress' THEN [AST_PCDetails].[IPAddress] END,
     CASE @orderBy WHEN 'IPAddress DESC' THEN [AST_PCDetails].[IPAddress] END DESC,
     CASE @orderBy WHEN 'HostName' THEN [AST_PCDetails].[HostName] END,
     CASE @orderBy WHEN 'HostName DESC' THEN [AST_PCDetails].[HostName] END DESC,
     CASE @orderBy WHEN 'INDomain' THEN [AST_PCDetails].[INDomain] END,
     CASE @orderBy WHEN 'INDomain DESC' THEN [AST_PCDetails].[INDomain] END DESC,
     CASE @orderBy WHEN 'DomainName' THEN [AST_PCDetails].[DomainName] END,
     CASE @orderBy WHEN 'DomainName DESC' THEN [AST_PCDetails].[DomainName] END DESC,
     CASE @orderBy WHEN 'pcUser' THEN [AST_PCDetails].[pcUser] END,
     CASE @orderBy WHEN 'pcUser DESC' THEN [AST_PCDetails].[pcUser] END DESC,
     CASE @orderBy WHEN 'UserID' THEN [AST_PCDetails].[UserID] END,
     CASE @orderBy WHEN 'UserID DESC' THEN [AST_PCDetails].[UserID] END DESC,
     CASE @orderBy WHEN 'MrnID' THEN [AST_PCDetails].[MrnID] END,
     CASE @orderBy WHEN 'MrnID DESC' THEN [AST_PCDetails].[MrnID] END DESC,
     CASE @orderBy WHEN 'AssetNo' THEN [AST_PCDetails].[AssetNo] END,
     CASE @orderBy WHEN 'AssetNo DESC' THEN [AST_PCDetails].[AssetNo] END DESC,
     CASE @orderBy WHEN 'LocationID' THEN [AST_PCDetails].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [AST_PCDetails].[LocationID] END DESC,
     CASE @orderBy WHEN 'MapDrive' THEN [AST_PCDetails].[MapDrive] END,
     CASE @orderBy WHEN 'MapDrive DESC' THEN [AST_PCDetails].[MapDrive] END DESC,
     CASE @orderBy WHEN 'PenDriveDisabled' THEN [AST_PCDetails].[PenDriveDisabled] END,
     CASE @orderBy WHEN 'PenDriveDisabled DESC' THEN [AST_PCDetails].[PenDriveDisabled] END DESC,
     CASE @orderBy WHEN 'CDRomDisabled' THEN [AST_PCDetails].[CDRomDisabled] END,
     CASE @orderBy WHEN 'CDRomDisabled DESC' THEN [AST_PCDetails].[CDRomDisabled] END DESC,
     CASE @orderBy WHEN 'InternetAccess' THEN [AST_PCDetails].[InternetAccess] END,
     CASE @orderBy WHEN 'InternetAccess DESC' THEN [AST_PCDetails].[InternetAccess] END DESC,
     CASE @orderBy WHEN 'Keyboard' THEN [AST_PCDetails].[Keyboard] END,
     CASE @orderBy WHEN 'Keyboard DESC' THEN [AST_PCDetails].[Keyboard] END DESC,
     CASE @orderBy WHEN 'Mouse' THEN [AST_PCDetails].[Mouse] END,
     CASE @orderBy WHEN 'Mouse DESC' THEN [AST_PCDetails].[Mouse] END DESC,
     CASE @orderBy WHEN 'FloppyDrive' THEN [AST_PCDetails].[FloppyDrive] END,
     CASE @orderBy WHEN 'FloppyDrive DESC' THEN [AST_PCDetails].[FloppyDrive] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [AST_PCDetails].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [AST_PCDetails].[Remarks] END DESC,
     CASE @orderBy WHEN 'Issued' THEN [AST_PCDetails].[Issued] END,
     CASE @orderBy WHEN 'Issued DESC' THEN [AST_PCDetails].[Issued] END DESC,
     CASE @orderBy WHEN 'Discarded' THEN [AST_PCDetails].[Discarded] END,
     CASE @orderBy WHEN 'Discarded DESC' THEN [AST_PCDetails].[Discarded] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [AST_PCDetails].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [AST_PCDetails].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [AST_PCDetails].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [AST_PCDetails].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'AST_Brands1_BrandID' THEN [AST_Brands1].[BrandID] END,
     CASE @orderBy WHEN 'AST_Brands1_BrandID DESC' THEN [AST_Brands1].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_Brands1_Description' THEN [AST_Brands1].[Description] END,
     CASE @orderBy WHEN 'AST_Brands1_Description DESC' THEN [AST_Brands1].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Brands2_BrandID' THEN [AST_Brands2].[BrandID] END,
     CASE @orderBy WHEN 'AST_Brands2_BrandID DESC' THEN [AST_Brands2].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_Brands2_Description' THEN [AST_Brands2].[Description] END,
     CASE @orderBy WHEN 'AST_Brands2_Description DESC' THEN [AST_Brands2].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Rams3_RamID' THEN [AST_Rams3].[RamID] END,
     CASE @orderBy WHEN 'AST_Rams3_RamID DESC' THEN [AST_Rams3].[RamID] END DESC,
     CASE @orderBy WHEN 'AST_Rams3_Description' THEN [AST_Rams3].[Description] END,
     CASE @orderBy WHEN 'AST_Rams3_Description DESC' THEN [AST_Rams3].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Brands4_BrandID' THEN [AST_Brands4].[BrandID] END,
     CASE @orderBy WHEN 'AST_Brands4_BrandID DESC' THEN [AST_Brands4].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_Brands4_Description' THEN [AST_Brands4].[Description] END,
     CASE @orderBy WHEN 'AST_Brands4_Description DESC' THEN [AST_Brands4].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Softwares5_SoftwareID' THEN [AST_Softwares5].[SoftwareID] END,
     CASE @orderBy WHEN 'AST_Softwares5_SoftwareID DESC' THEN [AST_Softwares5].[SoftwareID] END DESC,
     CASE @orderBy WHEN 'AST_Softwares5_Description' THEN [AST_Softwares5].[Description] END,
     CASE @orderBy WHEN 'AST_Softwares5_Description DESC' THEN [AST_Softwares5].[Description] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_EmployeeID' THEN [PRK_Employees6].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees6_EmployeeID DESC' THEN [PRK_Employees6].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_CardNo' THEN [PRK_Employees6].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees6_CardNo DESC' THEN [PRK_Employees6].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_EmployeeName' THEN [PRK_Employees6].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees6_EmployeeName DESC' THEN [PRK_Employees6].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_PostedAt' THEN [PRK_Employees6].[PostedAt] END,
     CASE @orderBy WHEN 'PRK_Employees6_PostedAt DESC' THEN [PRK_Employees6].[PostedAt] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_Department' THEN [PRK_Employees6].[Department] END,
     CASE @orderBy WHEN 'PRK_Employees6_Department DESC' THEN [PRK_Employees6].[Department] END DESC,
     CASE @orderBy WHEN 'PRK_Employees6_Company' THEN [PRK_Employees6].[Company] END,
     CASE @orderBy WHEN 'PRK_Employees6_Company DESC' THEN [PRK_Employees6].[Company] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_MrnID' THEN [AST_MrnPC7].[MrnID] END,
     CASE @orderBy WHEN 'AST_MrnPC7_MrnID DESC' THEN [AST_MrnPC7].[MrnID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_MrnDate' THEN [AST_MrnPC7].[MrnDate] END,
     CASE @orderBy WHEN 'AST_MrnPC7_MrnDate DESC' THEN [AST_MrnPC7].[MrnDate] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_MrnDescription' THEN [AST_MrnPC7].[MrnDescription] END,
     CASE @orderBy WHEN 'AST_MrnPC7_MrnDescription DESC' THEN [AST_MrnPC7].[MrnDescription] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_DateOfPurchase' THEN [AST_MrnPC7].[DateOfPurchase] END,
     CASE @orderBy WHEN 'AST_MrnPC7_DateOfPurchase DESC' THEN [AST_MrnPC7].[DateOfPurchase] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_WarrantyTill' THEN [AST_MrnPC7].[WarrantyTill] END,
     CASE @orderBy WHEN 'AST_MrnPC7_WarrantyTill DESC' THEN [AST_MrnPC7].[WarrantyTill] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_InsuranceTill' THEN [AST_MrnPC7].[InsuranceTill] END,
     CASE @orderBy WHEN 'AST_MrnPC7_InsuranceTill DESC' THEN [AST_MrnPC7].[InsuranceTill] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_SupplierID' THEN [AST_MrnPC7].[SupplierID] END,
     CASE @orderBy WHEN 'AST_MrnPC7_SupplierID DESC' THEN [AST_MrnPC7].[SupplierID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_Keyboard' THEN [AST_MrnPC7].[Keyboard] END,
     CASE @orderBy WHEN 'AST_MrnPC7_Keyboard DESC' THEN [AST_MrnPC7].[Keyboard] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_Mouse' THEN [AST_MrnPC7].[Mouse] END,
     CASE @orderBy WHEN 'AST_MrnPC7_Mouse DESC' THEN [AST_MrnPC7].[Mouse] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_FloppyDrive' THEN [AST_MrnPC7].[FloppyDrive] END,
     CASE @orderBy WHEN 'AST_MrnPC7_FloppyDrive DESC' THEN [AST_MrnPC7].[FloppyDrive] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_PurchasedQuantity' THEN [AST_MrnPC7].[PurchasedQuantity] END,
     CASE @orderBy WHEN 'AST_MrnPC7_PurchasedQuantity DESC' THEN [AST_MrnPC7].[PurchasedQuantity] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_IssuedQuantity' THEN [AST_MrnPC7].[IssuedQuantity] END,
     CASE @orderBy WHEN 'AST_MrnPC7_IssuedQuantity DESC' THEN [AST_MrnPC7].[IssuedQuantity] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_WriteoffQuantity' THEN [AST_MrnPC7].[WriteoffQuantity] END,
     CASE @orderBy WHEN 'AST_MrnPC7_WriteoffQuantity DESC' THEN [AST_MrnPC7].[WriteoffQuantity] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_pcBrandID' THEN [AST_MrnPC7].[pcBrandID] END,
     CASE @orderBy WHEN 'AST_MrnPC7_pcBrandID DESC' THEN [AST_MrnPC7].[pcBrandID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_NoOfCPUs' THEN [AST_MrnPC7].[NoOfCPUs] END,
     CASE @orderBy WHEN 'AST_MrnPC7_NoOfCPUs DESC' THEN [AST_MrnPC7].[NoOfCPUs] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_cpuBrandID' THEN [AST_MrnPC7].[cpuBrandID] END,
     CASE @orderBy WHEN 'AST_MrnPC7_cpuBrandID DESC' THEN [AST_MrnPC7].[cpuBrandID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_CPUModel' THEN [AST_MrnPC7].[CPUModel] END,
     CASE @orderBy WHEN 'AST_MrnPC7_CPUModel DESC' THEN [AST_MrnPC7].[CPUModel] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_RamID' THEN [AST_MrnPC7].[RamID] END,
     CASE @orderBy WHEN 'AST_MrnPC7_RamID DESC' THEN [AST_MrnPC7].[RamID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_NoOfHDDs' THEN [AST_MrnPC7].[NoOfHDDs] END,
     CASE @orderBy WHEN 'AST_MrnPC7_NoOfHDDs DESC' THEN [AST_MrnPC7].[NoOfHDDs] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_TotalHDDGB' THEN [AST_MrnPC7].[TotalHDDGB] END,
     CASE @orderBy WHEN 'AST_MrnPC7_TotalHDDGB DESC' THEN [AST_MrnPC7].[TotalHDDGB] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_HDDDetails' THEN [AST_MrnPC7].[HDDDetails] END,
     CASE @orderBy WHEN 'AST_MrnPC7_HDDDetails DESC' THEN [AST_MrnPC7].[HDDDetails] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_NoOfCDROMs' THEN [AST_MrnPC7].[NoOfCDROMs] END,
     CASE @orderBy WHEN 'AST_MrnPC7_NoOfCDROMs DESC' THEN [AST_MrnPC7].[NoOfCDROMs] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_CDRomDetails' THEN [AST_MrnPC7].[CDRomDetails] END,
     CASE @orderBy WHEN 'AST_MrnPC7_CDRomDetails DESC' THEN [AST_MrnPC7].[CDRomDetails] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_vduBrandID' THEN [AST_MrnPC7].[vduBrandID] END,
     CASE @orderBy WHEN 'AST_MrnPC7_vduBrandID DESC' THEN [AST_MrnPC7].[vduBrandID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_pcOSID' THEN [AST_MrnPC7].[pcOSID] END,
     CASE @orderBy WHEN 'AST_MrnPC7_pcOSID DESC' THEN [AST_MrnPC7].[pcOSID] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_pcOSDetails' THEN [AST_MrnPC7].[pcOSDetails] END,
     CASE @orderBy WHEN 'AST_MrnPC7_pcOSDetails DESC' THEN [AST_MrnPC7].[pcOSDetails] END DESC,
     CASE @orderBy WHEN 'AST_MrnPC7_Remarks' THEN [AST_MrnPC7].[Remarks] END,
     CASE @orderBy WHEN 'AST_MrnPC7_Remarks DESC' THEN [AST_MrnPC7].[Remarks] END DESC,
     CASE @orderBy WHEN 'AST_Locations8_LocationID' THEN [AST_Locations8].[LocationID] END,
     CASE @orderBy WHEN 'AST_Locations8_LocationID DESC' THEN [AST_Locations8].[LocationID] END DESC,
     CASE @orderBy WHEN 'AST_Locations8_Descriptions' THEN [AST_Locations8].[Descriptions] END,
     CASE @orderBy WHEN 'AST_Locations8_Descriptions DESC' THEN [AST_Locations8].[Descriptions] END DESC,
     CASE @orderBy WHEN 'PRK_Employees9_EmployeeID' THEN [PRK_Employees9].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees9_EmployeeID DESC' THEN [PRK_Employees9].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees9_CardNo' THEN [PRK_Employees9].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees9_CardNo DESC' THEN [PRK_Employees9].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees9_EmployeeName' THEN [PRK_Employees9].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees9_EmployeeName DESC' THEN [PRK_Employees9].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Employees9_PostedAt' THEN [PRK_Employees9].[PostedAt] END,
     CASE @orderBy WHEN 'PRK_Employees9_PostedAt DESC' THEN [PRK_Employees9].[PostedAt] END DESC,
     CASE @orderBy WHEN 'PRK_Employees9_Department' THEN [PRK_Employees9].[Department] END,
     CASE @orderBy WHEN 'PRK_Employees9_Department DESC' THEN [PRK_Employees9].[Department] END DESC,
     CASE @orderBy WHEN 'PRK_Employees9_Company' THEN [PRK_Employees9].[Company] END,
     CASE @orderBy WHEN 'PRK_Employees9_Company DESC' THEN [PRK_Employees9].[Company] END DESC 

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [AST_PCDetails].[pcID] = #PageIndex.pcID
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
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
