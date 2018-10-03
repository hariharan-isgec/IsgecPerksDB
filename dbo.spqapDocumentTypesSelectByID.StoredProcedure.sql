USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapDocumentTypesSelectByID]
  @LoginID NVarChar(8),
  @DocumentTypeID Int 
  AS
  SELECT
		[QAP_DocumentTypes].[DocumentTypeID] ,
		[QAP_DocumentTypes].[DocumentName]  
  FROM [QAP_DocumentTypes] 
  WHERE
  [QAP_DocumentTypes].[DocumentTypeID] = @DocumentTypeID
GO
