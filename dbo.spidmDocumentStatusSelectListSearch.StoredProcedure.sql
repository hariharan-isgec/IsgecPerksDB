USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentStatusSelectListSearch]
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
 ,DocumentStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (DocumentStatusID)
  SELECT [IDM_DocumentStatus].[DocumentStatusID] FROM [IDM_DocumentStatus]
 WHERE  
   ( 
         STR(ISNULL([IDM_DocumentStatus].[DocumentStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_DocumentStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'DocumentStatusID' THEN [IDM_DocumentStatus].[DocumentStatusID] END,
     CASE @orderBy WHEN 'DocumentStatusID DESC' THEN [IDM_DocumentStatus].[DocumentStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_DocumentStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_DocumentStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_DocumentStatus].[DocumentStatusID] ,
		[IDM_DocumentStatus].[Description]  
  FROM [IDM_DocumentStatus] 
    	INNER JOIN #PageIndex
          ON [IDM_DocumentStatus].[DocumentStatusID] = #PageIndex.DocumentStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
