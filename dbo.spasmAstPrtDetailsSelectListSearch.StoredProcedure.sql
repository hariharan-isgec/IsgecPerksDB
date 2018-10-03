USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstPrtDetailsSelectListSearch]
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
  INNER JOIN [ASM_AstHeader] AS [ASM_AstHeader6]
    ON [ASM_AstDetails].[MrnID] = [ASM_AstHeader6].[MrnID]
  LEFT OUTER JOIN [ASM_AstLocations] AS [ASM_AstLocations7]
    ON [ASM_AstDetails].[LocationID] = [ASM_AstLocations7].[LocationID]
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
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees14]
    ON [ASM_AstDetails].[UserID] = [HRM_Employees14].[CardNo]
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
     OR STR(ISNULL([ASM_AstDetails].[RecievedAt], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[RecievedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[AssetNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[AssetSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[UserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[LocationID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[IPAddress],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[HostName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[DomainName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CPUBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[NoOfCPUs], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CPUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CPUSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[RAMID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[SizeOfRAM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[HDDBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[NoOfHDD], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[SizeOfHDD], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[HDDDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[HDDSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CDROMBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[NoOfCDROM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CDROMDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CDROMSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[VDUBrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[VDUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[VDUSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[PCOSID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[PCOSDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[PCOSSerialNo],'')) LIKE @KeyWord1
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
     OR LOWER(ISNULL([ASM_AstHeader6].[AssetTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[MrnDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader6].[SupplierID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[ModelNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[OtherSpecifications],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader6].[PurchasedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader6].[RecievedAt], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[RecievedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader6].[IssuedQuantity], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader6].[WriteOffQuantity], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[CPUBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader6].[NoOfCPUs], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[CPUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[RAMID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader6].[SizeOfRAM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[HDDBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader6].[NoOfHDD], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader6].[SizeOfHDD], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[HDDDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[CDROMBrandID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstHeader6].[NoOfCDROM], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[CDROMDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[VDUBrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[VDUDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[PCOSID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstHeader6].[PCOSDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstLocations7].[LocationID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstLocations7].[Description],'')) LIKE @KeyWord1
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
     OR LOWER(ISNULL([HRM_Employees14].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees14].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees14].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees14].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees14].[C_DesignationID], 0)) LIKE @KeyWord1
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
     CASE @orderBy WHEN 'RecievedAt' THEN [ASM_AstDetails].[RecievedAt] END,
     CASE @orderBy WHEN 'RecievedAt DESC' THEN [ASM_AstDetails].[RecievedAt] END DESC,
     CASE @orderBy WHEN 'RecievedOn' THEN [ASM_AstDetails].[RecievedOn] END,
     CASE @orderBy WHEN 'RecievedOn DESC' THEN [ASM_AstDetails].[RecievedOn] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ASM_AstDetails].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ASM_AstDetails].[Remarks] END DESC,
     CASE @orderBy WHEN 'RecievedBy' THEN [ASM_AstDetails].[RecievedBy] END,
     CASE @orderBy WHEN 'RecievedBy DESC' THEN [ASM_AstDetails].[RecievedBy] END DESC,
     CASE @orderBy WHEN 'AssetNo' THEN [ASM_AstDetails].[AssetNo] END,
     CASE @orderBy WHEN 'AssetNo DESC' THEN [ASM_AstDetails].[AssetNo] END DESC,
     CASE @orderBy WHEN 'AssetSerialNo' THEN [ASM_AstDetails].[AssetSerialNo] END,
     CASE @orderBy WHEN 'AssetSerialNo DESC' THEN [ASM_AstDetails].[AssetSerialNo] END DESC,
     CASE @orderBy WHEN 'UserID' THEN [ASM_AstDetails].[UserID] END,
     CASE @orderBy WHEN 'UserID DESC' THEN [ASM_AstDetails].[UserID] END DESC,
     CASE @orderBy WHEN 'LocationID' THEN [ASM_AstDetails].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [ASM_AstDetails].[LocationID] END DESC,
     CASE @orderBy WHEN 'Issued' THEN [ASM_AstDetails].[Issued] END,
     CASE @orderBy WHEN 'Issued DESC' THEN [ASM_AstDetails].[Issued] END DESC,
     CASE @orderBy WHEN 'Discarded' THEN [ASM_AstDetails].[Discarded] END,
     CASE @orderBy WHEN 'Discarded DESC' THEN [ASM_AstDetails].[Discarded] END DESC,
     CASE @orderBy WHEN 'IPAddress' THEN [ASM_AstDetails].[IPAddress] END,
     CASE @orderBy WHEN 'IPAddress DESC' THEN [ASM_AstDetails].[IPAddress] END DESC,
     CASE @orderBy WHEN 'HostName' THEN [ASM_AstDetails].[HostName] END,
     CASE @orderBy WHEN 'HostName DESC' THEN [ASM_AstDetails].[HostName] END DESC,
     CASE @orderBy WHEN 'INDomain' THEN [ASM_AstDetails].[INDomain] END,
     CASE @orderBy WHEN 'INDomain DESC' THEN [ASM_AstDetails].[INDomain] END DESC,
     CASE @orderBy WHEN 'DomainName' THEN [ASM_AstDetails].[DomainName] END,
     CASE @orderBy WHEN 'DomainName DESC' THEN [ASM_AstDetails].[DomainName] END DESC,
     CASE @orderBy WHEN 'MapDrive' THEN [ASM_AstDetails].[MapDrive] END,
     CASE @orderBy WHEN 'MapDrive DESC' THEN [ASM_AstDetails].[MapDrive] END DESC,
     CASE @orderBy WHEN 'PenDriveDisable' THEN [ASM_AstDetails].[PenDriveDisable] END,
     CASE @orderBy WHEN 'PenDriveDisable DESC' THEN [ASM_AstDetails].[PenDriveDisable] END DESC,
     CASE @orderBy WHEN 'CDROMDisable' THEN [ASM_AstDetails].[CDROMDisable] END,
     CASE @orderBy WHEN 'CDROMDisable DESC' THEN [ASM_AstDetails].[CDROMDisable] END DESC,
     CASE @orderBy WHEN 'InternetAccess' THEN [ASM_AstDetails].[InternetAccess] END,
     CASE @orderBy WHEN 'InternetAccess DESC' THEN [ASM_AstDetails].[InternetAccess] END DESC,
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
     CASE @orderBy WHEN 'CPUSerialNo' THEN [ASM_AstDetails].[CPUSerialNo] END,
     CASE @orderBy WHEN 'CPUSerialNo DESC' THEN [ASM_AstDetails].[CPUSerialNo] END DESC,
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
     CASE @orderBy WHEN 'HDDSerialNo' THEN [ASM_AstDetails].[HDDSerialNo] END,
     CASE @orderBy WHEN 'HDDSerialNo DESC' THEN [ASM_AstDetails].[HDDSerialNo] END DESC,
     CASE @orderBy WHEN 'CDROMBrandID' THEN [ASM_AstDetails].[CDROMBrandID] END,
     CASE @orderBy WHEN 'CDROMBrandID DESC' THEN [ASM_AstDetails].[CDROMBrandID] END DESC,
     CASE @orderBy WHEN 'NoOfCDROM' THEN [ASM_AstDetails].[NoOfCDROM] END,
     CASE @orderBy WHEN 'NoOfCDROM DESC' THEN [ASM_AstDetails].[NoOfCDROM] END DESC,
     CASE @orderBy WHEN 'CDROMDetails' THEN [ASM_AstDetails].[CDROMDetails] END,
     CASE @orderBy WHEN 'CDROMDetails DESC' THEN [ASM_AstDetails].[CDROMDetails] END DESC,
     CASE @orderBy WHEN 'CDROMSerialNo' THEN [ASM_AstDetails].[CDROMSerialNo] END,
     CASE @orderBy WHEN 'CDROMSerialNo DESC' THEN [ASM_AstDetails].[CDROMSerialNo] END DESC,
     CASE @orderBy WHEN 'VDUBrandID' THEN [ASM_AstDetails].[VDUBrandID] END,
     CASE @orderBy WHEN 'VDUBrandID DESC' THEN [ASM_AstDetails].[VDUBrandID] END DESC,
     CASE @orderBy WHEN 'VDUDetails' THEN [ASM_AstDetails].[VDUDetails] END,
     CASE @orderBy WHEN 'VDUDetails DESC' THEN [ASM_AstDetails].[VDUDetails] END DESC,
     CASE @orderBy WHEN 'VDUSerialNo' THEN [ASM_AstDetails].[VDUSerialNo] END,
     CASE @orderBy WHEN 'VDUSerialNo DESC' THEN [ASM_AstDetails].[VDUSerialNo] END DESC,
     CASE @orderBy WHEN 'PCOSID' THEN [ASM_AstDetails].[PCOSID] END,
     CASE @orderBy WHEN 'PCOSID DESC' THEN [ASM_AstDetails].[PCOSID] END DESC,
     CASE @orderBy WHEN 'PCOSDetails' THEN [ASM_AstDetails].[PCOSDetails] END,
     CASE @orderBy WHEN 'PCOSDetails DESC' THEN [ASM_AstDetails].[PCOSDetails] END DESC,
     CASE @orderBy WHEN 'PCOSSerialNo' THEN [ASM_AstDetails].[PCOSSerialNo] END,
     CASE @orderBy WHEN 'PCOSSerialNo DESC' THEN [ASM_AstDetails].[PCOSSerialNo] END DESC,
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
     CASE @orderBy WHEN 'ASM_AstHeader6_MrnID' THEN [ASM_AstHeader6].[MrnID] END,
     CASE @orderBy WHEN 'ASM_AstHeader6_MrnID DESC' THEN [ASM_AstHeader6].[MrnID] END DESC,
     CASE @orderBy WHEN 'ASM_AstHeader6_AssetTypeID' THEN [ASM_AstHeader6].[AssetTypeID] END,
     CASE @orderBy WHEN 'ASM_AstHeader6_AssetTypeID DESC' THEN [ASM_AstHeader6].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'ASM_AstHeader6_MrnDate' THEN [ASM_AstHeader6].[MrnDate] END,
     CASE @orderBy WHEN 'ASM_AstHeader6_MrnDate DESC' THEN [ASM_AstHeader6].[MrnDate] END DESC,
     CASE @orderBy WHEN 'ASM_AstHeader6_MrnDescription' THEN [ASM_AstHeader6].[MrnDescription] END,
     CASE @orderBy WHEN 'ASM_AstHeader6_MrnDescription DESC' THEN [ASM_AstHeader6].[MrnDescription] END DESC,
     CASE @orderBy WHEN 'ASM_AstHeader6_SupplierID' THEN [ASM_AstHeader6].[SupplierID] END,
     CASE @orderBy WHEN 'ASM_AstHeader6_SupplierID DESC' THEN [ASM_AstHeader6].[SupplierID] END DESC,
     CASE @orderBy WHEN 'ASM_AstHeader6_DateOfPurchase' THEN [ASM_AstHeader6].[DateOfPurchase] END,
     CASE @orderBy WHEN 'ASM_AstHeader6_DateOfPurchase DESC' THEN [ASM_AstHeader6].[DateOfPurchase] END DESC,
     CASE @orderBy WHEN 'ASM_AstHeader6_BrandID' THEN [ASM_AstHeader6].[BrandID] END,
     CASE @orderBy WHEN 'ASM_AstHeader6_BrandID DESC' THEN [ASM_AstHeader6].[BrandID] END DESC,
     CASE @orderBy WHEN 'ASM_AstHeader6_PurchasedQuantity' THEN [ASM_AstHeader6].[PurchasedQuantity] END,
     CASE @orderBy WHEN 'ASM_AstHeader6_PurchasedQuantity DESC' THEN [ASM_AstHeader6].[PurchasedQuantity] END DESC,
     CASE @orderBy WHEN 'ASM_AstHeader6_RecievedAt' THEN [ASM_AstHeader6].[RecievedAt] END,
     CASE @orderBy WHEN 'ASM_AstHeader6_RecievedAt DESC' THEN [ASM_AstHeader6].[RecievedAt] END DESC,
     CASE @orderBy WHEN 'ASM_AstLocations7_LocationID' THEN [ASM_AstLocations7].[LocationID] END,
     CASE @orderBy WHEN 'ASM_AstLocations7_LocationID DESC' THEN [ASM_AstLocations7].[LocationID] END DESC,
     CASE @orderBy WHEN 'ASM_AstLocations7_Description' THEN [ASM_AstLocations7].[Description] END,
     CASE @orderBy WHEN 'ASM_AstLocations7_Description DESC' THEN [ASM_AstLocations7].[Description] END DESC,
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
     CASE @orderBy WHEN 'HRM_Employees14_CardNo' THEN [HRM_Employees14].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees14_CardNo DESC' THEN [HRM_Employees14].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees14_EmployeeName' THEN [HRM_Employees14].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees14_EmployeeName DESC' THEN [HRM_Employees14].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees14_C_OfficeID' THEN [HRM_Employees14].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees14_C_OfficeID DESC' THEN [HRM_Employees14].[C_OfficeID] END DESC,
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
		[ASM_AstDetails].[WarrantyTill],
		[ASM_AstDetails].[InsuranceTill],
		[ASM_AstDetails].[BrandID],
		[ASM_AstDetails].[ModelNo],
		[ASM_AstDetails].[OtherSpecifications],
		[ASM_AstDetails].[RecievedAt],
		[ASM_AstDetails].[RecievedOn],
		[ASM_AstDetails].[Remarks],
		[ASM_AstDetails].[RecievedBy],
		[ASM_AstDetails].[AssetNo],
		[ASM_AstDetails].[AssetSerialNo],
		[ASM_AstDetails].[UserID],
		[ASM_AstDetails].[LocationID],
		[ASM_AstDetails].[Issued],
		[ASM_AstDetails].[Discarded],
		[ASM_AstDetails].[IPAddress],
		[ASM_AstDetails].[HostName],
		[ASM_AstDetails].[INDomain],
		[ASM_AstDetails].[DomainName],
		[ASM_AstDetails].[MapDrive],
		[ASM_AstDetails].[PenDriveDisable],
		[ASM_AstDetails].[CDROMDisable],
		[ASM_AstDetails].[InternetAccess],
		[ASM_AstDetails].[Keyboard],
		[ASM_AstDetails].[Mouse],
		[ASM_AstDetails].[FloppyDrive],
		[ASM_AstDetails].[CPUBrandID],
		[ASM_AstDetails].[NoOfCPUs],
		[ASM_AstDetails].[CPUDetails],
		[ASM_AstDetails].[CPUSerialNo],
		[ASM_AstDetails].[RAMID],
		[ASM_AstDetails].[SizeOfRAM],
		[ASM_AstDetails].[HDDBrandID],
		[ASM_AstDetails].[NoOfHDD],
		[ASM_AstDetails].[SizeOfHDD],
		[ASM_AstDetails].[HDDDetails],
		[ASM_AstDetails].[HDDSerialNo],
		[ASM_AstDetails].[CDROMBrandID],
		[ASM_AstDetails].[NoOfCDROM],
		[ASM_AstDetails].[CDROMDetails],
		[ASM_AstDetails].[CDROMSerialNo],
		[ASM_AstDetails].[VDUBrandID],
		[ASM_AstDetails].[VDUDetails],
		[ASM_AstDetails].[VDUSerialNo],
		[ASM_AstDetails].[PCOSID],
		[ASM_AstDetails].[PCOSDetails],
		[ASM_AstDetails].[PCOSSerialNo],
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
		[ASM_AstHeader6].[MrnID] AS ASM_AstHeader6_MrnID,
		[ASM_AstHeader6].[AssetTypeID] AS ASM_AstHeader6_AssetTypeID,
		[ASM_AstHeader6].[MrnDate] AS ASM_AstHeader6_MrnDate,
		[ASM_AstHeader6].[MrnDescription] AS ASM_AstHeader6_MrnDescription,
		[ASM_AstHeader6].[SupplierID] AS ASM_AstHeader6_SupplierID,
		[ASM_AstHeader6].[DateOfPurchase] AS ASM_AstHeader6_DateOfPurchase,
		[ASM_AstHeader6].[BrandID] AS ASM_AstHeader6_BrandID,
		[ASM_AstHeader6].[PurchasedQuantity] AS ASM_AstHeader6_PurchasedQuantity,
		[ASM_AstHeader6].[RecievedAt] AS ASM_AstHeader6_RecievedAt,
		[ASM_AstLocations7].[LocationID] AS ASM_AstLocations7_LocationID,
		[ASM_AstLocations7].[Description] AS ASM_AstLocations7_Description,
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
		[HRM_Employees14].[CardNo] AS HRM_Employees14_CardNo,
		[HRM_Employees14].[EmployeeName] AS HRM_Employees14_EmployeeName,
		[HRM_Employees14].[C_OfficeID] AS HRM_Employees14_C_OfficeID,
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
  INNER JOIN [ASM_AstHeader] AS [ASM_AstHeader6]
    ON [ASM_AstDetails].[MrnID] = [ASM_AstHeader6].[MrnID]
  LEFT OUTER JOIN [ASM_AstLocations] AS [ASM_AstLocations7]
    ON [ASM_AstDetails].[LocationID] = [ASM_AstLocations7].[LocationID]
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
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees14]
    ON [ASM_AstDetails].[UserID] = [HRM_Employees14].[CardNo]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices18]
    ON [ASM_AstDetails].[RecievedAt] = [HRM_Offices18].[OfficeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
