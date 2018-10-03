USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCSerialNoSelectListPagedByFilteres]
  @Filter_MrnID Int,
  @Filter_UserID Int,
  @Filter_LocationID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @Discarded Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  pcID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (pcID) ' + 
               'SELECT [AST_PCDetails].[pcID] FROM [AST_PCDetails] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_MrnPC] AS [AST_MrnPC1]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[MrnID] = [AST_MrnPC1].[MrnID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands2]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[pcBrandID] = [AST_Brands2].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[cpuBrandID] = [AST_Brands3].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams4]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[RamID] = [AST_Rams4].[RamID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[UserID] = [PRK_Employees5].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations6]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[LocationID] = [AST_Locations6].[LocationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees7]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[ModifiedBy] = [PRK_Employees7].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_MrnID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_PCDetails].[MrnID] = ' + STR(@Filter_MrnID)
  IF (@Filter_UserID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_PCDetails].[UserID] = ' + STR(@Filter_UserID)
  IF (@Filter_LocationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_PCDetails].[LocationID] = ' + STR(@Filter_LocationID)
  SET @LGSQL = @LGSQL + ' AND [AST_PCDetails].[Discarded] = ''' + CONVERT(NVarChar(10), @Discarded) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'pcID' THEN '[AST_PCDetails].[pcID]'
                        WHEN 'pcID DESC' THEN '[AST_PCDetails].[pcID] DESC'
                        WHEN 'MrnID' THEN '[AST_PCDetails].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[AST_PCDetails].[MrnID] DESC'
                        WHEN 'pcBrandID' THEN '[AST_PCDetails].[pcBrandID]'
                        WHEN 'pcBrandID DESC' THEN '[AST_PCDetails].[pcBrandID] DESC'
                        WHEN 'ModelNo' THEN '[AST_PCDetails].[ModelNo]'
                        WHEN 'ModelNo DESC' THEN '[AST_PCDetails].[ModelNo] DESC'
                        WHEN 'cpuBrandID' THEN '[AST_PCDetails].[cpuBrandID]'
                        WHEN 'cpuBrandID DESC' THEN '[AST_PCDetails].[cpuBrandID] DESC'
                        WHEN 'RamID' THEN '[AST_PCDetails].[RamID]'
                        WHEN 'RamID DESC' THEN '[AST_PCDetails].[RamID] DESC'
                        WHEN 'UserID' THEN '[AST_PCDetails].[UserID]'
                        WHEN 'UserID DESC' THEN '[AST_PCDetails].[UserID] DESC'
                        WHEN 'LocationID' THEN '[AST_PCDetails].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[AST_PCDetails].[LocationID] DESC'
                        WHEN 'IPAddress' THEN '[AST_PCDetails].[IPAddress]'
                        WHEN 'IPAddress DESC' THEN '[AST_PCDetails].[IPAddress] DESC'
                        WHEN 'SerialNo' THEN '[AST_PCDetails].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[AST_PCDetails].[SerialNo] DESC'
                        WHEN 'AssetNo' THEN '[AST_PCDetails].[AssetNo]'
                        WHEN 'AssetNo DESC' THEN '[AST_PCDetails].[AssetNo] DESC'
                        WHEN 'Discarded' THEN '[AST_PCDetails].[Discarded]'
                        WHEN 'Discarded DESC' THEN '[AST_PCDetails].[Discarded] DESC'
                        WHEN 'ModifiedBy' THEN '[AST_PCDetails].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[AST_PCDetails].[ModifiedBy] DESC'
                        WHEN 'ModifiedOn' THEN '[AST_PCDetails].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[AST_PCDetails].[ModifiedOn] DESC'
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
                        WHEN 'AST_Brands2_BrandID' THEN '[AST_Brands2].[BrandID]'
                        WHEN 'AST_Brands2_BrandID DESC' THEN '[AST_Brands2].[BrandID] DESC'
                        WHEN 'AST_Brands2_Description' THEN '[AST_Brands2].[Description]'
                        WHEN 'AST_Brands2_Description DESC' THEN '[AST_Brands2].[Description] DESC'
                        WHEN 'AST_Brands3_BrandID' THEN '[AST_Brands3].[BrandID]'
                        WHEN 'AST_Brands3_BrandID DESC' THEN '[AST_Brands3].[BrandID] DESC'
                        WHEN 'AST_Brands3_Description' THEN '[AST_Brands3].[Description]'
                        WHEN 'AST_Brands3_Description DESC' THEN '[AST_Brands3].[Description] DESC'
                        WHEN 'AST_Rams4_RamID' THEN '[AST_Rams4].[RamID]'
                        WHEN 'AST_Rams4_RamID DESC' THEN '[AST_Rams4].[RamID] DESC'
                        WHEN 'AST_Rams4_Description' THEN '[AST_Rams4].[Description]'
                        WHEN 'AST_Rams4_Description DESC' THEN '[AST_Rams4].[Description] DESC'
                        WHEN 'PRK_Employees5_EmployeeID' THEN '[PRK_Employees5].[EmployeeID]'
                        WHEN 'PRK_Employees5_EmployeeID DESC' THEN '[PRK_Employees5].[EmployeeID] DESC'
                        WHEN 'PRK_Employees5_CardNo' THEN '[PRK_Employees5].[CardNo]'
                        WHEN 'PRK_Employees5_CardNo DESC' THEN '[PRK_Employees5].[CardNo] DESC'
                        WHEN 'PRK_Employees5_EmployeeName' THEN '[PRK_Employees5].[EmployeeName]'
                        WHEN 'PRK_Employees5_EmployeeName DESC' THEN '[PRK_Employees5].[EmployeeName] DESC'
                        WHEN 'PRK_Employees5_PostedAt' THEN '[PRK_Employees5].[PostedAt]'
                        WHEN 'PRK_Employees5_PostedAt DESC' THEN '[PRK_Employees5].[PostedAt] DESC'
                        WHEN 'PRK_Employees5_Department' THEN '[PRK_Employees5].[Department]'
                        WHEN 'PRK_Employees5_Department DESC' THEN '[PRK_Employees5].[Department] DESC'
                        WHEN 'PRK_Employees5_Company' THEN '[PRK_Employees5].[Company]'
                        WHEN 'PRK_Employees5_Company DESC' THEN '[PRK_Employees5].[Company] DESC'
                        WHEN 'AST_Locations6_LocationID' THEN '[AST_Locations6].[LocationID]'
                        WHEN 'AST_Locations6_LocationID DESC' THEN '[AST_Locations6].[LocationID] DESC'
                        WHEN 'AST_Locations6_Descriptions' THEN '[AST_Locations6].[Descriptions]'
                        WHEN 'AST_Locations6_Descriptions DESC' THEN '[AST_Locations6].[Descriptions] DESC'
                        WHEN 'PRK_Employees7_EmployeeID' THEN '[PRK_Employees7].[EmployeeID]'
                        WHEN 'PRK_Employees7_EmployeeID DESC' THEN '[PRK_Employees7].[EmployeeID] DESC'
                        WHEN 'PRK_Employees7_CardNo' THEN '[PRK_Employees7].[CardNo]'
                        WHEN 'PRK_Employees7_CardNo DESC' THEN '[PRK_Employees7].[CardNo] DESC'
                        WHEN 'PRK_Employees7_EmployeeName' THEN '[PRK_Employees7].[EmployeeName]'
                        WHEN 'PRK_Employees7_EmployeeName DESC' THEN '[PRK_Employees7].[EmployeeName] DESC'
                        WHEN 'PRK_Employees7_PostedAt' THEN '[PRK_Employees7].[PostedAt]'
                        WHEN 'PRK_Employees7_PostedAt DESC' THEN '[PRK_Employees7].[PostedAt] DESC'
                        WHEN 'PRK_Employees7_Department' THEN '[PRK_Employees7].[Department]'
                        WHEN 'PRK_Employees7_Department DESC' THEN '[PRK_Employees7].[Department] DESC'
                        WHEN 'PRK_Employees7_Company' THEN '[PRK_Employees7].[Company]'
                        WHEN 'PRK_Employees7_Company DESC' THEN '[PRK_Employees7].[Company] DESC'
                        ELSE '[AST_PCDetails].[pcID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[AST_PCDetails].[pcID],
		[AST_PCDetails].[MrnID],
		[AST_PCDetails].[pcBrandID],
		[AST_PCDetails].[ModelNo],
		[AST_PCDetails].[cpuBrandID],
		[AST_PCDetails].[RamID],
		[AST_PCDetails].[UserID],
		[AST_PCDetails].[LocationID],
		[AST_PCDetails].[IPAddress],
		[AST_PCDetails].[SerialNo],
		[AST_PCDetails].[AssetNo],
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
		[AST_Brands3].[BrandID] AS AST_Brands3_BrandID,
		[AST_Brands3].[Description] AS AST_Brands3_Description,
		[AST_Rams4].[RamID] AS AST_Rams4_RamID,
		[AST_Rams4].[Description] AS AST_Rams4_Description,
		[PRK_Employees5].[EmployeeID] AS PRK_Employees5_EmployeeID,
		[PRK_Employees5].[CardNo] AS PRK_Employees5_CardNo,
		[PRK_Employees5].[EmployeeName] AS PRK_Employees5_EmployeeName,
		[PRK_Employees5].[PostedAt] AS PRK_Employees5_PostedAt,
		[PRK_Employees5].[Department] AS PRK_Employees5_Department,
		[PRK_Employees5].[Company] AS PRK_Employees5_Company,
		[AST_Locations6].[LocationID] AS AST_Locations6_LocationID,
		[AST_Locations6].[Descriptions] AS AST_Locations6_Descriptions,
		[PRK_Employees7].[EmployeeID] AS PRK_Employees7_EmployeeID,
		[PRK_Employees7].[CardNo] AS PRK_Employees7_CardNo,
		[PRK_Employees7].[EmployeeName] AS PRK_Employees7_EmployeeName,
		[PRK_Employees7].[PostedAt] AS PRK_Employees7_PostedAt,
		[PRK_Employees7].[Department] AS PRK_Employees7_Department,
		[PRK_Employees7].[Company] AS PRK_Employees7_Company 
  FROM [AST_PCDetails] 
    	INNER JOIN #PageIndex
          ON [AST_PCDetails].[pcID] = #PageIndex.pcID
  LEFT OUTER JOIN [AST_MrnPC] AS [AST_MrnPC1]
    ON [AST_PCDetails].[MrnID] = [AST_MrnPC1].[MrnID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands2]
    ON [AST_PCDetails].[pcBrandID] = [AST_Brands2].[BrandID]
  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands3]
    ON [AST_PCDetails].[cpuBrandID] = [AST_Brands3].[BrandID]
  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams4]
    ON [AST_PCDetails].[RamID] = [AST_Rams4].[RamID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees5]
    ON [AST_PCDetails].[UserID] = [PRK_Employees5].[EmployeeID]
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations6]
    ON [AST_PCDetails].[LocationID] = [AST_Locations6].[LocationID]
  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees7]
    ON [AST_PCDetails].[ModifiedBy] = [PRK_Employees7].[EmployeeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
