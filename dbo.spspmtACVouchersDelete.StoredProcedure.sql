USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtACVouchersDelete]
  @Original_VoucherNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_ACVouchers]
  WHERE
  [SPMT_ACVouchers].[VoucherNo] = @Original_VoucherNo
  SET @RowCount = @@RowCount
GO
