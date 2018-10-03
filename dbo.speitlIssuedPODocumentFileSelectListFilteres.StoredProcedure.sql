USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlIssuedPODocumentFileSelectListFilteres]
  @Filter_SerialNo Int,
  @Filter_DocumentLineNo Int,
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
 ,SerialNo Int NOT NULL
 ,DocumentLineNo Int NOT NULL
 ,FileNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', DocumentLineNo'
  SET @LGSQL = @LGSQL + ', FileNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[EITL_PODocumentFile].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [EITL_PODocumentFile].[DocumentLineNo]'
  SET @LGSQL = @LGSQL + ', [EITL_PODocumentFile].[FileNo]'
  SET @LGSQL = @LGSQL + ' FROM [EITL_PODocumentFile] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [EITL_PODocumentList] AS [EITL_PODocumentList1]'
  SET @LGSQL = @LGSQL + '    ON [EITL_PODocumentFile].[SerialNo] = [EITL_PODocumentList1].[SerialNo]'
  SET @LGSQL = @LGSQL + '    AND [EITL_PODocumentFile].[DocumentLineNo] = [EITL_PODocumentList1].[DocumentLineNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [EITL_POList] AS [EITL_POList2]'
  SET @LGSQL = @LGSQL + '    ON [EITL_PODocumentFile].[SerialNo] = [EITL_POList2].[SerialNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [EITL_PODocumentFile].[SerialNo] = ' + STR(@Filter_SerialNo)
  IF (@Filter_DocumentLineNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [EITL_PODocumentFile].[DocumentLineNo] = ' + STR(@Filter_DocumentLineNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[EITL_PODocumentFile].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[EITL_PODocumentFile].[SerialNo] DESC'
                        WHEN 'DocumentLineNo' THEN '[EITL_PODocumentFile].[DocumentLineNo]'
                        WHEN 'DocumentLineNo DESC' THEN '[EITL_PODocumentFile].[DocumentLineNo] DESC'
                        WHEN 'FileNo' THEN '[EITL_PODocumentFile].[FileNo]'
                        WHEN 'FileNo DESC' THEN '[EITL_PODocumentFile].[FileNo] DESC'
                        WHEN 'Description' THEN '[EITL_PODocumentFile].[Description]'
                        WHEN 'Description DESC' THEN '[EITL_PODocumentFile].[Description] DESC'
                        WHEN 'FileName' THEN '[EITL_PODocumentFile].[FileName]'
                        WHEN 'FileName DESC' THEN '[EITL_PODocumentFile].[FileName] DESC'
                        WHEN 'DiskFile' THEN '[EITL_PODocumentFile].[DiskFile]'
                        WHEN 'DiskFile DESC' THEN '[EITL_PODocumentFile].[DiskFile] DESC'
                        WHEN 'EITL_PODocumentList1_DocumentID' THEN '[EITL_PODocumentList1].[DocumentID]'
                        WHEN 'EITL_PODocumentList1_DocumentID DESC' THEN '[EITL_PODocumentList1].[DocumentID] DESC'
                        WHEN 'EITL_POList2_PONumber' THEN '[EITL_POList2].[PONumber]'
                        WHEN 'EITL_POList2_PONumber DESC' THEN '[EITL_POList2].[PONumber] DESC'
                        ELSE '[EITL_PODocumentFile].[SerialNo],[EITL_PODocumentFile].[DocumentLineNo],[EITL_PODocumentFile].[FileNo]'
                    END
  EXEC (@LGSQL)

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
