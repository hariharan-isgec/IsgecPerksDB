USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentStatusSelectByID]
  @DocumentStatusID Int 
  AS
  SELECT
		[IDM_DocumentStatus].[DocumentStatusID] ,
		[IDM_DocumentStatus].[Description]  
  FROM [IDM_DocumentStatus] 
  WHERE
  [IDM_DocumentStatus].[DocumentStatusID] = @DocumentStatusID
GO
