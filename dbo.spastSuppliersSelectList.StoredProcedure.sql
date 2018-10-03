USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSuppliersSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[AST_Suppliers].[SupplierID],
		[AST_Suppliers].[Description] 
  FROM [AST_Suppliers] 
  ORDER BY
     CASE @orderBy WHEN 'SupplierID' THEN [AST_Suppliers].[SupplierID] END,
     CASE @orderBy WHEN 'SupplierID DESC' THEN [AST_Suppliers].[SupplierID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [AST_Suppliers].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [AST_Suppliers].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
