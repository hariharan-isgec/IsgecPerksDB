USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCDiscardSelectListPaged]
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
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands2]
    ON [AST_PCDetails].[pcBrandID] = [AST_Brands2].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams3]
    ON [AST_PCDetails].[RamID] = [AST_Rams3].[RamID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations4]
    ON [AST_PCDetails].[LocationID] = [AST_Locations4].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [AST_PCDetails].[UserID] = [PRK_Employees5].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees6]
    ON [AST_PCDetails].[ModifiedBy] = [PRK_Employees6].[EmployeeID]
  WHERE [AST_PCDetails].[Discarded] = @Discarded
  ORDER BY
     CASE @orderBy WHEN 'pcID' THEN [AST_PCDetails].[pcID] END,
     CASE @orderBy WHEN 'pcID DESC' THEN [AST_PCDetails].[pcID] END DESC,
     CASE @orderBy WHEN 'MrnID' THEN [AST_PCDetails].[MrnID] END,
     CASE @orderBy WHEN 'MrnID DESC' THEN [AST_PCDetails].[MrnID] END DESC,
     CASE @orderBy WHEN 'pcBrandID' THEN [AST_PCDetails].[pcBrandID] END,
     CASE @orderBy WHEN 'pcBrandID DESC' THEN [AST_PCDetails].[pcBrandID] END DESC,
     CASE @orderBy WHEN 'CPUModel' THEN [AST_PCDetails].[CPUModel] END,
     CASE @orderBy WHEN 'CPUModel DESC' THEN [AST_PCDetails].[CPUModel] END DESC,
     CASE @orderBy WHEN 'RamID' THEN [AST_PCDetails].[RamID] END,
     CASE @orderBy WHEN 'RamID DESC' THEN [AST_PCDetails].[RamID] END DESC,
     CASE @orderBy WHEN 'TotalHDDGB' THEN [AST_PCDetails].[TotalHDDGB] END,
     CASE @orderBy WHEN 'TotalHDDGB DESC' THEN [AST_PCDetails].[TotalHDDGB] END DESC,
     CASE @orderBy WHEN 'IPAddress' THEN [AST_PCDetails].[IPAddress] END,
     CASE @orderBy WHEN 'IPAddress DESC' THEN [AST_PCDetails].[IPAddress] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [AST_PCDetails].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [AST_PCDetails].[SerialNo] END DESC,
     CASE @orderBy WHEN 'AssetNo' THEN [AST_PCDetails].[AssetNo] END,
     CASE @orderBy WHEN 'AssetNo DESC' THEN [AST_PCDetails].[AssetNo] END DESC,
     CASE @orderBy WHEN 'LocationID' THEN [AST_PCDetails].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [AST_PCDetails].[LocationID] END DESC,
     CASE @orderBy WHEN 'UserID' THEN [AST_PCDetails].[UserID] END,
     CASE @orderBy WHEN 'UserID DESC' THEN [AST_PCDetails].[UserID] END DESC,
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
     CASE @orderBy WHEN 'AST_Brands2_BrandID' THEN [AST_Brands2].[BrandID] END,
     CASE @orderBy WHEN 'AST_Brands2_BrandID DESC' THEN [AST_Brands2].[BrandID] END DESC,
     CASE @orderBy WHEN 'AST_Brands2_Description' THEN [AST_Brands2].[Description] END,
     CASE @orderBy WHEN 'AST_Brands2_Description DESC' THEN [AST_Brands2].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Rams3_RamID' THEN [AST_Rams3].[RamID] END,
     CASE @orderBy WHEN 'AST_Rams3_RamID DESC' THEN [AST_Rams3].[RamID] END DESC,
     CASE @orderBy WHEN 'AST_Rams3_Description' THEN [AST_Rams3].[Description] END,
     CASE @orderBy WHEN 'AST_Rams3_Description DESC' THEN [AST_Rams3].[Description] END DESC,
     CASE @orderBy WHEN 'AST_Locations4_LocationID' THEN [AST_Locations4].[LocationID] END,
     CASE @orderBy WHEN 'AST_Locations4_LocationID DESC' THEN [AST_Locations4].[LocationID] END DESC,
     CASE @orderBy WHEN 'AST_Locations4_Descriptions' THEN [AST_Locations4].[Descriptions] END,
     CASE @orderBy WHEN 'AST_Locations4_Descriptions DESC' THEN [AST_Locations4].[Descriptions] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_EmployeeID' THEN [PRK_Employees5].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees5_EmployeeID DESC' THEN [PRK_Employees5].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_CardNo' THEN [PRK_Employees5].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees5_CardNo DESC' THEN [PRK_Employees5].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_EmployeeName' THEN [PRK_Employees5].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees5_EmployeeName DESC' THEN [PRK_Employees5].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_PostedAt' THEN [PRK_Employees5].[PostedAt] END,
     CASE @orderBy WHEN 'PRK_Employees5_PostedAt DESC' THEN [PRK_Employees5].[PostedAt] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_Department' THEN [PRK_Employees5].[Department] END,
     CASE @orderBy WHEN 'PRK_Employees5_Department DESC' THEN [PRK_Employees5].[Department] END DESC,
     CASE @orderBy WHEN 'PRK_Employees5_Company' THEN [PRK_Employees5].[Company] END,
     CASE @orderBy WHEN 'PRK_Employees5_Company DESC' THEN [PRK_Employees5].[Company] END DESC,
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
     CASE @orderBy WHEN 'PRK_Employees6_Company DESC' THEN [PRK_Employees6].[Company] END DESC 

  SET @RecordCount = @@RowCount

  SELECT
		[AST_PCDetails].[pcID],
		[AST_PCDetails].[MrnID],
		[AST_PCDetails].[pcBrandID],
		[AST_PCDetails].[CPUModel],
		[AST_PCDetails].[RamID],
		[AST_PCDetails].[TotalHDDGB],
		[AST_PCDetails].[IPAddress],
		[AST_PCDetails].[SerialNo],
		[AST_PCDetails].[AssetNo],
		[AST_PCDetails].[LocationID],
		[AST_PCDetails].[UserID],
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
		[AST_Brands2].[BrandID] AS AST_Brands2_BrandID,
		[AST_Brands2].[Description] AS AST_Brands2_Description,
		[AST_Rams3].[RamID] AS AST_Rams3_RamID,
		[AST_Rams3].[Description] AS AST_Rams3_Description,
		[AST_Locations4].[LocationID] AS AST_Locations4_LocationID,
		[AST_Locations4].[Descriptions] AS AST_Locations4_Descriptions,
		[PRK_Employees5].[EmployeeID] AS PRK_Employees5_EmployeeID,
		[PRK_Employees5].[CardNo] AS PRK_Employees5_CardNo,
		[PRK_Employees5].[EmployeeName] AS PRK_Employees5_EmployeeName,
		[PRK_Employees5].[PostedAt] AS PRK_Employees5_PostedAt,
		[PRK_Employees5].[Department] AS PRK_Employees5_Department,
		[PRK_Employees5].[Company] AS PRK_Employees5_Company,
		[PRK_Employees6].[EmployeeID] AS PRK_Employees6_EmployeeID,
		[PRK_Employees6].[CardNo] AS PRK_Employees6_CardNo,
		[PRK_Employees6].[EmployeeName] AS PRK_Employees6_EmployeeName,
		[PRK_Employees6].[PostedAt] AS PRK_Employees6_PostedAt,
		[PRK_Employees6].[Department] AS PRK_Employees6_Department,
		[PRK_Employees6].[Company] AS PRK_Employees6_Company 
  FROM [AST_PCDetails] 
    	INNER JOIN #PageIndex
          ON [AST_PCDetails].[pcID] = #PageIndex.pcID
  LEFT OUTER JOIN [AST_MrnPC] AS [AST_MrnPC1]
    ON [AST_PCDetails].[MrnID] = [AST_MrnPC1].[MrnID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands2]
    ON [AST_PCDetails].[pcBrandID] = [AST_Brands2].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams3]
    ON [AST_PCDetails].[RamID] = [AST_Rams3].[RamID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations4]
    ON [AST_PCDetails].[LocationID] = [AST_Locations4].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [AST_PCDetails].[UserID] = [PRK_Employees5].[EmployeeID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees6]
    ON [AST_PCDetails].[ModifiedBy] = [PRK_Employees6].[EmployeeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
