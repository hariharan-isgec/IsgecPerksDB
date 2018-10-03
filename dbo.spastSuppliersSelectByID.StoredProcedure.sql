USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSuppliersSelectByID]
  @SupplierID Int
  AS
  SELECT
		[AST_Suppliers].[SupplierID],
		[AST_Suppliers].[Description] 
  FROM [AST_Suppliers] 
  WHERE
  [AST_Suppliers].[SupplierID] = @SupplierID
GO
