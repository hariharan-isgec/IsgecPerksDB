USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapDocumentTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_DocumentTypes].[DocumentTypeID] ,
		[QAP_DocumentTypes].[DocumentName]  
  FROM [QAP_DocumentTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DocumentTypeID' THEN [QAP_DocumentTypes].[DocumentTypeID] END,
     CASE @OrderBy WHEN 'DocumentTypeID DESC' THEN [QAP_DocumentTypes].[DocumentTypeID] END DESC,
     CASE @OrderBy WHEN 'DocumentName' THEN [QAP_DocumentTypes].[DocumentName] END,
     CASE @OrderBy WHEN 'DocumentName DESC' THEN [QAP_DocumentTypes].[DocumentName] END DESC 
  SET @RecordCount = @@RowCount
GO
