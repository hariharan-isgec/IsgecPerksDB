USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfSupplierSelectListSearch]
  @LoginID NVarChar(8),
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
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SupplierID NVarChar(9) NOT NULL
  )
  INSERT INTO #PageIndex (SupplierID)
  SELECT [PSF_Supplier].[SupplierID] FROM [PSF_Supplier]
 WHERE  
   ( 
         LOWER(ISNULL([PSF_Supplier].[SupplierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_Supplier].[SupplierName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_Supplier].[BankName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_Supplier].[BranchAddress],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_Supplier].[BankAccountNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_Supplier].[IFSCCode],'')) LIKE @KeyWord1
   ) 
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

  SELECT
    [PSF_Supplier].*  
  FROM [PSF_Supplier] 
      INNER JOIN #PageIndex
          ON [PSF_Supplier].[SupplierID] = #PageIndex.SupplierID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
