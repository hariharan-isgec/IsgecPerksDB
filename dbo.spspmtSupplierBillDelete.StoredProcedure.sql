USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtSupplierBillDelete]
  @Original_IRNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_SupplierBill]
  WHERE
  [SPMT_SupplierBill].[IRNo] = @Original_IRNo
  SET @RowCount = @@RowCount
GO
