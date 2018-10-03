USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlSuppliersSelectListSearch]
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
  SELECT [EITL_Suppliers].[SupplierID] FROM [EITL_Suppliers]
 WHERE  
   ( 
         LOWER(ISNULL([EITL_Suppliers].[SupplierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_Suppliers].[SupplierName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_Suppliers].[Address1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_Suppliers].[Address2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_Suppliers].[Address3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_Suppliers].[Address4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_Suppliers].[City],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_Suppliers].[State],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_Suppliers].[Country],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_Suppliers].[Zip],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_Suppliers].[ContactPerson],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_Suppliers].[EMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_Suppliers].[ContactNo],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SupplierID' THEN [EITL_Suppliers].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [EITL_Suppliers].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SupplierName' THEN [EITL_Suppliers].[SupplierName] END,
     CASE @OrderBy WHEN 'SupplierName DESC' THEN [EITL_Suppliers].[SupplierName] END DESC,
     CASE @OrderBy WHEN 'Address1' THEN [EITL_Suppliers].[Address1] END,
     CASE @OrderBy WHEN 'Address1 DESC' THEN [EITL_Suppliers].[Address1] END DESC,
     CASE @OrderBy WHEN 'Address2' THEN [EITL_Suppliers].[Address2] END,
     CASE @OrderBy WHEN 'Address2 DESC' THEN [EITL_Suppliers].[Address2] END DESC,
     CASE @OrderBy WHEN 'Address3' THEN [EITL_Suppliers].[Address3] END,
     CASE @OrderBy WHEN 'Address3 DESC' THEN [EITL_Suppliers].[Address3] END DESC,
     CASE @OrderBy WHEN 'Address4' THEN [EITL_Suppliers].[Address4] END,
     CASE @OrderBy WHEN 'Address4 DESC' THEN [EITL_Suppliers].[Address4] END DESC,
     CASE @OrderBy WHEN 'City' THEN [EITL_Suppliers].[City] END,
     CASE @OrderBy WHEN 'City DESC' THEN [EITL_Suppliers].[City] END DESC,
     CASE @OrderBy WHEN 'State' THEN [EITL_Suppliers].[State] END,
     CASE @OrderBy WHEN 'State DESC' THEN [EITL_Suppliers].[State] END DESC,
     CASE @OrderBy WHEN 'Country' THEN [EITL_Suppliers].[Country] END,
     CASE @OrderBy WHEN 'Country DESC' THEN [EITL_Suppliers].[Country] END DESC,
     CASE @OrderBy WHEN 'Zip' THEN [EITL_Suppliers].[Zip] END,
     CASE @OrderBy WHEN 'Zip DESC' THEN [EITL_Suppliers].[Zip] END DESC,
     CASE @OrderBy WHEN 'ContactPerson' THEN [EITL_Suppliers].[ContactPerson] END,
     CASE @OrderBy WHEN 'ContactPerson DESC' THEN [EITL_Suppliers].[ContactPerson] END DESC,
     CASE @OrderBy WHEN 'EMailID' THEN [EITL_Suppliers].[EMailID] END,
     CASE @OrderBy WHEN 'EMailID DESC' THEN [EITL_Suppliers].[EMailID] END DESC,
     CASE @OrderBy WHEN 'ContactNo' THEN [EITL_Suppliers].[ContactNo] END,
     CASE @OrderBy WHEN 'ContactNo DESC' THEN [EITL_Suppliers].[ContactNo] END DESC 

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
