USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfSupplierSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PSF_Supplier].*  
  FROM [PSF_Supplier] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'SupplierID' THEN [PSF_Supplier].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [PSF_Supplier].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SupplierName' THEN [PSF_Supplier].[SupplierName] END,
     CASE @OrderBy WHEN 'SupplierName DESC' THEN [PSF_Supplier].[SupplierName] END DESC,
     CASE @OrderBy WHEN 'BankName' THEN [PSF_Supplier].[BankName] END,
     CASE @OrderBy WHEN 'BankName DESC' THEN [PSF_Supplier].[BankName] END DESC,
     CASE @OrderBy WHEN 'BranchAddress' THEN [PSF_Supplier].[BranchAddress] END,
     CASE @OrderBy WHEN 'BranchAddress DESC' THEN [PSF_Supplier].[BranchAddress] END DESC,
     CASE @OrderBy WHEN 'BankAccountNo' THEN [PSF_Supplier].[BankAccountNo] END,
     CASE @OrderBy WHEN 'BankAccountNo DESC' THEN [PSF_Supplier].[BankAccountNo] END DESC,
     CASE @OrderBy WHEN 'IFSCCode' THEN [PSF_Supplier].[IFSCCode] END,
     CASE @OrderBy WHEN 'IFSCCode DESC' THEN [PSF_Supplier].[IFSCCode] END DESC 
  SET @RecordCount = @@RowCount
GO
