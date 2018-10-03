USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCConfigurationSelectListPagedByFilteres]
  @Filter_MrnID Int,
  @Filter_LocationID Int,
  @Filter_UserID Int,
  @Filter_pcBrandID Int,
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations2]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[LocationID] = [AST_Locations2].[LocationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees3]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[UserID] = [PRK_Employees3].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[pcBrandID] = [AST_Brands4].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands5]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[cpuBrandID] = [AST_Brands5].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams6]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[RamID] = [AST_Rams6].[RamID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands7]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[vduBrandID] = [AST_Brands7].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Softwares] AS [AST_Softwares8]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[pcOSID] = [AST_Softwares8].[SoftwareID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees9]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[ModifiedBy] = [PRK_Employees9].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_MrnID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_PCDetails].[MrnID] = ' + STR(@Filter_MrnID)
  IF (@Filter_LocationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_PCDetails].[LocationID] = ' + STR(@Filter_LocationID)
  IF (@Filter_UserID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_PCDetails].[UserID] = ' + STR(@Filter_UserID)
  IF (@Filter_pcBrandID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_PCDetails].[pcBrandID] = ' + STR(@Filter_pcBrandID)
  SET @LGSQL = @LGSQL + ' AND [AST_PCDetails].[Discarded] = ''' + CONVERT(NVarChar(10), @Discarded) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'pcID' THEN '[AST_PCDetails].[pcID]'
                        WHEN 'pcID DESC' THEN '[AST_PCDetails].[pcID] DESC'
                        WHEN 'MrnID' THEN '[AST_PCDetails].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[AST_PCDetails].[MrnID] DESC'
                        WHEN 'SerialNo' THEN '[AST_PCDetails].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[AST_PCDetails].[SerialNo] DESC'
                        WHEN 'AssetNo' THEN '[AST_PCDetails].[AssetNo]'
                        WHEN 'AssetNo DESC' THEN '[AST_PCDetails].[AssetNo] DESC'
                        WHEN 'IPAddress' THEN '[AST_PCDetails].[IPAddress]'
                        WHEN 'IPAddress DESC' THEN '[AST_PCDetails].[IPAddress] DESC'
                        WHEN 'LocationID' THEN '[AST_PCDetails].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[AST_PCDetails].[LocationID] DESC'
                        WHEN 'pcUser' THEN '[AST_PCDetails].[pcUser]'
                        WHEN 'pcUser DESC' THEN '[AST_PCDetails].[pcUser] DESC'
                        WHEN 'UserID' THEN '[AST_PCDetails].[UserID]'
                        WHEN 'UserID DESC' THEN '[AST_PCDetails].[UserID] DESC'
                        WHEN 'pcBrandID' THEN '[AST_PCDetails].[pcBrandID]'
                        WHEN 'pcBrandID DESC' THEN '[AST_PCDetails].[pcBrandID] DESC'
                        WHEN 'ModelNo' THEN '[AST_PCDetails].[ModelNo]'
                        WHEN 'ModelNo DESC' THEN '[AST_PCDetails].[ModelNo] DESC'
                        WHEN 'NoOfCPUs' THEN '[AST_PCDetails].[NoOfCPUs]'
                        WHEN 'NoOfCPUs DESC' THEN '[AST_PCDetails].[NoOfCPUs] DESC'
                        WHEN 'cpuBrandID' THEN '[AST_PCDetails].[cpuBrandID]'
                        WHEN 'cpuBrandID DESC' THEN '[AST_PCDetails].[cpuBrandID] DESC'
                        WHEN 'CPUModel' THEN '[AST_PCDetails].[CPUModel]'
                        WHEN 'CPUModel DESC' THEN '[AST_PCDetails].[CPUModel] DESC'
                        WHEN 'RamID' THEN '[AST_PCDetails].[RamID]'
                        WHEN 'RamID DESC' THEN '[AST_PCDetails].[RamID] DESC'
                        WHEN 'NoOfHDDs' THEN '[AST_PCDetails].[NoOfHDDs]'
                        WHEN 'NoOfHDDs DESC' THEN '[AST_PCDetails].[NoOfHDDs] DESC'
                        WHEN 'TotalHDDGB' THEN '[AST_PCDetails].[TotalHDDGB]'
                        WHEN 'TotalHDDGB DESC' THEN '[AST_PCDetails].[TotalHDDGB] DESC'
                        WHEN 'HDDDetails' THEN '[AST_PCDetails].[HDDDetails]'
                        WHEN 'HDDDetails DESC' THEN '[AST_PCDetails].[HDDDetails] DESC'
                        WHEN 'NoOfCDROMs' THEN '[AST_PCDetails].[NoOfCDROMs]'
                        WHEN 'NoOfCDROMs DESC' THEN '[AST_PCDetails].[NoOfCDROMs] DESC'
                        WHEN 'CDRomDetails' THEN '[AST_PCDetails].[CDRomDetails]'
                        WHEN 'CDRomDetails DESC' THEN '[AST_PCDetails].[CDRomDetails] DESC'
                        WHEN 'vduBrandID' THEN '[AST_PCDetails].[vduBrandID]'
                        WHEN 'vduBrandID DESC' THEN '[AST_PCDetails].[vduBrandID] DESC'
                        WHEN 'vduSerialNo' THEN '[AST_PCDetails].[vduSerialNo]'
                        WHEN 'vduSerialNo DESC' THEN '[AST_PCDetails].[vduSerialNo] DESC'
                        WHEN 'pcOSID' THEN '[AST_PCDetails].[pcOSID]'
                        WHEN 'pcOSID DESC' THEN '[AST_PCDetails].[pcOSID] DESC'
                        WHEN 'pcOSDetails' THEN '[AST_PCDetails].[pcOSDetails]'
                        WHEN 'pcOSDetails DESC' THEN '[AST_PCDetails].[pcOSDetails] DESC'
                        WHEN 'HostName' THEN '[AST_PCDetails].[HostName]'
                        WHEN 'HostName DESC' THEN '[AST_PCDetails].[HostName] DESC'
                        WHEN 'INDomain' THEN '[AST_PCDetails].[INDomain]'
                        WHEN 'INDomain DESC' THEN '[AST_PCDetails].[INDomain] DESC'
                        WHEN 'DomainName' THEN '[AST_PCDetails].[DomainName]'
                        WHEN 'DomainName DESC' THEN '[AST_PCDetails].[DomainName] DESC'
                        WHEN 'MapDrive' THEN '[AST_PCDetails].[MapDrive]'
                        WHEN 'MapDrive DESC' THEN '[AST_PCDetails].[MapDrive] DESC'
                        WHEN 'PenDriveDisabled' THEN '[AST_PCDetails].[PenDriveDisabled]'
                        WHEN 'PenDriveDisabled DESC' THEN '[AST_PCDetails].[PenDriveDisabled] DESC'
                        WHEN 'CDRomDisabled' THEN '[AST_PCDetails].[CDRomDisabled]'
                        WHEN 'CDRomDisabled DESC' THEN '[AST_PCDetails].[CDRomDisabled] DESC'
                        WHEN 'InternetAccess' THEN '[AST_PCDetails].[InternetAccess]'
                        WHEN 'InternetAccess DESC' THEN '[AST_PCDetails].[InternetAccess] DESC'
                        WHEN 'Keyboard' THEN '[AST_PCDetails].[Keyboard]'
                        WHEN 'Keyboard DESC' THEN '[AST_PCDetails].[Keyboard] DESC'
                        WHEN 'Mouse' THEN '[AST_PCDetails].[Mouse]'
                        WHEN 'Mouse DESC' THEN '[AST_PCDetails].[Mouse] DESC'
                        WHEN 'FloppyDrive' THEN '[AST_PCDetails].[FloppyDrive]'
                        WHEN 'FloppyDrive DESC' THEN '[AST_PCDetails].[FloppyDrive] DESC'
                        WHEN 'Remarks' THEN '[AST_PCDetails].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[AST_PCDetails].[Remarks] DESC'
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
                        WHEN 'AST_Locations2_LocationID' THEN '[AST_Locations2].[LocationID]'
                        WHEN 'AST_Locations2_LocationID DESC' THEN '[AST_Locations2].[LocationID] DESC'
                        WHEN 'AST_Locations2_Descriptions' THEN '[AST_Locations2].[Descriptions]'
                        WHEN 'AST_Locations2_Descriptions DESC' THEN '[AST_Locations2].[Descriptions] DESC'
                        WHEN 'PRK_Employees3_EmployeeID' THEN '[PRK_Employees3].[EmployeeID]'
                        WHEN 'PRK_Employees3_EmployeeID DESC' THEN '[PRK_Employees3].[EmployeeID] DESC'
                        WHEN 'PRK_Employees3_CardNo' THEN '[PRK_Employees3].[CardNo]'
                        WHEN 'PRK_Employees3_CardNo DESC' THEN '[PRK_Employees3].[CardNo] DESC'
                        WHEN 'PRK_Employees3_EmployeeName' THEN '[PRK_Employees3].[EmployeeName]'
                        WHEN 'PRK_Employees3_EmployeeName DESC' THEN '[PRK_Employees3].[EmployeeName] DESC'
                        WHEN 'PRK_Employees3_PostedAt' THEN '[PRK_Employees3].[PostedAt]'
                        WHEN 'PRK_Employees3_PostedAt DESC' THEN '[PRK_Employees3].[PostedAt] DESC'
                        WHEN 'PRK_Employees3_Department' THEN '[PRK_Employees3].[Department]'
                        WHEN 'PRK_Employees3_Department DESC' THEN '[PRK_Employees3].[Department] DESC'
                        WHEN 'PRK_Employees3_Company' THEN '[PRK_Employees3].[Company]'
                        WHEN 'PRK_Employees3_Company DESC' THEN '[PRK_Employees3].[Company] DESC'
                        WHEN 'AST_Brands4_BrandID' THEN '[AST_Brands4].[BrandID]'
                        WHEN 'AST_Brands4_BrandID DESC' THEN '[AST_Brands4].[BrandID] DESC'
                        WHEN 'AST_Brands4_Description' THEN '[AST_Brands4].[Description]'
                        WHEN 'AST_Brands4_Description DESC' THEN '[AST_Brands4].[Description] DESC'
                        WHEN 'AST_Brands5_BrandID' THEN '[AST_Brands5].[BrandID]'
                        WHEN 'AST_Brands5_BrandID DESC' THEN '[AST_Brands5].[BrandID] DESC'
                        WHEN 'AST_Brands5_Description' THEN '[AST_Brands5].[Description]'
                        WHEN 'AST_Brands5_Description DESC' THEN '[AST_Brands5].[Description] DESC'
                        WHEN 'AST_Rams6_RamID' THEN '[AST_Rams6].[RamID]'
                        WHEN 'AST_Rams6_RamID DESC' THEN '[AST_Rams6].[RamID] DESC'
                        WHEN 'AST_Rams6_Description' THEN '[AST_Rams6].[Description]'
                        WHEN 'AST_Rams6_Description DESC' THEN '[AST_Rams6].[Description] DESC'
                        WHEN 'AST_Brands7_BrandID' THEN '[AST_Brands7].[BrandID]'
                        WHEN 'AST_Brands7_BrandID DESC' THEN '[AST_Brands7].[BrandID] DESC'
                        WHEN 'AST_Brands7_Description' THEN '[AST_Brands7].[Description]'
                        WHEN 'AST_Brands7_Description DESC' THEN '[AST_Brands7].[Description] DESC'
                        WHEN 'AST_Softwares8_SoftwareID' THEN '[AST_Softwares8].[SoftwareID]'
                        WHEN 'AST_Softwares8_SoftwareID DESC' THEN '[AST_Softwares8].[SoftwareID] DESC'
                        WHEN 'AST_Softwares8_Description' THEN '[AST_Softwares8].[Description]'
                        WHEN 'AST_Softwares8_Description DESC' THEN '[AST_Softwares8].[Description] DESC'
                        WHEN 'PRK_Employees9_EmployeeID' THEN '[PRK_Employees9].[EmployeeID]'
                        WHEN 'PRK_Employees9_EmployeeID DESC' THEN '[PRK_Employees9].[EmployeeID] DESC'
                        WHEN 'PRK_Employees9_CardNo' THEN '[PRK_Employees9].[CardNo]'
                        WHEN 'PRK_Employees9_CardNo DESC' THEN '[PRK_Employees9].[CardNo] DESC'
                        WHEN 'PRK_Employees9_EmployeeName' THEN '[PRK_Employees9].[EmployeeName]'
                        WHEN 'PRK_Employees9_EmployeeName DESC' THEN '[PRK_Employees9].[EmployeeName] DESC'
                        WHEN 'PRK_Employees9_PostedAt' THEN '[PRK_Employees9].[PostedAt]'
                        WHEN 'PRK_Employees9_PostedAt DESC' THEN '[PRK_Employees9].[PostedAt] DESC'
                        WHEN 'PRK_Employees9_Department' THEN '[PRK_Employees9].[Department]'
                        WHEN 'PRK_Employees9_Department DESC' THEN '[PRK_Employees9].[Department] DESC'
                        WHEN 'PRK_Employees9_Company' THEN '[PRK_Employees9].[Company]'
                        WHEN 'PRK_Employees9_Company DESC' THEN '[PRK_Employees9].[Company] DESC'
                        ELSE '[AST_PCDetails].[pcID]'
                    END
  EXEC (@LGSQL)

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
  END
GO
