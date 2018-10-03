USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlSuppliersDelete]
  @Original_SupplierID NVarChar(9),
  @RowCount int = null OUTPUT
  AS
  DELETE [EITL_Suppliers]
  WHERE
  [EITL_Suppliers].[SupplierID] = @Original_SupplierID
  SET @RowCount = @@RowCount
GO
