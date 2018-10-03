USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentSizesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_DocumentSizes].[DocumentSizeID] ,
		[IDM_DocumentSizes].[Description]  
  FROM [IDM_DocumentSizes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'DocumentSizeID' THEN [IDM_DocumentSizes].[DocumentSizeID] END,
     CASE @orderBy WHEN 'DocumentSizeID DESC' THEN [IDM_DocumentSizes].[DocumentSizeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_DocumentSizes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_DocumentSizes].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
