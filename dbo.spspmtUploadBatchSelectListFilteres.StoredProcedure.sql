USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtUploadBatchSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UploadBatchNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UploadBatchNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_UploadBatch].[UploadBatchNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_UploadBatch] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UploadBatchNo' THEN '[SPMT_UploadBatch].[UploadBatchNo]'
                        WHEN 'UploadBatchNo DESC' THEN '[SPMT_UploadBatch].[UploadBatchNo] DESC'
                        WHEN 'Description' THEN '[SPMT_UploadBatch].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_UploadBatch].[Description] DESC'
                        WHEN 'StartedOn' THEN '[SPMT_UploadBatch].[StartedOn]'
                        WHEN 'StartedOn DESC' THEN '[SPMT_UploadBatch].[StartedOn] DESC'
                        ELSE '[SPMT_UploadBatch].[UploadBatchNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_UploadBatch].*  
  FROM [SPMT_UploadBatch] 
      INNER JOIN #PageIndex
          ON [SPMT_UploadBatch].[UploadBatchNo] = #PageIndex.UploadBatchNo
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
