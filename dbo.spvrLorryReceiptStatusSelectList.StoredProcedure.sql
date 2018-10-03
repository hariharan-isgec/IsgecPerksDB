USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [VR_LorryReceiptStatus].*  
  FROM [VR_LorryReceiptStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'LRStatusID' THEN [VR_LorryReceiptStatus].[LRStatusID] END,
     CASE @OrderBy WHEN 'LRStatusID DESC' THEN [VR_LorryReceiptStatus].[LRStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_LorryReceiptStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_LorryReceiptStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
