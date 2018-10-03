USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstDetailsSelectListFilteres]
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
 ,AssetID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'MrnID'  SET @LGSQL = @LGSQL + ', AssetID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_AstDetails].[MrnID]'  SET @LGSQL = @LGSQL + ', [ASM_AstDetails].[AssetID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_AstDetails] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands1]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[CPUBrandID] = [ASM_AstBrands1].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands2]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[CDROMBrandID] = [ASM_AstBrands2].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands3]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[VDUBrandID] = [ASM_AstBrands3].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands4]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[HDDBrandID] = [ASM_AstBrands4].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands5]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[BrandID] = [ASM_AstBrands5].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstRAMS] AS [ASM_AstRAMS8]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[RAMID] = [ASM_AstRAMS8].[RAMID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstSoftwares] AS [ASM_AstSoftwares9]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[PCOSID] = [ASM_AstSoftwares9].[SoftwareID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes10]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[AssetTypeID] = [ASM_AstTypes10].[AssetTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers11]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[SupplierID] = [ASM_Suppliers11].[SupplierID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees13]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[RecievedBy] = [HRM_Employees13].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices18]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[RecievedAt] = [HRM_Offices18].[OfficeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'MrnID' THEN '[ASM_AstDetails].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[ASM_AstDetails].[MrnID] DESC'
                        WHEN 'AssetID' THEN '[ASM_AstDetails].[AssetID]'
                        WHEN 'AssetID DESC' THEN '[ASM_AstDetails].[AssetID] DESC'
                        WHEN 'AssetTypeID' THEN '[ASM_AstDetails].[AssetTypeID]'
                        WHEN 'AssetTypeID DESC' THEN '[ASM_AstDetails].[AssetTypeID] DESC'
                        WHEN 'MrnDate' THEN '[ASM_AstDetails].[MrnDate]'
                        WHEN 'MrnDate DESC' THEN '[ASM_AstDetails].[MrnDate] DESC'
                        WHEN 'MrnDescription' THEN '[ASM_AstDetails].[MrnDescription]'
                        WHEN 'MrnDescription DESC' THEN '[ASM_AstDetails].[MrnDescription] DESC'
                        WHEN 'SupplierID' THEN '[ASM_AstDetails].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[ASM_AstDetails].[SupplierID] DESC'
                        WHEN 'DateOfPurchase' THEN '[ASM_AstDetails].[DateOfPurchase]'
                        WHEN 'DateOfPurchase DESC' THEN '[ASM_AstDetails].[DateOfPurchase] DESC'
                        WHEN 'WarrantyTill' THEN '[ASM_AstDetails].[WarrantyTill]'
                        WHEN 'WarrantyTill DESC' THEN '[ASM_AstDetails].[WarrantyTill] DESC'
                        WHEN 'InsuranceTill' THEN '[ASM_AstDetails].[InsuranceTill]'
                        WHEN 'InsuranceTill DESC' THEN '[ASM_AstDetails].[InsuranceTill] DESC'
                        WHEN 'BrandID' THEN '[ASM_AstDetails].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[ASM_AstDetails].[BrandID] DESC'
                        WHEN 'ModelNo' THEN '[ASM_AstDetails].[ModelNo]'
                        WHEN 'ModelNo DESC' THEN '[ASM_AstDetails].[ModelNo] DESC'
                        WHEN 'OtherSpecifications' THEN '[ASM_AstDetails].[OtherSpecifications]'
                        WHEN 'OtherSpecifications DESC' THEN '[ASM_AstDetails].[OtherSpecifications] DESC'
                        WHEN 'PurchasedQuantity' THEN '[ASM_AstDetails].[PurchasedQuantity]'
                        WHEN 'PurchasedQuantity DESC' THEN '[ASM_AstDetails].[PurchasedQuantity] DESC'
                        WHEN 'RecievedAt' THEN '[ASM_AstDetails].[RecievedAt]'
                        WHEN 'RecievedAt DESC' THEN '[ASM_AstDetails].[RecievedAt] DESC'
                        WHEN 'RecievedOn' THEN '[ASM_AstDetails].[RecievedOn]'
                        WHEN 'RecievedOn DESC' THEN '[ASM_AstDetails].[RecievedOn] DESC'
                        WHEN 'Remarks' THEN '[ASM_AstDetails].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ASM_AstDetails].[Remarks] DESC'
                        WHEN 'RecievedBy' THEN '[ASM_AstDetails].[RecievedBy]'
                        WHEN 'RecievedBy DESC' THEN '[ASM_AstDetails].[RecievedBy] DESC'
                        WHEN 'IssueToLocation' THEN '[ASM_AstDetails].[IssueToLocation]'
                        WHEN 'IssueToLocation DESC' THEN '[ASM_AstDetails].[IssueToLocation] DESC'
                        WHEN 'Modified' THEN '[ASM_AstDetails].[Modified]'
                        WHEN 'Modified DESC' THEN '[ASM_AstDetails].[Modified] DESC'
                        WHEN 'Keyboard' THEN '[ASM_AstDetails].[Keyboard]'
                        WHEN 'Keyboard DESC' THEN '[ASM_AstDetails].[Keyboard] DESC'
                        WHEN 'Mouse' THEN '[ASM_AstDetails].[Mouse]'
                        WHEN 'Mouse DESC' THEN '[ASM_AstDetails].[Mouse] DESC'
                        WHEN 'FloppyDrive' THEN '[ASM_AstDetails].[FloppyDrive]'
                        WHEN 'FloppyDrive DESC' THEN '[ASM_AstDetails].[FloppyDrive] DESC'
                        WHEN 'CPUBrandID' THEN '[ASM_AstDetails].[CPUBrandID]'
                        WHEN 'CPUBrandID DESC' THEN '[ASM_AstDetails].[CPUBrandID] DESC'
                        WHEN 'NoOfCPUs' THEN '[ASM_AstDetails].[NoOfCPUs]'
                        WHEN 'NoOfCPUs DESC' THEN '[ASM_AstDetails].[NoOfCPUs] DESC'
                        WHEN 'CPUDetails' THEN '[ASM_AstDetails].[CPUDetails]'
                        WHEN 'CPUDetails DESC' THEN '[ASM_AstDetails].[CPUDetails] DESC'
                        WHEN 'RAMID' THEN '[ASM_AstDetails].[RAMID]'
                        WHEN 'RAMID DESC' THEN '[ASM_AstDetails].[RAMID] DESC'
                        WHEN 'SizeOfRAM' THEN '[ASM_AstDetails].[SizeOfRAM]'
                        WHEN 'SizeOfRAM DESC' THEN '[ASM_AstDetails].[SizeOfRAM] DESC'
                        WHEN 'HDDBrandID' THEN '[ASM_AstDetails].[HDDBrandID]'
                        WHEN 'HDDBrandID DESC' THEN '[ASM_AstDetails].[HDDBrandID] DESC'
                        WHEN 'NoOfHDD' THEN '[ASM_AstDetails].[NoOfHDD]'
                        WHEN 'NoOfHDD DESC' THEN '[ASM_AstDetails].[NoOfHDD] DESC'
                        WHEN 'SizeOfHDD' THEN '[ASM_AstDetails].[SizeOfHDD]'
                        WHEN 'SizeOfHDD DESC' THEN '[ASM_AstDetails].[SizeOfHDD] DESC'
                        WHEN 'HDDDetails' THEN '[ASM_AstDetails].[HDDDetails]'
                        WHEN 'HDDDetails DESC' THEN '[ASM_AstDetails].[HDDDetails] DESC'
                        WHEN 'CDROMBrandID' THEN '[ASM_AstDetails].[CDROMBrandID]'
                        WHEN 'CDROMBrandID DESC' THEN '[ASM_AstDetails].[CDROMBrandID] DESC'
                        WHEN 'NoOfCDROM' THEN '[ASM_AstDetails].[NoOfCDROM]'
                        WHEN 'NoOfCDROM DESC' THEN '[ASM_AstDetails].[NoOfCDROM] DESC'
                        WHEN 'CDROMDetails' THEN '[ASM_AstDetails].[CDROMDetails]'
                        WHEN 'CDROMDetails DESC' THEN '[ASM_AstDetails].[CDROMDetails] DESC'
                        WHEN 'VDUBrandID' THEN '[ASM_AstDetails].[VDUBrandID]'
                        WHEN 'VDUBrandID DESC' THEN '[ASM_AstDetails].[VDUBrandID] DESC'
                        WHEN 'VDUDetails' THEN '[ASM_AstDetails].[VDUDetails]'
                        WHEN 'VDUDetails DESC' THEN '[ASM_AstDetails].[VDUDetails] DESC'
                        WHEN 'PCOSID' THEN '[ASM_AstDetails].[PCOSID]'
                        WHEN 'PCOSID DESC' THEN '[ASM_AstDetails].[PCOSID] DESC'
                        WHEN 'PCOSDetails' THEN '[ASM_AstDetails].[PCOSDetails]'
                        WHEN 'PCOSDetails DESC' THEN '[ASM_AstDetails].[PCOSDetails] DESC'
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
                        WHEN 'ASM_AstRAMS8_RAMID' THEN '[ASM_AstRAMS8].[RAMID]'
                        WHEN 'ASM_AstRAMS8_RAMID DESC' THEN '[ASM_AstRAMS8].[RAMID] DESC'
                        WHEN 'ASM_AstRAMS8_Description' THEN '[ASM_AstRAMS8].[Description]'
                        WHEN 'ASM_AstRAMS8_Description DESC' THEN '[ASM_AstRAMS8].[Description] DESC'
                        WHEN 'ASM_AstSoftwares9_SoftwareID' THEN '[ASM_AstSoftwares9].[SoftwareID]'
                        WHEN 'ASM_AstSoftwares9_SoftwareID DESC' THEN '[ASM_AstSoftwares9].[SoftwareID] DESC'
                        WHEN 'ASM_AstSoftwares9_Description' THEN '[ASM_AstSoftwares9].[Description]'
                        WHEN 'ASM_AstSoftwares9_Description DESC' THEN '[ASM_AstSoftwares9].[Description] DESC'
                        WHEN 'ASM_AstTypes10_AssetTypeID' THEN '[ASM_AstTypes10].[AssetTypeID]'
                        WHEN 'ASM_AstTypes10_AssetTypeID DESC' THEN '[ASM_AstTypes10].[AssetTypeID] DESC'
                        WHEN 'ASM_AstTypes10_Description' THEN '[ASM_AstTypes10].[Description]'
                        WHEN 'ASM_AstTypes10_Description DESC' THEN '[ASM_AstTypes10].[Description] DESC'
                        WHEN 'ASM_AstTypes10_IssueToLocation' THEN '[ASM_AstTypes10].[IssueToLocation]'
                        WHEN 'ASM_AstTypes10_IssueToLocation DESC' THEN '[ASM_AstTypes10].[IssueToLocation] DESC'
                        WHEN 'ASM_Suppliers11_SupplierID' THEN '[ASM_Suppliers11].[SupplierID]'
                        WHEN 'ASM_Suppliers11_SupplierID DESC' THEN '[ASM_Suppliers11].[SupplierID] DESC'
                        WHEN 'ASM_Suppliers11_Description' THEN '[ASM_Suppliers11].[Description]'
                        WHEN 'ASM_Suppliers11_Description DESC' THEN '[ASM_Suppliers11].[Description] DESC'
                        WHEN 'HRM_Employees13_CardNo' THEN '[HRM_Employees13].[CardNo]'
                        WHEN 'HRM_Employees13_CardNo DESC' THEN '[HRM_Employees13].[CardNo] DESC'
                        WHEN 'HRM_Employees13_EmployeeName' THEN '[HRM_Employees13].[EmployeeName]'
                        WHEN 'HRM_Employees13_EmployeeName DESC' THEN '[HRM_Employees13].[EmployeeName] DESC'
                        WHEN 'HRM_Employees13_C_OfficeID' THEN '[HRM_Employees13].[C_OfficeID]'
                        WHEN 'HRM_Employees13_C_OfficeID DESC' THEN '[HRM_Employees13].[C_OfficeID] DESC'
                        WHEN 'HRM_Offices18_OfficeID' THEN '[HRM_Offices18].[OfficeID]'
                        WHEN 'HRM_Offices18_OfficeID DESC' THEN '[HRM_Offices18].[OfficeID] DESC'
                        WHEN 'HRM_Offices18_Description' THEN '[HRM_Offices18].[Description]'
                        WHEN 'HRM_Offices18_Description DESC' THEN '[HRM_Offices18].[Description] DESC'
                        ELSE '[ASM_AstDetails].[MrnID],[ASM_AstDetails].[AssetID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
