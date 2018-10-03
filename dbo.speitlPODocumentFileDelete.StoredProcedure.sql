USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPODocumentFileDelete]
  @Original_SerialNo Int,
  @Original_DocumentLineNo Int,
  @Original_FileNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [EITL_PODocumentFile]
  WHERE
  [EITL_PODocumentFile].[SerialNo] = @Original_SerialNo
  AND [EITL_PODocumentFile].[DocumentLineNo] = @Original_DocumentLineNo
  AND [EITL_PODocumentFile].[FileNo] = @Original_FileNo
  SET @RowCount = @@RowCount
GO
