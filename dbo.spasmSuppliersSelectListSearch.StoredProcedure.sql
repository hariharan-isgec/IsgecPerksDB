USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmSuppliersSelectListSearch]
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
 ,SupplierID Int NOT NULL
  )
  INSERT INTO #PageIndex (SupplierID)
  SELECT [ASM_Suppliers].[SupplierID] FROM [ASM_Suppliers]
 WHERE  
   ( 
         STR(ISNULL([ASM_Suppliers].[SupplierID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_Suppliers].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'SupplierID' THEN [ASM_Suppliers].[SupplierID] END,
     CASE @orderBy WHEN 'SupplierID DESC' THEN [ASM_Suppliers].[SupplierID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_Suppliers].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_Suppliers].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ASM_Suppliers].[SupplierID],
		[ASM_Suppliers].[Description] 
  FROM [ASM_Suppliers] 
    	INNER JOIN #PageIndex
          ON [ASM_Suppliers].[SupplierID] = #PageIndex.SupplierID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
