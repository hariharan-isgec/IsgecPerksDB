USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPODocumentListDelete]
  @Original_SerialNo Int,
  @Original_DocumentLineNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [EITL_PODocumentList]
  WHERE
  [EITL_PODocumentList].[SerialNo] = @Original_SerialNo
  AND [EITL_PODocumentList].[DocumentLineNo] = @Original_DocumentLineNo
  SET @RowCount = @@RowCount
GO
