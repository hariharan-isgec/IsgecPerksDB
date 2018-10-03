USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCDetailsSelectPrintByFilteres]
  @Filter_pcBrandID Int,
  @Filter_RamID Int,
  @Filter_UserID Int,
  @Filter_LocationID Int,
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands1]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[pcBrandID] = [AST_Brands1].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands2]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[cpuBrandID] = [AST_Brands2].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Rams] AS [AST_Rams3]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[RamID] = [AST_Rams3].[RamID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Brands] AS [AST_Brands4]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[vduBrandID] = [AST_Brands4].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Softwares] AS [AST_Softwares5]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[pcOSID] = [AST_Softwares5].[SoftwareID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees6]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[UserID] = [PRK_Employees6].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_MrnPC] AS [AST_MrnPC7]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[MrnID] = [AST_MrnPC7].[MrnID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations8]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[LocationID] = [AST_Locations8].[LocationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PRK_Employees] AS [PRK_Employees9]'
  SET @LGSQL = @LGSQL + '    ON [AST_PCDetails].[ModifiedBy] = [PRK_Employees9].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_pcBrandID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_PCDetails].[pcBrandID] = ' + STR(@Filter_pcBrandID)
  IF (@Filter_RamID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_PCDetails].[RamID] = ' + STR(@Filter_RamID)
  IF (@Filter_UserID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_PCDetails].[UserID] = ' + STR(@Filter_UserID)
  IF (@Filter_LocationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [AST_PCDetails].[LocationID] = ' + STR(@Filter_LocationID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'pcID' THEN '[AST_PCDetails].[pcID]'
                        WHEN 'pcID DESC' THEN '[AST_PCDetails].[pcID] DESC'
                        WHEN 'pcBrandID' THEN '[AST_PCDetails].[pcBrandID]'
                        WHEN 'pcBrandID DESC' THEN '[AST_PCDetails].[pcBrandID] DESC'
                        WHEN 'ModelNo' THEN '[AST_PCDetails].[ModelNo]'
                        WHEN 'ModelNo DESC' THEN '[AST_PCDetails].[ModelNo] DESC'
                        WHEN 'SerialNo' THEN '[AST_PCDetails].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[AST_PCDetails].[SerialNo] DESC'
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
                        WHEN 'IPAddress' THEN '[AST_PCDetails].[IPAddress]'
                        WHEN 'IPAddress DESC' THEN '[AST_PCDetails].[IPAddress] DESC'
                        WHEN 'HostName' THEN '[AST_PCDetails].[HostName]'
                        WHEN 'HostName DESC' THEN '[AST_PCDetails].[HostName] DESC'
                        WHEN 'INDomain' THEN '[AST_PCDetails].[INDomain]'
                        WHEN 'INDomain DESC' THEN '[AST_PCDetails].[INDomain] DESC'
                        WHEN 'DomainName' THEN '[AST_PCDetails].[DomainName]'
                        WHEN 'DomainName DESC' THEN '[AST_PCDetails].[DomainName] DESC'
                        WHEN 'pcUser' THEN '[AST_PCDetails].[pcUser]'
                        WHEN 'pcUser DESC' THEN '[AST_PCDetails].[pcUser] DESC'
                        WHEN 'UserID' THEN '[AST_PCDetails].[UserID]'
                        WHEN 'UserID DESC' THEN '[AST_PCDetails].[UserID] DESC'
                        WHEN 'MrnID' THEN '[AST_PCDetails].[MrnID]'
                        WHEN 'MrnID DESC' THEN '[AST_PCDetails].[MrnID] DESC'
                        WHEN 'AssetNo' THEN '[AST_PCDetails].[AssetNo]'
                        WHEN 'AssetNo DESC' THEN '[AST_PCDetails].[AssetNo] DESC'
                        WHEN 'LocationID' THEN '[AST_PCDetails].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[AST_PCDetails].[LocationID] DESC'
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
                        WHEN 'Issued' THEN '[AST_PCDetails].[Issued]'
                        WHEN 'Issued DESC' THEN '[AST_PCDetails].[Issued] DESC'
                        WHEN 'Discarded' THEN '[AST_PCDetails].[Discarded]'
                        WHEN 'Discarded DESC' THEN '[AST_PCDetails].[Discarded] DESC'
                        WHEN 'ModifiedBy' THEN '[AST_PCDetails].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[AST_PCDetails].[ModifiedBy] DESC'
                        WHEN 'ModifiedOn' THEN '[AST_PCDetails].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[AST_PCDetails].[ModifiedOn] DESC'
                        WHEN 'AST_Brands1_BrandID' THEN '[AST_Brands1].[BrandID]'
                        WHEN 'AST_Brands1_BrandID DESC' THEN '[AST_Brands1].[BrandID] DESC'
                        WHEN 'AST_Brands1_Description' THEN '[AST_Brands1].[Description]'
                        WHEN 'AST_Brands1_Description DESC' THEN '[AST_Brands1].[Description] DESC'
                        WHEN 'AST_Brands2_BrandID' THEN '[AST_Brands2].[BrandID]'
                        WHEN 'AST_Brands2_BrandID DESC' THEN '[AST_Brands2].[BrandID] DESC'
                        WHEN 'AST_Brands2_Description' THEN '[AST_Brands2].[Description]'
                        WHEN 'AST_Brands2_Description DESC' THEN '[AST_Brands2].[Description] DESC'
                        WHEN 'AST_Rams3_RamID' THEN '[AST_Rams3].[RamID]'
                        WHEN 'AST_Rams3_RamID DESC' THEN '[AST_Rams3].[RamID] DESC'
                        WHEN 'AST_Rams3_Description' THEN '[AST_Rams3].[Description]'
                        WHEN 'AST_Rams3_Description DESC' THEN '[AST_Rams3].[Description] DESC'
                        WHEN 'AST_Brands4_BrandID' THEN '[AST_Brands4].[BrandID]'
                        WHEN 'AST_Brands4_BrandID DESC' THEN '[AST_Brands4].[BrandID] DESC'
                        WHEN 'AST_Brands4_Description' THEN '[AST_Brands4].[Description]'
                        WHEN 'AST_Brands4_Description DESC' THEN '[AST_Brands4].[Description] DESC'
                        WHEN 'AST_Softwares5_SoftwareID' THEN '[AST_Softwares5].[SoftwareID]'
                        WHEN 'AST_Softwares5_SoftwareID DESC' THEN '[AST_Softwares5].[SoftwareID] DESC'
                        WHEN 'AST_Softwares5_Description' THEN '[AST_Softwares5].[Description]'
                        WHEN 'AST_Softwares5_Description DESC' THEN '[AST_Softwares5].[Description] DESC'
                        WHEN 'PRK_Employees6_EmployeeID' THEN '[PRK_Employees6].[EmployeeID]'
                        WHEN 'PRK_Employees6_EmployeeID DESC' THEN '[PRK_Employees6].[EmployeeID] DESC'
                        WHEN 'PRK_Employees6_CardNo' THEN '[PRK_Employees6].[CardNo]'
                        WHEN 'PRK_Employees6_CardNo DESC' THEN '[PRK_Employees6].[CardNo] DESC'
                        WHEN 'PRK_Employees6_EmployeeName' THEN '[PRK_Employees6].[EmployeeName]'
                        WHEN 'PRK_Employees6_EmployeeName DESC' THEN '[PRK_Employees6].[EmployeeName] DESC'
                        WHEN 'PRK_Employees6_PostedAt' THEN '[PRK_Employees6].[PostedAt]'
                        WHEN 'PRK_Employees6_PostedAt DESC' THEN '[PRK_Employees6].[PostedAt] DESC'
                        WHEN 'PRK_Employees6_Department' THEN '[PRK_Employees6].[Department]'
                        WHEN 'PRK_Employees6_Department DESC' THEN '[PRK_Employees6].[Department] DESC'
                        WHEN 'PRK_Employees6_Company' THEN '[PRK_Employees6].[Company]'
                        WHEN 'PRK_Employees6_Company DESC' THEN '[PRK_Employees6].[Company] DESC'
                        WHEN 'AST_MrnPC7_MrnID' THEN '[AST_MrnPC7].[MrnID]'
                        WHEN 'AST_MrnPC7_MrnID DESC' THEN '[AST_MrnPC7].[MrnID] DESC'
                        WHEN 'AST_MrnPC7_MrnDate' THEN '[AST_MrnPC7].[MrnDate]'
                        WHEN 'AST_MrnPC7_MrnDate DESC' THEN '[AST_MrnPC7].[MrnDate] DESC'
                        WHEN 'AST_MrnPC7_MrnDescription' THEN '[AST_MrnPC7].[MrnDescription]'
                        WHEN 'AST_MrnPC7_MrnDescription DESC' THEN '[AST_MrnPC7].[MrnDescription] DESC'
                        WHEN 'AST_MrnPC7_DateOfPurchase' THEN '[AST_MrnPC7].[DateOfPurchase]'
                        WHEN 'AST_MrnPC7_DateOfPurchase DESC' THEN '[AST_MrnPC7].[DateOfPurchase] DESC'
                        WHEN 'AST_MrnPC7_WarrantyTill' THEN '[AST_MrnPC7].[WarrantyTill]'
                        WHEN 'AST_MrnPC7_WarrantyTill DESC' THEN '[AST_MrnPC7].[WarrantyTill] DESC'
                        WHEN 'AST_MrnPC7_InsuranceTill' THEN '[AST_MrnPC7].[InsuranceTill]'
                        WHEN 'AST_MrnPC7_InsuranceTill DESC' THEN '[AST_MrnPC7].[InsuranceTill] DESC'
                        WHEN 'AST_MrnPC7_SupplierID' THEN '[AST_MrnPC7].[SupplierID]'
                        WHEN 'AST_MrnPC7_SupplierID DESC' THEN '[AST_MrnPC7].[SupplierID] DESC'
                        WHEN 'AST_MrnPC7_Keyboard' THEN '[AST_MrnPC7].[Keyboard]'
                        WHEN 'AST_MrnPC7_Keyboard DESC' THEN '[AST_MrnPC7].[Keyboard] DESC'
                        WHEN 'AST_MrnPC7_Mouse' THEN '[AST_MrnPC7].[Mouse]'
                        WHEN 'AST_MrnPC7_Mouse DESC' THEN '[AST_MrnPC7].[Mouse] DESC'
                        WHEN 'AST_MrnPC7_FloppyDrive' THEN '[AST_MrnPC7].[FloppyDrive]'
                        WHEN 'AST_MrnPC7_FloppyDrive DESC' THEN '[AST_MrnPC7].[FloppyDrive] DESC'
                        WHEN 'AST_MrnPC7_PurchasedQuantity' THEN '[AST_MrnPC7].[PurchasedQuantity]'
                        WHEN 'AST_MrnPC7_PurchasedQuantity DESC' THEN '[AST_MrnPC7].[PurchasedQuantity] DESC'
                        WHEN 'AST_MrnPC7_IssuedQuantity' THEN '[AST_MrnPC7].[IssuedQuantity]'
                        WHEN 'AST_MrnPC7_IssuedQuantity DESC' THEN '[AST_MrnPC7].[IssuedQuantity] DESC'
                        WHEN 'AST_MrnPC7_WriteoffQuantity' THEN '[AST_MrnPC7].[WriteoffQuantity]'
                        WHEN 'AST_MrnPC7_WriteoffQuantity DESC' THEN '[AST_MrnPC7].[WriteoffQuantity] DESC'
                        WHEN 'AST_MrnPC7_pcBrandID' THEN '[AST_MrnPC7].[pcBrandID]'
                        WHEN 'AST_MrnPC7_pcBrandID DESC' THEN '[AST_MrnPC7].[pcBrandID] DESC'
                        WHEN 'AST_MrnPC7_NoOfCPUs' THEN '[AST_MrnPC7].[NoOfCPUs]'
                        WHEN 'AST_MrnPC7_NoOfCPUs DESC' THEN '[AST_MrnPC7].[NoOfCPUs] DESC'
                        WHEN 'AST_MrnPC7_cpuBrandID' THEN '[AST_MrnPC7].[cpuBrandID]'
                        WHEN 'AST_MrnPC7_cpuBrandID DESC' THEN '[AST_MrnPC7].[cpuBrandID] DESC'
                        WHEN 'AST_MrnPC7_CPUModel' THEN '[AST_MrnPC7].[CPUModel]'
                        WHEN 'AST_MrnPC7_CPUModel DESC' THEN '[AST_MrnPC7].[CPUModel] DESC'
                        WHEN 'AST_MrnPC7_RamID' THEN '[AST_MrnPC7].[RamID]'
                        WHEN 'AST_MrnPC7_RamID DESC' THEN '[AST_MrnPC7].[RamID] DESC'
                        WHEN 'AST_MrnPC7_NoOfHDDs' THEN '[AST_MrnPC7].[NoOfHDDs]'
                        WHEN 'AST_MrnPC7_NoOfHDDs DESC' THEN '[AST_MrnPC7].[NoOfHDDs] DESC'
                        WHEN 'AST_MrnPC7_TotalHDDGB' THEN '[AST_MrnPC7].[TotalHDDGB]'
                        WHEN 'AST_MrnPC7_TotalHDDGB DESC' THEN '[AST_MrnPC7].[TotalHDDGB] DESC'
                        WHEN 'AST_MrnPC7_HDDDetails' THEN '[AST_MrnPC7].[HDDDetails]'
                        WHEN 'AST_MrnPC7_HDDDetails DESC' THEN '[AST_MrnPC7].[HDDDetails] DESC'
                        WHEN 'AST_MrnPC7_NoOfCDROMs' THEN '[AST_MrnPC7].[NoOfCDROMs]'
                        WHEN 'AST_MrnPC7_NoOfCDROMs DESC' THEN '[AST_MrnPC7].[NoOfCDROMs] DESC'
                        WHEN 'AST_MrnPC7_CDRomDetails' THEN '[AST_MrnPC7].[CDRomDetails]'
                        WHEN 'AST_MrnPC7_CDRomDetails DESC' THEN '[AST_MrnPC7].[CDRomDetails] DESC'
                        WHEN 'AST_MrnPC7_vduBrandID' THEN '[AST_MrnPC7].[vduBrandID]'
                        WHEN 'AST_MrnPC7_vduBrandID DESC' THEN '[AST_MrnPC7].[vduBrandID] DESC'
                        WHEN 'AST_MrnPC7_pcOSID' THEN '[AST_MrnPC7].[pcOSID]'
                        WHEN 'AST_MrnPC7_pcOSID DESC' THEN '[AST_MrnPC7].[pcOSID] DESC'
                        WHEN 'AST_MrnPC7_pcOSDetails' THEN '[AST_MrnPC7].[pcOSDetails]'
                        WHEN 'AST_MrnPC7_pcOSDetails DESC' THEN '[AST_MrnPC7].[pcOSDetails] DESC'
                        WHEN 'AST_MrnPC7_Remarks' THEN '[AST_MrnPC7].[Remarks]'
                        WHEN 'AST_MrnPC7_Remarks DESC' THEN '[AST_MrnPC7].[Remarks] DESC'
                        WHEN 'AST_Locations8_LocationID' THEN '[AST_Locations8].[LocationID]'
                        WHEN 'AST_Locations8_LocationID DESC' THEN '[AST_Locations8].[LocationID] DESC'
                        WHEN 'AST_Locations8_Descriptions' THEN '[AST_Locations8].[Descriptions]'
                        WHEN 'AST_Locations8_Descriptions DESC' THEN '[AST_Locations8].[Descriptions] DESC'
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
  ORDER BY
    #PageIndex.IndexID
  END
GO
