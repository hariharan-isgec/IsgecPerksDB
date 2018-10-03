USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtUploadBatchSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UploadBatchNo Int NOT NULL
  )
  INSERT INTO #PageIndex (UploadBatchNo)
  SELECT [SPMT_UploadBatch].[UploadBatchNo] FROM [SPMT_UploadBatch]
 WHERE  
   ( 
         STR(ISNULL([SPMT_UploadBatch].[UploadBatchNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_UploadBatch].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'UploadBatchNo' THEN [SPMT_UploadBatch].[UploadBatchNo] END,
     CASE @OrderBy WHEN 'UploadBatchNo DESC' THEN [SPMT_UploadBatch].[UploadBatchNo] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_UploadBatch].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_UploadBatch].[Description] END DESC,
     CASE @OrderBy WHEN 'StartedOn' THEN [SPMT_UploadBatch].[StartedOn] END,
     CASE @OrderBy WHEN 'StartedOn DESC' THEN [SPMT_UploadBatch].[StartedOn] END DESC 

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
