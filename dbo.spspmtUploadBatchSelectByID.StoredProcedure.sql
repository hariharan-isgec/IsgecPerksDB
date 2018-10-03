USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtUploadBatchSelectByID]
  @LoginID NVarChar(8),
  @UploadBatchNo Int 
  AS
  SELECT
    [SPMT_UploadBatch].*  
  FROM [SPMT_UploadBatch] 
  WHERE
  [SPMT_UploadBatch].[UploadBatchNo] = @UploadBatchNo
GO
