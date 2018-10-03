USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPODocumentListSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
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
  INNER JOIN [EITL_POList] AS [EITL_POList1]
    ON [EITL_PODocumentList].[SerialNo] = [EITL_POList1].[SerialNo]
  WHERE 1 = 1  
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
GO
