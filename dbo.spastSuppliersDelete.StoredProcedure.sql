USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSuppliersDelete]
  @Original_SupplierID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_Suppliers]
  WHERE
  [AST_Suppliers].[SupplierID] = @Original_SupplierID
  SET @RowCount = @@RowCount
GO
