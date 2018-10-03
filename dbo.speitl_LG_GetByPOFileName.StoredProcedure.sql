USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitl_LG_GetByPOFileName]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @FileName NVarChar(250) 
  AS
  SELECT TOP 1 
		[EITL_PODocumentFile].[SerialNo] ,
		[EITL_PODocumentFile].[DocumentLineNo] ,
		[EITL_PODocumentFile].[FileNo] ,
		[EITL_PODocumentFile].[Description] ,
		[EITL_PODocumentFile].[FileName] ,
		[EITL_PODocumentFile].[DiskFile] ,
		[EITL_PODocumentList1].[DocumentID] AS EITL_PODocumentList1_DocumentID,
		[EITL_POList2].[PONumber] AS EITL_POList2_PONumber 
  FROM [EITL_PODocumentFile] 
  INNER JOIN [EITL_PODocumentList] AS [EITL_PODocumentList1]
    ON [EITL_PODocumentFile].[SerialNo] = [EITL_PODocumentList1].[SerialNo]
    AND [EITL_PODocumentFile].[DocumentLineNo] = [EITL_PODocumentList1].[DocumentLineNo]
  INNER JOIN [EITL_POList] AS [EITL_POList2]
    ON [EITL_PODocumentFile].[SerialNo] = [EITL_POList2].[SerialNo]
  WHERE
  [EITL_PODocumentFile].[SerialNo] = @SerialNo
  AND [EITL_PODocumentFile].[FileName] = @FileName
GO
