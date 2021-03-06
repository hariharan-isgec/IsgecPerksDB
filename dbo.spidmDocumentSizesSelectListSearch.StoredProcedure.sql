USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentSizesSelectListSearch]
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
 ,DocumentSizeID NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (DocumentSizeID)
  SELECT [IDM_DocumentSizes].[DocumentSizeID] FROM [IDM_DocumentSizes]
 WHERE  
   ( 
         LOWER(ISNULL([IDM_DocumentSizes].[DocumentSizeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_DocumentSizes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'DocumentSizeID' THEN [IDM_DocumentSizes].[DocumentSizeID] END,
     CASE @orderBy WHEN 'DocumentSizeID DESC' THEN [IDM_DocumentSizes].[DocumentSizeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_DocumentSizes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_DocumentSizes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_DocumentSizes].[DocumentSizeID] ,
		[IDM_DocumentSizes].[Description]  
  FROM [IDM_DocumentSizes] 
    	INNER JOIN #PageIndex
          ON [IDM_DocumentSizes].[DocumentSizeID] = #PageIndex.DocumentSizeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
