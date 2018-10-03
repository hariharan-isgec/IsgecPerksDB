USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmTransferDetailsSelectByID]
  @TransferID Int,
  @MrnID Int,
  @AssetID Int 
  AS
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
  [ASM_TransferDetails].[TransferID] = @TransferID
  AND [ASM_TransferDetails].[MrnID] = @MrnID
  AND [ASM_TransferDetails].[AssetID] = @AssetID
GO
