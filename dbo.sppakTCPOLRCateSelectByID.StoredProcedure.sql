USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLRCateSelectByID]
  @LoginID NVarChar(8),
  @DocumentCategoryID Int 
  AS
  SELECT
    [PAK_POLineRecCategory].*  
  FROM [PAK_POLineRecCategory] 
  WHERE
  [PAK_POLineRecCategory].[DocumentCategoryID] = @DocumentCategoryID
GO
