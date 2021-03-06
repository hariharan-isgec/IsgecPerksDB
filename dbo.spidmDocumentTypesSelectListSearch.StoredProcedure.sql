USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentTypesSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,DocumentTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (DocumentTypeID)
  SELECT [IDM_DocumentTypes].[DocumentTypeID] FROM [IDM_DocumentTypes]
 WHERE  
   ( 
         STR(ISNULL([IDM_DocumentTypes].[DocumentTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_DocumentTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'DocumentTypeID' THEN [IDM_DocumentTypes].[DocumentTypeID] END,
     CASE @orderBy WHEN 'DocumentTypeID DESC' THEN [IDM_DocumentTypes].[DocumentTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_DocumentTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_DocumentTypes].[Description] END DESC,
     CASE @orderBy WHEN 'ValidateInPLM' THEN [IDM_DocumentTypes].[ValidateInPLM] END,
     CASE @orderBy WHEN 'ValidateInPLM DESC' THEN [IDM_DocumentTypes].[ValidateInPLM] END DESC,
     CASE @orderBy WHEN 'BlockIfNotExists' THEN [IDM_DocumentTypes].[BlockIfNotExists] END,
     CASE @orderBy WHEN 'BlockIfNotExists DESC' THEN [IDM_DocumentTypes].[BlockIfNotExists] END DESC,
     CASE @orderBy WHEN 'OnceForApproval' THEN [IDM_DocumentTypes].[OnceForApproval] END,
     CASE @orderBy WHEN 'OnceForApproval DESC' THEN [IDM_DocumentTypes].[OnceForApproval] END DESC,
     CASE @orderBy WHEN 'WarnForApproval' THEN [IDM_DocumentTypes].[WarnForApproval] END,
     CASE @orderBy WHEN 'WarnForApproval DESC' THEN [IDM_DocumentTypes].[WarnForApproval] END DESC,
     CASE @orderBy WHEN 'ImplementReceiptLock' THEN [IDM_DocumentTypes].[ImplementReceiptLock] END,
     CASE @orderBy WHEN 'ImplementReceiptLock DESC' THEN [IDM_DocumentTypes].[ImplementReceiptLock] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_DocumentTypes].[DocumentTypeID] ,
		[IDM_DocumentTypes].[Description] ,
		[IDM_DocumentTypes].[ValidateInPLM] ,
		[IDM_DocumentTypes].[BlockIfNotExists] ,
		[IDM_DocumentTypes].[OnceForApproval] ,
		[IDM_DocumentTypes].[WarnForApproval] ,
		[IDM_DocumentTypes].[ImplementReceiptLock]  
  FROM [IDM_DocumentTypes] 
    	INNER JOIN #PageIndex
          ON [IDM_DocumentTypes].[DocumentTypeID] = #PageIndex.DocumentTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
