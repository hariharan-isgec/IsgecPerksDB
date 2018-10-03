USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapPurposeSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_Purpose].[PurposeID] ,
		[QAP_Purpose].[PurposeName]  
  FROM [QAP_Purpose] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Purpose].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Purpose].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'PurposeName' THEN [QAP_Purpose].[PurposeName] END,
     CASE @OrderBy WHEN 'PurposeName DESC' THEN [QAP_Purpose].[PurposeName] END DESC 
  SET @RecordCount = @@RowCount
GO
