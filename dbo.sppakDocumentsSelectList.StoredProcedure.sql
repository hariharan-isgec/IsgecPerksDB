USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDocumentsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PAK_Documents].*  
  FROM [PAK_Documents] 
  WHERE 1 = 1  
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
GO
