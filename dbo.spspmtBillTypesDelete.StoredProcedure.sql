USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBillTypesDelete]
  @Original_BillType Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_BillTypes]
  WHERE
  [SPMT_BillTypes].[BillType] = @Original_BillType
  SET @RowCount = @@RowCount
GO
