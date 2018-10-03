USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtUploadBatchDelete]
  @Original_UploadBatchNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_UploadBatch]
  WHERE
  [SPMT_UploadBatch].[UploadBatchNo] = @Original_UploadBatchNo
  SET @RowCount = @@RowCount
GO
