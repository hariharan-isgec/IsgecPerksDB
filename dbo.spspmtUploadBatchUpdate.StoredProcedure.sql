USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtUploadBatchUpdate]
  @Original_UploadBatchNo Int, 
  @Description NVarChar(50),
  @StartedOn DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_UploadBatch] SET 
   [Description] = @Description
  ,[StartedOn] = @StartedOn
  WHERE
  [UploadBatchNo] = @Original_UploadBatchNo
  SET @RowCount = @@RowCount
GO
