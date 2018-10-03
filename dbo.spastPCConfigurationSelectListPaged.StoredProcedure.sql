USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCConfigurationSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @Discarded Bit,
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
  WHERE [AST_PCDetails].[Discarded] = @Discarded
  ORDER BY
     CASE @orderBy WHEN 'pcID' THEN [AST_PCDetails].[pcID] END,
     CASE @orderBy WHEN 'pcID DESC' THEN [AST_PCDetails].[pcID] END DESC,
     CASE @orderBy WHEN 'MrnID' THEN [AST_PCDetails].[MrnID] END,
     CASE @orderBy WHEN 'MrnID DESC' THEN [AST_PCDetails].[MrnID] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [AST_PCDetails].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [AST_PCDetails].[SerialNo] END DESC,
     CASE @orderBy WHEN 'AssetNo' THEN [AST_PCDetails].[AssetNo] END,
     CASE @orderBy WHEN 'AssetNo DESC' THEN [AST_PCDetails].[AssetNo] END DESC,
     CASE @orderBy WHEN 'IPAddress' THEN [AST_PCDetails].[IPAddress] END,
     CASE @orderBy WHEN 'IPAddress DESC' THEN [AST_PCDetails].[IPAddress] END DESC,
     CASE @orderBy WHEN 'LocationID' THEN [AST_PCDetails].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [AST_PCDetails].[LocationID] END DESC,
     CASE @orderBy WHEN 'pcUser' THEN [AST_PCDetails].[pcUser] END,
     CASE @orderBy WHEN 'pcUser DESC' THEN [AST_PCDetails].[pcUser] END DESC,
     CASE @orderBy WHEN 'UserID' THEN [AST_PCDetails].[UserID] END,
     CASE @orderBy WHEN 'UserID DESC' THEN [AST_PCDetails].[UserID] END DESC,
     CASE @orderBy WHEN 'pcBrandID' THEN [AST_PCDetails].[pcBrandID] END,
     CASE @orderBy WHEN 'pcBrandID DESC' THEN [AST_PCDetails].[pcBrandID] END DESC,
     CASE @orderBy WHEN 'ModelNo' THEN [AST_PCDetails].[ModelNo] END,
     CASE @orderBy WHEN 'ModelNo DESC' THEN [AST_PCDetails].[ModelNo] END DESC,
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
     CASE @orderBy WHEN 'HostName' THEN [AST_PCDetails].[HostName] END,
     CASE @orderBy WHEN 'HostName DESC' THEN [AST_PCDetails].[HostName] END DESC,
     CASE @orderBy WHEN 'INDomain' THEN [AST_PCDetails].[INDomain] END,
     CASE @orderBy WHEN 'INDomain DESC' THEN [AST_PCDetails].[INDomain] END DESC,
     CASE @orderBy WHEN 'DomainName' THEN [AST_PCDetails].[DomainName] END,
     CASE @orderBy WHEN 'DomainName DESC' THEN [AST_PCDetails].[DomainName] END DESC,
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
     CASE @orderBy WHEN 'Discarded' THEN [AST_PCDetails].[Discarded] END,
     CASE @orderBy WHEN 'Discarded DESC' THEN [AST_PCDetails].[Discarded] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [AST_PCDetails].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [AST_PCDetails].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [AST_PCDetails].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [AST_PCDetails].[ModifiedOn] END DESC,
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
     CASE @orderBy WHEN 'AST_Locations2_LocationID' THEN [AST_Locations2].[LocationID] END,
     CASE @orderBy WHEN 'AST_Locations2_LocationID DESC' THEN [AST_Locations2].[LocationID] END DESC,
     CASE @orderBy WHEN 'AST_Locations2_Descriptions' THEN [AST_Locations2].[Descriptions] END,
     CASE @orderBy WHEN 'AST_Locations2_Descriptions DESC' THEN [AST_Locations2].[Descriptions] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_EmployeeID' THEN [PRK_Employees3].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees3_EmployeeID DESC' THEN [PRK_Employees3].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_CardNo' THEN [PRK_Employees3].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees3_CardNo DESC' THEN [PRK_Employees3].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_EmployeeName' THEN [PRK_Employees3].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees3_EmployeeName DESC' THEN [PRK_Employees3].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_PostedAt' THEN [PRK_Employees3].[PostedAt] END,
     CASE @orderBy WHEN 'PRK_Employees3_PostedAt DESC' THEN [PRK_Employees3].[PostedAt] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_Department' THEN [PRK_Employees3].[Department] END,
     CASE @orderBy WHEN 'PRK_Employees3_Department DESC' THEN [PRK_Employees3].[Department] END DESC,
     CASE @orderBy WHEN 'PRK_Employees3_Company' THEN [PRK_Employees3].[Company] END,
     CASE @orderBy WHEN 'PRK_Employees3_Company DESC' THEN [PRK_Employees3].[Company] END DESC,
     CASE @orderBy WHEN 'AST_Brands4_BrandID' THEN [AST_Brands4].[BrandID] END,
     CASE @orderBy WHEN 'AST_Brands4_BrandID DESC' THEN [AST_Brands4].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_Brands4_Description' THEN [AST_Brands4].[Description] END,
     CASE @orderBy WHEN 'AST_Brands4_Description DESC' THEN [AST_Brands4].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Brands5_BrandID' THEN [AST_Brands5].[BrandID] END,
     CASE @orderBy WHEN 'AST_Brands5_BrandID DESC' THEN [AST_Brands5].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_Brands5_Description' THEN [AST_Brands5].[Description] END,
     CASE @orderBy WHEN 'AST_Brands5_Description DESC' THEN [AST_Brands5].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Rams6_RamID' THEN [AST_Rams6].[RamID] END,
     CASE @orderBy WHEN 'AST_Rams6_RamID DESC' THEN [AST_Rams6].[RamID] END DESC,
     CASE @orderBy WHEN 'AST_Rams6_Description' THEN [AST_Rams6].[Description] END,
     CASE @orderBy WHEN 'AST_Rams6_Description DESC' THEN [AST_Rams6].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Brands7_BrandID' THEN [AST_Brands7].[BrandID] END,
     CASE @orderBy WHEN 'AST_Brands7_BrandID DESC' THEN [AST_Brands7].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_Brands7_Description' THEN [AST_Brands7].[Description] END,
     CASE @orderBy WHEN 'AST_Brands7_Description DESC' THEN [AST_Brands7].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Softwares8_SoftwareID' THEN [AST_Softwares8].[SoftwareID] END,
     CASE @orderBy WHEN 'AST_Softwares8_SoftwareID DESC' THEN [AST_Softwares8].[SoftwareID] END DESC,
     CASE @orderBy WHEN 'AST_Softwares8_Description' THEN [AST_Softwares8].[Description] END,
     CASE @orderBy WHEN 'AST_Softwares8_Description DESC' THEN [AST_Softwares8].[Description] END DESC,
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
    	INNER JOIN #PageIndex
          ON [AST_PCDetails].[pcID] = #PageIndex.pcID
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
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
