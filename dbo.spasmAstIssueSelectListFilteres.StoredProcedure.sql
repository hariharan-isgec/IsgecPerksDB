USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstIssueSelectListFilteres]
  @Filter_AssetTypeID NVarChar(10),
  @Filter_BrandID NVarChar(15),
  @Filter_RecievedAt Int,
  @StartRowIndex int,
  @MaximumRows int,
  @Issued Bit,
  @Transferred Bit,
  @OnRepair Bit,
  @Discarded Bit,
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands5]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[BrandID] = [ASM_AstBrands5].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstLocations] AS [ASM_AstLocations7]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[LocationID] = [ASM_AstLocations7].[LocationID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes10]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[AssetTypeID] = [ASM_AstTypes10].[AssetTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers11]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[SupplierID] = [ASM_Suppliers11].[SupplierID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees14]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[UserID] = [HRM_Employees14].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices18]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[RecievedAt] = [HRM_Offices18].[OfficeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_AssetTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [ASM_AstDetails].[AssetTypeID] = ''' + @Filter_AssetTypeID + ''''
  IF (@Filter_BrandID > '') 
    SET @LGSQL = @LGSQL + ' AND [ASM_AstDetails].[BrandID] = ''' + @Filter_BrandID + ''''
  IF (@Filter_RecievedAt > 0) 
    SET @LGSQL = @LGSQL + ' AND [ASM_AstDetails].[RecievedAt] = ' + STR(@Filter_RecievedAt)
  SET @LGSQL = @LGSQL + ' AND [ASM_AstDetails].[Issued] = ''' + CONVERT(NVarChar(10), @Issued) + ''''
  SET @LGSQL = @LGSQL + ' AND [ASM_AstDetails].[Transferred] = ''' + CONVERT(NVarChar(10), @Transferred) + ''''
  SET @LGSQL = @LGSQL + ' AND [ASM_AstDetails].[OnRepair] = ''' + CONVERT(NVarChar(10), @OnRepair) + ''''
  SET @LGSQL = @LGSQL + ' AND [ASM_AstDetails].[Discarded] = ''' + CONVERT(NVarChar(10), @Discarded) + ''''
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
                        WHEN 'SupplierID' THEN '[ASM_AstDetails].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[ASM_AstDetails].[SupplierID] DESC'
                        WHEN 'BrandID' THEN '[ASM_AstDetails].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[ASM_AstDetails].[BrandID] DESC'
                        WHEN 'ModelNo' THEN '[ASM_AstDetails].[ModelNo]'
                        WHEN 'ModelNo DESC' THEN '[ASM_AstDetails].[ModelNo] DESC'
                        WHEN 'RecievedAt' THEN '[ASM_AstDetails].[RecievedAt]'
                        WHEN 'RecievedAt DESC' THEN '[ASM_AstDetails].[RecievedAt] DESC'
                        WHEN 'AssetNo' THEN '[ASM_AstDetails].[AssetNo]'
                        WHEN 'AssetNo DESC' THEN '[ASM_AstDetails].[AssetNo] DESC'
                        WHEN 'AssetSerialNo' THEN '[ASM_AstDetails].[AssetSerialNo]'
                        WHEN 'AssetSerialNo DESC' THEN '[ASM_AstDetails].[AssetSerialNo] DESC'
                        WHEN 'IssueToLocation' THEN '[ASM_AstDetails].[IssueToLocation]'
                        WHEN 'IssueToLocation DESC' THEN '[ASM_AstDetails].[IssueToLocation] DESC'
                        WHEN 'UserID' THEN '[ASM_AstDetails].[UserID]'
                        WHEN 'UserID DESC' THEN '[ASM_AstDetails].[UserID] DESC'
                        WHEN 'LocationID' THEN '[ASM_AstDetails].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[ASM_AstDetails].[LocationID] DESC'
                        WHEN 'Issued' THEN '[ASM_AstDetails].[Issued]'
                        WHEN 'Issued DESC' THEN '[ASM_AstDetails].[Issued] DESC'
                        WHEN 'StandBy' THEN '[ASM_AstDetails].[StandBy]'
                        WHEN 'StandBy DESC' THEN '[ASM_AstDetails].[StandBy] DESC'
                        WHEN 'ReplacedTill' THEN '[ASM_AstDetails].[ReplacedTill]'
                        WHEN 'ReplacedTill DESC' THEN '[ASM_AstDetails].[ReplacedTill] DESC'
                        WHEN 'Transferred' THEN '[ASM_AstDetails].[Transferred]'
                        WHEN 'Transferred DESC' THEN '[ASM_AstDetails].[Transferred] DESC'
                        WHEN 'OnRepair' THEN '[ASM_AstDetails].[OnRepair]'
                        WHEN 'OnRepair DESC' THEN '[ASM_AstDetails].[OnRepair] DESC'
                        WHEN 'Discarded' THEN '[ASM_AstDetails].[Discarded]'
                        WHEN 'Discarded DESC' THEN '[ASM_AstDetails].[Discarded] DESC'
                        WHEN 'Modified' THEN '[ASM_AstDetails].[Modified]'
                        WHEN 'Modified DESC' THEN '[ASM_AstDetails].[Modified] DESC'
                        WHEN 'ModifiedOn' THEN '[ASM_AstDetails].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[ASM_AstDetails].[ModifiedOn] DESC'
                        WHEN 'ModifiedBy' THEN '[ASM_AstDetails].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[ASM_AstDetails].[ModifiedBy] DESC'
                        WHEN 'ModificationRemarks' THEN '[ASM_AstDetails].[ModificationRemarks]'
                        WHEN 'ModificationRemarks DESC' THEN '[ASM_AstDetails].[ModificationRemarks] DESC'
                        WHEN 'IPAddress' THEN '[ASM_AstDetails].[IPAddress]'
                        WHEN 'IPAddress DESC' THEN '[ASM_AstDetails].[IPAddress] DESC'
                        WHEN 'HostName' THEN '[ASM_AstDetails].[HostName]'
                        WHEN 'HostName DESC' THEN '[ASM_AstDetails].[HostName] DESC'
                        WHEN 'INDomain' THEN '[ASM_AstDetails].[INDomain]'
                        WHEN 'INDomain DESC' THEN '[ASM_AstDetails].[INDomain] DESC'
                        WHEN 'DomainName' THEN '[ASM_AstDetails].[DomainName]'
                        WHEN 'DomainName DESC' THEN '[ASM_AstDetails].[DomainName] DESC'
                        WHEN 'MapDrive' THEN '[ASM_AstDetails].[MapDrive]'
                        WHEN 'MapDrive DESC' THEN '[ASM_AstDetails].[MapDrive] DESC'
                        WHEN 'PenDriveDisable' THEN '[ASM_AstDetails].[PenDriveDisable]'
                        WHEN 'PenDriveDisable DESC' THEN '[ASM_AstDetails].[PenDriveDisable] DESC'
                        WHEN 'CDROMDisable' THEN '[ASM_AstDetails].[CDROMDisable]'
                        WHEN 'CDROMDisable DESC' THEN '[ASM_AstDetails].[CDROMDisable] DESC'
                        WHEN 'InternetAccess' THEN '[ASM_AstDetails].[InternetAccess]'
                        WHEN 'InternetAccess DESC' THEN '[ASM_AstDetails].[InternetAccess] DESC'
                        WHEN 'ASM_AstBrands5_BrandID' THEN '[ASM_AstBrands5].[BrandID]'
                        WHEN 'ASM_AstBrands5_BrandID DESC' THEN '[ASM_AstBrands5].[BrandID] DESC'
                        WHEN 'ASM_AstBrands5_Description' THEN '[ASM_AstBrands5].[Description]'
                        WHEN 'ASM_AstBrands5_Description DESC' THEN '[ASM_AstBrands5].[Description] DESC'
                        WHEN 'ASM_AstLocations7_LocationID' THEN '[ASM_AstLocations7].[LocationID]'
                        WHEN 'ASM_AstLocations7_LocationID DESC' THEN '[ASM_AstLocations7].[LocationID] DESC'
                        WHEN 'ASM_AstLocations7_Description' THEN '[ASM_AstLocations7].[Description]'
                        WHEN 'ASM_AstLocations7_Description DESC' THEN '[ASM_AstLocations7].[Description] DESC'
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
                        WHEN 'HRM_Employees14_CardNo' THEN '[HRM_Employees14].[CardNo]'
                        WHEN 'HRM_Employees14_CardNo DESC' THEN '[HRM_Employees14].[CardNo] DESC'
                        WHEN 'HRM_Employees14_EmployeeName' THEN '[HRM_Employees14].[EmployeeName]'
                        WHEN 'HRM_Employees14_EmployeeName DESC' THEN '[HRM_Employees14].[EmployeeName] DESC'
                        WHEN 'HRM_Employees14_C_OfficeID' THEN '[HRM_Employees14].[C_OfficeID]'
                        WHEN 'HRM_Employees14_C_OfficeID DESC' THEN '[HRM_Employees14].[C_OfficeID] DESC'
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
		[ASM_AstDetails].[SupplierID],
		[ASM_AstDetails].[BrandID],
		[ASM_AstDetails].[ModelNo],
		[ASM_AstDetails].[RecievedAt],
		[ASM_AstDetails].[AssetNo],
		[ASM_AstDetails].[AssetSerialNo],
		[ASM_AstDetails].[IssueToLocation],
		[ASM_AstDetails].[UserID],
		[ASM_AstDetails].[LocationID],
		[ASM_AstDetails].[Issued],
		[ASM_AstDetails].[StandBy],
		[ASM_AstDetails].[ReplacedTill],
		[ASM_AstDetails].[Transferred],
		[ASM_AstDetails].[OnRepair],
		[ASM_AstDetails].[Discarded],
		[ASM_AstDetails].[Modified],
		[ASM_AstDetails].[ModifiedOn],
		[ASM_AstDetails].[ModifiedBy],
		[ASM_AstDetails].[ModificationRemarks],
		[ASM_AstDetails].[IPAddress],
		[ASM_AstDetails].[HostName],
		[ASM_AstDetails].[INDomain],
		[ASM_AstDetails].[DomainName],
		[ASM_AstDetails].[MapDrive],
		[ASM_AstDetails].[PenDriveDisable],
		[ASM_AstDetails].[CDROMDisable],
		[ASM_AstDetails].[InternetAccess],
		[ASM_AstBrands5].[BrandID] AS ASM_AstBrands5_BrandID,
		[ASM_AstBrands5].[Description] AS ASM_AstBrands5_Description,
		[ASM_AstLocations7].[LocationID] AS ASM_AstLocations7_LocationID,
		[ASM_AstLocations7].[Description] AS ASM_AstLocations7_Description,
		[ASM_AstTypes10].[AssetTypeID] AS ASM_AstTypes10_AssetTypeID,
		[ASM_AstTypes10].[Description] AS ASM_AstTypes10_Description,
		[ASM_AstTypes10].[IssueToLocation] AS ASM_AstTypes10_IssueToLocation,
		[ASM_Suppliers11].[SupplierID] AS ASM_Suppliers11_SupplierID,
		[ASM_Suppliers11].[Description] AS ASM_Suppliers11_Description,
		[HRM_Employees14].[CardNo] AS HRM_Employees14_CardNo,
		[HRM_Employees14].[EmployeeName] AS HRM_Employees14_EmployeeName,
		[HRM_Employees14].[C_OfficeID] AS HRM_Employees14_C_OfficeID,
		[HRM_Offices18].[OfficeID] AS HRM_Offices18_OfficeID,
		[HRM_Offices18].[Description] AS HRM_Offices18_Description 
  FROM [ASM_AstDetails] 
    	INNER JOIN #PageIndex
          ON [ASM_AstDetails].[MrnID] = #PageIndex.MrnID
          AND [ASM_AstDetails].[AssetID] = #PageIndex.AssetID
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands5]
    ON [ASM_AstDetails].[BrandID] = [ASM_AstBrands5].[BrandID]
  LEFT OUTER JOIN [ASM_AstLocations] AS [ASM_AstLocations7]
    ON [ASM_AstDetails].[LocationID] = [ASM_AstLocations7].[LocationID]
  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes10]
    ON [ASM_AstDetails].[AssetTypeID] = [ASM_AstTypes10].[AssetTypeID]
  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers11]
    ON [ASM_AstDetails].[SupplierID] = [ASM_Suppliers11].[SupplierID]
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
