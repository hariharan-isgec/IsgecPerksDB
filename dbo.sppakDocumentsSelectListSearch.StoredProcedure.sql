USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDocumentsSelectListSearch]
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
 ,DocumentNo Int NOT NULL
  )
  INSERT INTO #PageIndex (DocumentNo)
  SELECT [PAK_Documents].[DocumentNo] FROM [PAK_Documents]
 WHERE  
   ( 
         STR(ISNULL([PAK_Documents].[DocumentNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_Documents].[DocumentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_Documents].[DocumentRevision],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_Documents].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_Documents].[Filename],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_Documents].[DisskFile],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DocumentNo' THEN [PAK_Documents].[DocumentNo] END,
     CASE @OrderBy WHEN 'DocumentNo DESC' THEN [PAK_Documents].[DocumentNo] END DESC,
     CASE @OrderBy WHEN 'DocumentID' THEN [PAK_Documents].[DocumentID] END,
     CASE @OrderBy WHEN 'DocumentID DESC' THEN [PAK_Documents].[DocumentID] END DESC,
     CASE @OrderBy WHEN 'DocumentRevision' THEN [PAK_Documents].[DocumentRevision] END,
     CASE @OrderBy WHEN 'DocumentRevision DESC' THEN [PAK_Documents].[DocumentRevision] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_Documents].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_Documents].[Description] END DESC,
     CASE @OrderBy WHEN 'ExternalDocument' THEN [PAK_Documents].[ExternalDocument] END,
     CASE @OrderBy WHEN 'ExternalDocument DESC' THEN [PAK_Documents].[ExternalDocument] END DESC,
     CASE @OrderBy WHEN 'Filename' THEN [PAK_Documents].[Filename] END,
     CASE @OrderBy WHEN 'Filename DESC' THEN [PAK_Documents].[Filename] END DESC,
     CASE @OrderBy WHEN 'DisskFile' THEN [PAK_Documents].[DisskFile] END,
     CASE @OrderBy WHEN 'DisskFile DESC' THEN [PAK_Documents].[DisskFile] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PAK_Documents].*  
  FROM [PAK_Documents] 
      INNER JOIN #PageIndex
          ON [PAK_Documents].[DocumentNo] = #PageIndex.DocumentNo
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
