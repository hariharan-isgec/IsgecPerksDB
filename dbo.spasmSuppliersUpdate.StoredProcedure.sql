USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmSuppliersUpdate]
  @Original_SupplierID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_Suppliers] SET 
   [Description] = @Description
  WHERE
  [SupplierID] = @Original_SupplierID
  SET @RowCount = @@RowCount
GO
