USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapDocumentTypesSelectListSearch]
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
 ,DocumentTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (DocumentTypeID)
  SELECT [QAP_DocumentTypes].[DocumentTypeID] FROM [QAP_DocumentTypes]
 WHERE  
   ( 
         STR(ISNULL([QAP_DocumentTypes].[DocumentTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_DocumentTypes].[DocumentName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DocumentTypeID' THEN [QAP_DocumentTypes].[DocumentTypeID] END,
     CASE @OrderBy WHEN 'DocumentTypeID DESC' THEN [QAP_DocumentTypes].[DocumentTypeID] END DESC,
     CASE @OrderBy WHEN 'DocumentName' THEN [QAP_DocumentTypes].[DocumentName] END,
     CASE @OrderBy WHEN 'DocumentName DESC' THEN [QAP_DocumentTypes].[DocumentName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QAP_DocumentTypes].[DocumentTypeID] ,
		[QAP_DocumentTypes].[DocumentName]  
  FROM [QAP_DocumentTypes] 
    	INNER JOIN #PageIndex
          ON [QAP_DocumentTypes].[DocumentTypeID] = #PageIndex.DocumentTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
