USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstHeaderSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,MrnID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'MrnID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_AstHeader].[MrnID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_AstHeader] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands1]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstHeader].[BrandID] = [ASM_AstBrands1].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands2]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstHeader].[HDDBrandID] = [ASM_AstBrands2].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands3]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstHeader].[CDROMBrandID] = [ASM_AstBrands3].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands4]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstHeader].[VDUBrandID] = [ASM_AstBrands4].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands5]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstHeader].[CPUBrandID] = [ASM_AstBrands5].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstRAMS] AS [ASM_AstRAMS6]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstHeader].[RAMID] = [ASM_AstRAMS6].[RAMID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstSoftwares] AS [ASM_AstSoftwares7]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstHeader].[PCOSID] = [ASM_AstSoftwares7].[SoftwareID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes8]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstHeader].[AssetTypeID] = [ASM_AstTypes8].[AssetTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers9]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstHeader].[SupplierID] = [ASM_Suppliers9].[SupplierID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees10]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstHeader].[RecievedBy] = [HRM_Employees10].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices11]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstHeader].[RecievedAt] = [HRM_Offices11].[OfficeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'MrnID' THEN '[ASM_AstHeader].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[ASM_AstHeader].[MrnID] DESC'
                        WHEN 'AssetTypeID' THEN '[ASM_AstHeader].[AssetTypeID]'
                        WHEN 'AssetTypeID DESC' THEN '[ASM_AstHeader].[AssetTypeID] DESC'
                        WHEN 'MrnDate' THEN '[ASM_AstHeader].[MrnDate]'
                        WHEN 'MrnDate DESC' THEN '[ASM_AstHeader].[MrnDate] DESC'
                        WHEN 'MrnDescription' THEN '[ASM_AstHeader].[MrnDescription]'
                        WHEN 'MrnDescription DESC' THEN '[ASM_AstHeader].[MrnDescription] DESC'
                        WHEN 'SupplierID' THEN '[ASM_AstHeader].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[ASM_AstHeader].[SupplierID] DESC'
                        WHEN 'DateOfPurchase' THEN '[ASM_AstHeader].[DateOfPurchase]'
                        WHEN 'DateOfPurchase DESC' THEN '[ASM_AstHeader].[DateOfPurchase] DESC'
                        WHEN 'WarrantyTill' THEN '[ASM_AstHeader].[WarrantyTill]'
                        WHEN 'WarrantyTill DESC' THEN '[ASM_AstHeader].[WarrantyTill] DESC'
                        WHEN 'InsuranceTill' THEN '[ASM_AstHeader].[InsuranceTill]'
                        WHEN 'InsuranceTill DESC' THEN '[ASM_AstHeader].[InsuranceTill] DESC'
                        WHEN 'BrandID' THEN '[ASM_AstHeader].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[ASM_AstHeader].[BrandID] DESC'
                        WHEN 'ModelNo' THEN '[ASM_AstHeader].[ModelNo]'
                        WHEN 'ModelNo DESC' THEN '[ASM_AstHeader].[ModelNo] DESC'
                        WHEN 'OtherSpecifications' THEN '[ASM_AstHeader].[OtherSpecifications]'
                        WHEN 'OtherSpecifications DESC' THEN '[ASM_AstHeader].[OtherSpecifications] DESC'
                        WHEN 'PurchasedQuantity' THEN '[ASM_AstHeader].[PurchasedQuantity]'
                        WHEN 'PurchasedQuantity DESC' THEN '[ASM_AstHeader].[PurchasedQuantity] DESC'
                        WHEN 'RecievedAt' THEN '[ASM_AstHeader].[RecievedAt]'
                        WHEN 'RecievedAt DESC' THEN '[ASM_AstHeader].[RecievedAt] DESC'
                        WHEN 'RecievedOn' THEN '[ASM_AstHeader].[RecievedOn]'
                        WHEN 'RecievedOn DESC' THEN '[ASM_AstHeader].[RecievedOn] DESC'
                        WHEN 'Remarks' THEN '[ASM_AstHeader].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ASM_AstHeader].[Remarks] DESC'
                        WHEN 'RecievedBy' THEN '[ASM_AstHeader].[RecievedBy]'
                        WHEN 'RecievedBy DESC' THEN '[ASM_AstHeader].[RecievedBy] DESC'
                        WHEN 'Keyboard' THEN '[ASM_AstHeader].[Keyboard]'
                        WHEN 'Keyboard DESC' THEN '[ASM_AstHeader].[Keyboard] DESC'
                        WHEN 'Mouse' THEN '[ASM_AstHeader].[Mouse]'
                        WHEN 'Mouse DESC' THEN '[ASM_AstHeader].[Mouse] DESC'
                        WHEN 'FloppyDrive' THEN '[ASM_AstHeader].[FloppyDrive]'
                        WHEN 'FloppyDrive DESC' THEN '[ASM_AstHeader].[FloppyDrive] DESC'
                        WHEN 'CPUBrandID' THEN '[ASM_AstHeader].[CPUBrandID]'
                        WHEN 'CPUBrandID DESC' THEN '[ASM_AstHeader].[CPUBrandID] DESC'
                        WHEN 'NoOfCPUs' THEN '[ASM_AstHeader].[NoOfCPUs]'
                        WHEN 'NoOfCPUs DESC' THEN '[ASM_AstHeader].[NoOfCPUs] DESC'
                        WHEN 'CPUDetails' THEN '[ASM_AstHeader].[CPUDetails]'
                        WHEN 'CPUDetails DESC' THEN '[ASM_AstHeader].[CPUDetails] DESC'
                        WHEN 'RAMID' THEN '[ASM_AstHeader].[RAMID]'
                        WHEN 'RAMID DESC' THEN '[ASM_AstHeader].[RAMID] DESC'
                        WHEN 'SizeOfRAM' THEN '[ASM_AstHeader].[SizeOfRAM]'
                        WHEN 'SizeOfRAM DESC' THEN '[ASM_AstHeader].[SizeOfRAM] DESC'
                        WHEN 'HDDBrandID' THEN '[ASM_AstHeader].[HDDBrandID]'
                        WHEN 'HDDBrandID DESC' THEN '[ASM_AstHeader].[HDDBrandID] DESC'
                        WHEN 'NoOfHDD' THEN '[ASM_AstHeader].[NoOfHDD]'
                        WHEN 'NoOfHDD DESC' THEN '[ASM_AstHeader].[NoOfHDD] DESC'
                        WHEN 'SizeOfHDD' THEN '[ASM_AstHeader].[SizeOfHDD]'
                        WHEN 'SizeOfHDD DESC' THEN '[ASM_AstHeader].[SizeOfHDD] DESC'
                        WHEN 'HDDDetails' THEN '[ASM_AstHeader].[HDDDetails]'
                        WHEN 'HDDDetails DESC' THEN '[ASM_AstHeader].[HDDDetails] DESC'
                        WHEN 'CDROMBrandID' THEN '[ASM_AstHeader].[CDROMBrandID]'
                        WHEN 'CDROMBrandID DESC' THEN '[ASM_AstHeader].[CDROMBrandID] DESC'
                        WHEN 'NoOfCDROM' THEN '[ASM_AstHeader].[NoOfCDROM]'
                        WHEN 'NoOfCDROM DESC' THEN '[ASM_AstHeader].[NoOfCDROM] DESC'
                        WHEN 'CDROMDetails' THEN '[ASM_AstHeader].[CDROMDetails]'
                        WHEN 'CDROMDetails DESC' THEN '[ASM_AstHeader].[CDROMDetails] DESC'
                        WHEN 'VDUBrandID' THEN '[ASM_AstHeader].[VDUBrandID]'
                        WHEN 'VDUBrandID DESC' THEN '[ASM_AstHeader].[VDUBrandID] DESC'
                        WHEN 'VDUDetails' THEN '[ASM_AstHeader].[VDUDetails]'
                        WHEN 'VDUDetails DESC' THEN '[ASM_AstHeader].[VDUDetails] DESC'
                        WHEN 'PCOSID' THEN '[ASM_AstHeader].[PCOSID]'
                        WHEN 'PCOSID DESC' THEN '[ASM_AstHeader].[PCOSID] DESC'
                        WHEN 'PCOSDetails' THEN '[ASM_AstHeader].[PCOSDetails]'
                        WHEN 'PCOSDetails DESC' THEN '[ASM_AstHeader].[PCOSDetails] DESC'
                        WHEN 'ASM_AstBrands1_BrandID' THEN '[ASM_AstBrands1].[BrandID]'
                        WHEN 'ASM_AstBrands1_BrandID DESC' THEN '[ASM_AstBrands1].[BrandID] DESC'
                        WHEN 'ASM_AstBrands1_Description' THEN '[ASM_AstBrands1].[Description]'
                        WHEN 'ASM_AstBrands1_Description DESC' THEN '[ASM_AstBrands1].[Description] DESC'
                        WHEN 'ASM_AstBrands2_BrandID' THEN '[ASM_AstBrands2].[BrandID]'
                        WHEN 'ASM_AstBrands2_BrandID DESC' THEN '[ASM_AstBrands2].[BrandID] DESC'
                        WHEN 'ASM_AstBrands2_Description' THEN '[ASM_AstBrands2].[Description]'
                        WHEN 'ASM_AstBrands2_Description DESC' THEN '[ASM_AstBrands2].[Description] DESC'
                        WHEN 'ASM_AstBrands3_BrandID' THEN '[ASM_AstBrands3].[BrandID]'
                        WHEN 'ASM_AstBrands3_BrandID DESC' THEN '[ASM_AstBrands3].[BrandID] DESC'
                        WHEN 'ASM_AstBrands3_Description' THEN '[ASM_AstBrands3].[Description]'
                        WHEN 'ASM_AstBrands3_Description DESC' THEN '[ASM_AstBrands3].[Description] DESC'
                        WHEN 'ASM_AstBrands4_BrandID' THEN '[ASM_AstBrands4].[BrandID]'
                        WHEN 'ASM_AstBrands4_BrandID DESC' THEN '[ASM_AstBrands4].[BrandID] DESC'
                        WHEN 'ASM_AstBrands4_Description' THEN '[ASM_AstBrands4].[Description]'
                        WHEN 'ASM_AstBrands4_Description DESC' THEN '[ASM_AstBrands4].[Description] DESC'
                        WHEN 'ASM_AstBrands5_BrandID' THEN '[ASM_AstBrands5].[BrandID]'
                        WHEN 'ASM_AstBrands5_BrandID DESC' THEN '[ASM_AstBrands5].[BrandID] DESC'
                        WHEN 'ASM_AstBrands5_Description' THEN '[ASM_AstBrands5].[Description]'
                        WHEN 'ASM_AstBrands5_Description DESC' THEN '[ASM_AstBrands5].[Description] DESC'
                        WHEN 'ASM_AstRAMS6_RAMID' THEN '[ASM_AstRAMS6].[RAMID]'
                        WHEN 'ASM_AstRAMS6_RAMID DESC' THEN '[ASM_AstRAMS6].[RAMID] DESC'
                        WHEN 'ASM_AstRAMS6_Description' THEN '[ASM_AstRAMS6].[Description]'
                        WHEN 'ASM_AstRAMS6_Description DESC' THEN '[ASM_AstRAMS6].[Description] DESC'
                        WHEN 'ASM_AstSoftwares7_SoftwareID' THEN '[ASM_AstSoftwares7].[SoftwareID]'
                        WHEN 'ASM_AstSoftwares7_SoftwareID DESC' THEN '[ASM_AstSoftwares7].[SoftwareID] DESC'
                        WHEN 'ASM_AstSoftwares7_Description' THEN '[ASM_AstSoftwares7].[Description]'
                        WHEN 'ASM_AstSoftwares7_Description DESC' THEN '[ASM_AstSoftwares7].[Description] DESC'
                        WHEN 'ASM_AstTypes8_AssetTypeID' THEN '[ASM_AstTypes8].[AssetTypeID]'
                        WHEN 'ASM_AstTypes8_AssetTypeID DESC' THEN '[ASM_AstTypes8].[AssetTypeID] DESC'
                        WHEN 'ASM_AstTypes8_Description' THEN '[ASM_AstTypes8].[Description]'
                        WHEN 'ASM_AstTypes8_Description DESC' THEN '[ASM_AstTypes8].[Description] DESC'
                        WHEN 'ASM_AstTypes8_IssueToLocation' THEN '[ASM_AstTypes8].[IssueToLocation]'
                        WHEN 'ASM_AstTypes8_IssueToLocation DESC' THEN '[ASM_AstTypes8].[IssueToLocation] DESC'
                        WHEN 'ASM_Suppliers9_SupplierID' THEN '[ASM_Suppliers9].[SupplierID]'
                        WHEN 'ASM_Suppliers9_SupplierID DESC' THEN '[ASM_Suppliers9].[SupplierID] DESC'
                        WHEN 'ASM_Suppliers9_Description' THEN '[ASM_Suppliers9].[Description]'
                        WHEN 'ASM_Suppliers9_Description DESC' THEN '[ASM_Suppliers9].[Description] DESC'
                        WHEN 'HRM_Employees10_CardNo' THEN '[HRM_Employees10].[CardNo]'
                        WHEN 'HRM_Employees10_CardNo DESC' THEN '[HRM_Employees10].[CardNo] DESC'
                        WHEN 'HRM_Employees10_EmployeeName' THEN '[HRM_Employees10].[EmployeeName]'
                        WHEN 'HRM_Employees10_EmployeeName DESC' THEN '[HRM_Employees10].[EmployeeName] DESC'
                        WHEN 'HRM_Offices11_OfficeID' THEN '[HRM_Offices11].[OfficeID]'
                        WHEN 'HRM_Offices11_OfficeID DESC' THEN '[HRM_Offices11].[OfficeID] DESC'
                        WHEN 'HRM_Offices11_Description' THEN '[HRM_Offices11].[Description]'
                        WHEN 'HRM_Offices11_Description DESC' THEN '[HRM_Offices11].[Description] DESC'
                        ELSE '[ASM_AstHeader].[MrnID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [ASM_AstHeader].[MrnID] = #PageIndex.MrnID
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
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
