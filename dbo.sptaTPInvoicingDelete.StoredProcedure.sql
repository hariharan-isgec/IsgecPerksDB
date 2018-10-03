USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaTPInvoicingDelete]
  @Original_InvoiceNo NVarChar(15),
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_TPInvoicing]
  WHERE
  [TA_TPInvoicing].[InvoiceNo] = @Original_InvoiceNo
  SET @RowCount = @@RowCount
GO
