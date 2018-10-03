USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppak_LG_DocumentsSelectByDocRevID]
  @LoginID NVarChar(8),
  @DocumentID NVarChar(50),
  @DocumentRevision NVarChar(10)  
  AS
  SELECT TOP 1 
    [PAK_Documents].*  
  FROM [PAK_Documents] 
  WHERE
  [PAK_Documents].[DocumentID] = @DocumentID 
  AND [PAK_Documents].[DocumentRevision] = @DocumentRevision
GO
