USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlIssuedPODocumentFileSelectListSearch]
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
 ,SerialNo Int NOT NULL
 ,DocumentLineNo Int NOT NULL
 ,FileNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo, DocumentLineNo, FileNo)
  SELECT [EITL_PODocumentFile].[SerialNo], [EITL_PODocumentFile].[DocumentLineNo], [EITL_PODocumentFile].[FileNo] FROM [EITL_PODocumentFile]
  INNER JOIN [EITL_PODocumentList] AS [EITL_PODocumentList1]
    ON [EITL_PODocumentFile].[SerialNo] = [EITL_PODocumentList1].[SerialNo]
    AND [EITL_PODocumentFile].[DocumentLineNo] = [EITL_PODocumentList1].[DocumentLineNo]
  INNER JOIN [EITL_POList] AS [EITL_POList2]
    ON [EITL_PODocumentFile].[SerialNo] = [EITL_POList2].[SerialNo]
 WHERE  
   ( 
         STR(ISNULL([EITL_PODocumentFile].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([EITL_PODocumentFile].[DocumentLineNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([EITL_PODocumentFile].[FileNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_PODocumentFile].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_PODocumentFile].[FileName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_PODocumentFile].[DiskFile],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [EITL_PODocumentFile].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [EITL_PODocumentFile].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'DocumentLineNo' THEN [EITL_PODocumentFile].[DocumentLineNo] END,
     CASE @OrderBy WHEN 'DocumentLineNo DESC' THEN [EITL_PODocumentFile].[DocumentLineNo] END DESC,
     CASE @OrderBy WHEN 'FileNo' THEN [EITL_PODocumentFile].[FileNo] END,
     CASE @OrderBy WHEN 'FileNo DESC' THEN [EITL_PODocumentFile].[FileNo] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [EITL_PODocumentFile].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [EITL_PODocumentFile].[Description] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [EITL_PODocumentFile].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [EITL_PODocumentFile].[FileName] END DESC,
     CASE @OrderBy WHEN 'DiskFile' THEN [EITL_PODocumentFile].[DiskFile] END,
     CASE @OrderBy WHEN 'DiskFile DESC' THEN [EITL_PODocumentFile].[DiskFile] END DESC,
     CASE @OrderBy WHEN 'EITL_PODocumentList1_DocumentID' THEN [EITL_PODocumentList1].[DocumentID] END,
     CASE @OrderBy WHEN 'EITL_PODocumentList1_DocumentID DESC' THEN [EITL_PODocumentList1].[DocumentID] END DESC,
     CASE @OrderBy WHEN 'EITL_POList2_PONumber' THEN [EITL_POList2].[PONumber] END,
     CASE @OrderBy WHEN 'EITL_POList2_PONumber DESC' THEN [EITL_POList2].[PONumber] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[EITL_PODocumentFile].[SerialNo] ,
		[EITL_PODocumentFile].[DocumentLineNo] ,
		[EITL_PODocumentFile].[FileNo] ,
		[EITL_PODocumentFile].[Description] ,
		[EITL_PODocumentFile].[FileName] ,
		[EITL_PODocumentFile].[DiskFile] ,
		[EITL_PODocumentList1].[DocumentID] AS EITL_PODocumentList1_DocumentID,
		[EITL_POList2].[PONumber] AS EITL_POList2_PONumber 
  FROM [EITL_PODocumentFile] 
    	INNER JOIN #PageIndex
          ON [EITL_PODocumentFile].[SerialNo] = #PageIndex.SerialNo
          AND [EITL_PODocumentFile].[DocumentLineNo] = #PageIndex.DocumentLineNo
          AND [EITL_PODocumentFile].[FileNo] = #PageIndex.FileNo
  INNER JOIN [EITL_PODocumentList] AS [EITL_PODocumentList1]
    ON [EITL_PODocumentFile].[SerialNo] = [EITL_PODocumentList1].[SerialNo]
    AND [EITL_PODocumentFile].[DocumentLineNo] = [EITL_PODocumentList1].[DocumentLineNo]
  INNER JOIN [EITL_POList] AS [EITL_POList2]
    ON [EITL_PODocumentFile].[SerialNo] = [EITL_POList2].[SerialNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
