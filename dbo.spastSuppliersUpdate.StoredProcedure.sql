USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSuppliersUpdate]
  @Description NVarChar(30),
  @Original_SupplierID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_Suppliers] SET 
   [Description] = @Description
  WHERE
  [SupplierID] = @Original_SupplierID
  SET @RowCount = @@RowCount
GO
