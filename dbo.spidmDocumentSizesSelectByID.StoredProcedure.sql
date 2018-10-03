USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentSizesSelectByID]
  @DocumentSizeID NVarChar(2) 
  AS
  SELECT
		[IDM_DocumentSizes].[DocumentSizeID] ,
		[IDM_DocumentSizes].[Description]  
  FROM [IDM_DocumentSizes] 
  WHERE
  [IDM_DocumentSizes].[DocumentSizeID] = @DocumentSizeID
GO
