USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlSuppliersSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[EITL_Suppliers].[SupplierID]'
  SET @LGSQL = @LGSQL + ' FROM [EITL_Suppliers] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SupplierID' THEN '[EITL_Suppliers].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[EITL_Suppliers].[SupplierID] DESC'
                        WHEN 'SupplierName' THEN '[EITL_Suppliers].[SupplierName]'
                        WHEN 'SupplierName DESC' THEN '[EITL_Suppliers].[SupplierName] DESC'
                        WHEN 'Address1' THEN '[EITL_Suppliers].[Address1]'
                        WHEN 'Address1 DESC' THEN '[EITL_Suppliers].[Address1] DESC'
                        WHEN 'Address2' THEN '[EITL_Suppliers].[Address2]'
                        WHEN 'Address2 DESC' THEN '[EITL_Suppliers].[Address2] DESC'
                        WHEN 'Address3' THEN '[EITL_Suppliers].[Address3]'
                        WHEN 'Address3 DESC' THEN '[EITL_Suppliers].[Address3] DESC'
                        WHEN 'Address4' THEN '[EITL_Suppliers].[Address4]'
                        WHEN 'Address4 DESC' THEN '[EITL_Suppliers].[Address4] DESC'
                        WHEN 'City' THEN '[EITL_Suppliers].[City]'
                        WHEN 'City DESC' THEN '[EITL_Suppliers].[City] DESC'
                        WHEN 'State' THEN '[EITL_Suppliers].[State]'
                        WHEN 'State DESC' THEN '[EITL_Suppliers].[State] DESC'
                        WHEN 'Country' THEN '[EITL_Suppliers].[Country]'
                        WHEN 'Country DESC' THEN '[EITL_Suppliers].[Country] DESC'
                        WHEN 'Zip' THEN '[EITL_Suppliers].[Zip]'
                        WHEN 'Zip DESC' THEN '[EITL_Suppliers].[Zip] DESC'
                        WHEN 'ContactPerson' THEN '[EITL_Suppliers].[ContactPerson]'
                        WHEN 'ContactPerson DESC' THEN '[EITL_Suppliers].[ContactPerson] DESC'
                        WHEN 'EMailID' THEN '[EITL_Suppliers].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[EITL_Suppliers].[EMailID] DESC'
                        WHEN 'ContactNo' THEN '[EITL_Suppliers].[ContactNo]'
                        WHEN 'ContactNo DESC' THEN '[EITL_Suppliers].[ContactNo] DESC'
                        ELSE '[EITL_Suppliers].[SupplierID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[EITL_Suppliers].[SupplierID] ,
		[EITL_Suppliers].[SupplierName] ,
		[EITL_Suppliers].[Address1] ,
		[EITL_Suppliers].[Address2] ,
		[EITL_Suppliers].[Address3] ,
		[EITL_Suppliers].[Address4] ,
		[EITL_Suppliers].[City] ,
		[EITL_Suppliers].[State] ,
		[EITL_Suppliers].[Country] ,
		[EITL_Suppliers].[Zip] ,
		[EITL_Suppliers].[ContactPerson] ,
		[EITL_Suppliers].[EMailID] ,
		[EITL_Suppliers].[ContactNo]  
  FROM [EITL_Suppliers] 
    	INNER JOIN #PageIndex
          ON [EITL_Suppliers].[SupplierID] = #PageIndex.SupplierID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
