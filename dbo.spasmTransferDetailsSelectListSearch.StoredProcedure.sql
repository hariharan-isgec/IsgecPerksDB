USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmTransferDetailsSelectListSearch]
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
 ,TransferID Int NOT NULL
 ,MrnID Int NOT NULL
 ,AssetID Int NOT NULL
  )
  INSERT INTO #PageIndex (TransferID, MrnID, AssetID)
  SELECT [ASM_TransferDetails].[TransferID], [ASM_TransferDetails].[MrnID], [ASM_TransferDetails].[AssetID] FROM [ASM_TransferDetails]
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands1]
    ON [ASM_TransferDetails].[BrandID] = [ASM_AstBrands1].[BrandID]
  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes9]
    ON [ASM_TransferDetails].[AssetTypeID] = [ASM_AstTypes9].[AssetTypeID]
  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers10]
    ON [ASM_TransferDetails].[SupplierID] = [ASM_Suppliers10].[SupplierID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees12]
    ON [ASM_TransferDetails].[ModifiedBy] = [HRM_Employees12].[CardNo]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices15]
    ON [ASM_TransferDetails].[ToOfficeID] = [HRM_Offices15].[OfficeID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices16]
    ON [ASM_TransferDetails].[FromOfficeID] = [HRM_Offices16].[OfficeID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices17]
    ON [ASM_TransferDetails].[RecievedAt] = [HRM_Offices17].[OfficeID]
 WHERE  
   ( 
         STR(ISNULL([ASM_TransferDetails].[TransferID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[MrnID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[AssetID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[AssetTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[SupplierID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[ModelNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[OtherSpecifications],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[RecievedAt], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[AssetNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[AssetSerialNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[ToOfficeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferDetails].[FromOfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[ModifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferDetails].[ModificationRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands1].[BrandID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstBrands1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstTypes9].[AssetTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstTypes9].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_Suppliers10].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees12].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees12].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees12].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees12].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees12].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices15].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices15].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices15].[City],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices16].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices16].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices16].[City],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices17].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices17].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices17].[City],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'TransferID' THEN [ASM_TransferDetails].[TransferID] END,
     CASE @orderBy WHEN 'TransferID DESC' THEN [ASM_TransferDetails].[TransferID] END DESC,
     CASE @orderBy WHEN 'MrnID' THEN [ASM_TransferDetails].[MrnID] END,
     CASE @orderBy WHEN 'MrnID DESC' THEN [ASM_TransferDetails].[MrnID] END DESC,
     CASE @orderBy WHEN 'AssetID' THEN [ASM_TransferDetails].[AssetID] END,
     CASE @orderBy WHEN 'AssetID DESC' THEN [ASM_TransferDetails].[AssetID] END DESC,
     CASE @orderBy WHEN 'AssetTypeID' THEN [ASM_TransferDetails].[AssetTypeID] END,
     CASE @orderBy WHEN 'AssetTypeID DESC' THEN [ASM_TransferDetails].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'MrnDate' THEN [ASM_TransferDetails].[MrnDate] END,
     CASE @orderBy WHEN 'MrnDate DESC' THEN [ASM_TransferDetails].[MrnDate] END DESC,
     CASE @orderBy WHEN 'SupplierID' THEN [ASM_TransferDetails].[SupplierID] END,
     CASE @orderBy WHEN 'SupplierID DESC' THEN [ASM_TransferDetails].[SupplierID] END DESC,
     CASE @orderBy WHEN 'BrandID' THEN [ASM_TransferDetails].[BrandID] END,
     CASE @orderBy WHEN 'BrandID DESC' THEN [ASM_TransferDetails].[BrandID] END DESC,
     CASE @orderBy WHEN 'ModelNo' THEN [ASM_TransferDetails].[ModelNo] END,
     CASE @orderBy WHEN 'ModelNo DESC' THEN [ASM_TransferDetails].[ModelNo] END DESC,
     CASE @orderBy WHEN 'OtherSpecifications' THEN [ASM_TransferDetails].[OtherSpecifications] END,
     CASE @orderBy WHEN 'OtherSpecifications DESC' THEN [ASM_TransferDetails].[OtherSpecifications] END DESC,
     CASE @orderBy WHEN 'RecievedAt' THEN [ASM_TransferDetails].[RecievedAt] END,
     CASE @orderBy WHEN 'RecievedAt DESC' THEN [ASM_TransferDetails].[RecievedAt] END DESC,
     CASE @orderBy WHEN 'AssetNo' THEN [ASM_TransferDetails].[AssetNo] END,
     CASE @orderBy WHEN 'AssetNo DESC' THEN [ASM_TransferDetails].[AssetNo] END DESC,
     CASE @orderBy WHEN 'AssetSerialNo' THEN [ASM_TransferDetails].[AssetSerialNo] END,
     CASE @orderBy WHEN 'AssetSerialNo DESC' THEN [ASM_TransferDetails].[AssetSerialNo] END DESC,
     CASE @orderBy WHEN 'Issued' THEN [ASM_TransferDetails].[Issued] END,
     CASE @orderBy WHEN 'Issued DESC' THEN [ASM_TransferDetails].[Issued] END DESC,
     CASE @orderBy WHEN 'Returnable' THEN [ASM_TransferDetails].[Returnable] END,
     CASE @orderBy WHEN 'Returnable DESC' THEN [ASM_TransferDetails].[Returnable] END DESC,
     CASE @orderBy WHEN 'ExpectedDate' THEN [ASM_TransferDetails].[ExpectedDate] END,
     CASE @orderBy WHEN 'ExpectedDate DESC' THEN [ASM_TransferDetails].[ExpectedDate] END DESC,
     CASE @orderBy WHEN 'Transferred' THEN [ASM_TransferDetails].[Transferred] END,
     CASE @orderBy WHEN 'Transferred DESC' THEN [ASM_TransferDetails].[Transferred] END DESC,
     CASE @orderBy WHEN 'ToOfficeID' THEN [ASM_TransferDetails].[ToOfficeID] END,
     CASE @orderBy WHEN 'ToOfficeID DESC' THEN [ASM_TransferDetails].[ToOfficeID] END DESC,
     CASE @orderBy WHEN 'RecievedTransfered' THEN [ASM_TransferDetails].[RecievedTransfered] END,
     CASE @orderBy WHEN 'RecievedTransfered DESC' THEN [ASM_TransferDetails].[RecievedTransfered] END DESC,
     CASE @orderBy WHEN 'FromOfficeID' THEN [ASM_TransferDetails].[FromOfficeID] END,
     CASE @orderBy WHEN 'FromOfficeID DESC' THEN [ASM_TransferDetails].[FromOfficeID] END DESC,
     CASE @orderBy WHEN 'OnRepair' THEN [ASM_TransferDetails].[OnRepair] END,
     CASE @orderBy WHEN 'OnRepair DESC' THEN [ASM_TransferDetails].[OnRepair] END DESC,
     CASE @orderBy WHEN 'Discarded' THEN [ASM_TransferDetails].[Discarded] END,
     CASE @orderBy WHEN 'Discarded DESC' THEN [ASM_TransferDetails].[Discarded] END DESC,
     CASE @orderBy WHEN 'Modified' THEN [ASM_TransferDetails].[Modified] END,
     CASE @orderBy WHEN 'Modified DESC' THEN [ASM_TransferDetails].[Modified] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [ASM_TransferDetails].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [ASM_TransferDetails].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [ASM_TransferDetails].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [ASM_TransferDetails].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'ModificationRemarks' THEN [ASM_TransferDetails].[ModificationRemarks] END,
     CASE @orderBy WHEN 'ModificationRemarks DESC' THEN [ASM_TransferDetails].[ModificationRemarks] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands1_BrandID' THEN [ASM_AstBrands1].[BrandID] END,
     CASE @orderBy WHEN 'ASM_AstBrands1_BrandID DESC' THEN [ASM_AstBrands1].[BrandID] END DESC,
     CASE @orderBy WHEN 'ASM_AstBrands1_Description' THEN [ASM_AstBrands1].[Description] END,
     CASE @orderBy WHEN 'ASM_AstBrands1_Description DESC' THEN [ASM_AstBrands1].[Description] END DESC,
     CASE @orderBy WHEN 'ASM_AstTypes9_AssetTypeID' THEN [ASM_AstTypes9].[AssetTypeID] END,
     CASE @orderBy WHEN 'ASM_AstTypes9_AssetTypeID DESC' THEN [ASM_AstTypes9].[AssetTypeID] END DESC,
     CASE @orderBy WHEN 'ASM_AstTypes9_Description' THEN [ASM_AstTypes9].[Description] END,
     CASE @orderBy WHEN 'ASM_AstTypes9_Description DESC' THEN [ASM_AstTypes9].[Description] END DESC,
     CASE @orderBy WHEN 'ASM_AstTypes9_IssueToLocation' THEN [ASM_AstTypes9].[IssueToLocation] END,
     CASE @orderBy WHEN 'ASM_AstTypes9_IssueToLocation DESC' THEN [ASM_AstTypes9].[IssueToLocation] END DESC,
     CASE @orderBy WHEN 'ASM_Suppliers10_SupplierID' THEN [ASM_Suppliers10].[SupplierID] END,
     CASE @orderBy WHEN 'ASM_Suppliers10_SupplierID DESC' THEN [ASM_Suppliers10].[SupplierID] END DESC,
     CASE @orderBy WHEN 'ASM_Suppliers10_Description' THEN [ASM_Suppliers10].[Description] END,
     CASE @orderBy WHEN 'ASM_Suppliers10_Description DESC' THEN [ASM_Suppliers10].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees12_CardNo' THEN [HRM_Employees12].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees12_CardNo DESC' THEN [HRM_Employees12].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees12_EmployeeName' THEN [HRM_Employees12].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees12_EmployeeName DESC' THEN [HRM_Employees12].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees12_C_OfficeID' THEN [HRM_Employees12].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees12_C_OfficeID DESC' THEN [HRM_Employees12].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices15_OfficeID' THEN [HRM_Offices15].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices15_OfficeID DESC' THEN [HRM_Offices15].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices15_Description' THEN [HRM_Offices15].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices15_Description DESC' THEN [HRM_Offices15].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices16_OfficeID' THEN [HRM_Offices16].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices16_OfficeID DESC' THEN [HRM_Offices16].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices16_Description' THEN [HRM_Offices16].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices16_Description DESC' THEN [HRM_Offices16].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices17_OfficeID' THEN [HRM_Offices17].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices17_OfficeID DESC' THEN [HRM_Offices17].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices17_Description' THEN [HRM_Offices17].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices17_Description DESC' THEN [HRM_Offices17].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ASM_TransferDetails].[TransferID],
		[ASM_TransferDetails].[MrnID],
		[ASM_TransferDetails].[AssetID],
		[ASM_TransferDetails].[AssetTypeID],
		[ASM_TransferDetails].[MrnDate],
		[ASM_TransferDetails].[SupplierID],
		[ASM_TransferDetails].[BrandID],
		[ASM_TransferDetails].[ModelNo],
		[ASM_TransferDetails].[OtherSpecifications],
		[ASM_TransferDetails].[RecievedAt],
		[ASM_TransferDetails].[AssetNo],
		[ASM_TransferDetails].[AssetSerialNo],
		[ASM_TransferDetails].[Issued],
		[ASM_TransferDetails].[Returnable],
		[ASM_TransferDetails].[ExpectedDate],
		[ASM_TransferDetails].[Transferred],
		[ASM_TransferDetails].[ToOfficeID],
		[ASM_TransferDetails].[RecievedTransfered],
		[ASM_TransferDetails].[FromOfficeID],
		[ASM_TransferDetails].[OnRepair],
		[ASM_TransferDetails].[Discarded],
		[ASM_TransferDetails].[Modified],
		[ASM_TransferDetails].[ModifiedOn],
		[ASM_TransferDetails].[ModifiedBy],
		[ASM_TransferDetails].[ModificationRemarks],
		[ASM_AstBrands1].[BrandID] AS ASM_AstBrands1_BrandID,
		[ASM_AstBrands1].[Description] AS ASM_AstBrands1_Description,
		[ASM_AstTypes9].[AssetTypeID] AS ASM_AstTypes9_AssetTypeID,
		[ASM_AstTypes9].[Description] AS ASM_AstTypes9_Description,
		[ASM_AstTypes9].[IssueToLocation] AS ASM_AstTypes9_IssueToLocation,
		[ASM_Suppliers10].[SupplierID] AS ASM_Suppliers10_SupplierID,
		[ASM_Suppliers10].[Description] AS ASM_Suppliers10_Description,
		[HRM_Employees12].[CardNo] AS HRM_Employees12_CardNo,
		[HRM_Employees12].[EmployeeName] AS HRM_Employees12_EmployeeName,
		[HRM_Employees12].[C_OfficeID] AS HRM_Employees12_C_OfficeID,
		[HRM_Offices15].[OfficeID] AS HRM_Offices15_OfficeID,
		[HRM_Offices15].[Description] AS HRM_Offices15_Description,
		[HRM_Offices16].[OfficeID] AS HRM_Offices16_OfficeID,
		[HRM_Offices16].[Description] AS HRM_Offices16_Description,
		[HRM_Offices17].[OfficeID] AS HRM_Offices17_OfficeID,
		[HRM_Offices17].[Description] AS HRM_Offices17_Description 
  FROM [ASM_TransferDetails] 
    	INNER JOIN #PageIndex
          ON [ASM_TransferDetails].[TransferID] = #PageIndex.TransferID
          AND [ASM_TransferDetails].[MrnID] = #PageIndex.MrnID
          AND [ASM_TransferDetails].[AssetID] = #PageIndex.AssetID
  LEFT OUTER JOIN [ASM_AstBrands] AS [ASM_AstBrands1]
    ON [ASM_TransferDetails].[BrandID] = [ASM_AstBrands1].[BrandID]
  INNER JOIN [ASM_AstTypes] AS [ASM_AstTypes9]
    ON [ASM_TransferDetails].[AssetTypeID] = [ASM_AstTypes9].[AssetTypeID]
  LEFT OUTER JOIN [ASM_Suppliers] AS [ASM_Suppliers10]
    ON [ASM_TransferDetails].[SupplierID] = [ASM_Suppliers10].[SupplierID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees12]
    ON [ASM_TransferDetails].[ModifiedBy] = [HRM_Employees12].[CardNo]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices15]
    ON [ASM_TransferDetails].[ToOfficeID] = [HRM_Offices15].[OfficeID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices16]
    ON [ASM_TransferDetails].[FromOfficeID] = [HRM_Offices16].[OfficeID]
  LEFT OUTER JOIN [HRM_Offices] AS [HRM_Offices17]
    ON [ASM_TransferDetails].[RecievedAt] = [HRM_Offices17].[OfficeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
