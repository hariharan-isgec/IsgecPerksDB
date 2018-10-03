USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSuppliersSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  SupplierID Int NOT NULL
  )
  INSERT INTO #PageIndex (SupplierID)
  SELECT [AST_Suppliers].[SupplierID] FROM [AST_Suppliers]
  ORDER BY
     CASE @orderBy WHEN 'SupplierID' THEN [AST_Suppliers].[SupplierID] END,
     CASE @orderBy WHEN 'SupplierID DESC' THEN [AST_Suppliers].[SupplierID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [AST_Suppliers].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [AST_Suppliers].[Description] END DESC 

  SET @RecordCount = @@RowCount

  SELECT
		[AST_Suppliers].[SupplierID],
		[AST_Suppliers].[Description] 
  FROM [AST_Suppliers] 
    	INNER JOIN #PageIndex
          ON [AST_Suppliers].[SupplierID] = #PageIndex.SupplierID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO
