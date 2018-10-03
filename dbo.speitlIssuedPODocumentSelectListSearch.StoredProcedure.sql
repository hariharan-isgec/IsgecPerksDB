USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlIssuedPODocumentSelectListSearch]
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
  )
  INSERT INTO #PageIndex (SerialNo, DocumentLineNo)
  SELECT [EITL_PODocumentList].[SerialNo], [EITL_PODocumentList].[DocumentLineNo] FROM [EITL_PODocumentList]
  INNER JOIN [EITL_POList] AS [EITL_POList1]
    ON [EITL_PODocumentList].[SerialNo] = [EITL_POList1].[SerialNo]
 WHERE  
   ( 
         STR(ISNULL([EITL_PODocumentList].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([EITL_PODocumentList].[DocumentLineNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_PODocumentList].[DocumentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_PODocumentList].[RevisionNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_PODocumentList].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [EITL_PODocumentList].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [EITL_PODocumentList].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'DocumentLineNo' THEN [EITL_PODocumentList].[DocumentLineNo] END,
     CASE @OrderBy WHEN 'DocumentLineNo DESC' THEN [EITL_PODocumentList].[DocumentLineNo] END DESC,
     CASE @OrderBy WHEN 'DocumentID' THEN [EITL_PODocumentList].[DocumentID] END,
     CASE @OrderBy WHEN 'DocumentID DESC' THEN [EITL_PODocumentList].[DocumentID] END DESC,
     CASE @OrderBy WHEN 'RevisionNo' THEN [EITL_PODocumentList].[RevisionNo] END,
     CASE @OrderBy WHEN 'RevisionNo DESC' THEN [EITL_PODocumentList].[RevisionNo] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [EITL_PODocumentList].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [EITL_PODocumentList].[Description] END DESC,
     CASE @OrderBy WHEN 'ReadyToDespatch' THEN [EITL_PODocumentList].[ReadyToDespatch] END,
     CASE @OrderBy WHEN 'ReadyToDespatch DESC' THEN [EITL_PODocumentList].[ReadyToDespatch] END DESC,
     CASE @OrderBy WHEN 'Despatched' THEN [EITL_PODocumentList].[Despatched] END,
     CASE @OrderBy WHEN 'Despatched DESC' THEN [EITL_PODocumentList].[Despatched] END DESC,
     CASE @OrderBy WHEN 'DespatchDate' THEN [EITL_PODocumentList].[DespatchDate] END,
     CASE @OrderBy WHEN 'DespatchDate DESC' THEN [EITL_PODocumentList].[DespatchDate] END DESC,
     CASE @OrderBy WHEN 'EITL_POList1_PONumber' THEN [EITL_POList1].[PONumber] END,
     CASE @OrderBy WHEN 'EITL_POList1_PONumber DESC' THEN [EITL_POList1].[PONumber] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[EITL_PODocumentList].[SerialNo] ,
		[EITL_PODocumentList].[DocumentLineNo] ,
		[EITL_PODocumentList].[DocumentID] ,
		[EITL_PODocumentList].[RevisionNo] ,
		[EITL_PODocumentList].[Description] ,
		[EITL_PODocumentList].[ReadyToDespatch] ,
		[EITL_PODocumentList].[Despatched] ,
		[EITL_PODocumentList].[DespatchDate] ,
		[EITL_POList1].[PONumber] AS EITL_POList1_PONumber 
  FROM [EITL_PODocumentList] 
    	INNER JOIN #PageIndex
          ON [EITL_PODocumentList].[SerialNo] = #PageIndex.SerialNo
          AND [EITL_PODocumentList].[DocumentLineNo] = #PageIndex.DocumentLineNo
  INNER JOIN [EITL_POList] AS [EITL_POList1]
    ON [EITL_PODocumentList].[SerialNo] = [EITL_POList1].[SerialNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
