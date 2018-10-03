USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCReceiptsSelectListPagedByFilteres]
  @Filter_SupplierID Int,
  @Filter_pcBrandID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  MrnID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (MrnID) ' + 
               'SELECT [AST_MrnPC].[MrnID] FROM [AST_MrnPC] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [AST_MrnPC] AS [AST_MrnPC1]'
  SET @LGSQL = @LGSQL + '    ON [AST_MrnPC].[MrnID] = [AST_MrnPC1].[MrnID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [AST_Suppliers] AS [AST_Suppliers2]'
  SET @LGSQL = @LGSQL + '    ON [AST_MrnPC].[SupplierID] = [AST_Suppliers2].[SupplierID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]'
  SET @LGSQL = @LGSQL + '    ON [AST_MrnPC].[pcBrandID] = [AST_Brands3].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]'
  SET @LGSQL = @LGSQL + '    ON [AST_MrnPC].[cpuBrandID] = [AST_Brands4].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams5]'
  SET @LGSQL = @LGSQL + '    ON [AST_MrnPC].[RamID] = [AST_Rams5].[RamID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands6]'
  SET @LGSQL = @LGSQL + '    ON [AST_MrnPC].[vduBrandID] = [AST_Brands6].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Softwares] AS [AST_Softwares7]'
  SET @LGSQL = @LGSQL + '    ON [AST_MrnPC].[pcOSID] = [AST_Softwares7].[SoftwareID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SupplierID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_MrnPC].[SupplierID] = ' + STR(@Filter_SupplierID)
  IF (@Filter_pcBrandID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_MrnPC].[pcBrandID] = ' + STR(@Filter_pcBrandID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'MrnID' THEN '[AST_MrnPC].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[AST_MrnPC].[MrnID] DESC'
                        WHEN 'MrnDate' THEN '[AST_MrnPC].[MrnDate]'
                        WHEN 'MrnDate DESC' THEN '[AST_MrnPC].[MrnDate] DESC'
                        WHEN 'MrnDescription' THEN '[AST_MrnPC].[MrnDescription]'
                        WHEN 'MrnDescription DESC' THEN '[AST_MrnPC].[MrnDescription] DESC'
                        WHEN 'DateOfPurchase' THEN '[AST_MrnPC].[DateOfPurchase]'
                        WHEN 'DateOfPurchase DESC' THEN '[AST_MrnPC].[DateOfPurchase] DESC'
                        WHEN 'WarrantyTill' THEN '[AST_MrnPC].[WarrantyTill]'
                        WHEN 'WarrantyTill DESC' THEN '[AST_MrnPC].[WarrantyTill] DESC'
                        WHEN 'InsuranceTill' THEN '[AST_MrnPC].[InsuranceTill]'
                        WHEN 'InsuranceTill DESC' THEN '[AST_MrnPC].[InsuranceTill] DESC'
                        WHEN 'SupplierID' THEN '[AST_MrnPC].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[AST_MrnPC].[SupplierID] DESC'
                        WHEN 'Keyboard' THEN '[AST_MrnPC].[Keyboard]'
                        WHEN 'Keyboard DESC' THEN '[AST_MrnPC].[Keyboard] DESC'
                        WHEN 'Mouse' THEN '[AST_MrnPC].[Mouse]'
                        WHEN 'Mouse DESC' THEN '[AST_MrnPC].[Mouse] DESC'
                        WHEN 'FloppyDrive' THEN '[AST_MrnPC].[FloppyDrive]'
                        WHEN 'FloppyDrive DESC' THEN '[AST_MrnPC].[FloppyDrive] DESC'
                        WHEN 'PurchasedQuantity' THEN '[AST_MrnPC].[PurchasedQuantity]'
                        WHEN 'PurchasedQuantity DESC' THEN '[AST_MrnPC].[PurchasedQuantity] DESC'
                        WHEN 'IssuedQuantity' THEN '[AST_MrnPC].[IssuedQuantity]'
                        WHEN 'IssuedQuantity DESC' THEN '[AST_MrnPC].[IssuedQuantity] DESC'
                        WHEN 'WriteoffQuantity' THEN '[AST_MrnPC].[WriteoffQuantity]'
                        WHEN 'WriteoffQuantity DESC' THEN '[AST_MrnPC].[WriteoffQuantity] DESC'
                        WHEN 'pcBrandID' THEN '[AST_MrnPC].[pcBrandID]'
                        WHEN 'pcBrandID DESC' THEN '[AST_MrnPC].[pcBrandID] DESC'
                        WHEN 'NoOfCPUs' THEN '[AST_MrnPC].[NoOfCPUs]'
                        WHEN 'NoOfCPUs DESC' THEN '[AST_MrnPC].[NoOfCPUs] DESC'
                        WHEN 'cpuBrandID' THEN '[AST_MrnPC].[cpuBrandID]'
                        WHEN 'cpuBrandID DESC' THEN '[AST_MrnPC].[cpuBrandID] DESC'
                        WHEN 'CPUModel' THEN '[AST_MrnPC].[CPUModel]'
                        WHEN 'CPUModel DESC' THEN '[AST_MrnPC].[CPUModel] DESC'
                        WHEN 'RamID' THEN '[AST_MrnPC].[RamID]'
                        WHEN 'RamID DESC' THEN '[AST_MrnPC].[RamID] DESC'
                        WHEN 'NoOfHDDs' THEN '[AST_MrnPC].[NoOfHDDs]'
                        WHEN 'NoOfHDDs DESC' THEN '[AST_MrnPC].[NoOfHDDs] DESC'
                        WHEN 'TotalHDDGB' THEN '[AST_MrnPC].[TotalHDDGB]'
                        WHEN 'TotalHDDGB DESC' THEN '[AST_MrnPC].[TotalHDDGB] DESC'
                        WHEN 'HDDDetails' THEN '[AST_MrnPC].[HDDDetails]'
                        WHEN 'HDDDetails DESC' THEN '[AST_MrnPC].[HDDDetails] DESC'
                        WHEN 'NoOfCDROMs' THEN '[AST_MrnPC].[NoOfCDROMs]'
                        WHEN 'NoOfCDROMs DESC' THEN '[AST_MrnPC].[NoOfCDROMs] DESC'
                        WHEN 'CDRomDetails' THEN '[AST_MrnPC].[CDRomDetails]'
                        WHEN 'CDRomDetails DESC' THEN '[AST_MrnPC].[CDRomDetails] DESC'
                        WHEN 'vduBrandID' THEN '[AST_MrnPC].[vduBrandID]'
                        WHEN 'vduBrandID DESC' THEN '[AST_MrnPC].[vduBrandID] DESC'
                        WHEN 'pcOSID' THEN '[AST_MrnPC].[pcOSID]'
                        WHEN 'pcOSID DESC' THEN '[AST_MrnPC].[pcOSID] DESC'
                        WHEN 'pcOSDetails' THEN '[AST_MrnPC].[pcOSDetails]'
                        WHEN 'pcOSDetails DESC' THEN '[AST_MrnPC].[pcOSDetails] DESC'
                        WHEN 'Remarks' THEN '[AST_MrnPC].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[AST_MrnPC].[Remarks] DESC'
                        WHEN 'AST_MrnPC1_MrnID' THEN '[AST_MrnPC1].[MrnID]'
                        WHEN 'AST_MrnPC1_MrnID DESC' THEN '[AST_MrnPC1].[MrnID] DESC'
                        WHEN 'AST_MrnPC1_MrnDate' THEN '[AST_MrnPC1].[MrnDate]'
                        WHEN 'AST_MrnPC1_MrnDate DESC' THEN '[AST_MrnPC1].[MrnDate] DESC'
                        WHEN 'AST_MrnPC1_MrnDescription' THEN '[AST_MrnPC1].[MrnDescription]'
                        WHEN 'AST_MrnPC1_MrnDescription DESC' THEN '[AST_MrnPC1].[MrnDescription] DESC'
                        WHEN 'AST_MrnPC1_DateOfPurchase' THEN '[AST_MrnPC1].[DateOfPurchase]'
                        WHEN 'AST_MrnPC1_DateOfPurchase DESC' THEN '[AST_MrnPC1].[DateOfPurchase] DESC'
                        WHEN 'AST_MrnPC1_WarrantyTill' THEN '[AST_MrnPC1].[WarrantyTill]'
                        WHEN 'AST_MrnPC1_WarrantyTill DESC' THEN '[AST_MrnPC1].[WarrantyTill] DESC'
                        WHEN 'AST_MrnPC1_InsuranceTill' THEN '[AST_MrnPC1].[InsuranceTill]'
                        WHEN 'AST_MrnPC1_InsuranceTill DESC' THEN '[AST_MrnPC1].[InsuranceTill] DESC'
                        WHEN 'AST_MrnPC1_SupplierID' THEN '[AST_MrnPC1].[SupplierID]'
                        WHEN 'AST_MrnPC1_SupplierID DESC' THEN '[AST_MrnPC1].[SupplierID] DESC'
                        WHEN 'AST_MrnPC1_Keyboard' THEN '[AST_MrnPC1].[Keyboard]'
                        WHEN 'AST_MrnPC1_Keyboard DESC' THEN '[AST_MrnPC1].[Keyboard] DESC'
                        WHEN 'AST_MrnPC1_Mouse' THEN '[AST_MrnPC1].[Mouse]'
                        WHEN 'AST_MrnPC1_Mouse DESC' THEN '[AST_MrnPC1].[Mouse] DESC'
                        WHEN 'AST_MrnPC1_FloppyDrive' THEN '[AST_MrnPC1].[FloppyDrive]'
                        WHEN 'AST_MrnPC1_FloppyDrive DESC' THEN '[AST_MrnPC1].[FloppyDrive] DESC'
                        WHEN 'AST_MrnPC1_PurchasedQuantity' THEN '[AST_MrnPC1].[PurchasedQuantity]'
                        WHEN 'AST_MrnPC1_PurchasedQuantity DESC' THEN '[AST_MrnPC1].[PurchasedQuantity] DESC'
                        WHEN 'AST_MrnPC1_IssuedQuantity' THEN '[AST_MrnPC1].[IssuedQuantity]'
                        WHEN 'AST_MrnPC1_IssuedQuantity DESC' THEN '[AST_MrnPC1].[IssuedQuantity] DESC'
                        WHEN 'AST_MrnPC1_WriteoffQuantity' THEN '[AST_MrnPC1].[WriteoffQuantity]'
                        WHEN 'AST_MrnPC1_WriteoffQuantity DESC' THEN '[AST_MrnPC1].[WriteoffQuantity] DESC'
                        WHEN 'AST_MrnPC1_pcBrandID' THEN '[AST_MrnPC1].[pcBrandID]'
                        WHEN 'AST_MrnPC1_pcBrandID DESC' THEN '[AST_MrnPC1].[pcBrandID] DESC'
                        WHEN 'AST_MrnPC1_NoOfCPUs' THEN '[AST_MrnPC1].[NoOfCPUs]'
                        WHEN 'AST_MrnPC1_NoOfCPUs DESC' THEN '[AST_MrnPC1].[NoOfCPUs] DESC'
                        WHEN 'AST_MrnPC1_cpuBrandID' THEN '[AST_MrnPC1].[cpuBrandID]'
                        WHEN 'AST_MrnPC1_cpuBrandID DESC' THEN '[AST_MrnPC1].[cpuBrandID] DESC'
                        WHEN 'AST_MrnPC1_CPUModel' THEN '[AST_MrnPC1].[CPUModel]'
                        WHEN 'AST_MrnPC1_CPUModel DESC' THEN '[AST_MrnPC1].[CPUModel] DESC'
                        WHEN 'AST_MrnPC1_RamID' THEN '[AST_MrnPC1].[RamID]'
                        WHEN 'AST_MrnPC1_RamID DESC' THEN '[AST_MrnPC1].[RamID] DESC'
                        WHEN 'AST_MrnPC1_NoOfHDDs' THEN '[AST_MrnPC1].[NoOfHDDs]'
                        WHEN 'AST_MrnPC1_NoOfHDDs DESC' THEN '[AST_MrnPC1].[NoOfHDDs] DESC'
                        WHEN 'AST_MrnPC1_TotalHDDGB' THEN '[AST_MrnPC1].[TotalHDDGB]'
                        WHEN 'AST_MrnPC1_TotalHDDGB DESC' THEN '[AST_MrnPC1].[TotalHDDGB] DESC'
                        WHEN 'AST_MrnPC1_HDDDetails' THEN '[AST_MrnPC1].[HDDDetails]'
                        WHEN 'AST_MrnPC1_HDDDetails DESC' THEN '[AST_MrnPC1].[HDDDetails] DESC'
                        WHEN 'AST_MrnPC1_NoOfCDROMs' THEN '[AST_MrnPC1].[NoOfCDROMs]'
                        WHEN 'AST_MrnPC1_NoOfCDROMs DESC' THEN '[AST_MrnPC1].[NoOfCDROMs] DESC'
                        WHEN 'AST_MrnPC1_CDRomDetails' THEN '[AST_MrnPC1].[CDRomDetails]'
                        WHEN 'AST_MrnPC1_CDRomDetails DESC' THEN '[AST_MrnPC1].[CDRomDetails] DESC'
                        WHEN 'AST_MrnPC1_vduBrandID' THEN '[AST_MrnPC1].[vduBrandID]'
                        WHEN 'AST_MrnPC1_vduBrandID DESC' THEN '[AST_MrnPC1].[vduBrandID] DESC'
                        WHEN 'AST_MrnPC1_pcOSID' THEN '[AST_MrnPC1].[pcOSID]'
                        WHEN 'AST_MrnPC1_pcOSID DESC' THEN '[AST_MrnPC1].[pcOSID] DESC'
                        WHEN 'AST_MrnPC1_pcOSDetails' THEN '[AST_MrnPC1].[pcOSDetails]'
                        WHEN 'AST_MrnPC1_pcOSDetails DESC' THEN '[AST_MrnPC1].[pcOSDetails] DESC'
                        WHEN 'AST_MrnPC1_Remarks' THEN '[AST_MrnPC1].[Remarks]'
                        WHEN 'AST_MrnPC1_Remarks DESC' THEN '[AST_MrnPC1].[Remarks] DESC'
                        WHEN 'AST_Suppliers2_SupplierID' THEN '[AST_Suppliers2].[SupplierID]'
                        WHEN 'AST_Suppliers2_SupplierID DESC' THEN '[AST_Suppliers2].[SupplierID] DESC'
                        WHEN 'AST_Suppliers2_Description' THEN '[AST_Suppliers2].[Description]'
                        WHEN 'AST_Suppliers2_Description DESC' THEN '[AST_Suppliers2].[Description] DESC'
                        WHEN 'AST_Brands3_BrandID' THEN '[AST_Brands3].[BrandID]'
                        WHEN 'AST_Brands3_BrandID DESC' THEN '[AST_Brands3].[BrandID] DESC'
                        WHEN 'AST_Brands3_Description' THEN '[AST_Brands3].[Description]'
                        WHEN 'AST_Brands3_Description DESC' THEN '[AST_Brands3].[Description] DESC'
                        WHEN 'AST_Brands4_BrandID' THEN '[AST_Brands4].[BrandID]'
                        WHEN 'AST_Brands4_BrandID DESC' THEN '[AST_Brands4].[BrandID] DESC'
                        WHEN 'AST_Brands4_Description' THEN '[AST_Brands4].[Description]'
                        WHEN 'AST_Brands4_Description DESC' THEN '[AST_Brands4].[Description] DESC'
                        WHEN 'AST_Rams5_RamID' THEN '[AST_Rams5].[RamID]'
                        WHEN 'AST_Rams5_RamID DESC' THEN '[AST_Rams5].[RamID] DESC'
                        WHEN 'AST_Rams5_Description' THEN '[AST_Rams5].[Description]'
                        WHEN 'AST_Rams5_Description DESC' THEN '[AST_Rams5].[Description] DESC'
                        WHEN 'AST_Brands6_BrandID' THEN '[AST_Brands6].[BrandID]'
                        WHEN 'AST_Brands6_BrandID DESC' THEN '[AST_Brands6].[BrandID] DESC'
                        WHEN 'AST_Brands6_Description' THEN '[AST_Brands6].[Description]'
                        WHEN 'AST_Brands6_Description DESC' THEN '[AST_Brands6].[Description] DESC'
                        WHEN 'AST_Softwares7_SoftwareID' THEN '[AST_Softwares7].[SoftwareID]'
                        WHEN 'AST_Softwares7_SoftwareID DESC' THEN '[AST_Softwares7].[SoftwareID] DESC'
                        WHEN 'AST_Softwares7_Description' THEN '[AST_Softwares7].[Description]'
                        WHEN 'AST_Softwares7_Description DESC' THEN '[AST_Softwares7].[Description] DESC'
                        ELSE '[AST_MrnPC].[MrnID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [AST_MrnPC].[MrnID] = #PageIndex.MrnID
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
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
