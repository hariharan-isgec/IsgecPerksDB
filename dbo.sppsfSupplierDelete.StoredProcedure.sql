USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfSupplierDelete]
  @Original_SupplierID NVarChar(9),
  @RowCount int = null OUTPUT
  AS
  DELETE [PSF_Supplier]
  WHERE
  [PSF_Supplier].[SupplierID] = @Original_SupplierID
  SET @RowCount = @@RowCount
GO
