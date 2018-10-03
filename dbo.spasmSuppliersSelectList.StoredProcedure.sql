USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmSuppliersSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ASM_Suppliers].[SupplierID],
		[ASM_Suppliers].[Description] 
  FROM [ASM_Suppliers] 
  ORDER BY
     CASE @orderBy WHEN 'SupplierID' THEN [ASM_Suppliers].[SupplierID] END,
     CASE @orderBy WHEN 'SupplierID DESC' THEN [ASM_Suppliers].[SupplierID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_Suppliers].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_Suppliers].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
