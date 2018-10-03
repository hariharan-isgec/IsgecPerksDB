USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpCreateTPTBillDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ERP_TransporterBill]
  WHERE
  [ERP_TransporterBill].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
