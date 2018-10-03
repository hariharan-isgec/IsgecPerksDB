USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDocumentsSelectByID]
  @LoginID NVarChar(8),
  @DocumentNo Int 
  AS
  SELECT
    [PAK_Documents].*  
  FROM [PAK_Documents] 
  WHERE
  [PAK_Documents].[DocumentNo] = @DocumentNo
GO
