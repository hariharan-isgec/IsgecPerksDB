USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtSupplierBillDelete]
  @Original_IRNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PMT_IRDocs]
  WHERE
  [PMT_IRDocs].[IRNo] = @Original_IRNo
  SET @RowCount = @@RowCount
GO
