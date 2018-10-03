USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitl_LG_GetByPODocumentRev]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @DocumentID NVarChar(50),
  @Rev NVarChar(3) 
  AS
  SELECT TOP 1   
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
  WHERE
  [EITL_PODocumentList].[SerialNo] = @SerialNo
  AND [EITL_PODocumentList].[DocumentID] = @DocumentID  
  AND [EITL_PODocumentList].[RevisionNo] = @Rev
GO
