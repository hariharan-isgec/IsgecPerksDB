USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfSupplierSelectListFilteres]
  @Filter_SupplierID NVarChar(9),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SupplierID NVarChar(9) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SupplierID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PSF_Supplier].[SupplierID]'
  SET @LGSQL = @LGSQL + ' FROM [PSF_Supplier] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SupplierID > '') 
    SET @LGSQL = @LGSQL + ' AND [PSF_Supplier].[SupplierID] = ''' + @Filter_SupplierID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SupplierID' THEN '[PSF_Supplier].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[PSF_Supplier].[SupplierID] DESC'
                        WHEN 'SupplierName' THEN '[PSF_Supplier].[SupplierName]'
                        WHEN 'SupplierName DESC' THEN '[PSF_Supplier].[SupplierName] DESC'
                        WHEN 'BankName' THEN '[PSF_Supplier].[BankName]'
                        WHEN 'BankName DESC' THEN '[PSF_Supplier].[BankName] DESC'
                        WHEN 'BranchAddress' THEN '[PSF_Supplier].[BranchAddress]'
                        WHEN 'BranchAddress DESC' THEN '[PSF_Supplier].[BranchAddress] DESC'
                        WHEN 'BankAccountNo' THEN '[PSF_Supplier].[BankAccountNo]'
                        WHEN 'BankAccountNo DESC' THEN '[PSF_Supplier].[BankAccountNo] DESC'
                        WHEN 'IFSCCode' THEN '[PSF_Supplier].[IFSCCode]'
                        WHEN 'IFSCCode DESC' THEN '[PSF_Supplier].[IFSCCode] DESC'
                        ELSE '[PSF_Supplier].[SupplierID]'
                    END
  EXEC (@LGSQL)

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
