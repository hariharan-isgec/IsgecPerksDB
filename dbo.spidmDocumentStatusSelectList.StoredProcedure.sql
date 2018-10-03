USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[IDM_DocumentStatus].[DocumentStatusID] ,
		[IDM_DocumentStatus].[Description]  
  FROM [IDM_DocumentStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'DocumentStatusID' THEN [IDM_DocumentStatus].[DocumentStatusID] END,
     CASE @orderBy WHEN 'DocumentStatusID DESC' THEN [IDM_DocumentStatus].[DocumentStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_DocumentStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_DocumentStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
