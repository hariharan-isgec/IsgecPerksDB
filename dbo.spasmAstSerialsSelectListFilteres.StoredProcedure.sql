USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstSerialsSelectListFilteres]
  @Filter_SupplierID Int,
  @Filter_BrandID NVarChar(15),
  @Filter_RecievedAt Int,
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands5]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[BrandID] = [ASM_AstBrands5].[BrandID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstSoftwares] AS [ASM_AstSoftwares9]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[PCOSID] = [ASM_AstSoftwares9].[SoftwareID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes10]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[AssetTypeID] = [ASM_AstTypes10].[AssetTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers11]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[SupplierID] = [ASM_Suppliers11].[SupplierID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices18]'
  SET @LGSQL = @LGSQL + '    ON [ASM_AstDetails].[RecievedAt] = [HRM_Offices18].[OfficeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SupplierID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ASM_AstDetails].[SupplierID] = ' + STR(@Filter_SupplierID)
  IF (@Filter_BrandID > '') 
    SET @LGSQL = @LGSQL + ' AND [ASM_AstDetails].[BrandID] = ''' + @Filter_BrandID + ''''
  IF (@Filter_RecievedAt > 0) 
    SET @LGSQL = @LGSQL + ' AND [ASM_AstDetails].[RecievedAt] = ' + STR(@Filter_RecievedAt)
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
                        WHEN 'BrandID' THEN '[ASM_AstDetails].[BrandID]'
                        WHEN 'BrandID DESC' THEN '[ASM_AstDetails].[BrandID] DESC'
                        WHEN 'ModelNo' THEN '[ASM_AstDetails].[ModelNo]'
                        WHEN 'ModelNo DESC' THEN '[ASM_AstDetails].[ModelNo] DESC'
                        WHEN 'RecievedAt' THEN '[ASM_AstDetails].[RecievedAt]'
                        WHEN 'RecievedAt DESC' THEN '[ASM_AstDetails].[RecievedAt] DESC'
                        WHEN 'RecievedOn' THEN '[ASM_AstDetails].[RecievedOn]'
                        WHEN 'RecievedOn DESC' THEN '[ASM_AstDetails].[RecievedOn] DESC'
                        WHEN 'Remarks' THEN '[ASM_AstDetails].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ASM_AstDetails].[Remarks] DESC'
                        WHEN 'AssetNo' THEN '[ASM_AstDetails].[AssetNo]'
                        WHEN 'AssetNo DESC' THEN '[ASM_AstDetails].[AssetNo] DESC'
                        WHEN 'AssetSerialNo' THEN '[ASM_AstDetails].[AssetSerialNo]'
                        WHEN 'AssetSerialNo DESC' THEN '[ASM_AstDetails].[AssetSerialNo] DESC'
                        WHEN 'Modified' THEN '[ASM_AstDetails].[Modified]'
                        WHEN 'Modified DESC' THEN '[ASM_AstDetails].[Modified] DESC'
                        WHEN 'ModifiedOn' THEN '[ASM_AstDetails].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[ASM_AstDetails].[ModifiedOn] DESC'
                        WHEN 'ModifiedBy' THEN '[ASM_AstDetails].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[ASM_AstDetails].[ModifiedBy] DESC'
                        WHEN 'CPUSerialNo' THEN '[ASM_AstDetails].[CPUSerialNo]'
                        WHEN 'CPUSerialNo DESC' THEN '[ASM_AstDetails].[CPUSerialNo] DESC'
                        WHEN 'HDDSerialNo' THEN '[ASM_AstDetails].[HDDSerialNo]'
                        WHEN 'HDDSerialNo DESC' THEN '[ASM_AstDetails].[HDDSerialNo] DESC'
                        WHEN 'CDROMSerialNo' THEN '[ASM_AstDetails].[CDROMSerialNo]'
                        WHEN 'CDROMSerialNo DESC' THEN '[ASM_AstDetails].[CDROMSerialNo] DESC'
                        WHEN 'VDUSerialNo' THEN '[ASM_AstDetails].[VDUSerialNo]'
                        WHEN 'VDUSerialNo DESC' THEN '[ASM_AstDetails].[VDUSerialNo] DESC'
                        WHEN 'PCOSID' THEN '[ASM_AstDetails].[PCOSID]'
                        WHEN 'PCOSID DESC' THEN '[ASM_AstDetails].[PCOSID] DESC'
                        WHEN 'PCOSSerialNo' THEN '[ASM_AstDetails].[PCOSSerialNo]'
                        WHEN 'PCOSSerialNo DESC' THEN '[ASM_AstDetails].[PCOSSerialNo] DESC'
                        WHEN 'ASM_AstBrands5_BrandID' THEN '[ASM_AstBrands5].[BrandID]'
                        WHEN 'ASM_AstBrands5_BrandID DESC' THEN '[ASM_AstBrands5].[BrandID] DESC'
                        WHEN 'ASM_AstBrands5_Description' THEN '[ASM_AstBrands5].[Description]'
                        WHEN 'ASM_AstBrands5_Description DESC' THEN '[ASM_AstBrands5].[Description] DESC'
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
		[ASM_AstDetails].[BrandID],
		[ASM_AstDetails].[ModelNo],
		[ASM_AstDetails].[RecievedAt],
		[ASM_AstDetails].[RecievedOn],
		[ASM_AstDetails].[Remarks],
		[ASM_AstDetails].[AssetNo],
		[ASM_AstDetails].[AssetSerialNo],
		[ASM_AstDetails].[Modified],
		[ASM_AstDetails].[ModifiedOn],
		[ASM_AstDetails].[ModifiedBy],
		[ASM_AstDetails].[CPUSerialNo],
		[ASM_AstDetails].[HDDSerialNo],
		[ASM_AstDetails].[CDROMSerialNo],
		[ASM_AstDetails].[VDUSerialNo],
		[ASM_AstDetails].[PCOSID],
		[ASM_AstDetails].[PCOSSerialNo],
		[ASM_AstBrands5].[BrandID] AS ASM_AstBrands5_BrandID,
		[ASM_AstBrands5].[Description] AS ASM_AstBrands5_Description,
		[ASM_AstSoftwares9].[SoftwareID] AS ASM_AstSoftwares9_SoftwareID,
		[ASM_AstSoftwares9].[Description] AS ASM_AstSoftwares9_Description,
		[ASM_AstTypes10].[AssetTypeID] AS ASM_AstTypes10_AssetTypeID,
		[ASM_AstTypes10].[Description] AS ASM_AstTypes10_Description,
		[ASM_AstTypes10].[IssueToLocation] AS ASM_AstTypes10_IssueToLocation,
		[ASM_Suppliers11].[SupplierID] AS ASM_Suppliers11_SupplierID,
		[ASM_Suppliers11].[Description] AS ASM_Suppliers11_Description,
		[HRM_Offices18].[OfficeID] AS HRM_Offices18_OfficeID,
		[HRM_Offices18].[Description] AS HRM_Offices18_Description 
  FROM [ASM_AstDetails] 
    	INNER JOIN #PageIndex
          ON [ASM_AstDetails].[MrnID] = #PageIndex.MrnID
          AND [ASM_AstDetails].[AssetID] = #PageIndex.AssetID
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands5]
    ON [ASM_AstDetails].[BrandID] = [ASM_AstBrands5].[BrandID]
  LEFT OUTER JOIN [ASM_AstSoftwares] AS [ASM_AstSoftwares9]
    ON [ASM_AstDetails].[PCOSID] = [ASM_AstSoftwares9].[SoftwareID]
  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes10]
    ON [ASM_AstDetails].[AssetTypeID] = [ASM_AstTypes10].[AssetTypeID]
  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers11]
    ON [ASM_AstDetails].[SupplierID] = [ASM_Suppliers11].[SupplierID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices18]
    ON [ASM_AstDetails].[RecievedAt] = [HRM_Offices18].[OfficeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
