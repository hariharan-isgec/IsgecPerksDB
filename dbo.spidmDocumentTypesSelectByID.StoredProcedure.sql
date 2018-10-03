USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentTypesSelectByID]
  @DocumentTypeID Int 
  AS
  SELECT
		[IDM_DocumentTypes].[DocumentTypeID] ,
		[IDM_DocumentTypes].[Description] ,
		[IDM_DocumentTypes].[ValidateInPLM] ,
		[IDM_DocumentTypes].[BlockIfNotExists] ,
		[IDM_DocumentTypes].[OnceForApproval] ,
		[IDM_DocumentTypes].[WarnForApproval] ,
		[IDM_DocumentTypes].[ImplementReceiptLock]  
  FROM [IDM_DocumentTypes] 
  WHERE
  [IDM_DocumentTypes].[DocumentTypeID] = @DocumentTypeID
GO
