USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstSerialsSelectListSearch]
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
   ( 
         STR(ISNULL([ASM_AstDetails].[MrnID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[AssetID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[AssetTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[MrnDescription],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[SupplierID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[ModelNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_AstDetails].[RecievedAt], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[AssetNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[AssetSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[ModifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CPUSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[HDDSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[CDROMSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[VDUSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[PCOSID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstDetails].[PCOSSerialNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands5].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands5].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstSoftwares9].[SoftwareID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstSoftwares9].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstTypes10].[AssetTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstTypes10].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_Suppliers11].[Description],'')) LIKE @KeyWord1
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
     CASE @orderBy WHEN 'DateOfPurchase' THEN [ASM_AstDetails].[DateOfPurchase] END,
     CASE @orderBy WHEN 'DateOfPurchase DESC' THEN [ASM_AstDetails].[DateOfPurchase] END DESC,
     CASE @orderBy WHEN 'BrandID' THEN [ASM_AstDetails].[BrandID] END,
     CASE @orderBy WHEN 'BrandID DESC' THEN [ASM_AstDetails].[BrandID] END DESC,
     CASE @orderBy WHEN 'ModelNo' THEN [ASM_AstDetails].[ModelNo] END,
     CASE @orderBy WHEN 'ModelNo DESC' THEN [ASM_AstDetails].[ModelNo] END DESC,
     CASE @orderBy WHEN 'RecievedAt' THEN [ASM_AstDetails].[RecievedAt] END,
     CASE @orderBy WHEN 'RecievedAt DESC' THEN [ASM_AstDetails].[RecievedAt] END DESC,
     CASE @orderBy WHEN 'RecievedOn' THEN [ASM_AstDetails].[RecievedOn] END,
     CASE @orderBy WHEN 'RecievedOn DESC' THEN [ASM_AstDetails].[RecievedOn] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ASM_AstDetails].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ASM_AstDetails].[Remarks] END DESC,
     CASE @orderBy WHEN 'AssetNo' THEN [ASM_AstDetails].[AssetNo] END,
     CASE @orderBy WHEN 'AssetNo DESC' THEN [ASM_AstDetails].[AssetNo] END DESC,
     CASE @orderBy WHEN 'AssetSerialNo' THEN [ASM_AstDetails].[AssetSerialNo] END,
     CASE @orderBy WHEN 'AssetSerialNo DESC' THEN [ASM_AstDetails].[AssetSerialNo] END DESC,
     CASE @orderBy WHEN 'Modified' THEN [ASM_AstDetails].[Modified] END,
     CASE @orderBy WHEN 'Modified DESC' THEN [ASM_AstDetails].[Modified] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [ASM_AstDetails].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [ASM_AstDetails].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [ASM_AstDetails].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [ASM_AstDetails].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'CPUSerialNo' THEN [ASM_AstDetails].[CPUSerialNo] END,
     CASE @orderBy WHEN 'CPUSerialNo DESC' THEN [ASM_AstDetails].[CPUSerialNo] END DESC,
     CASE @orderBy WHEN 'HDDSerialNo' THEN [ASM_AstDetails].[HDDSerialNo] END,
     CASE @orderBy WHEN 'HDDSerialNo DESC' THEN [ASM_AstDetails].[HDDSerialNo] END DESC,
     CASE @orderBy WHEN 'CDROMSerialNo' THEN [ASM_AstDetails].[CDROMSerialNo] END,
     CASE @orderBy WHEN 'CDROMSerialNo DESC' THEN [ASM_AstDetails].[CDROMSerialNo] END DESC,
     CASE @orderBy WHEN 'VDUSerialNo' THEN [ASM_AstDetails].[VDUSerialNo] END,
     CASE @orderBy WHEN 'VDUSerialNo DESC' THEN [ASM_AstDetails].[VDUSerialNo] END DESC,
     CASE @orderBy WHEN 'PCOSID' THEN [ASM_AstDetails].[PCOSID] END,
     CASE @orderBy WHEN 'PCOSID DESC' THEN [ASM_AstDetails].[PCOSID] END DESC,
     CASE @orderBy WHEN 'PCOSSerialNo' THEN [ASM_AstDetails].[PCOSSerialNo] END,
     CASE @orderBy WHEN 'PCOSSerialNo DESC' THEN [ASM_AstDetails].[PCOSSerialNo] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands5_BrandID' THEN [ASM_AstBrands5].[BrandID] END,
     CASE @orderBy WHEN 'ASM_AstBrands5_BrandID DESC' THEN [ASM_AstBrands5].[BrandID] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands5_Description' THEN [ASM_AstBrands5].[Description] END,
     CASE @orderBy WHEN 'ASM_AstBrands5_Description DESC' THEN [ASM_AstBrands5].[Description] END DESC,
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
