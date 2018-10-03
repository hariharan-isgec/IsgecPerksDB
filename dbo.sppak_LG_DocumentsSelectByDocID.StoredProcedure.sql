USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sppak_LG_DocumentsSelectByDocID]
  @LoginID NVarChar(8),
  @DocumentID NVarChar(50)  
  AS
  SELECT TOP 1 
    [PAK_Documents].*  
  FROM [PAK_Documents] 
  WHERE
  [PAK_Documents].[DocumentID] = @DocumentID
GO
