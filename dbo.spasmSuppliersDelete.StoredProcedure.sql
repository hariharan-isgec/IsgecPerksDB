USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmSuppliersDelete]
  @Original_SupplierID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ASM_Suppliers]
  WHERE
  [ASM_Suppliers].[SupplierID] = @Original_SupplierID
  SET @RowCount = @@RowCount
GO
